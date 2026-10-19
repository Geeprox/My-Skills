"""Pure policy tests; formal Source objects are fakes and never call the App."""
from pathlib import Path
import sys,unittest,contextlib,io,json
from unittest import mock
from types import SimpleNamespace
sys.path.insert(0,str(Path(__file__).resolve().parent))
import lexicon_cli as p

class FakeSource:
    mode='formal'
    def __init__(self,fail=False):self.calls=[];self.fail=fail
    def restore(self,running,source):
        self.calls.append((running,source))
        if self.fail:raise RuntimeError('simulated UI restoration failure')

class PolicyTests(unittest.TestCase):
    def test_formal_snapshot_rollback_refused(self):
        with self.assertRaises(p.e.Error):p.refuse_formal_snapshot_rollback(SimpleNamespace(mode='formal'))
        with self.assertRaises(p.e.Error):p.refuse_formal_import(SimpleNamespace(mode='formal'))
        policy=p.formal_submission_policy('formal')
        self.assertFalse(policy['formal_import_enabled']);self.assertFalse(policy['formal_snapshot_rollback_enabled']);self.assertIn('1000',policy['submission_disabled_reason'])
    def test_lab_rollback_policy_unchanged(self):
        p.refuse_formal_snapshot_rollback(SimpleNamespace(mode='lab'))
        p.refuse_formal_import(SimpleNamespace(mode='lab'))
        self.assertEqual(p.formal_submission_policy('lab'),{})
    def test_direct_formal_transaction_refused_before_journal_or_app(self):
        for kind in ('rollback-plan','import-plan'):
            with self.assertRaises(p.e.Error):p.transact(None,SimpleNamespace(mode='formal'),{'kind':kind})
    def exercise(self,restore_fail=False,journal_fail=False):
        src=FakeSource(restore_fail);journal={'id':'tx-synthetic','original_running':True,'original_source':'fake.original.source'};checkpoints=[]
        def checkpoint(phase,**fields):
            checkpoints.append((phase,fields))
            if journal_fail:raise OSError('simulated journal write failure')
        old_swap=p.swap
        def forbidden(*args):raise AssertionError('historical swap must never run')
        p.swap=forbidden
        try:
            with self.assertRaises(p.e.Error):p.preserve_formal_exchange(src,journal,checkpoint,RuntimeError('synthetic post-swap error'))
        finally:p.swap=old_swap
        self.assertEqual(src.calls,[(True,'fake.original.source')])
        self.assertEqual(len(checkpoints),2)
        self.assertTrue(all(phase=='recovery-required'and f['swapped']is True and f['automatic_snapshot_rewind']is False for phase,f in checkpoints))
        self.assertEqual(checkpoints[-1][1]['original_state_restore_succeeded'],not restore_fail)
        return checkpoints
    def test_after_swap_preserves_data_and_retries_restore(self):self.exercise()
    def test_restore_failure_still_preserves_data_and_requires_recovery(self):self.exercise(restore_fail=True)
    def test_journal_failure_does_not_prevent_restore_attempt(self):self.exercise(journal_fail=True)
    def test_dual_failure_never_restores_historical_v5(self):self.exercise(restore_fail=True,journal_fail=True)
    def test_formal_import_main_with_old_plan_never_opens_dictionary(self):
        # Real CLI main/execute/transact flow, mocked workspace metadata and App.
        # A pre-existing valid plan does not bypass the new submission pause.
        source=SimpleNamespace(mode='formal',quiet=mock.Mock(side_effect=AssertionError('formal DB must not open')),pids=mock.Mock(side_effect=AssertionError('formal App must not be queried')))
        root=Path('/synthetic/wetype-lab-policy-no-filesystem')
        config={'target':'formal','abi':p.e.ABI}
        oldplan={'kind':'import-plan','id':'plan-'+'1'*32}
        stdout,stderr=io.StringIO(),io.StringIO()
        with mock.patch.object(p.e,'safe_root',return_value=root),mock.patch.object(p.e,'locked',return_value=contextlib.nullcontext()),mock.patch.object(p.e,'read_json',return_value=config),mock.patch.object(p.e,'prepare',return_value={}),mock.patch.object(p,'Source',return_value=source),mock.patch.object(Path,'glob',return_value=[]),mock.patch.object(p,'plan_read',return_value=oldplan)as read_plan,mock.patch.object(p,'save',side_effect=AssertionError('journal must not be created'))as save,contextlib.redirect_stdout(stdout),contextlib.redirect_stderr(stderr):
            status=p.main(['--workspace',str(root),'--target','formal','import','--plan',oldplan['id']])
        self.assertEqual(status,2)
        self.assertFalse(json.loads(stderr.getvalue())['ok'])
        self.assertIn('1000',json.loads(stderr.getvalue())['error'])
        read_plan.assert_called_once()
        source.quiet.assert_not_called();source.pids.assert_not_called();save.assert_not_called()

if __name__=='__main__':unittest.main(verbosity=2)
