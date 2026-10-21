"""Offline state-machine and complete input-validation tests; no native/App/network."""
import copy
import contextlib
import csv
import hashlib
import io
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock
import audit_helpers as a
import batch_cli as b
import batch_words as w
import engine_support as e
import lexicon_cli as t

class Crash(BaseException):pass
class Clock:
    def __init__(self):self.value=0;self.sleeps=[]
    def now(self):return self.value
    def sleep(self,seconds):self.sleeps.append(seconds);self.value+=seconds

def rows(count):
    return [{'word':'青瓷'+chr(0x4e00+i//200)+chr(0x4e00+i%200),'pinyin':'qing,ci,mai,zhen'} for i in range(count)]
def pair(row):return row['pinyin'],row['word']

class Fake:
    """A signed write-ahead core, with crashes at actual publication boundaries."""
    def __init__(self,root):
        self.root=root;self.present=set();self.backlog=0;self.calls=[];self.add_calls=[];self.fault=None;self.recoveries=[];self.on_step=None
    def _q(self):return {'backlog':self.backlog,'last_assigned_sequence':self.backlog,'local_consumed_watermark':0}
    def preview(self,items,job_id):
        return {'source_record_hash':'0'*64,'entries':[dict(v,index=i,existed=pair(v) in self.present,count=int(pair(v) in self.present))for i,v in enumerate(items)],
                'existing':sum(pair(v) in self.present for v in items),'new':sum(pair(v) not in self.present for v in items),'queue':self._q(),'capacity':max(0,900-self.backlog)}
    def step(self,items,job_id,batch_index,on_plan):
        self.calls.append((job_id,batch_index))
        if self.on_step:self.on_step(self)
        result=[dict(v,existed=pair(v) in self.present)for v in items]
        count,new=b.bounded_prefix(items,result,max(0,900-self.backlog))
        if not count:return {'status':'waiting_sync','queue':self._q(),'capacity':0}
        chosen=items[:count];src=SimpleNamespace(mode='lab')
        plan=t.record_plan(self.root,src,'sync-import-plan',{'batch_job_id':job_id,'batch_index':batch_index})
        on_plan(plan,count,new)
        if self.fault=='before-journal':self.fault=None;raise Crash()
        tx=t.base_meta(self.root,'sync-transaction')|{'id':t.token('sync-tx'),'target':'lab','batch_job_id':job_id,'batch_index':batch_index,
                'plan_id':plan['id'],'phase':'started','rows':chosen}
        path=self.root/'sync-transactions'/(tx['id']+'.json');t.save(self.root,path,tx)
        if self.fault=='pending':self.fault=None;raise Crash()
        if self.fault=='aborted':
            self.fault=None;tx['phase']='aborted';t.save(self.root,path,tx);raise Crash()
        self.add_calls.extend(pair(v)for v in chosen if pair(v)not in self.present)
        self.present.update(pair(v)for v in chosen);self.backlog+=new
        tx.update(phase='committed',result={'added':new,'skipped_existing':count-new,'no_exchange':new==0})
        t.save(self.root,path,tx)
        if self.fault=='published-pending':
            self.fault=None;tx['phase']='recovery-required';t.save(self.root,path,tx);raise Crash()
        if self.fault=='after-commit':self.fault=None;raise Crash()
        return {'status':'attempted','transaction':tx}
    def transactions(self,plan_id):
        return [v for p in (self.root/'sync-transactions').glob('*.json')if (v:=t.read(self.root,p))['plan_id']==plan_id]
    def recover(self,tx):
        self.recoveries.append(tx['id']);tx=copy.deepcopy(tx);tx['phase']='committed-recovered' if 'result' in tx else 'aborted-recovered';t.save(self.root,self.root/'sync-transactions'/(tx['id']+'.json'),tx)
        return {'id':tx['id'],'phase':tx['phase'],'dictionary_overwritten':False}

class Workspace(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='batch-offline-');self.base=Path(self.temp.name)
        self.root=self.base/'wetype-lab-fake';self.root.mkdir();(self.root/'audit.key').write_bytes(b'x'*32)
        for name in ('plans','sync-transactions'):(self.root/name).mkdir()
        e.atomic_json(self.root/'STORE.json',{'id':'fake-workspace','target':'lab','abi':e.ABI})
        self.fake=Fake(self.root);self.clock=Clock();self.jobs=b.Jobs(self.root,'lab',self.fake,clock=self.clock.now,sleep=self.clock.sleep,code_hash='fake-code')
    def tearDown(self):self.temp.cleanup()
    def file(self,items,extension='json'):
        path=self.base/('words.'+extension)
        if extension=='json':path.write_text(json.dumps(items,ensure_ascii=False))
        else:
            with path.open('w',newline='')as stream:
                out=csv.DictWriter(stream,fieldnames=['word','pinyin'],delimiter='\t' if extension=='tsv' else ',');out.writeheader();out.writerows(items)
        return path
    def job(self,count=3):return self.jobs.prepare(self.file(rows(count)))
    def test_all_formats_normalize_and_dedupe(self):
        items=[{'word':'青瓷','pinyin':" QING ’ CI "},{'word':'青瓷','pinyin':'qing,ci'}]
        for ext in ('json','tsv','csv'):
            path=self.file(items,ext);parsed=w.parse(path)
            self.assertEqual(parsed['source_sha256'],hashlib.sha256(path.read_bytes()).hexdigest())
            self.assertEqual(parsed['input_rows'],2);self.assertEqual(parsed['unique_rows'],1)
            self.assertEqual(parsed['rows'],[{'word':'青瓷','pinyin':'qing,ci'}]);self.assertEqual(parsed['duplicates_in_file'][0]['row'],2)
    def test_validation_rejects_any_bad_row_before_job(self):
        invalid=rows(2)+[{'word':'ASCII','pinyin':'a'}]+rows(1)
        with self.assertRaises(e.Error):self.jobs.prepare(self.file(invalid))
        self.assertEqual(list((self.root/'batch-jobs').iterdir()),[])
    def test_invalid_spellings_and_lengths(self):
        for value in ({'word':'青瓷','pinyin':'qingci'},{'word':'青瓷','pinyin':'qing,zz'},{'word':'青'*17,'pinyin':','.join(['qing']*17)}, {'word':'青','pinyin':'qing','extra':'x'}):
            with self.assertRaises(e.Error):w.parse(self.file([value]))
    def test_utf8_and_byte_limit(self):
        path=self.base/'bad.tsv';path.write_bytes(b'word\tpinyin\n\xff\tjia\n')
        with self.assertRaises(UnicodeError):w.parse(path)
        path.write_bytes(b'x'*(w.MAX_BYTES+1))
        with self.assertRaises(e.Error):w.parse(path)
    def test_input_row_limit_includes_duplicates(self):
        path=self.base/'large.tsv';path.write_text('word\tpinyin\n'+'甲\tjia\n'*100001)
        with self.assertRaises(e.Error):w.parse(path)
        path.write_text('word\tpinyin\n'+'甲\tjia\n'*100000)
        parsed=w.parse(path);self.assertEqual(parsed['unique_rows'],1);self.assertEqual(len(parsed['duplicates_in_file']),99999)
    def test_duplicate_csv_headers_rejected(self):
        path=self.base/'bad.csv';path.write_text('word,pinyin,pinyin\n甲,jia,jia\n')
        with self.assertRaises(e.Error):w.parse(path)
    def test_prepare_has_no_adapter_actions_and_tamper_rejected(self):
        doc=self.job();self.assertEqual(self.fake.calls,[]);self.assertEqual(doc['cursor'],0)
        path=self.jobs._path(doc['id']);raw=json.loads(path.read_text());raw['validation']['rows'][0]['word']='篡改';path.write_text(json.dumps(raw))
        with self.assertRaises(e.Error):self.jobs.load(doc['id'])
    def test_source_edits_cannot_change_signed_job_rows(self):
        path=self.file(rows(3));doc=self.jobs.prepare(path);path.write_text('[]')
        result=self.jobs.run(doc['id']);self.assertEqual(result['added'],3)
    def test_preview_and_existing_zero_write(self):
        doc=self.job();self.fake.present.update(map(pair,rows(3)));self.fake.backlog=900
        preview=self.jobs.preview(doc['id']);self.assertEqual(preview['preview']['new'],0);self.assertEqual(self.fake.add_calls,[])
        result=self.jobs.run(doc['id']);self.assertEqual(result['status'],'completed');self.assertEqual(result['skipped_existing'],3);self.assertEqual(self.fake.add_calls,[])
        self.assertEqual(result['batches'][0]['added'],0)
    def test_more_than_500_splits_and_respects_capacity(self):
        doc=self.job(1001);result=self.jobs.run(doc['id'])
        self.assertEqual(result['status'],'waiting_sync');self.assertEqual(result['cursor'],900);self.assertEqual([v['end']-v['start']for v in result['batches']],[500,400])
        self.fake.backlog=0;result=self.jobs.run(doc['id']);self.assertEqual(result['status'],'completed');self.assertEqual(result['added'],1001)
        self.assertEqual(len(self.fake.add_calls),len(set(self.fake.add_calls)))
    def test_wait_default_returns_restored_and_no_poll(self):
        doc=self.job();self.fake.backlog=900;result=self.jobs.run(doc['id'])
        self.assertEqual(result['status'],'waiting_sync');self.assertEqual(result['cursor'],0);self.assertEqual(self.clock.sleeps,[]);self.assertEqual(len(self.fake.calls),1)
    def test_explicit_wait_bounded_and_resumable(self):
        doc=self.job();self.fake.backlog=900
        result=self.jobs.run(doc['id'],max_wait_seconds=65)
        self.assertEqual(result['status'],'waiting_sync');self.assertEqual(self.clock.sleeps,[30,30,5]);self.assertEqual(len(self.fake.calls),3)
        self.fake.backlog=0;self.assertEqual(self.jobs.run(doc['id'])['status'],'completed')
    def test_progress_during_explicit_wait(self):
        doc=self.job();self.fake.backlog=900
        def progress(fake):
            if len(fake.calls)==2:fake.backlog=897
        self.fake.on_step=progress;result=self.jobs.run(doc['id'],max_wait_seconds=90)
        self.assertEqual(result['status'],'completed');self.assertEqual(self.clock.sleeps,[30]);self.assertEqual(result['added'],3)
    def test_pending_recovery_classifies_without_same_run_resend(self):
        doc=self.job();self.fake.fault='pending'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        self.assertEqual(self.fake.add_calls,[])
        classified=self.jobs.run(doc['id']);self.assertEqual(classified['status'],'recovery_classified');self.assertTrue(classified['resume_required'])
        self.assertEqual(len(self.fake.calls),1);self.assertEqual(len(self.fake.recoveries),1);self.assertEqual(self.fake.add_calls,[])
        result=self.jobs.run(doc['id']);self.assertEqual(result['status'],'completed');self.assertEqual(result['added'],3)
        self.assertNotEqual(result['batches'][0]['plan_id'],result['batches'][1]['plan_id'])
    def test_committed_crash_advances_without_duplicate_add(self):
        doc=self.job();self.fake.fault='after-commit'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        result=self.jobs.run(doc['id']);self.assertEqual(result['status'],'completed');self.assertEqual(result['added'],3)
        self.assertEqual(len(self.fake.calls),1);self.assertEqual(len(self.fake.add_calls),3)
        self.jobs.run(doc['id']);self.assertEqual(len(self.fake.calls),1)
    def test_crash_before_journal_uses_fresh_plan_without_reusing_attempt(self):
        doc=self.job();self.fake.fault='before-journal'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        result=self.jobs.run(doc['id']);self.assertEqual(result['status'],'completed')
        self.assertEqual(result['batches'][0]['status'],'abandoned-before-start');self.assertNotEqual(result['batches'][0]['plan_id'],result['batches'][1]['plan_id'])
    def test_aborted_attempt_only_explicit_next_run_gets_new_plan(self):
        doc=self.job();self.fake.fault='aborted'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        self.assertEqual(self.fake.add_calls,[])
        result=self.jobs.run(doc['id']);self.assertEqual(result['status'],'completed');self.assertEqual(result['batches'][0]['status'],'aborted')
    def test_duplicate_transaction_journals_rejected(self):
        doc=self.job();self.fake.fault='after-commit'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        entry=self.jobs.load(doc['id'])['batches'][0];tx=self.fake.transactions(entry['plan_id'])[0];tx['id']=t.token('sync-tx');t.save(self.root,self.root/'sync-transactions'/(tx['id']+'.json'),tx)
        with self.assertRaises(e.Error):self.jobs.run(doc['id'])
        self.assertEqual(len(self.fake.add_calls),3)
    def test_wrong_batch_binding_cannot_advance(self):
        doc=self.job();self.fake.fault='after-commit'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        entry=self.jobs.load(doc['id'])['batches'][0];tx=self.fake.transactions(entry['plan_id'])[0];tx['batch_index']=4;t.save(self.root,self.root/'sync-transactions'/(tx['id']+'.json'),tx)
        with self.assertRaises(e.Error):self.jobs.run(doc['id'])
    def test_wrong_rows_or_committed_counts_cannot_advance(self):
        doc=self.job();self.fake.fault='after-commit'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        entry=self.jobs.load(doc['id'])['batches'][0];tx=self.fake.transactions(entry['plan_id'])[0]
        tx['result']={'added':0,'skipped_existing':3};t.save(self.root,self.root/'sync-transactions'/(tx['id']+'.json'),tx)
        with self.assertRaises(e.Error):self.jobs.run(doc['id'])
        tx['result']={'added':3,'skipped_existing':0};tx['rows']=rows(2);t.save(self.root,self.root/'sync-transactions'/(tx['id']+'.json'),tx)
        with self.assertRaises(e.Error):self.jobs.run(doc['id'])
    def test_published_pending_classification_then_progress_never_readds(self):
        doc=self.job();self.fake.fault='published-pending'
        with self.assertRaises(Crash):self.jobs.run(doc['id'])
        classified=self.jobs.run(doc['id']);self.assertEqual(classified['status'],'recovery_classified');self.assertEqual(classified['cursor'],0)
        self.assertEqual(classified['batches'][-1]['last_recovery']['phase'],'committed-recovered')
        result=self.jobs.run(doc['id']);self.assertEqual(result['status'],'completed');self.assertEqual(result['added'],3)
        self.assertEqual(len(self.fake.calls),1);self.assertEqual(len(self.fake.add_calls),3)
    def test_init_reports_new_formal_entry_separately_from_legacy(self):
        arguments=SimpleNamespace(command='init',workspace=str(self.root),target='formal')
        legacy={'formal_import_enabled':False,'submission_disabled_reason':'old','formal_snapshot_rollback_enabled':False,'batch_input_limit':500}
        with mock.patch.object(e,'safe_root',return_value=self.root),mock.patch.object(t,'initialize',return_value=legacy):
            result=b.execute(arguments)
        self.assertTrue(result['formal_batch_import_enabled']);self.assertTrue(result['service_interlock_required'])
        self.assertFalse(result['legacy_formal_import_enabled']);self.assertNotIn('submission_disabled_reason',result);self.assertNotIn('formal_import_enabled',result)
        self.assertNotIn('batch_input_limit',result);self.assertEqual(result['max_transaction_rows'],500)
        self.assertEqual(result['max_input_rows'],100000);self.assertEqual(result['max_file_bytes'],2097152)
    def test_service_recovery_precedes_adapter_compile_and_version_checks(self):
        import service_lease
        arguments=SimpleNamespace(command='recover-service',workspace=str(self.root),target='formal',lease=None)
        with mock.patch.object(e,'safe_root',return_value=self.root),mock.patch.object(e,'locked',return_value=contextlib.nullcontext()),mock.patch.object(e,'read_json',side_effect=AssertionError('version check called')),mock.patch.object(b.s,'prepare',side_effect=AssertionError('compile called')),mock.patch.object(service_lease,'recover',return_value={'leases':[]})as recover:
            self.assertEqual(b.execute(arguments),{'leases':[]});recover.assert_called_once_with(self.root,None)
    def test_json_duplicate_fields_rejected_and_utf8_bom_accepted(self):
        path=self.base/'special.json';path.write_text('[{"word":"甲","word":"乙","pinyin":"jia"}]')
        with self.assertRaises(e.Error):w.parse(path)
        path.write_bytes(b'\xef\xbb\xbf'+json.dumps([{'word':'甲','pinyin':'jia'}],ensure_ascii=False).encode())
        self.assertEqual(w.parse(path)['rows'],[{'word':'甲','pinyin':'jia'}])
    def test_wait_limit_rejected_before_adapter(self):
        doc=self.job()
        for value in (-1,901,True,1.5):
            with self.assertRaises(e.Error):self.jobs.run(doc['id'],max_wait_seconds=value)
        self.assertEqual(self.fake.calls,[])
    def test_native_adapter_overfull_queue_waits_even_for_existing_pairs(self):
        adapter=b.NativeAdapter(self.root,SimpleNamespace(mode='lab'))
        adapter.guard=lambda *args:contextlib.nullcontext()
        adapter._snapshot=lambda:('managed-copy',{})
        adapter._inspect=lambda job,items:[{'rows':[dict(row,existed=True)for row in items]}]
        adapter._queue=lambda *args:({'last_assigned_sequence':901,'local_consumed_watermark':0},0)
        on_plan=mock.Mock()
        with mock.patch.object(t,'record_plan',side_effect=AssertionError('overfull queue must not plan')),mock.patch.object(b.s,'transact',side_effect=AssertionError('overfull queue must not transact')):
            self.assertEqual(adapter.step(rows(3),'fake-job',0,on_plan)['status'],'waiting_sync')
        on_plan.assert_not_called()
    def test_prefix_preserves_order_with_free_existing(self):
        items=rows(4);result=[dict(v,existed=i in (0,2))for i,v in enumerate(items)]
        self.assertEqual(b.bounded_prefix(items,result,1),(3,1));self.assertEqual(b.bounded_prefix(items,result,0),(1,0))

def native_integration(workspace,seed_workspace,backup,report_path):
    """Private opt-in integration; only a signed immutable backup seeds a lab.

    The first stage uses the real head. Resume admission explicitly uses mock
    observation provenance; actual CurrentInfoV3 and all old actions stay intact.
    """
    import argparse,os,shutil,time
    import sync_cli as native
    os.umask(0o077)
    root=e.safe_root(workspace);seed_root=e.safe_root(seed_workspace)
    t.require(not root.exists(),'Native integration requires a new workspace')
    root.mkdir(mode=0o700,parents=True);immutable=root/'immutable-seed'
    with e.locked(seed_root):
        config=e.read_json(seed_root/'STORE.json');source=t.Source(seed_root,config['target'])
        path,metadata=t.backup_check(seed_root,source,backup)
        shutil.copytree(path/'v5',immutable)
    t.require(e.manifest(immutable)==metadata['files'],'Immutable seed copy mismatch')
    # initialize rejects a nonempty root; the verified seed sits outside the
    # managed runtime root so its original bytes remain independently available.
    runtime=root/('wetype-lab-batch-mvp-'+str(time.time_ns()))
    t.initialize(runtime,'lab');native.prepare(runtime);src=t.Source(runtime,'lab')
    checks=[];timings=[];start_hash=native.code_hash();start_batch_hash=b.identity()
    output={'scope':'private isolated native import integration','formal_dictionary_written':False,'official_app_controlled':False,
            'cloud_transport_tested':False,'mock_watermark_resume':True,'actual_sync_head_modified_for_mock':False,
            'old_actions_trimmed_for_mock':False,'code_hash':start_hash,'batch_code_hash':start_batch_hash,'checks':checks,'timings':timings}
    def passed(name,**fields):
        checks.append({'name':name,'passed':True,**fields});e.atomic_json(Path(report_path),output);print('PASS '+name,flush=True)
    def swap_job(job):
        incoming=job/'data/userDict/v5'
        with src.quiet():
            fd=t.lock_file(incoming/(incoming/'db_path.conf').read_text()/'LOCK')
            try:t.swap(src.path,incoming)
            finally:os.close(fd)
    class Timed(b.NativeAdapter):
        def step(self,*args,**kwargs):
            started=time.monotonic();outcome=super().step(*args,**kwargs)
            doc={'status':outcome['status'],'elapsed_seconds':round(time.monotonic()-started,3)}
            if outcome['status']=='attempted':
                tx=outcome['transaction'];doc.update(rows=len(tx['rows']),added=tx['result']['added'],skipped_existing=tx['result']['skipped_existing'])
                if tx['result']['added']:doc['action_span']=tx['result']['action_sequence_last']-tx['result']['action_sequence_first']+1
            timings.append(doc);return outcome
    with e.locked(runtime):
        stage=t.job(runtime);shutil.copytree(immutable,stage/'data/userDict/v5');swap_job(stage)
        # Establish one existing pair through native Add if the seed lacks it.
        anchor={'word':'松岚锦汀','pinyin':'song,lan,jin,ting'}
        with src.quiet():seed_job,_=t.snapshot(runtime,src)
        seeded=t.native(runtime,seed_job,'import',[anchor]);swap_job(seed_job)
        with src.quiet():initial_job,_=t.snapshot(runtime,src)
        before=t.kv(runtime,initial_job);q0=native.probe(runtime,initial_job);native.gate(runtime,initial_job,q0)
        # The historically validated dispersed common-Han generator, extended
        # to five characters so four-character prior trials cannot overlap.
        alphabet=list(zip('青瓷麦阵云栖织流霜舟星澜玉帆柏松棠雾岑灯海杉月林泉夏沙雪竹秋谷风',
                          'qing ci mai zhen yun qi zhi liu shuang zhou xing lan yu fan bai song tang wu cen deng hai shan yue lin quan xia sha xue zhu qiu gu feng'.split()))
        generated=[]
        for number in range(1001):
            value=(number*104729+19391)%(32**4)
            chosen=[alphabet[(value//(32**position))%32]for position in range(4)]
            generated.append({'word':'霁'+''.join(v[0]for v in chosen),'pinyin':','.join(['ji']+[v[1]for v in chosen])})
        word_path=runtime/'synthetic-words.json';word_path.write_text(json.dumps(generated+[anchor,generated[0]],ensure_ascii=False))
        jobs=b.Jobs(runtime,'lab',Timed(runtime,src));job=jobs.prepare(word_path);preview=jobs.preview(job['id'])
        assert preview['preview']['new']==1001 and preview['preview']['existing']==1 and len(job['validation']['duplicates_in_file'])==1
        passed('full-file-normalization-existing-and-duplicate-preview',input_rows=1003,unique_rows=1002,new_pairs=1001,existing_pairs=1,duplicate_rows=1)
        first=jobs.run(job['id']);assert first['status']=='waiting_sync' and first['cursor']<1002
        assert first['batches'][0]['end']-first['batches'][0]['start']==500 and first['batches'][0]['added']==500
        with src.quiet():paused_job,_=t.snapshot(runtime,src)
        paused=t.kv(runtime,paused_job);qp=native.probe(runtime,paused_job)
        assert qp['last_assigned_sequence']-qp['local_consumed_watermark']==900
        passed('native-500-and-real-head-backpressure',committed_batches=len(first['batches']),committed_rows=first['cursor'],added_pairs=first['added'],real_pending=900)
        before_batches=len(first['batches']);repeated=jobs.run(job['id']);assert repeated['status']=='waiting_sync'and len(repeated['batches'])==before_batches
        with src.quiet():repeated_job,_=t.snapshot(runtime,src)
        assert t.kv(runtime,repeated_job)['hashes']==paused['hashes']
        passed('resume-with-stalled-real-head-no-new-action',logical_kv_unchanged=True)
        # Explicit test-only admission source. Do not forge a durable head or ACK.
        real_probe=native.probe;real_observation=native.observation;real_assess=b.bp.assess
        mock_watermark=qp['last_assigned_sequence']
        def mock_probe(root_arg,job_arg):
            observation=real_probe(root_arg,job_arg)
            assert mock_watermark>=observation['local_consumed_watermark'] and mock_watermark<=observation['last_assigned_sequence']
            observation=dict(observation,local_consumed_watermark=mock_watermark,watermark_provenance='explicit_test_mock')
            return observation
        def mock_observation(job_arg,queue):
            result=real_observation(job_arg,queue);result['provenance']='mock_watermark';return result
        def mock_assess(observation,*args,**kwargs):
            assert observation['provenance']=='mock_watermark';kwargs['allow_mock']=True;return real_assess(observation,*args,**kwargs)
        with mock.patch.object(native,'probe',mock_probe),mock.patch.object(native,'observation',mock_observation),mock.patch.object(b.bp,'assess',mock_assess):
            finished=jobs.run(job['id']);assert finished['status']=='completed' and finished['added']==1001 and finished['skipped_existing']==1
            again=jobs.run(job['id']);assert again['added']==1001 and len(again['batches'])==len(finished['batches'])
        with src.quiet():final_job,_=t.snapshot(runtime,src)
        after=t.kv(runtime,final_job);q1=real_probe(runtime,final_job)
        assert q1['local_consumed_watermark']==q0['local_consumed_watermark'] and q1['last_assigned_sequence']==q0['last_assigned_sequence']+1001
        assert q1['queue_epoch']==q0['queue_epoch']
        # The core's complete audits ran per transaction. Verify head and every
        # old action again across the complete job, without exporting raw data.
        head=a.key_tag(t.secret(runtime),b'!dcsc!CurrentInfoV3')
        assert before['hashes'][head]==after['hashes'][head]
        seq=e.read_json(initial_job/'queue-sequences.json')
        old_keys=[a.key_tag(t.secret(runtime),b'!dcact!'+v.to_bytes(8,'big'))for v in seq]
        assert all(before['hashes'][key]==after['hashes'][key]for key in old_keys)
        passed('explicit-mock-progress-native-resume-completes',new_pairs=1001,existing_skipped=1,actual_head_unchanged=True,all_old_actions_unchanged=True,
               simulated_watermark_only=True,cloud_ack_proven=False,actual_final_pending=q1['last_assigned_sequence']-q1['local_consumed_watermark'])
        sample=[generated[0],generated[499],generated[999],generated[1000],anchor]
        reopened=t.native(runtime,final_job,'verify',sample)
        assert all(r['rank']>0 for r in reopened['rows'])
        assert reopened['record_audit']['after_count']==seeded['record_audit']['after_count']+1001
        assert all(tx['status']=='committed'for tx in finished['batches'])
        passed('new-process-pinyin-recall-and-native-record-accounting',sample_size=len(sample),sample_ranks=[r['rank']for r in reopened['rows']],all_new_batch_rows_verified_by_core=True)
        for fault in ('before-swap','after-swap'):
            fault_root=root/('wetype-lab-batch-fault-'+fault+'-'+str(time.time_ns()))
            t.initialize(fault_root,'lab');native.prepare(fault_root);fault_src=t.Source(fault_root,'lab')
            with e.locked(fault_root):
                candidate=t.job(fault_root);shutil.copytree(immutable,candidate/'data/userDict/v5');incoming=candidate/'data/userDict/v5'
                with fault_src.quiet():
                    lock=t.lock_file(incoming/(incoming/'db_path.conf').read_text()/'LOCK')
                    try:t.swap(fault_src.path,incoming)
                    finally:os.close(lock)
                fault_path=fault_root/'synthetic-words.json';fault_path.write_text(json.dumps(generated[:3],ensure_ascii=False))
                fault_jobs=b.Jobs(fault_root,'lab',b.NativeAdapter(fault_root,fault_src));fault_job=fault_jobs.prepare(fault_path)
                with fault_src.quiet():pre_job,_=t.snapshot(fault_root,fault_src)
                initial_queue=native.probe(fault_root,pre_job);initial_kv=t.kv(fault_root,pre_job)
                real_transact=native.transact
                def faulted(root_arg,source_arg,plan_arg):return real_transact(root_arg,source_arg,plan_arg,fault=fault)
                with mock.patch.object(native,'transact',faulted):
                    try:fault_jobs.run(fault_job['id'])
                    except e.Error:pass
                    else:raise AssertionError('native batch fault did not fire')
                with fault_src.quiet():failed_job,_=t.snapshot(fault_root,fault_src)
                failed_kv=t.kv(fault_root,failed_job)
                if fault=='before-swap':
                    assert initial_kv['hashes']==failed_kv['hashes']
                    recovered=fault_jobs.run(fault_job['id']);assert recovered['status']=='completed'
                    assert len(recovered['batches'])==2 and recovered['batches'][0]['status']=='aborted'
                else:
                    assert initial_kv['hashes']!=failed_kv['hashes']
                    classified=fault_jobs.run(fault_job['id']);assert classified['status']=='recovery_classified'and classified['cursor']==0
                    assert len(classified['batches'])==1 and classified['batches'][0]['last_recovery']['phase']=='committed-recovered'
                    recovered=fault_jobs.run(fault_job['id']);assert recovered['status']=='completed'and len(recovered['batches'])==1
                with fault_src.quiet():post_job,_=t.snapshot(fault_root,fault_src)
                final_queue=native.probe(fault_root,post_job)
                assert final_queue['last_assigned_sequence']==initial_queue['last_assigned_sequence']+3
                assert final_queue['local_consumed_watermark']==initial_queue['local_consumed_watermark']
                proof=t.native(fault_root,post_job,'verify',generated[:3]);assert all(v['rank']>0 for v in proof['rows'])
                passed('native-batch-fault-'+fault+'-resume',source_unchanged_before_publication=fault=='before-swap',
                       actual_source_action_delta=3,completed_added=recovered['added'],attempts=len(recovered['batches']),
                       no_duplicate_published_actions=True,restart_ranks=[v['rank']for v in proof['rows']])
        assert native.code_hash()==start_hash and b.identity()==start_batch_hash,'Adapter changed during native integration'
        output.update(passed=True,completed=True,transaction_count=len(finished['batches']),total_added=1001,total_skipped=1,actual_final_pending=q1['last_assigned_sequence']-q1['local_consumed_watermark'])
        e.atomic_json(Path(report_path),output);print('NATIVE_BATCH_MVP_PASS',flush=True)

if __name__=='__main__':
    import sys
    if '--native' in sys.argv:
        import argparse
        parser=argparse.ArgumentParser(description=native_integration.__doc__);parser.add_argument('--native',action='store_true')
        parser.add_argument('--workspace',required=True);parser.add_argument('--seed-workspace',required=True);parser.add_argument('--backup',required=True);parser.add_argument('--report',required=True)
        arguments=parser.parse_args();native_integration(arguments.workspace,arguments.seed_workspace,arguments.backup,arguments.report)
    else:unittest.main()

