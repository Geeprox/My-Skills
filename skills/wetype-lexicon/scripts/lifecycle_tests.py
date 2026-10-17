"""Real isolated dictionaries; simulated application/input-source restore failures."""
import argparse,json,os,sys
from pathlib import Path
import lexicon_cli as c
os.umask(0o077)
p=argparse.ArgumentParser();p.add_argument('--workspace',required=True);args=p.parse_args();root=c.e.safe_root(args.workspace)
if root.exists():raise RuntimeError('Requires a new workspace')
c.initialize(root,'lab')
rows=[{'word':'霜澜织舟','pinyin':'shuang,lan,zhi,zhou'}]
extra=[{'word':'云栖棠阵','pinyin':'yun,qi,tang,zhen'}]
words=root/'test-words.json';words.write_text(json.dumps(rows,ensure_ascii=False))
def run(cmd,**kwargs):return c.execute(argparse.Namespace(command=cmd,workspace=str(root),target='lab',**kwargs))
def source_fp():return c.fp(c.e.manifest(root/'live/v5'))
result={'dictionary':'real native isolated','application_restore_failure':'simulated','production_written':False,'checks':[]}
# 1. The first application-restore error occurs after the new dictionary was swapped.
plan=run('preview',words=str(words));before=source_fp();source=c.Source(root,'lab');n=[0]
def fail_once(running,original):
 n[0]+=1
 if n[0]==1:raise c.e.Error('simulated input-source restoration error')
source.restore=fail_once
with c.e.locked(root):
 try:c.transact(root,source,plan)
 except c.e.Error:pass
 else:raise AssertionError('restoration fault was ignored')
assert source_fp()==before
result['checks'].append({'name':'post-swap-restore-error-auto-rollback','exact_original_files_restored':True})
# 2. Failure while restoring the app after undo leaves an honest pending journal;
# recover classifies actual original records, rather than trusting swapped=true.
plan=run('preview',words=str(words));source=c.Source(root,'lab');n=[0]
def fail_twice(running,original):
 n[0]+=1
 if n[0]<=2:raise c.e.Error('simulated repeated restoration error')
source.restore=fail_twice
with c.e.locked(root):
 try:c.transact(root,source,plan)
 except c.e.Error:pass
 else:raise AssertionError('repeated fault was ignored')
status=run('status');assert len(status['pending_transactions'])==1
recovered=run('recover',transaction=status['pending_transactions'][0]['id']);assert recovered['phase']=='aborted-recovered' and source_fp()==before
result['checks'].append({'name':'failed-auto-rollback-lifecycle-recovered-by-records','phase':recovered['phase'],'exact_original_files_restored':True})
# 3. Simulate independent native learning after official app reopening, then a
# source-restoration error. The new learned record must block destructive undo.
plan=run('preview',words=str(words));source=c.Source(root,'lab');n=[0]
def learn_then_fail(running,original):
 n[0]+=1
 if n[0]!=1:return
 j=c.job(root);c.shutil.copytree(source.path,j/'data/userDict/v5')
 report=c.native(root,j,'import',extra);assert report['rows'][0]['added']
 c.swap(source.path,j/'data/userDict/v5')
 raise c.e.Error('simulated source restoration failure after independent learning')
source.restore=learn_then_fail
with c.e.locked(root):
 try:c.transact(root,source,plan)
 except c.e.Error:pass
 else:raise AssertionError('conflicting new learning was overwritten')
status=run('status');assert len(status['pending_transactions'])==1
preserved=source_fp()
try:run('recover',transaction=status['pending_transactions'][0]['id'])
except c.e.Error:pass
else:raise AssertionError('ambiguous recovery should refuse')
assert source_fp()==preserved
with c.e.locked(root):
 j=c.job(root);c.shutil.copytree(source.path,j/'data/userDict/v5');r=c.native(root,j,'verify',rows+extra)
 assert all(x['existed'] and x['rank']>0 for x in r['rows'])
result['checks'].append({'name':'new-learning-blocks-destructive-auto-undo-and-ambiguous-recovery','both_pairs_preserved_and_recalled':True,'current_files_unchanged_by_recovery':True,'pending_transaction_retained':True})
result['ok']=True;(root/'lifecycle-results.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
