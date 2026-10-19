#!/usr/bin/env python3
"""Audited WeType 3.0.0 batch import; lab is the default target."""
import argparse, contextlib, ctypes, datetime, fcntl, hashlib, hmac, json, os, re, shutil, subprocess, sys, time, uuid
from pathlib import Path
import engine_support as e
import audit_helpers as a

DUMMY = [{'word':'青瓷脉阵','pinyin':'qing,ci,mai,zhen'}]
TRAILER = bytes.fromhex('100000005aa55aa5')

def require(condition, message):
    if not condition: raise e.Error(message)

def now(): return datetime.datetime.now(datetime.timezone.utc).isoformat()
def token(prefix): return prefix+'-'+uuid.uuid4().hex
def fp(files): return hashlib.sha256(e.json_bytes(files)).hexdigest()
def secret(root):
    p=root/'audit.key'
    require(p.is_file() and p.stat().st_size==32, 'Missing or invalid private audit key')
    return p.read_bytes()
def sign(root, obj):
    clean={k:v for k,v in obj.items() if k!='seal'}
    return hmac.new(secret(root),e.json_bytes(clean),hashlib.sha256).hexdigest()
def save(root, path, obj):
    obj=dict(obj);obj['seal']=sign(root,obj);e.atomic_json(path,obj);return obj
def read(root, path):
    e.safe_tree(path.parent);o=e.read_json(path)
    require(isinstance(o,dict) and hmac.compare_digest(str(o.get('seal','')),sign(root,o)), 'Document signature mismatch; refusing modified plan/backup/journal')
    require(o.get('workspace_id')==e.read_json(root/'STORE.json')['id'], 'Document belongs to another workspace')
    return o
def ident(value,prefix):
    require(bool(re.fullmatch(re.escape(prefix)+r'-[0-9a-f]{32}',value)), 'Invalid '+prefix+' ID');return value

def lock_file(path):
    fd=os.open(path,os.O_RDWR|os.O_NOFOLLOW)
    try: fcntl.lockf(fd,fcntl.LOCK_EX|fcntl.LOCK_NB)
    except BaseException: os.close(fd);raise
    return fd

def manifest_locked(path, lockpath, fd):
    e.safe_tree(path);out={}
    for p in sorted(path.rglob('*')):
        if not p.is_file(): continue
        if p==lockpath:
            h=hashlib.sha256();offset=0
            while True:
                b=os.pread(fd,1048576,offset)
                if not b: break
                h.update(b);offset+=len(b)
            out[str(p.relative_to(path))]=h.hexdigest()
        else: out[str(p.relative_to(path))]=e.digest(p)
    return out

def copy_locked(src,dest,lockpath,fd):
    def copy(x,y):
        if Path(x)==lockpath:
            with open(y,'xb') as f:
                offset=0
                while True:
                    b=os.pread(fd,1048576,offset)
                    if not b: break
                    f.write(b);offset+=len(b)
            shutil.copystat(x,y);return y
        return shutil.copy2(x,y)
    shutil.copytree(src,dest,copy_function=copy)

def swap(x,y):
    require(x.stat().st_dev==y.stat().st_dev, 'Atomic exchange requires the same filesystem')
    lib=ctypes.CDLL(None,use_errno=True)
    lib.renamex_np.argtypes=[ctypes.c_char_p,ctypes.c_char_p,ctypes.c_uint];lib.renamex_np.restype=ctypes.c_int
    if lib.renamex_np(os.fsencode(x),os.fsencode(y),2): raise OSError(ctypes.get_errno(),'RENAME_SWAP failed; no non-atomic fallback')
    e.fsync_dir(x.parent);e.fsync_dir(y.parent)

