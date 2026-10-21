#!/usr/bin/env python3
"""Bounded native learning transactions with monotonic sync history and compensating undo."""
import argparse,contextlib,datetime,hashlib,json,os,subprocess,sys
from pathlib import Path
import lexicon_cli as t
import engine_support as e
import audit_helpers as a
import backpressure_policy as bp
import remove_helpers as rh
import service_lease as sl
HERE=Path(__file__).resolve().parent
LIMIT=500
PENDING={'started','quiesced','backed-up','prepared','swapped','recovery-required'}

def code_hash():
    names=['sync_cli.py','sync_probe.cpp','backpressure_policy.py','remove_worker.cpp','remove_support.hpp','remove_helpers.py','lexicon_cli.py','engine_support.py','audit_helpers.py','native_worker.cpp','dictionary_items.inc','abi_profile.hpp','audit.hpp','kv_hash.cpp','app_control.mm','input_source.cpp','service_lease.py']
    return hashlib.sha256(b''.join(n.encode()+b'\0'+(HERE/n).read_bytes() for n in names)).hexdigest()

def prepare(root):
    e.prepare(root)
    for n in ('sync-observations','sync-transactions'):(root/n).mkdir(exist_ok=True,mode=0o700)
    identity=root/'cache/sync-identity.json';sources=code_hash()
    if identity.exists():
        m=e.read_json(identity);t.require(m['source_hash']==sources,'Sync adapter changed; use a new workspace')
        for n,h in m['files'].items():t.require(e.digest(root/'cache'/n)==h,'Sync helper identity mismatch')
        return
    files={}
    for name,src in [('sync_probe','sync_probe.cpp'),('remove_worker','remove_worker.cpp')]:
        dest=root/'cache'/name
        subprocess.run(['/usr/bin/xcrun','clang++','-std=c++17','-O0',str(HERE/src),'-lsandbox','-o',str(dest)],check=True,capture_output=True,timeout=180)
        files[name]=e.digest(dest)
    e.atomic_json(identity,{'source_hash':sources,'files':files})

def probe(root,j):
    p=subprocess.run([str(root/'cache/sync_probe'),str(root),str(j)],capture_output=True,timeout=120)
    t.require(p.returncode==0 and p.stdout.splitlines().count(b'SYNC_METADATA_COMPLETE')==1,'Sync probe rejected')
    return e.read_json(j/'sync-metadata.json')

def observation(j,q):
    return {'schema':1,'epoch':q['queue_epoch'],'complete':True,'header_valid':bool(q['action_header_present'] and q['action_wire_sequences_valid']),'head_valid':bool(q['sync_head_present'] and q['group_present']),'max_assigned':q['last_assigned_sequence'],'watermark':q['local_consumed_watermark'],'sequences':e.read_json(j/'queue-sequences.json'),'provenance':'native_head'}

def gate(root,j,q,delta=0,reserve=0):
    ob=observation(j,q);decision=bp.assess(ob,delta,reserve)
    t.require(decision.allowed,'Sync admission refused: '+decision.reason)
    for path in (root/'sync-observations').glob('*.json'):
        old=t.read(root,path)['queue']
        t.require(q['queue_epoch']==old['queue_epoch'],'Sync epoch changed; no automatic reset')
        t.require(q['last_assigned_sequence']>=max(old['last_assigned_sequence'],old['action_max']),'Observed allocated sequence would be reused')
        t.require(q['local_consumed_watermark']>=old['local_consumed_watermark'],'Consumer watermark rewound')
    return decision.to_dict()

def remember(root,q,label):
    name=t.token('observation');doc=t.base_meta(root,'sync-queue-observation')|{'id':name,'queue':q,'label':label}
    t.save(root,root/'sync-observations'/(name+'.json'),doc)
    return name

def recent(doc,minutes=20):
    age=(datetime.datetime.now(datetime.timezone.utc)-datetime.datetime.fromisoformat(doc['created_at'])).total_seconds()
    t.require(0<=age<=minutes*60,'Plan expired; preview again')

def rows_file(path):
    valid=e.normalize_rows(Path(path))
    t.require(valid['input_rows']<=LIMIT,'Transaction accepts at most 500 input rows; use batch commands for larger lists')
    return valid

def read_tx(root,src,name):
    tx=t.read(root,root/'sync-transactions'/(t.ident(name,'sync-tx')+'.json'))
    t.require(tx.get('target')==src.mode and tx.get('code_hash')==code_hash(),'Transaction target/adapter mismatch')
    return tx

def plan_read(root,src,name,kind):
    p=t.plan_read(root,src,name,kind);recent(p)
    t.require(p.get('code_hash')==code_hash(),'Plan adapter changed')
    return p

