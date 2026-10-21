"""Native offline transaction checks on private consistent copies, never formal Source."""
import sys,os,json,shutil,time,copy,argparse,subprocess
from pathlib import Path
os.umask(0o077)
HERE=Path(__file__).resolve().parent;sys.path.insert(0,str(HERE))
import sync_cli as s
import lexicon_cli as t
import engine_support as e
import audit_helpers as a
import backpressure_policy as bp
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--workspace',required=True,help='New private test directory, name starts wetype-lab')
parser.add_argument('--seed-workspace',required=True,help='Existing managed workspace owning the immutable backup')
parser.add_argument('--backup',required=True,help='Signed backup ID; only a backup copy is read')
args=parser.parse_args()
BASE=e.safe_root(args.workspace);t.require(not BASE.exists(),'Test workspace must not exist');BASE.mkdir(mode=0o700,parents=True)
seed_root=e.safe_root(args.seed_workspace)
with e.locked(seed_root):
    config=e.read_json(seed_root/'STORE.json');source=t.Source(seed_root,config['target'])
    backup_path,meta=t.backup_check(seed_root,source,args.backup)
    seed=BASE/'immutable-seed';shutil.copytree(backup_path/'v5',seed)
t.require(e.manifest(seed)==meta['files'],'Seed backup copy mismatch')
ROWS=[{'word':'雾珀弦岑','pinyin':'wu,po,xian,cen'},{'word':'绛霖砂簇','pinyin':'jiang,lin,sha,cu'},{'word':'苔岚汐榫','pinyin':'tai,lan,xi,sun'}]
WORDS=BASE/'trial-words.json';WORDS.write_text(json.dumps(ROWS,ensure_ascii=False))
checks=[];runid=str(time.time_ns())
def passed(name,**extra):
    checks.append({'name':name,'passed':True,**extra});e.atomic_json(BASE/'integration-results.json',{'passed':True,'completed':False,'formal_dictionary_written':False,'cloud_transport_tested':False,'code_hash':s.code_hash(),'checks':checks});print('PASS '+name,flush=True)
def newroot(label):
    root=BASE/('wetype-lab-sync-selftest-'+label+'-'+runid);t.initialize(root,'lab');s.prepare(root);src=t.Source(root,'lab')
    j=t.job(root);shutil.copytree(seed,j/'data/userDict/v5');incoming=j/'data/userDict/v5'
    with src.quiet():
        fd=t.lock_file(incoming/(incoming/'db_path.conf').read_text()/'LOCK')
        try:t.swap(src.path,incoming)
        finally:os.close(fd)
    return root,src
def snap(root,src):
    with src.quiet():j,_=t.snapshot(root,src)
    return j,t.kv(root,j)
def put_lab(root,src,rows,force_learning=False):
    with src.quiet():
        j,_=t.snapshot(root,src);result=t.native(root,j,'inspect' if force_learning else 'import',rows)
        if force_learning:
            assert src.mode=='lab' and len(rows)==1 and result['rows'][0]['existed']
            (root/'SYNTHETIC_REMOVE_TESTS_ONLY').write_text('isolated fixture only\n')
            exe=root/'cache/sync_learning_fixture'
            if not exe.exists():subprocess.run(['/usr/bin/xcrun','clang++','-std=c++17','-O0',str(HERE/'sync_learning_fixture.cpp'),'-lsandbox','-o',str(exe)],check=True,capture_output=True)
            p=subprocess.run([str(exe),str(root),str(j)],capture_output=True,timeout=120)
            assert p.returncode==0 and b'NATIVE_LEARN_COMPLETE count_before=1 count_after=2' in p.stdout
        incoming=j/'data/userDict/v5';fd=t.lock_file(incoming/(incoming/'db_path.conf').read_text()/'LOCK')
        try:t.swap(src.path,incoming)
        finally:os.close(fd)
    return result