class Source:
    def __init__(self,root,mode):
        self.root,self.mode=root,mode
        self.path=(Path.home()/'Library/Application Support/WeType/userDict/v5') if mode=='formal' else root/'live/v5'
        self.fd=None;self.generation=None;self.lockpath=None
    def pids(self):
        if self.mode!='formal': return []
        p=subprocess.run(['/usr/bin/pgrep','-f',r'^/Library/Input Methods/WeType\.app/Contents/MacOS/WeType($| )'],capture_output=True,text=True,timeout=10)
        require(p.returncode in(0,1),'Cannot inspect official input method process')
        return [int(x) for x in p.stdout.split()]
    def input_source(self,target=None):
        p=subprocess.run([str(self.root/'cache/input_source')]+([target] if target else []),check=True,capture_output=True,text=True,timeout=10)
        r=dict(x.split('=',1) for x in p.stdout.splitlines() if '=' in x)
        if target: require(r.get('selected')==target,'Input source switch failed')
        require(bool(r.get('current')),'Current input source unavailable');return r['current']
    def stop(self):
        pids=self.pids();require(len(pids)<=1,'Multiple official input method processes; refusing')
        if pids:
            subprocess.run([str(self.root/'cache/app_control')],capture_output=True,check=True,timeout=10)
            deadline=time.monotonic()+15
            while self.pids() and time.monotonic()<deadline: time.sleep(.1)
            require(not self.pids(),'Input method did not quit normally; no forced kill is used')
    def restore(self,running,source):
        if self.mode!='formal': return
        if running:
            subprocess.run(['/usr/bin/open',str(e.APP)],check=True,capture_output=True,timeout=15)
            deadline=time.monotonic()+15
            while not self.pids() and time.monotonic()<deadline: time.sleep(.1)
            require(bool(self.pids()),'Official input method did not restart; run recover')
        if source: self.input_source(source)
    @contextlib.contextmanager
    def quiet(self, resume=None):
        self.check_path();original=None;running=False
        if self.mode=='formal':
            original=self.input_source();running=bool(self.pids())
        try:
            if self.mode=='formal': self.input_source('com.apple.keylayout.ABC');self.stop()
            if self.mode=='formal':
                r=subprocess.run(['/usr/sbin/lsof','-nP','+D',str(self.path)],capture_output=True,timeout=15)
                require(r.returncode in(0,1) and not r.stdout.strip(),'Database has open users; refusing access')
            self.generation=(self.path/'db_path.conf').read_text('ascii')
            require(bool(re.fullmatch(r'[0-9]{1,32}',self.generation)), 'Invalid dictionary generation')
            self.lockpath=self.path/self.generation/'LOCK';self.fd=lock_file(self.lockpath)
            require(not self.pids(),'Official input method restarted during locking')
            self.original_source=original;self.original_running=running
            yield self
        finally:
            if self.fd is not None: os.close(self.fd);self.fd=None
            self.restore(running or bool(resume and resume.get('original_running')), (resume or {}).get('original_source') or original)
    def check_path(self):
        require(self.path.is_dir(),'Dictionary does not exist; lab requires init')
        for p in [self.path]+list(self.path.parents): require(not p.is_symlink(),'Dictionary path contains a symbolic link')
        e.safe_tree(self.path)
    def files(self): return manifest_locked(self.path,self.lockpath,self.fd)
    def copy(self,dest):
        before=self.files();copy_locked(self.path,dest,self.lockpath,self.fd)
        require(e.manifest(dest)==before and self.files()==before,'Consistent snapshot verification failed')
        return before

def job(root, source=None):
    p=root/'jobs'/token('job');p.mkdir(mode=0o700)
    if source: shutil.copytree(source,p/'data')
    else: (p/'data/engine').mkdir(parents=True);(p/'data/userDict').mkdir()
    a.new_job_key(p,secret(root));return p

def native(root,j,mode,rows,fault=0):
    require(1<=len(rows)<=500,'Native request must contain 1–500 unique pairs')
    e.prepare(root);e.check_db_paths(j/'data');e.safe_tree(j)
    return a.invoke_worker(root,j,mode,rows,timeout=1800,fault_after=fault)

def kv(root,j):
    r=a.invoke_kv(root,j,timeout=120)
    for p in (j/'data/userDict/v5').glob('*/LOG'):
        require(b'repair' not in p.read_bytes().lower(),'Native database repair detected; snapshot refused')
    return r

def inspected(root,j,rows):
    before=kv(root,j);r=native(root,j,'inspect',rows);after=kv(root,j)
    require(before['hashes']==after['hashes'],'Engine initialization changed logical keys; refusing transaction')
    return r,before

def snapshot(root,src):
    j=job(root);files=src.copy(j/'data/userDict/v5');return j,files

def record_hash(report): return report['record_audit']['after_hash']
FORMAL_IMPORT_PAUSE_REASON='Formal import is paused: the local consumer can trim its pending queue to 1000 and advance its cursor; neither that cursor nor local action presence proves cloud or cross-device completion'

def refuse_formal_import(src):
    require(src.mode!='formal',FORMAL_IMPORT_PAUSE_REASON)

