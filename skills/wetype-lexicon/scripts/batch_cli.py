#!/usr/bin/env python3
"""Explicit, resumable word-list imports with bounded native sync admission."""
import argparse
import contextlib
import copy
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time
import audit_helpers as a
import backpressure_policy as bp
import batch_words as words
import engine_support as e
import lexicon_cli as t
import sync_cli as s

HERE=Path(__file__).resolve().parent
BATCH_LIMIT=500
MAX_WAIT_SECONDS=900
TERMINAL_COMMIT={'committed','committed-recovered'}
TERMINAL_ABORT={'aborted','aborted-recovered'}

def identity():
    return hashlib.sha256(s.code_hash().encode()+b''.join((HERE/n).read_bytes() for n in ('batch_cli.py','batch_words.py'))).hexdigest()

def bounded_prefix(rows,native_rows,capacity):
    """Take a contiguous prefix; existing pairs use no native action budget."""
    t.require(type(capacity)is int and 0<=capacity<=bp.WINDOW,'Invalid queue capacity')
    t.require(1<=len(rows)<=BATCH_LIMIT and len(native_rows)==len(rows),'Invalid preview batch')
    count=new=0
    for row,result in zip(rows,native_rows):
        t.require(all(result.get(k)==row[k] for k in ('word','pinyin')) and type(result.get('existed'))is bool,'Preview row mismatch')
        if not result['existed']:
            if new==capacity:break
            new+=1
        count+=1
    return count,new

class NativeAdapter:
    """The guardian is provided by service_lease; no source mutation bypass exists."""
    def __init__(self,root,src):self.root,self.src=root,src
    @contextlib.contextmanager
    def guard(self,operation,job_id=None):
        import service_lease
        with service_lease.guard(self.root,self.src,operation,job_id=job_id):yield
    def _snapshot(self):
        with self.src.quiet():return t.snapshot(self.root,self.src)
    def _inspect(self,job,rows):
        before=t.kv(self.root,job);reports=[];aggregate=None
        for start in range(0,len(rows),BATCH_LIMIT):
            report=t.native(self.root,job,'inspect',rows[start:start+BATCH_LIMIT])
            if aggregate is None:aggregate=t.record_hash(report)
            t.require(t.record_hash(report)==aggregate,'Inspection main-record preimage changed')
            reports.append(report)
        t.require(t.kv(self.root,job)['hashes']==before['hashes'],'Inspection changed logical keys')
        return reports
    def _queue(self,job,label):
        q=s.probe(self.root,job);decision=bp.assess(s.observation(job,q),0,0)
        t.require(decision.allowed or decision.reason=='backpressure_wait_for_observed_progress','Unsafe queue: '+decision.reason)
        # A full but structurally valid queue is a waiting state. Even there,
        # retain the same epoch/high-water guards as the native transaction.
        for path in (self.root/'sync-observations').glob('*.json'):
            old=t.read(self.root,path)['queue']
            t.require(q['queue_epoch']==old['queue_epoch'],'Sync epoch changed; refusing automatic reset')
            t.require(q['last_assigned_sequence']>=max(old['last_assigned_sequence'],old['action_max']),'Observed allocated sequence would be reused')
            t.require(q['local_consumed_watermark']>=old['local_consumed_watermark'],'Consumer watermark rewound')
        s.remember(self.root,q,label)
        return q,max(0,bp.WINDOW-(q['last_assigned_sequence']-q['local_consumed_watermark']))
    def preview(self,rows,job_id):
        with self.guard('preview',job_id):job,_=self._snapshot()
        reports=self._inspect(job,rows);q,capacity=self._queue(job,'batch-preview')
        entries=[{'index':i,'word':r['word'],'pinyin':r['pinyin'],'existed':r['existed'],'count':r['count']}
                 for i,r in enumerate([v for report in reports for v in report['rows']])]
        return {'source_record_hash':t.record_hash(reports[0]),'entries':entries,'queue':q,
                'existing':sum(r['existed'] for r in entries),'new':sum(not r['existed'] for r in entries),'capacity':capacity}
    def step(self,rows,job_id,batch_index,on_plan):
        with self.guard('batch-import',job_id):
            job,files=self._snapshot();report=self._inspect(job,rows)[0];q,capacity=self._queue(job,'batch-before')
            if q['last_assigned_sequence']-q['local_consumed_watermark']>bp.WINDOW:
                return {'status':'waiting_sync','queue':q,'capacity':0}
            count,new=bounded_prefix(rows,report['rows'],capacity)
            if not count:return {'status':'waiting_sync','queue':q,'capacity':capacity}
            chosen=rows[:count];native_preview=copy.deepcopy(report);native_preview['rows']=native_preview['rows'][:count]
            valid={'input_rows':count,'unique_rows':count,'rows':chosen,'duplicates_in_file':[]}
            plan=t.record_plan(self.root,self.src,'sync-import-plan',{'code_hash':s.code_hash(),'batch_job_id':job_id,'batch_index':batch_index,
                'validation':valid,'base_record_hash':t.record_hash(report),'native_preview':native_preview,'queue':q,
                'add':new,'skip_existing':count-new,'source_files':files,'source_ui_selection':False,'compensation_reserve':0})
            on_plan(plan,count,new)
            tx=s.transact(self.root,self.src,plan)
            return {'status':'attempted','transaction':tx}
    def transactions(self,plan_id):
        return [doc for path in (self.root/'sync-transactions').glob('sync-tx-*.json')
                if (doc:=t.read(self.root,path)).get('plan_id')==plan_id]
    def recover(self,tx):
        with self.guard('queue'):
            return s.recover(self.root,self.src,tx['id'])

