"""Pure crash-recovery forward tests: mocked Source; no App or database access."""
import contextlib, copy, json, sys, tempfile, unittest
from pathlib import Path
from types import SimpleNamespace
from unittest import mock
sys.path.insert(0,str(Path(__file__).resolve().parent))
import sync_cli as s
class ReviewRecovery(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory(prefix='wetype-review-recovery-');self.root=Path(self.tmp.name);(self.root/'sync-transactions').mkdir();(self.root/'sync-observations').mkdir()
 def tearDown(self):self.tmp.cleanup()
 def q(self,h=11,w=8,epoch='e',maximum=None):return dict(queue_epoch=epoch,last_assigned_sequence=h,local_consumed_watermark=w,action_max=h if maximum is None else maximum,action_header_present=True,action_wire_sequences_valid=True,sync_head_present=True,group_present=True)
 def invoke(self,q,sequences=None):
  (self.root/'queue-sequences.json').write_text(json.dumps(list(range(q['local_consumed_watermark']+1,max(q['last_assigned_sequence'],q['action_max'])+1)) if sequences is None else sequences))
  state=dict(phase='recovery-required',rows=[{'pinyin':'wu,po,xian,cen','word':'雾珀弦岑'}],after_record_hash='after',before_record_hash='before',result={'queue':self.q()},before_queue=self.q(10,8))
  src=SimpleNamespace(mode='formal',quiet=mock.Mock(return_value=contextlib.nullcontext()))
  with mock.patch.object(s,'read_tx',return_value=state),mock.patch.object(s.t,'snapshot',return_value=(self.root,{})),mock.patch.object(s.t,'inspected',return_value=({'record_audit':{'after_hash':'after'}},{})),mock.patch.object(s,'probe',return_value=q),mock.patch.object(s,'remember') as remember,mock.patch.object(s.t,'save') as save:
   try:result=s.recover(self.root,src,'owned')
   except BaseException:
    save.assert_not_called();raise
   self.assertFalse(result['dictionary_overwritten']);self.assertFalse(result['cloud_state_classified']);save.assert_called_once();return result
 def test_recovery_accepts_monotonic_known_postimage(self):self.assertEqual(self.invoke(self.q(12,9))['phase'],'committed-recovered')
 def test_recovery_rejects_allocated_floor_rewind(self):
  with self.assertRaises(s.e.Error):self.invoke(self.q(10,8))
 def test_recovery_rejects_physical_header_lag(self):
  with self.assertRaises(s.e.Error):self.invoke(self.q(11,8,maximum=12))
 def test_recovery_rejects_epoch_change(self):
  with self.assertRaises(s.e.Error):self.invoke(self.q(11,8,'new'))
 def test_recovery_rejects_watermark_rewind(self):
  with self.assertRaises(s.e.Error):self.invoke(self.q(11,7))
 def test_recovery_rejects_pending_gap(self):
  with self.assertRaises(s.e.Error):self.invoke(self.q(11,8),[10,11])
 def test_recovery_rejects_watermark_above_header(self):
  with self.assertRaises(s.e.Error):self.invoke(self.q(11,12))
 def test_recovery_rejects_malformed_action_wire(self):
  q=self.q();q['action_wire_sequences_valid']=False
  with self.assertRaises(s.e.Error):self.invoke(q)
 def test_recovery_with_high_backlog_stays_pending(self):
  with self.assertRaises(s.e.Error):self.invoke(self.q(1000,0))
 def test_formal_original_intent_sealed_before_quiesce(self):
  saved=[]
  src=SimpleNamespace(mode='formal',pids=lambda:[1],input_source=lambda:'test.original',quiet=mock.Mock(side_effect=s.e.Error('quiesce interrupted before yield')))
  plan=dict(id='p',kind='sync-import-plan',validation={'rows':[{'pinyin':'wu,po,xian,cen','word':'雾珀弦岑'}]})
  with mock.patch.object(s,'pending',return_value=[]),mock.patch.object(s,'formal_allowed'),mock.patch.object(s,'code_hash',return_value='hash'),mock.patch.object(s.t,'token',return_value='sync-tx-test'),mock.patch.object(s.t,'base_meta',return_value={}),mock.patch.object(s.t,'save',side_effect=lambda root,path,obj:saved.append(copy.deepcopy(obj))),self.assertRaises(s.e.Error):s.transact(self.root,src,plan)
  self.assertEqual(saved[-1]['phase'],'recovery-required');self.assertIsNotNone(saved[-1]['restore_error'])
  self.assertEqual(saved[0]['phase'],'started');self.assertTrue(saved[0]['original_running']);self.assertEqual(saved[0]['original_source'],'test.original')
if __name__=='__main__':unittest.main(verbosity=2)