def formal_submission_policy(mode):
    return {'formal_import_enabled':False,'formal_snapshot_rollback_enabled':False,'submission_disabled_reason':FORMAL_IMPORT_PAUSE_REASON} if mode=='formal' else {}

def refuse_formal_snapshot_rollback(src):
    require(src.mode!='formal', 'Formal full-snapshot rollback is disabled: cloud synchronization state and monotonic action IDs are not jointly restored')

def preserve_formal_exchange(src,journal,checkpoint,error):
    # quiet() already attempted restoration on exit. Retry the original UI/process
    # intent, never reopen/quiesce the DB and never exchange a historical v5 back.
    fields={'swapped':True,'error':str(error),'automatic_snapshot_rewind':False}
    journal_error=None
    try: checkpoint('recovery-required',**fields)
    except BaseException as ex: journal_error=type(ex).__name__
    restore_error=None
    try: src.restore(bool(journal.get('original_running')),journal.get('original_source'))
    except BaseException as ex: restore_error=type(ex).__name__
    try: checkpoint('recovery-required',**fields,original_state_restore_attempted=True,original_state_restore_succeeded=restore_error is None,restore_error=restore_error,journal_write_error=journal_error)
    except BaseException: pass
    raise e.Error('Formal exchange completed; recovery is required. Current dictionary and both snapshots are preserved; automatic historical rollback is disabled. Transaction: '+journal['id']) from error

def base_meta(root,kind):
    return {'schema':1,'workspace_id':e.read_json(root/'STORE.json')['id'],'abi':e.ABI,'source_sha256':e.SOURCE_SHA,'kind':kind,'created_at':now()}

def backup_from(root,src,reason,rows,record=None):
    name=token('backup');p=root/'backups'/name;p.mkdir(mode=0o700)
    files=src.copy(p/'v5');meta=base_meta(root,'backup')|{'id':name,'target':src.mode,'reason':reason,'generation':src.generation,'files':files,'fingerprint':fp(files),'rows':rows,'record_hash':record,'guard_record_hash':record}
    save(root,p/'backup.json',meta);e.sync_tree(p);return meta

def backup_check(root,src,name):
    p=root/'backups'/ident(name,'backup');m=read(root,p/'backup.json')
    require(m.get('id')==name and m.get('target')==src.mode and m.get('abi')==e.ABI and m.get('source_sha256')==e.SOURCE_SHA,'Backup identity mismatch')
    require(set(x.name for x in p.iterdir())=={'v5','backup.json'},'Unexpected backup files')
    require(m['files']==e.manifest(p/'v5') and m['fingerprint']==fp(m['files']),'Backup inventory or SHA256 mismatch')
    return p,m

def backup_job(root,path):
    j=job(root);shutil.copytree(path/'v5',j/'data/userDict/v5');return j

def plan_read(root,src,name,kind):
    p=read(root,root/'plans'/(ident(name,'plan')+'.json'))
    require(p.get('target')==src.mode and p.get('kind')==kind and p.get('abi')==e.ABI,'Plan kind/target/version mismatch')
    return p

def record_plan(root,src,kind,fields):
    name=token('plan');p=base_meta(root,kind)|{'id':name,'target':src.mode}|fields
    return save(root,root/'plans'/(name+'.json'),p)

def verify_separate(root,staged,rows,expected):
    v=job(root,staged/'data');r=native(root,v,'verify',rows)
    require(record_hash(r)==expected,'Restart verification changed the personal record multiset')
    require(all(x['existed'] and x['count']>0 and x['rank']>0 for x in r['rows']),'Missing persisted pair or candidate')
    return r

def initialize(root,mode):
    require(not (root/'STORE.json').exists(),'Workspace already initialized')
    e.initialize(root)
    (root/'audit.key').write_bytes(os.urandom(32));(root/'audit.key').chmod(0o600)
    (root/'transactions').mkdir(mode=0o700)
    config={'schema':1,'id':uuid.uuid4().hex,'target':mode,'abi':e.ABI,'purpose':'audited-personal-learning-dictionary'}
    e.atomic_json(root/'STORE.json',config)
    with e.locked(root):
        e.prepare(root)
        if mode=='lab':
            j=job(root);native(root,j,'inspect',DUMMY)
            (root/'live').mkdir();shutil.copytree(j/'data/userDict/v5',root/'live/v5')
    return {'target':mode,'workspace':str(root),'abi':e.ABI,'production_written':False,'batch_input_limit':500}|formal_submission_policy(mode)