def pending(root):
    values=[]
    for directory,pattern in [('sync-transactions','sync-tx-*.json'),('transactions','tx-*.json')]:
        for path in (root/directory).glob(pattern):
            doc=t.read(root,path)
            if doc['phase'] in PENDING:values.append(doc['id'])
    return values

def import_preview(root,src,path,baseline=False):
    valid=rows_file(path);rows=valid['rows']
    with src.quiet():j,files=t.snapshot(root,src)
    r,_=t.inspected(root,j,rows);q=probe(root,j);admission=gate(root,j,q,0,0 if src.mode=='formal' else 2*sum(not x['existed'] for x in r['rows']))
    ranks=None
    if baseline:
        clone=t.job(root,j/'data');ranks=t.native(root,clone,'candidates',rows)['rows']
    remember(root,q,'baseline' if baseline else 'preview')
    return t.record_plan(root,src,'sync-import-plan',{'code_hash':code_hash(),'validation':valid,'base_record_hash':t.record_hash(r),'native_preview':r,'queue':q,'admission':admission,'add':sum(not x['existed'] for x in r['rows']),'skip_existing':sum(x['existed'] for x in r['rows']),'candidate_baseline':ranks,'source_ui_selection':False,'source_files':files})

def ownership(root,src,name):
    tx=read_tx(root,src,name)
    t.require(tx['operation']=='sync-import-plan' and tx['phase'] in ('committed','committed-recovered'),'Only a committed owned import can be undone')
    t.require(tx.get('result',{}).get('added',0)>0,'Import added no owned pairs')
    for path in (root/'sync-transactions').glob('sync-tx-*.json'):
        other=t.read(root,path)
        if other.get('undo_of')==name and other['phase'] not in ('aborted','aborted-recovered'):
            raise e.Error('Compensation already started; inspect its journal, never resend')
    receipt=rh.receipt_from_import(tx['native_import'],t.secret(root))
    return tx,receipt

def undo_preview(root,src,name):
    tx,receipt=ownership(root,src,name);rows=[{'pinyin':x['pinyin'],'word':x['word']} for x in receipt['rows']]
    with src.quiet():j,files=t.snapshot(root,src)
    r,_=t.inspected(root,j,rows)
    rebound=rh.rebase_receipt(receipt,r,t.secret(root))
    q=probe(root,j);admission=gate(root,j,q,len(rows),0);remember(root,q,'preview-undo')
    return t.record_plan(root,src,'sync-undo-plan',{'code_hash':code_hash(),'undo_of':name,'rows':rows,'owned_targets':len(rows),'base_record_hash':t.record_hash(r),'current_target_proof':rebound,'queue':q,'admission':admission,'source_files':files})

def formal_allowed(root,src,plan):
    if src.mode!='formal':return
    t.require(plan['kind']=='sync-import-plan','Formal pure compensation and historical snapshot rollback are unavailable')
    sl.assert_active(root,plan['id'],mutation=True,job_id=plan.get('batch_job_id'))