class Jobs:
    """Signed progress, coupled to the core's write-ahead transaction journals."""
    def __init__(self,root,target,adapter,*,clock=time.monotonic,sleep=time.sleep,code_hash=None):
        self.root,self.target,self.adapter=Path(root),target,adapter
        self.clock,self.sleep=clock,sleep;self.code_hash=code_hash or identity()
        self.directory=self.root/'batch-jobs';self.directory.mkdir(mode=0o700,exist_ok=True)
    def _path(self,name):return self.directory/(t.ident(name,'importjob')+'.json')
    def _save(self,doc):doc['updated_at']=t.now();return t.save(self.root,self._path(doc['id']),doc)
    def load(self,name):
        doc=t.read(self.root,self._path(name))
        t.require(doc.get('kind')=='batch-import-job' and doc.get('target')==self.target and doc.get('code_hash')==self.code_hash,'Job target or adapter mismatch')
        t.require(type(doc.get('cursor'))is int and 0<=doc['cursor']<=len(doc['validation']['rows']),'Invalid job cursor')
        return doc
    def prepare(self,path):
        validation=words.parse(path);name=t.token('importjob')
        doc=t.base_meta(self.root,'batch-import-job')|{'id':name,'target':self.target,'code_hash':self.code_hash,'status':'prepared',
            'validation':validation,'cursor':0,'batches':[],'added':0,'skipped_existing':0,'cloud_delivery_verified':False,'automatic_background_resume':False}
        return self._save(doc)
    def preview(self,name):
        doc=self.load(name);doc['preview']=self.adapter.preview(doc['validation']['rows'],doc['id']);return self._save(doc)
    def _apply(self,doc,entry,tx):
        t.require(tx.get('plan_id')==entry['plan_id'] and tx.get('target')==self.target,'Transaction/job binding mismatch')
        t.require(tx.get('batch_job_id')==doc['id'] and tx.get('batch_index')==entry['index'],'Transaction batch identity mismatch')
        t.require(tx.get('phase') in TERMINAL_COMMIT,'Transaction did not commit')
        t.require(tx.get('rows')==doc['validation']['rows'][entry['start']:entry['end']],'Transaction batch rows mismatch')
        result=tx['result'];added=result['added'];skipped=result['skipped_existing']
        t.require(type(added)is int and type(skipped)is int and added>=0 and skipped>=0 and added+skipped==entry['end']-entry['start'] and added==entry['expected_added'],'Invalid committed row accounting')
        t.require(doc['cursor']==entry['start'],'Batch progress is not contiguous')
        entry.update(status='committed',transaction_id=tx['id'],added=added,skipped_existing=skipped)
        doc['cursor']=entry['end'];doc['added']+=added;doc['skipped_existing']+=skipped
        doc['status']='completed' if doc['cursor']==len(doc['validation']['rows']) else 'ready'
        self._save(doc)
    def _reconcile(self,doc):
        if not doc['batches'] or doc['batches'][-1]['status']!='attempting':return False
        entry=doc['batches'][-1];found=self.adapter.transactions(entry['plan_id'])
        t.require(len(found)<=1,'Multiple transaction journals for one batch plan')
        if not found:
            # Core writes its started journal before any source mutation. Absence
            # means only the signed plan was prepared; use a fresh plan next time.
            entry['status']='abandoned-before-start';doc['status']='ready';self._save(doc);return False
        tx=found[0];entry['transaction_id']=tx['id']
        if tx['phase'] in TERMINAL_COMMIT:self._apply(doc,entry,tx);return False
        if tx['phase'] in TERMINAL_ABORT:
            entry['status']='aborted';doc['status']='ready';self._save(doc);return False
        t.require(tx['phase'] in s.PENDING,'Unrecognized interrupted transaction phase')
        # Recovery classifies preserved state only. This invocation never resends
        # or starts a new batch after classifying an interrupted transaction.
        outcome=self.adapter.recover(tx);entry['last_recovery']=outcome
        doc['status']='recovery_classified';doc['resume_required']=True;self._save(doc);return True
    def run(self,name,*,max_wait_seconds=0):
        t.require(type(max_wait_seconds)is int and 0<=max_wait_seconds<=MAX_WAIT_SECONDS,'max_wait_seconds must be 0..900')
        deadline=self.clock()+max_wait_seconds;doc=self.load(name)
        if self._reconcile(doc):return doc
        while doc['cursor']<len(doc['validation']['rows']):
            start=doc['cursor'];rows=doc['validation']['rows'][start:start+BATCH_LIMIT]
            def on_plan(plan,count,new):
                t.require(1<=count<=len(rows) and 0<=new<=count,'Invalid planned batch accounting')
                doc['batches'].append({'index':len(doc['batches']),'start':start,'end':start+count,'status':'attempting',
                                      'plan_id':plan['id'],'expected_added':new})
                doc['status']='running';doc.pop('resume_required',None);self._save(doc)
            try:outcome=self.adapter.step(rows,doc['id'],len(doc['batches']),on_plan)
            except BaseException:
                doc['status']='interrupted';self._save(doc);raise
            if outcome['status']=='waiting_sync':
                t.require(doc['cursor']==start and (not doc['batches'] or doc['batches'][-1]['status']!='attempting'),'Waiting batch unexpectedly attempted')
                doc.update(status='waiting_sync',queue=outcome['queue']);self._save(doc)
                remaining=deadline-self.clock()
                if remaining<=0:return doc
                self.sleep(min(30,remaining))
                if self.clock()>=deadline:return doc
                continue
            t.require(outcome['status']=='attempted' and doc['batches'][-1]['status']=='attempting','Native adapter protocol mismatch')
            self._apply(doc,doc['batches'][-1],outcome['transaction'])
        doc['status']='completed';return self._save(doc)