def transact(root,src,plan,fault=None):
    if plan['kind']=='import-plan': refuse_formal_import(src)
    else: refuse_formal_snapshot_rollback(src)
    tx=token('tx');journal=base_meta(root,'transaction')|{'id':tx,'target':src.mode,'plan_id':plan['id'],'operation':plan['kind'],'phase':'started','swapped':False}
    if src.mode=='formal': journal.update(original_running=bool(src.pids()),original_source=src.input_source())
    jp=root/'transactions'/(tx+'.json');save(root,jp,journal)
    def checkpoint(phase,**fields):
        journal.update(fields);journal['phase']=phase;save(root,jp,journal)
    incoming=None;incoming_fd=None;did_swap=False;backup=None
    try:
        with src.quiet():
            checkpoint('quiesced',original_running=src.original_running,original_source=src.original_source)
            baseline,files=snapshot(root,src)
            rows=plan['validation']['rows'] if plan['kind']=='import-plan' else plan['rows']
            before,kv_before=inspected(root,baseline,rows or DUMMY)
            require(record_hash(before)==plan['base_record_hash'],'Preview is stale: dictionary words/counts changed; preview again')
            if plan['kind']=='import-plan':
                expected_preview=[(x['existed'],x['count']) for x in plan['native_preview']['rows']]
                require([(x['existed'],x['count']) for x in before['rows']]==expected_preview,'Pair counts changed since preview')
                if all(x['existed'] for x in before['rows']):
                    checkpoint('no-op',added=0,skipped=len(rows));return {'transaction':tx,'added':0,'skipped':len(rows),'unchanged':True}
                backup=backup_from(root,src,'before-import',rows,record_hash(before));checkpoint('backed-up',backup_id=backup['id'])
                added=native(root,baseline,'import',rows,1 if fault=='native' else 0)
                kv_after=kv(root,baseline)
                audited=a.audit_add_only(kv_before,kv_after,rows,added,secret(root))
                require(added['record_audit']['before_hash']==record_hash(before),'Import started from wrong personal record multiset')
                expected=record_hash(added)
                reopened=verify_separate(root,baseline,rows,expected)
                require(reopened['pid']!=added['pid'],'Independent process verification missing')
                require(kv(root,baseline)['hashes']==kv_after['hashes'],'Verification modified the Add-only commit clone')
                staged=baseline;count=sum(x['added'] for x in added['rows'])
                result={'added':count,'skipped':len(rows)-count,'existing_records_changed':0,'audit':audited,'new_process_verify':reopened,'native_import':added}
                bp=root/'backups'/backup['id']/'backup.json';backup['guard_record_hash']=expected;backup['imported_pairs']=count;save(root,bp,backup)
            else:
                path,old=backup_check(root,src,plan['backup_id'])
                require(record_hash(before)==old['guard_record_hash'],'Rollback conflict: subsequent learning would be lost; no forced restore')
                staged=backup_job(root,path);target_report,target_kv=inspected(root,staged,rows or DUMMY)
                require(record_hash(target_report)==old['record_hash'],'Backup personal record hash mismatch')
                present=[{'pinyin':x['pinyin'],'word':x['word']} for x in target_report['rows'] if x['existed']]
                reopened=verify_separate(root,staged,present,record_hash(target_report)) if present else None
                # Recreate from immutable backup so even native LOG changes are not committed.
                staged=backup_job(root,path);expected=old['record_hash']
                backup=backup_from(root,src,'before-rollback',rows,record_hash(before));backup['guard_record_hash']=expected;save(root,root/'backups'/backup['id']/'backup.json',backup)
                checkpoint('backed-up',backup_id=backup['id'])
                result={'restored_from':old['id'],'undo_backup_id':backup['id'],'existing_words_after_restore':target_report['record_audit']['after_count'],'backup_exact_files_restored':True,'new_process_verify':reopened}
            incoming=staged/'data/userDict/v5';e.safe_tree(incoming);e.sync_tree(incoming)
            generation=(incoming/'db_path.conf').read_text('ascii')
            require(bool(re.fullmatch(r'[0-9]{1,32}',generation)), 'Invalid staged generation')
            incoming_fd=lock_file(incoming/generation/'LOCK')
            newfiles=manifest_locked(incoming,incoming/generation/'LOCK',incoming_fd)
            require(src.files()==files and not src.pids(),'Formal source changed or input method restarted; refusing swap')
            checkpoint('prepared',stage=str(incoming.relative_to(root)),before_files=files,after_files=newfiles,before_record_hash=record_hash(before),after_record_hash=expected,generation=generation,result=result)
            if fault=='before-swap': raise e.Error('Injected failure before atomic exchange')
            if fault=='crash-before-swap': os._exit(86)
            swap(src.path,incoming);did_swap=True
            require(manifest_locked(src.path,src.path/generation/'LOCK',incoming_fd)==newfiles and manifest_locked(incoming,incoming/src.generation/'LOCK',src.fd)==files,'Atomic exchange content mismatch')
            checkpoint('swapped',swapped=True)
            if fault=='after-swap': raise e.Error('Injected failure after atomic exchange')
            if fault=='crash-after-swap': os._exit(86)
            os.close(incoming_fd);incoming_fd=None
        checkpoint('committed',swapped=True,official_app_restarted=src.mode=='formal')
        return {'transaction':tx,'backup_id':backup['id'],'target':src.mode,**result}
    except BaseException as error:
        if incoming_fd is not None: os.close(incoming_fd);incoming_fd=None
        if did_swap:
            if src.mode=='formal': preserve_formal_exchange(src,journal,checkpoint,error)
            try:
                # The app may have reopened; reacquire both POSIX locks and audit before undo.
                with src.quiet(resume=journal):
                    current,curfiles=snapshot(root,src);r,_=inspected(root,current,rows or DUMMY)
                    require(record_hash(r)==journal['after_record_hash'],'Recovery conflict: new learning exists; refusing to overwrite it')
                    oldgen=(incoming/'db_path.conf').read_text('ascii');oldfd=lock_file(incoming/oldgen/'LOCK')
                    try:
                        swap(src.path,incoming)
                        require(manifest_locked(src.path,src.path/oldgen/'LOCK',oldfd)==journal['before_files'],'Automatic rollback file verification failed')
                    finally: os.close(oldfd)
                checkpoint('rolled-back',swapped=False,error=str(error));did_swap=False
            except BaseException as recovery_error:
                checkpoint('recovery-required',swapped=True,error=str(error),recovery_error=str(recovery_error))
                raise e.Error('Transaction needs recover; current data and backups preserved. Transaction: '+tx) from recovery_error
        else: checkpoint('aborted',swapped=False,error=str(error))
        raise e.Error('Import/rollback aborted; backup and diagnostics retained. Transaction: '+tx+'; '+str(error)) from error

