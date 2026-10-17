import argparse,json,os,subprocess,sys,time,shutil
from pathlib import Path
os.umask(0o077)
PACKAGE=Path(__file__).resolve().parent
sys.path.insert(0,str(PACKAGE));import lexicon_cli as c
parser=argparse.ArgumentParser(description='Only creates a new isolated lab; never targets formal dictionaries.')
parser.add_argument('--workspace',default=str(Path.cwd()/'work'/('wetype-lab-selftest-'+c.uuid.uuid4().hex)))
args=parser.parse_args();ROOT=c.e.safe_root(args.workspace)
if ROOT.exists():raise RuntimeError('Selftest requires a new, nonexistent workspace')
c.initialize(ROOT,'lab')
FIXTURES=ROOT/'fixtures';FIXTURES.mkdir(mode=0o700)
RESULT=ROOT/'selftest-results.json'
PAIRS=list(zip('青瓷麦阵云栖织流霜舟星澜玉帆柏松棠雾岑灯海杉月林泉夏沙雪竹秋谷风','qing ci mai zhen yun qi zhi liu shuang zhou xing lan yu fan bai song tang wu cen deng hai shan yue lin quan xia sha xue zhu qiu gu feng'.split()))
def generated(n,start=0):
 out=[]
 for i in range(start,start+n):
  x=(i*104729+19391)%(32**4);v=[PAIRS[(x//(32**k))%32]for k in range(4)]
  out.append({'word':''.join(c for c,p in v),'pinyin':','.join(p for c,p in v)})
 return out
out={'scope':'real native, isolated target only','production_written_this_run':False,'checks':[],'started_at':c.now()}
def save():RESULT.write_text(json.dumps(out,ensure_ascii=False,indent=2))
def check(name,proof):
 out['checks'].append({'name':name,'proof':proof});save();print('PASS '+name,flush=True)
def run(cmd,**kw):return c.execute(argparse.Namespace(command=cmd,workspace=str(ROOT),target='lab',**kw))
def expect_fail(name,fn):
 try:fn()
 except (c.e.Error,c.a.AuditError,OSError,ValueError) as ex:check(name,{'rejected':True,'error':str(ex)});return
 raise AssertionError(name+' was accepted')
def file(name,items):
 p=FIXTURES/name;p.write_text(json.dumps(items,ensure_ascii=False));return str(p)
def fingerprint():return c.fp(c.e.manifest(ROOT/'live/v5'))
def rollback(backup):
 p=run('preview-rollback',backup_id=backup);return run('rollback',plan=p['id'],fault=None)
small=[{'word':'青瓷脉阵','pinyin':'qing,ci,mai,zhen'},{'word':'清词麦镇','pinyin':'qing,ci,mai,zhen'},{'word':'星澜织舟','pinyin':'xing,lan,zhi,zhou'}]
smallfile=file('first.json',small+[small[0]])
invalid=file('invalid.json',[{'word':'青瓷','pinyin':'qing1,ci'}])
expect_fail('reject-invalid-pinyin-before-native',lambda:run('validate',words=invalid))
v=run('validate',words=smallfile);assert v['unique_rows']==3 and len(v['duplicates_in_file'])==1
check('file-normalization-and-dedup',{'input':4,'unique':3,'file_duplicates':1})
before=fingerprint();p=run('preview',words=smallfile);assert p['add']==3 and p['skip_existing']==0 and fingerprint()==before
check('preview-leaves-source-exact',{'add':3,'fingerprint':before})
x=run('import',plan=p['id'],fault=None);assert x['added']==3 and x['existing_records_changed']==0 and x['audit']['target_buckets']==2
firstbackup=x['backup_id'];firstfp=fingerprint()
check('batch-import-and-homophone-bucket',{'added':3,'pinyin_buckets':2,'backup_id':firstbackup,'native_import_pid':x['native_import']['pid'],'restart_pid':x['new_process_verify']['pid'],'ranks':[r['rank']for r in x['new_process_verify']['rows']]})
p=run('preview',words=smallfile);assert p['add']==0 and p['skip_existing']==3
x=run('import',plan=p['id'],fault=None);assert x['unchanged'] and fingerprint()==firstfp
check('existing-pairs-skip-native-add-and-preserve-bytes',{'added':0,'skipped':3,'fingerprint':firstfp})
manual=run('backup');assert manual['fingerprint']==firstfp
check('manual-backup-hashes',{'id':manual['id'],'fingerprint':firstfp})
# Stale plan and document-integrity controls.
p=run('preview',words=smallfile);planfile=ROOT/'plans'/(p['id']+'.json');original=planfile.read_bytes();tampered=json.loads(original);tampered['validation']['rows'][0]['word']='云舟';planfile.write_text(json.dumps(tampered))
expect_fail('tampered-plan-rejected',lambda:run('import',plan=p['id'],fault=None));planfile.write_bytes(original)
new500=generated(500,start=1000);largefile=file('batch-500.json',new500)
stale=run('preview',words=file('stale.json',[generated(1,start=50000)[0]]))
largeplan=run('preview',words=largefile);assert largeplan['add']==500
at=time.monotonic();large=run('import',plan=largeplan['id'],fault=None);elapsed=time.monotonic()-at
assert large['added']==500 and all(r['count']==1 and r['rank']>0 for r in large['new_process_verify']['rows'])
check('full-500-row-native-transaction',{'added':500,'skipped':0,'seconds':elapsed,'all_500_persisted_and_recalled':True,'ranks_max':max(r['rank']for r in large['new_process_verify']['rows']),'existing_records_changed':0})
largefp=fingerprint();expect_fail('stale-plan-rejected',lambda:run('import',plan=stale['id'],fault=None));assert fingerprint()==largefp
canary=run('verify',words=smallfile);assert all(r['rank']>0 for r in canary['new_process_verify']['rows'])
check('prior-homophones-recall-after-large-append',{'ranks':[r['rank']for r in canary['new_process_verify']['rows']]})
freshfile=file('fault.json',generated(3,start=900000))
for fault in ('native','before-swap','after-swap'):
 p=run('preview',words=freshfile);before=fingerprint()
 expect_fail('failure-'+fault,lambda p=p,fault=fault:run('import',plan=p['id'],fault=fault))
 assert fingerprint()==before
 check('failure-'+fault+'-source-exact',{'fingerprint':before})
# Future learning is simulated by a real additional native import, not by changing metadata.
p=run('preview',words=freshfile);appended=run('import',plan=p['id'],fault=None);afterappend=fingerprint()
expect_fail('rollback-refuses-new-learning-loss',lambda:run('preview-rollback',backup_id=large['backup_id']));assert fingerprint()==afterappend
r=rollback(appended['backup_id']);assert r['backup_exact_files_restored'] and fingerprint()==largefp
check('rollback-last-batch-exact',{'restored_pairs':503,'undo_backup_id':r['undo_backup_id']})
r=rollback(large['backup_id']);assert fingerprint()==firstfp
check('rollback-500-to-populated-backup-exact',{'restored_pairs':3,'fingerprint':firstfp,'undo_backup_id':r['undo_backup_id']})
# Corruption is rejected before a swap. Restore the intentionally changed private fixture afterwards.
bdir=ROOT/'backups'/manual['id']/'v5';chosen=next(p for p in bdir.rglob('*')if p.is_file() and p.name!='LOCK');orig=chosen.read_bytes();chosen.write_bytes(orig+b'corrupt')
expect_fail('corrupted-backup-rejected',lambda:run('preview-rollback',backup_id=manual['id']));chosen.write_bytes(orig)
assert fingerprint()==firstfp
# Abrupt process exit on either side of the real atomic exchange.
for fault in ('crash-before-swap','crash-after-swap'):
 p=run('preview',words=freshfile)
 cli=[sys.executable,str(PACKAGE/'lexicon_cli.py'),'--workspace',str(ROOT),'import','--plan',p['id'],'--fault',fault]
 proc=subprocess.run(cli,capture_output=True);assert proc.returncode==86
 status=run('status');assert len(status['pending_transactions'])==1;tx=status['pending_transactions'][0]['id']
 expect_fail('pending-'+fault+'-blocks-further-import',lambda:run('import',plan=p['id'],fault=None))
 recovered=run('recover',transaction=tx);state=c.read(ROOT,ROOT/'transactions'/(tx+'.json'))
 if fault=='crash-before-swap':assert recovered['phase']=='aborted-recovered' and fingerprint()==firstfp
 else:
  assert recovered['phase']=='committed-recovered'
  run('verify',words=freshfile);rollback(state['backup_id']);assert fingerprint()==firstfp
 check('recover-'+fault,{'child_exit':86,'phase':recovered['phase'],'final_source_exact':True})
# Record lock survives both full original hashing and snapshot copying.
src=c.Source(ROOT,'lab')
with src.quiet():
 j,files=c.snapshot(ROOT,src)
 test="import os,fcntl,sys;f=os.open(sys.argv[1],os.O_RDWR);\ntry: fcntl.lockf(f,fcntl.LOCK_EX|fcntl.LOCK_NB)\nexcept BlockingIOError: sys.exit(23)\nsys.exit(0)"
 result=subprocess.run([sys.executable,'-c',test,str(src.lockpath)]);assert result.returncode==23
check('posix-lock-retained-through-hash-and-copy',{'competing_process_denied':True})
# Restore initial empty library through the actual rollback command.
r=rollback(firstbackup)
empty=run('preview',words=smallfile);assert empty['add']==3 and empty['base_record_count']==0
check('restore-initial-empty-snapshot',{'record_count':0,'all_test_words_absent':True})
out['ok']=True;out['finished_at']=c.now();out['total_checks']=len(out['checks']);save();print('ALL ACCEPTANCE CHECKS PASSED',flush=True)