def summary(doc):
    result={k:doc[k] for k in ('id','target','status','cursor','added','skipped_existing','cloud_delivery_verified','automatic_background_resume')}
    result.update(input_rows=doc['validation']['input_rows'],unique_rows=doc['validation']['unique_rows'],input_duplicates=len(doc['validation']['duplicates_in_file']),source_sha256=doc['validation']['source_sha256'])
    if 'preview' in doc:result['preview']={k:v for k,v in doc['preview'].items() if k!='entries'};result['preview_sample']=doc['preview']['entries'][:20]
    if doc['batches']:result['last_batch']=doc['batches'][-1]
    if doc.get('status')=='waiting_sync':result['queue']=doc.get('queue');result['resume_required']=True
    if doc.get('resume_required'):result['resume_required']=True
    return result

def execute(args):
    if args.command=='validate':return words.parse(args.words)
    root=e.safe_root(args.workspace)
    if args.command=='init':
        result=t.initialize(root,args.target)
        for key in ('formal_import_enabled','submission_disabled_reason','batch_input_limit'):result.pop(key,None)
        return result|{'formal_batch_import_enabled':True,'service_interlock_required':args.target=='formal',
                       'legacy_formal_import_enabled':False,'formal_snapshot_rollback_enabled':False,
                       'formal_compensation_enabled':False,'automatic_background_resume':False,
                       'max_transaction_rows':BATCH_LIMIT,'max_input_rows':words.MAX_INPUT_ROWS,
                       'max_file_bytes':words.MAX_BYTES}
    if args.command=='recover-service':
        # Recovery must remain reachable after an app/adapter upgrade or a
        # compiler failure. Captured helpers are checked by the signed lease.
        with e.locked(root):
            import service_lease
            return service_lease.recover(root,args.lease)
    with e.locked(root):
        config=e.read_json(root/'STORE.json');t.require(config['target']==args.target and config['abi']==e.ABI,'Workspace target/version mismatch')
        s.prepare(root);jobs=Jobs(root,args.target,NativeAdapter(root,t.Source(root,args.target)))
        if args.command=='prepare':return summary(jobs.prepare(args.words))
        if args.command=='preview':return summary(jobs.preview(args.job))
        if args.command=='status':return summary(jobs.load(args.job))
        if args.command in ('run','resume'):return summary(jobs.run(args.job,max_wait_seconds=args.max_wait_seconds))
        raise e.Error('Unknown batch operation')