def transact(root,src,plan,fault=None):
    t.require(not pending(root),'Pending interrupted transaction; inspect status and recover first')
    formal_allowed(root,src,plan)
    t.require(not(src.mode=='formal' and fault),'Fault injection is lab only')
    for path in (root/'sync-transactions').glob('sync-tx-*.json'):
        prev=t.read(root,path);t.require(prev['plan_id']!=plan['id'],'Plan already attempted; preview a new plan')
    operation=plan['kind'];undo=operation=='sync-undo-plan'
    owned=None
    if undo:_,owned=ownership(root,src,plan['undo_of'])
    rows=plan['rows'] if undo else plan['validation']['rows']
    tx=t.token('sync-tx');journal=t.base_meta(root,'sync-transaction')|{'id':tx,'target':src.mode,'code_hash':code_hash(),'plan_id':plan['id'],'operation':operation,'rows':rows,'undo_of':plan.get('undo_of'),'phase':'started','swapped':False,'automatic_snapshot_rewind':False}
    if src.mode=='formal':journal.update(original_running=bool(src.pids()),original_source=src.input_source())
    for key in ('batch_job_id','batch_index'):
        if key in plan:journal[key]=plan[key]
    path=root/'sync-transactions'/(tx+'.json')
    def checkpoint(phase,**fields):journal.update(fields);journal['phase']=phase;t.save(root,path,journal)
    checkpoint('started');incoming_fd=None;attempted=False;did_swap=False
    def close_incoming():
        nonlocal incoming_fd
        if incoming_fd is not None:os.close(incoming_fd);incoming_fd=None
    try:
        with src.quiet(),contextlib.ExitStack() as cleanup:
            checkpoint('quiesced',original_running=src.original_running,original_source=src.original_source)
            j,files=t.snapshot(root,src);before,kv0=t.inspected(root,j,rows)
            t.require(t.record_hash(before)==plan['base_record_hash'],'Learning changed after preview; preview again')
            q0=probe(root,j);gate(root,j,q0);remember(root,q0,'transaction-before')
            if undo:
                active=rh.rebase_receipt(owned,before,t.secret(root));reserve=0
                gate(root,j,q0,len(rows),0)
            else:
                new=sum(not r['existed'] for r in before['rows']);reserve=0 if src.mode=='formal' or plan.get('batch_job_id') else 2*new
                gate(root,j,q0,new,reserve)
                if not new:
                    checkpoint('committed',swapped=False,result={'added':0,'skipped_existing':len(rows),'no_exchange':True,'queue':q0})
                    return journal
            backup=t.backup_from(root,src,'before-sync-compensation' if undo else 'before-sync-import',rows,t.record_hash(before))
            checkpoint('backed-up',backup_id=backup['id'],before_queue=q0)
            if undo:
                result=rh.compensate(root,j,active,t.secret(root));expected=result['after_hash'];kv1=t.kv(root,j)
                audit=result['exact_kv_delta'];delta=result['removed']
                v=t.job(root,j/'data');reopened,unused=t.inspected(root,v,rows)
                t.require(all(not x['existed'] for x in reopened['rows']) and t.record_hash(reopened)==expected,'Removed pair persisted or unrelated records changed on reopen')
                result.update(new_process_absence=True)
            else:
                added=t.native(root,j,'import',rows);kv1=t.kv(root,j)
                audit=a.audit_add_only(kv0,kv1,rows,added,t.secret(root));expected=t.record_hash(added)
                t.require(added['record_audit']['before_hash']==t.record_hash(before),'Import preimage mismatch')
                delta=audit['counter_after']-audit['counter_before']
                t.require(delta==new,'Native action allocation does not match actual newly-added pairs')
                reopened=t.verify_separate(root,j,rows,expected)
                result={'added':new,'skipped_existing':len(rows)-new,'input_duplicates':len(plan['validation']['duplicates_in_file'])}
            gate(root,j,q0,delta,reserve)
            q1=probe(root,j)
            t.require(q1['last_assigned_sequence']==q0['last_assigned_sequence']+delta and q1['local_consumed_watermark']==q0['local_consumed_watermark'] and q1['queue_epoch']==q0['queue_epoch'],'Native transaction changed queue history/head')
            gate(root,j,q1,0,reserve)
            t.require(t.kv(root,j)['hashes']==kv1['hashes'],'Candidate query contaminated commit clone')
            incoming=j/'data/userDict/v5';e.safe_tree(incoming);e.sync_tree(incoming);gen=(incoming/'db_path.conf').read_text('ascii')
            incoming_fd=t.lock_file(incoming/gen/'LOCK');cleanup.callback(close_incoming)
            staged=t.manifest_locked(incoming,incoming/gen/'LOCK',incoming_fd)
            t.require(src.files()==files and not src.pids(),'Source changed before exchange')
            result.update(action_sequence_first=q0['last_assigned_sequence']+1,action_sequence_last=q1['last_assigned_sequence'],queue=q1,compensation_action_reserve=reserve,cloud_delivery_verified=False)
            checkpoint('prepared',stage=str(incoming.relative_to(root)),before_files=files,after_files=staged,before_record_hash=t.record_hash(before),after_record_hash=expected,result=result,native_import=added if not undo else None,independent_verify=reopened,full_kv_audit=audit)
            if fault=='before-swap':raise e.Error('Lab injected pre-exchange failure')
            if src.mode=='formal':sl.assert_active(root,plan['id'],mutation=True,job_id=plan.get('batch_job_id'))
            attempted=True;t.swap(src.path,incoming);did_swap=True
            t.require(t.manifest_locked(src.path,src.path/gen/'LOCK',incoming_fd)==staged,'Exchange destination mismatch')
            t.require(t.manifest_locked(incoming,incoming/src.generation/'LOCK',src.fd)==files,'Exchange backup mismatch')
            checkpoint('swapped',swapped=True);close_incoming()
            if fault=='after-swap':raise e.Error('Lab injected post-exchange failure')
        checkpoint('committed',swapped=True,original_state_restored=True);remember(root,q1,'transaction-committed')
        return journal
    except BaseException as ex:
        close_incoming();restore_error=None
        if src.mode=='formal':
            try:src.restore(journal['original_running'],journal['original_source'])
            except BaseException as restore_ex:restore_error=type(restore_ex).__name__+': '+str(restore_ex)
        checkpoint('recovery-required' if attempted or restore_error else 'aborted',swapped=True if did_swap else None if attempted else False,exchange_attempted=attempted,error=type(ex).__name__+': '+str(ex),restore_error=restore_error)
        raise

