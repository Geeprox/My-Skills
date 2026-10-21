"""Independent pure forward-tests. No native execution, formal library or networking."""
import contextlib, datetime, json, sys, tempfile, unittest
from pathlib import Path
from types import SimpleNamespace
from unittest import mock
sys.path.insert(0,str(Path(__file__).resolve().parent))
import sync_cli as s

class Review(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory(prefix='wetype-review-');self.root=Path(self.tmp.name)
  (self.root/'sync-observations').mkdir();(self.root/'sync-transactions').mkdir();(self.root/'transactions').mkdir()
  self.job=self.root/'job';self.job.mkdir()
 def tearDown(self):self.tmp.cleanup()
 def q(self,h=10,w=8,epoch='e',maximum=None):
  return dict(queue_epoch=epoch,action_header_present=True,action_wire_sequences_valid=True,sync_head_present=True,group_present=True,last_assigned_sequence=h,local_consumed_watermark=w,action_max=h if maximum is None else maximum)
 def seq(self,rows):(self.job/'queue-sequences.json').write_text(json.dumps(rows))
 def history(self,q):
  path=self.root/'sync-observations'/'old.json';path.write_text('{}');return mock.patch.object(s.t,'read',return_value={'queue':q})
 def test_queue_admits_contiguous_reserves(self):
  self.seq([9,10]);r=s.gate(self.root,self.job,self.q(),3,6);self.assertEqual(r['projected_backlog'],5)
 def test_queue_gap_rejected(self):
  self.seq([10]);
  with self.assertRaises(s.e.Error):s.gate(self.root,self.job,self.q(),1,2)
 def test_header_lags_physical_key_rejected(self):
  self.seq([9,10,11]);
  with self.assertRaises(s.e.Error):s.gate(self.root,self.job,self.q(maximum=11),1,2)
 def test_historical_physical_floor_protected(self):
  self.seq([9,10])
  with self.history(self.q(maximum=11)),self.assertRaises(s.e.Error):s.gate(self.root,self.job,self.q(),1,2)
 def test_epoch_change_rejected(self):
  self.seq([9,10])
  with self.history(self.q(epoch='old')),self.assertRaises(s.e.Error):s.gate(self.root,self.job,self.q(),1,2)
 def test_watermark_rewind_rejected(self):
  self.seq([9,10])
  with self.history(self.q(w=9)),self.assertRaises(s.e.Error):s.gate(self.root,self.job,self.q(),1,2)
 def test_reserve_backpressure_rejected(self):
  self.seq(list(range(1,895)))
  with self.assertRaises(s.e.Error):s.gate(self.root,self.job,self.q(894,0),3,6)
 def test_input_duplicate_counts_toward_bound(self):
  word={'word':'雾珀弦岑','pinyin':'wu,po,xian,cen'};path=self.root/'words.json';path.write_text(json.dumps([word]*501,ensure_ascii=False))
  with self.assertRaises(s.e.Error):s.rows_file(path)
 def test_duplicate_three_normalizes_to_one(self):
  word={'word':'雾珀弦岑','pinyin':'wu,po,xian,cen'};path=self.root/'words.json';path.write_text(json.dumps([word]*3,ensure_ascii=False))
  v=s.rows_file(path);self.assertEqual((v['input_rows'],v['unique_rows'],len(v['duplicates_in_file'])),(3,1,2))
 def test_replayed_plan_rejected_before_quiet(self):
  path=self.root/'sync-transactions'/'sync-tx-old.json';path.write_text('{}');source=SimpleNamespace(mode='lab',quiet=mock.Mock(side_effect=AssertionError('must not quiesce')))
  with mock.patch.object(s,'pending',return_value=[]),mock.patch.object(s,'formal_allowed'),mock.patch.object(s.t,'read',return_value={'plan_id':'same'}),self.assertRaises(s.e.Error):s.transact(self.root,source,{'id':'same'})
  source.quiet.assert_not_called()
 def test_pending_rejected_before_any_formal_action(self):
  source=SimpleNamespace(mode='formal',quiet=mock.Mock(side_effect=AssertionError('must not quiesce')))
  with mock.patch.object(s,'pending',return_value=['pending']),mock.patch.object(s,'formal_allowed') as permit,self.assertRaises(s.e.Error):s.transact(self.root,source,{})
  permit.assert_not_called();source.quiet.assert_not_called()
 def test_expired_and_future_plans_rejected(self):
  now=datetime.datetime.now(datetime.timezone.utc)
  for delta in (-21,1):
   with self.assertRaises(s.e.Error):s.recent({'created_at':(now+datetime.timedelta(minutes=delta)).isoformat()})
 def test_formal_write_refused_without_live_interlock(self):
  with self.assertRaises(s.e.Error):s.formal_allowed(self.root,SimpleNamespace(mode='formal'),{'id':'p','kind':'sync-import-plan'})
 def test_config_or_trial_file_cannot_grant_a_service_lease(self):
  source=SimpleNamespace(mode='formal',quiet=mock.Mock(side_effect=AssertionError('must not quiesce')))
  with mock.patch.object(s.e,'read_json',return_value={'formal_batch_import_enabled':True}),mock.patch.object(s.t,'read',return_value={'isolated_passed':True}),mock.patch.object(s,'pending',return_value=[]),self.assertRaises(s.e.Error):s.transact(self.root,source,{'id':'p','kind':'sync-import-plan'})
  source.quiet.assert_not_called()
 def test_formal_compensation_refused_before_interlock(self):
  with mock.patch.object(s.sl,'assert_active') as active,self.assertRaises(s.e.Error):s.formal_allowed(self.root,SimpleNamespace(mode='formal'),{'id':'p','kind':'sync-undo-plan'})
  active.assert_not_called()
 def test_formal_import_requires_matching_plan_and_batch_identity(self):
  with mock.patch.object(s.sl,'assert_active') as active:
   s.formal_allowed(self.root,SimpleNamespace(mode='formal'),{'id':'p','kind':'sync-import-plan','batch_job_id':'owned-job'})
  active.assert_called_once_with(self.root,'p',mutation=True,job_id='owned-job')
 def test_lab_policy_does_not_require_release_or_formal_permit(self):
  with mock.patch.object(s.e,'read_json',side_effect=AssertionError('no release read')),mock.patch.object(s.t,'read',side_effect=AssertionError('no permit read')):
   s.formal_allowed(self.root,SimpleNamespace(mode='lab'),{})
 def test_probe_allows_native_log_with_one_exact_marker(self):
  value=SimpleNamespace(returncode=0,stdout=b'Native initialize log\nSYNC_METADATA_COMPLETE\n')
  with mock.patch.object(s.subprocess,'run',return_value=value),mock.patch.object(s.e,'read_json',return_value={'mock_metadata':True}):self.assertEqual(s.probe(self.root,self.job),{'mock_metadata':True})
 def test_probe_rejects_duplicate_partial_and_error_markers(self):
  variants=[(0,b'SYNC_METADATA_COMPLETE\nSYNC_METADATA_COMPLETE\n'),(0,b'prefixSYNC_METADATA_COMPLETE\n'),(0,b''),(1,b'SYNC_METADATA_COMPLETE\n')]
  for code,stdout in variants:
   with self.subTest(code=code,stdout=stdout),mock.patch.object(s.subprocess,'run',return_value=SimpleNamespace(returncode=code,stdout=stdout)),mock.patch.object(s.e,'read_json') as meta,self.assertRaises(s.e.Error):s.probe(self.root,self.job)
   meta.assert_not_called()
 def test_plan_hash_change_rejected(self):
  p={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'code_hash':'different'}
  with mock.patch.object(s.t,'plan_read',return_value=p),self.assertRaises(s.e.Error):s.plan_read(self.root,SimpleNamespace(mode='lab'),'irrelevant','sync-import-plan')

if __name__=='__main__':unittest.main(verbosity=2)