def main():
    os.umask(0o077);p=argparse.ArgumentParser(description=__doc__,formatter_class=argparse.RawDescriptionHelpFormatter,epilog='''Word-list examples (UTF-8; 1-16 Han characters, one untoned syllable per character):
  TSV: word<TAB>pinyin, then 青瓷脉阵<TAB>qing ci mai zhen
  CSV: word,pinyin, then 青瓷脉阵,"qing,ci,mai,zhen"
  JSON: [{"word":"青瓷脉阵","pinyin":"qing,ci,mai,zhen"}]

Example flow (repeat the same --workspace and --target for every command):
  --target formal --workspace /private/path/wetype-lab-import init
  --target formal --workspace /private/path/wetype-lab-import prepare words.tsv
  --target formal --workspace /private/path/wetype-lab-import preview --job importjob-ID
  --target formal --workspace /private/path/wetype-lab-import run --job importjob-ID
  --target formal --workspace /private/path/wetype-lab-import resume --job importjob-ID --max-wait-seconds 300
  --target formal --workspace /private/path/wetype-lab-import recover-service

prepare validates the complete file (2 MiB / 100000 input rows), normalizes and
signs its exact contents. preview reports counts and a sample; complete per-row
results are in the signed batch-jobs/importjob-ID.json file. run/resume is explicit
and uses at most 500 rows per transaction. Waiting defaults to immediate return;
optional foreground waiting lasts at most 900 seconds. No scheduled resume is made.
''')
    p.add_argument('--workspace',default=str(Path.cwd()/'wetype-lab-batch'));p.add_argument('--target',choices=['lab','formal'],default='lab')
    sub=p.add_subparsers(dest='command',required=True)
    sub.add_parser('init');sub.add_parser('recover-service').add_argument('--lease')
    sub.add_parser('validate').add_argument('words');sub.add_parser('prepare').add_argument('words')
    for name in ('preview','status','run','resume'):
        child=sub.add_parser(name);child.add_argument('--job',required=True)
        if name in ('run','resume'):child.add_argument('--max-wait-seconds',type=int,default=0)
    try:print(json.dumps(execute(p.parse_args()),ensure_ascii=False,indent=2))
    except (e.Error,a.AuditError,OSError,ValueError,subprocess.SubprocessError) as ex:
        print(json.dumps({'error':str(ex),'no_automatic_resend':True},ensure_ascii=False),file=sys.stderr);raise SystemExit(2)
if __name__=='__main__':main()