def recover(root,src,tx):
    state=read(root,root/'transactions'/(ident(tx,'tx')+'.json'))
    require(state.get('target')==src.mode,'Recovery target mismatch')
    require(state['phase'] in ('started','quiesced','backed-up','prepared','swapped','recovery-required'),'Transaction is already terminal')
    with src.quiet(resume=state):
        j,files=snapshot(root,src);r,_=inspected(root,j,DUMMY);actual=record_hash(r)
        if actual==state.get('after_record_hash'):phase='committed-recovered';swapped=True
        elif actual==state.get('before_record_hash'):phase='aborted-recovered';swapped=False
        elif 'after_record_hash' not in state:phase='aborted-recovered';swapped=False
        else: raise e.Error('Recovery is ambiguous: current words changed; preserved all data, refusing overwrite')
    state.update(phase=phase,swapped=swapped,recovered_at=now());save(root,root/'transactions'/(tx+'.json'),state)
    return {'transaction':tx,'phase':phase,'word_dictionary_unchanged_by_recovery':True,'input_method_restored':src.mode=='formal'}

def execute(args):
    if args.command=='validate': return e.normalize_rows(Path(args.words))
    root=e.safe_root(args.workspace)
    if args.command=='init': return initialize(root,args.target)
    with e.locked(root):
        config=e.read_json(root/'STORE.json');require(config['target']==args.target,'Workspace target mismatch; use a separate workspace')
        require(config['abi']==e.ABI,'Workspace ABI mismatch');e.prepare(root)
        src=Source(root,args.target)
        if args.command=='status':
            pending=[]
            for p in (root/'transactions').glob('tx-*.json'):
                s=read(root,p)
                if s['phase'] in ('started','quiesced','backed-up','prepared','swapped','recovery-required'):pending.append({'id':s['id'],'phase':s['phase']})
            return {'target':args.target,'abi':e.ABI,'workspace':str(root),'official_input_method_running':bool(src.pids()),'pending_transactions':pending,'batch_input_limit':500}|formal_submission_policy(src.mode)
        if args.command=='backups':
            return [read(root,p) for p in sorted((root/'backups').glob('backup-*/backup.json'))]
        if args.command=='recover': return recover(root,src,args.transaction)
        if args.command in ('import','rollback'):
            require(not any(read(root,p)['phase'] in ('started','quiesced','backed-up','prepared','swapped','recovery-required') for p in (root/'transactions').glob('tx-*.json')),'Pending interrupted transaction; run status and recover first')
            p=plan_read(root,src,args.plan,'import-plan' if args.command=='import' else 'rollback-plan')
            fault=getattr(args,'fault',None)
            require(not (src.mode=='formal' and fault),'Failure injection is lab-only')
            return transact(root,src,p,fault)
        if args.command in ('preview','verify'):
            valid=e.normalize_rows(Path(args.words));rows=valid['rows']
            with src.quiet(): j,files=snapshot(root,src)
            r,_=inspected(root,j,rows)
            if args.command=='verify':
                present=[{'pinyin':x['pinyin'],'word':x['word']} for x in r['rows'] if x['existed']]
                require(len(present)==len(rows),'Some requested pairs are absent')
                v=verify_separate(root,j,rows,record_hash(r))
                return {'target':src.mode,'unchanged':True,'new_process_verify':v}
            return record_plan(root,src,'import-plan',{'validation':valid,'base_record_hash':record_hash(r),'base_record_count':r['record_audit']['after_count'],'native_preview':r,'add':sum(not x['existed'] for x in r['rows']),'skip_existing':sum(x['existed'] for x in r['rows']),'fingerprint_at_snapshot':fp(files),'note':'Import takes a new consistent backup and rejects changed word metadata; auxiliary/log-only changes can be preserved from that fresh snapshot.'}|formal_submission_policy(src.mode))
        if args.command=='backup':
            with src.quiet():
                j,_=snapshot(root,src);r,_=inspected(root,j,DUMMY);return backup_from(root,src,'manual',DUMMY,record_hash(r))
        if args.command=='preview-rollback':
            refuse_formal_snapshot_rollback(src)
            path,b=backup_check(root,src,args.backup_id)
            rows=b['rows'] or DUMMY
            with src.quiet(): j,_=snapshot(root,src)
            current,_=inspected(root,j,rows)
            require(record_hash(current)==b['guard_record_hash'],'Rollback conflict: subsequent learning would be lost; no forced restore')
            v=backup_job(root,path);dest,_=inspected(root,v,rows)
            require(record_hash(dest)==b['record_hash'],'Backup record digest mismatch')
            return record_plan(root,src,'rollback-plan',{'backup_id':b['id'],'base_record_hash':record_hash(current),'rows':rows,'current_record_count':current['record_audit']['after_count'],'restore_record_count':dest['record_audit']['after_count'],'words_removed_by_restore':current['record_audit']['after_count']-dest['record_audit']['after_count'],'warning':'Restore the complete v5 snapshot, including auxiliary statistics. Current data is backed up first. Subsequent learning causes a conflict and is never forced over.'})
    raise e.Error('Unknown command')