# Three real native rows, restart recall, owned undo, old actions/head preserved.
root,src=newroot('batch-success')
with e.locked(root):
    p=s.import_preview(root,src,WORDS,True);assert p['add']==3 and all(r['rank']==0 for r in p['candidate_baseline'])
    initial=p['base_record_hash'];tx=s.transact(root,src,p);assert tx['result']['added']==3 and all(r['rank']>0 for r in tx['independent_verify']['rows'])
    assert tx['result']['action_sequence_last']-tx['result']['action_sequence_first']==2
    passed('three-native-adds-and-new-process-recall',ranks=[r['rank']for r in tx['independent_verify']['rows']],sequence_span=3)
    p2=s.import_preview(root,src,WORDS);j,k=snap(root,src);skip=s.transact(root,src,p2);_,k2=snap(root,src)
    assert skip['result']['added']==0 and k['hashes']==k2['hashes'];passed('repeat-all-existing-does-not-exchange-or-add-frequency')
    try:s.transact(root,src,p)
    except e.Error:pass
    else:raise AssertionError('plan replay accepted')
    _,k3=snap(root,src);assert k3['hashes']==k2['hashes'];passed('plan-replay-refused')
    unrelated=[{'word':'露砂弦岑','pinyin':'lu,sha,xian,cen'}];put_lab(root,src,unrelated)
    undo_plan=s.undo_preview(root,src,tx['id']);undo=s.transact(root,src,undo_plan);assert undo['result']['removed']==3 and undo['result']['unrelated_record_changes_preserved']
    j,_=snap(root,src);r,_=t.inspected(root,j,ROWS+unrelated)
    assert all(not row['existed']for row in r['rows'][:3]) and r['rows'][3]['existed']
    candidate_job=t.job(root,j/'data');candidate_report=t.native(root,candidate_job,'candidates',ROWS)
    assert all(row['rank']==0 for row in candidate_report['rows']);passed('all-three-candidates-absent-after-new-process-undo')
    assert undo['result']['action_sequence_first']>tx['result']['action_sequence_last'];passed('three-native-removes-restart-absence-preserves-later-unrelated-learning',sequence_span=3)
    try:s.undo_preview(root,src,tx['id'])
    except e.Error:pass
    else:raise AssertionError('repeat undo allowed')
    passed('repeat-owned-undo-refused')
    # Exact duplicate within <=3 rows plus existing pair causes only one new action.
    mixed=BASE/'mixed-words.json';mixed.write_text(json.dumps([ROWS[0],unrelated[0],ROWS[0]],ensure_ascii=False))
    m=s.import_preview(root,src,mixed);assert m['add']==1 and m['skip_existing']==1 and len(m['validation']['duplicates_in_file'])==1
    mt=s.transact(root,src,m);assert mt['result']['added']==1 and mt['result']['skipped_existing']==1 and mt['result']['input_duplicates']==1;passed('existing-and-file-duplicate-counted-with-one-new-action')
    # Later target frequency blocks entire undo before authoritative mutation.
    put_lab(root,src,[ROWS[0]],True);j,before=snap(root,src)
    try:s.undo_preview(root,src,mt['id'])
    except a.AuditError:pass
    else:raise AssertionError('target-learning conflict allowed')
    _,after=snap(root,src);assert before['hashes']==after['hashes'];passed('later-target-learning-rejects-entire-undo-without-change')
# Transaction failure boundaries, no historical swap-back; same executable code.
for fault in ['before-swap','after-swap']:
    root,src=newroot(fault)
    with e.locked(root):
        p=s.import_preview(root,src,WORDS);_,before=snap(root,src)
        try:s.transact(root,src,p,fault)
        except e.Error:pass
        else:raise AssertionError('fault not raised')
        _,after=snap(root,src);jp=next((root/'sync-transactions').glob('*.json'));tx=t.read(root,jp)
        if fault=='before-swap':assert tx['phase']=='aborted' and before['hashes']==after['hashes']
        else:
            assert tx['phase']=='recovery-required' and before['hashes']!=after['hashes'];assert s.pending(root)
            r=s.recover(root,src,tx['id']);assert r['phase']=='committed-recovered';assert not s.pending(root)
        passed('fault-'+fault+'-forward-only')
# Fail closed at the real coordinator gate with synthetic metadata corruption only;
# authoritative native lab remains byte-for-byte logical KV unchanged.
root,src=newroot('gate')
with e.locked(root):
    j,before=snap(root,src);q=s.probe(root,j);base_seq=e.read_json(j/'queue-sequences.json')
    bad=[('missing-head',dict(q,sync_head_present=0),base_seq),('header-behind-physical',dict(q,last_assigned_sequence=q['action_max']-1),base_seq),('pending-gap',q,base_seq[:-1])]
    high=dict(q,last_assigned_sequence=q['local_consumed_watermark']+899,action_max=q['local_consumed_watermark']+899)
    bad.append(('backpressure-reserves-all-three-undo',high,list(range(high['local_consumed_watermark']+1,high['last_assigned_sequence']+1))))
    s.remember(root,q,'test-real-observation')
    bad.extend([('epoch-change',dict(q,queue_epoch='different'),base_seq),('watermark-rewind',dict(q,local_consumed_watermark=q['local_consumed_watermark']-1),[q['local_consumed_watermark']]+base_seq)])
    for label,qq,seq in bad:
        e.atomic_json(j/'queue-sequences.json',seq)
        try:s.gate(root,j,qq,3,6)
        except e.Error:pass
        else:raise AssertionError('gate allowed '+label)
        assert t.kv(root,j)['hashes']==before['hashes'];passed('gate-'+label+'-no-authoritative-write')
    e.atomic_json(j/'queue-sequences.json',base_seq)
    for rows in ([ROWS[0]]*501,):
        path=BASE/'too-many.json';path.write_text(json.dumps(rows,ensure_ascii=False))
        try:s.rows_file(path)
        except e.Error:pass
        else:raise AssertionError('input limit ignored')
    passed('501-input-rows-rejected-even-if-duplicates')
result={'passed':True,'completed':True,'formal_dictionary_written':False,'cloud_transport_tested':False,'code_hash':s.code_hash(),'checks':checks}
e.atomic_json(BASE/'integration-results.json',result);print('BATCH_INTEGRATION_PASS '+str(len(checks)),flush=True)