def recover(root,src,name):
    state=read_tx(root,src,name);t.require(state['phase'] in PENDING,'Transaction is already terminal')
    with src.quiet(resume=state):
        j,_=t.snapshot(root,src);r,_=t.inspected(root,j,state['rows']);actual=t.record_hash(r);q=probe(root,j)
        gate(root,j,q)
        # Preserve current data. Exact known record pre/postimage is classification only.
        if actual==state.get('after_record_hash'):
            allocated=state['result']['queue'];old=state['before_queue']
            t.require(q['queue_epoch']==allocated['queue_epoch'] and q['last_assigned_sequence']>=allocated['last_assigned_sequence'] and q['action_max']<=q['last_assigned_sequence'] and q['local_consumed_watermark']>=old['local_consumed_watermark'],'Recovery queue history is inconsistent; preserve all copies')
            phase='committed-recovered'
        elif actual==state.get('before_record_hash'):phase='aborted-recovered'
        elif 'after_record_hash' not in state and not state.get('exchange_attempted'):phase='aborted-recovered'
        else:raise e.Error('Ambiguous recovery: preserve all copies; no automatic overwrite')
    remember(root,q,'recovery-observation');state.update(phase=phase,recovered_at=t.now(),dictionary_overwritten=False);t.save(root,root/'sync-transactions'/(name+'.json'),state)
    return {'id':name,'phase':phase,'dictionary_overwritten':False,'cloud_state_classified':False}

def execute(args):
    if args.command=='validate':return rows_file(args.words)
    root=e.safe_root(args.workspace)
    if args.command=='init':
        result=t.initialize(root,args.target)
        legacy=result.pop('formal_import_enabled',False)
        result.pop('submission_disabled_reason',None);result.pop('batch_input_limit',None)
        result.update(legacy_formal_import_enabled=legacy,formal_batch_import_enabled=args.target=='formal',service_interlock_required=args.target=='formal',max_transaction_rows=LIMIT)
        return result
    if args.command=='recover-service':
        with e.locked(root):return sl.recover(root)
    with e.locked(root):
        config=e.read_json(root/'STORE.json');t.require(config['target']==args.target and config['abi']==e.ABI,'Workspace target/version mismatch');prepare(root);src=t.Source(root,args.target)
        if args.command=='status':return {'target':src.mode,'pending_transactions':pending(root),'max_transaction_rows':LIMIT,'release':e.read_json(HERE/'sync-release.json')}
        if args.command=='recover':
            with sl.guard(root,src,'recover'):return recover(root,src,args.transaction)
        if args.command=='queue':
            with sl.guard(root,src,'queue'),src.quiet():j,_=t.snapshot(root,src)
            q=probe(root,j)
            try:admission=gate(root,j,q)
            finally:remember(root,q,'queue')
            return {'target':src.mode,'queue':q,'admission':admission,'formal_dictionary_written':False}
        if args.command in ('baseline','preview'):
            with sl.guard(root,src,'preview'):return import_preview(root,src,args.words,args.command=='baseline')
        if args.command=='preview-undo':
            t.require(src.mode!='formal','Formal compensation is outside this release')
            return undo_preview(root,src,args.receipt)
        if args.command in ('import','undo'):
            p=plan_read(root,src,args.plan,'sync-import-plan' if args.command=='import' else 'sync-undo-plan')
            with sl.guard(root,src,'import',plan_id=p['id']):return transact(root,src,p)
        raise e.Error('Unknown sync operation')

def main():
    os.umask(0o077);p=argparse.ArgumentParser(description=__doc__);p.add_argument('--workspace',default=str(Path.cwd()/'wetype-lab-sync'));p.add_argument('--target',choices=['lab','formal'],default='lab');sub=p.add_subparsers(dest='command',required=True)
    for name in ['init','status','queue','recover-service']:sub.add_parser(name)
    for name in ['validate','baseline','preview']:sub.add_parser(name).add_argument('words')
    for name in ['import','undo']:sub.add_parser(name).add_argument('--plan',required=True)
    sub.add_parser('preview-undo').add_argument('--receipt',required=True)
    sub.add_parser('recover').add_argument('transaction')
    try:print(json.dumps(execute(p.parse_args()),ensure_ascii=False,indent=2))
    except (e.Error,a.AuditError,OSError,ValueError,subprocess.SubprocessError) as ex:print(json.dumps({'error':str(ex),'no_automatic_resend':True},ensure_ascii=False),file=sys.stderr);raise SystemExit(2)
if __name__=='__main__':main()