def main(argv=None):
    os.umask(0o077)
    p=argparse.ArgumentParser(description='微信输入法3.0.0个人学习词库：默认隔离，正式操作显式选择 --target formal；所有输出JSON。')
    p.add_argument('--workspace',default=str(Path.cwd()/'work/wetype-lab-managed'))
    p.add_argument('--target',choices=['lab','formal'],default='lab')
    sub=p.add_subparsers(dest='command',required=True)
    for cmd in ('init','status','backup','backups'):sub.add_parser(cmd)
    for cmd in ('validate','preview','verify'):sub.add_parser(cmd).add_argument('words')
    for cmd in ('import','rollback'):
        c=sub.add_parser(cmd);c.add_argument('--plan',required=True);c.add_argument('--fault',choices=['native','before-swap','after-swap','crash-before-swap','crash-after-swap'],help=argparse.SUPPRESS)
    sub.add_parser('preview-rollback').add_argument('backup_id')
    sub.add_parser('recover').add_argument('transaction')
    args=p.parse_args(argv)
    try:
        print(json.dumps({'ok':True,'result':execute(args)},ensure_ascii=False,indent=2));return 0
    except (e.Error,a.AuditError,OSError,ValueError,KeyError,TypeError,subprocess.SubprocessError) as ex:
        print(json.dumps({'ok':False,'error':str(ex)},ensure_ascii=False),file=sys.stderr);return 2
if __name__=='__main__':sys.exit(main())
