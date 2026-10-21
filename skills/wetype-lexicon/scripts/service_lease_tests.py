"""Independent pure service-interlock tests. Every service/process-control API is fake."""
import contextlib,copy,os,signal,sys,tempfile,unittest
from pathlib import Path
from types import SimpleNamespace
from unittest import mock
sys.path.insert(0,str(Path(__file__).resolve().parent))
import service_lease as sl
import sync_cli as core

class Clock:
 def __init__(self):self.n=0
 def now(self):return self.n
 def sleep(self,n):self.n+=n
class Tests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory(prefix='wetype-service-review-');self.root=Path(self.tmp.name);(self.root/'service-leases').mkdir();self.clock=Clock();self.parent=222;self.events=[]
  self.j={'id':'lease-'+'1'*32,'coordinator_pid':222,'coordinator_identity':'coordinator-start','boot_id':'boot','deadline_monotonic':30,'operation':'batch-import','job_id':'job-owned','plan_id':None,'label':sl.PREFIX+'1.2','target':'gui/501/'+sl.PREFIX+'1.2'}
  self.child=SimpleNamespace(pid=333,poll=mock.Mock(return_value=None));sl.ACTIVE.clear()
  self.deny_service=mock.patch.object(sl,'run',side_effect=AssertionError('unexpected real service API'));self.deny_process=mock.patch.object(sl.subprocess,'run',side_effect=AssertionError('unexpected real process API'));self.deny_service.start();self.deny_process.start()
 def tearDown(self):self.deny_process.stop();self.deny_service.stop();sl.ACTIVE.clear();self.tmp.cleanup()
 def guardian(self,read=b'R',timeout=False,revoked_error=False,kill_exit=True,term_exit=True,control_error=None):
  def kill(pid,sig):
   self.events.append(('kill',pid,sig))
   if (sig==signal.SIGTERM and term_exit)or(sig==signal.SIGKILL and kill_exit):self.parent=1
  def state(root,j,phase,**kw):
   self.events.append(('state',phase))
   if phase=='revoked'and revoked_error:raise OSError('journal unavailable')
  def restore(root,j):self.events.append(('restore',self.parent))
  with mock.patch.object(sl,'load',return_value=copy.deepcopy(self.j)),mock.patch.object(sl,'process_identity',return_value='guardian-start'),mock.patch.object(sl,'set_state',side_effect=state),mock.patch.object(sl.os,'getppid',side_effect=lambda:self.parent),mock.patch.object(sl.os,'getpid',return_value=333),mock.patch.object(sl.os,'kill',side_effect=kill),mock.patch.object(sl.os,'write'),mock.patch.object(sl.os,'close'),mock.patch.object(sl.os,'read',return_value=read),mock.patch.object(sl.select,'select',side_effect=control_error if control_error else None,return_value=([]if timeout else[10],[],[])),mock.patch.object(sl.time,'monotonic',side_effect=self.clock.now),mock.patch.object(sl.time,'sleep',side_effect=self.clock.sleep),mock.patch.object(sl,'restore',side_effect=restore):return sl.guardian(self.root,self.j['id'],10,11)
 def test_normal_release_can_restore_live_coordinator_without_kill(self):
  self.assertEqual(self.guardian(),0);self.assertNotIn('kill',[e[0]for e in self.events]);self.assertIn(('restore',222),self.events)
 def test_coordinator_eof_after_parent_exit_restores(self):
  self.parent=1;self.assertEqual(self.guardian(read=b''),0);self.assertIn(('restore',1),self.events)
 def test_timeout_terminates_parent_before_restoring(self):
  self.assertEqual(self.guardian(timeout=True),0);self.assertIn(('kill',222,signal.SIGTERM),self.events);self.assertIn(('restore',1),self.events);self.assertLess(self.events.index(('kill',222,signal.SIGTERM)),self.events.index(('restore',1)))
 def test_timeout_revocation_journal_failure_does_not_skip_fence_or_restore(self):
  self.assertEqual(self.guardian(timeout=True,revoked_error=True),0);self.assertIn(('kill',222,signal.SIGTERM),self.events);self.assertIn(('restore',1),self.events)
 def test_sigkill_fallback_is_confirmed_before_enable(self):
  self.assertEqual(self.guardian(timeout=True,term_exit=False),0);self.assertIn(('kill',222,signal.SIGKILL),self.events);self.assertIn(('restore',1),self.events)
 def test_unfenceable_coordinator_keeps_service_disabled(self):
  self.assertEqual(self.guardian(timeout=True,term_exit=False,kill_exit=False),2);self.assertNotIn('restore',[e[0]for e in self.events]);self.assertIn(('state','restore-failed'),self.events)
 def test_control_error_fences_parent_before_restoring(self):
  self.assertEqual(self.guardian(control_error=OSError('select failed')),0);self.assertIn(('kill',222,signal.SIGKILL),self.events);self.assertIn(('restore',1),self.events)
 def test_unexpected_eof_while_parent_live_requires_fence(self):
  self.assertEqual(self.guardian(read=b''),0);self.assertIn(('restore',1),self.events);self.assertNotIn(('restore',222),self.events)
 def active(self,*,operation='batch-import',job_id='job-owned',mutation=True,plan_id='plan-new',discover=None,disabled=True,pids=None,now=0):
  self.j['operation']=operation;sl.ACTIVE[str(self.root)]=(self.j,self.child,99)
  state={'phase':'armed','guardian_pid':333};source=SimpleNamespace(pids=mock.Mock(return_value=pids or[]))
  with mock.patch.object(sl.time,'monotonic',return_value=now),mock.patch.object(sl.t,'read',return_value=state),mock.patch.object(sl,'disabled',return_value=disabled),mock.patch.object(sl,'service_labels',return_value=[self.j['label']]if discover is None else[discover['target'].split('/',2)[-1]]),mock.patch.object(sl.t,'Source',return_value=source):return sl.assert_active(self.root,plan_id,mutation=mutation,job_id=job_id)
 def test_owned_batch_lease_admits(self):self.assertEqual(self.active(),self.j['id'])
 def test_readonly_lease_cannot_authorize_import(self):
  for operation in ['preview','queue','recover']:
   with self.subTest(operation=operation),self.assertRaises(sl.e.Error):self.active(operation=operation)
 def test_batch_job_mismatch_refused(self):
  for job in [None,'wrong']:
   with self.subTest(job=job),self.assertRaises(sl.e.Error):self.active(job_id=job)
 def test_changed_launch_instance_refused_even_when_idle(self):
  with self.assertRaises(sl.e.Error):self.active(discover={'target':self.j['target']+'-other'})
 def test_multiple_discovered_services_refused(self):
  with mock.patch.object(sl,'run',return_value='- 0 '+sl.PREFIX+'1.2\n- 0 '+sl.PREFIX+'3.4\n'),self.assertRaises(sl.e.Error):sl.discover()
 def test_wrong_program_or_bundle_refused(self):
  label=sl.PREFIX+'1.2'
  for program,bundle in [('/wrong/program',sl.BUNDLE),(sl.PROGRAM,'wrong.bundle')]:
   text='program = '+program+'\nbundle id = '+bundle+'\n'
   with self.subTest(program=program,bundle=bundle),mock.patch.object(sl,'run',side_effect=['- 0 '+label+'\n',text]),self.assertRaises(sl.e.Error):sl.discover()
 def test_inactive_expired_unrestricted_or_running_service_refused(self):
  variants=[{'now':25},{'disabled':False},{'pids':[444]}]
  for values in variants:
   with self.subTest(values=values),self.assertRaises(sl.e.Error):self.active(**values)
  self.child.poll.return_value=1
  with self.assertRaises(sl.e.Error):self.active()
 def recovered(self,coordinator=False,guardian=False):
  (self.root/'service-leases'/(self.j['id']+'.json')).touch();sl.state_path(self.root,self.j['id']).touch()
  state={'phase':'armed','guardian_pid':333,'guardian_identity':'guardian-start'}
  def same(j,pid,start):return coordinator if pid==222 else guardian
  with mock.patch.object(sl,'load',return_value=self.j),mock.patch.object(sl.t,'read',return_value=state),mock.patch.object(sl,'same_process',side_effect=same),mock.patch.object(sl,'restore')as restore,mock.patch.object(sl,'set_state')as save:
   try:result=sl.recover(self.root,self.j['id'])
   except BaseException:restore.assert_not_called();save.assert_not_called();raise
   restore.assert_called_once();return result
 def test_recovery_refuses_live_coordinator_even_if_guardian_dead(self):
  with self.assertRaises(sl.e.Error):self.recovered(coordinator=True)
 def test_recovery_refuses_live_guardian_even_if_coordinator_dead(self):
  with self.assertRaises(sl.e.Error):self.recovered(guardian=True)
 def test_dead_lease_recovery_never_writes_dictionary(self):self.assertFalse(self.recovered()['dictionary_written'])
 def test_boot_change_and_reused_pid_are_not_live_identity(self):
  with mock.patch.object(sl,'boot_id',return_value='different'),mock.patch.object(sl,'process_identity')as process:self.assertFalse(sl.same_process(self.j,222,'coordinator-start'))
  process.assert_not_called()
  with mock.patch.object(sl,'boot_id',return_value='boot'),mock.patch.object(sl,'process_identity',return_value='reused-start'):self.assertFalse(sl.same_process(self.j,222,'coordinator-start'))
 def test_lab_guard_never_discovers_or_controls_service(self):
  with mock.patch.object(sl,'discover')as discover,mock.patch.object(sl,'run')as run:
   with sl.guard(self.root,SimpleNamespace(mode='lab'),'batch-import')as lease:self.assertIsNone(lease)
  discover.assert_not_called();run.assert_not_called()
 def test_missing_process_identity_refuses_recovery_before_os_queries(self):
  for value in [None,'',123,False]:
   with self.subTest(value=value),mock.patch.object(sl,'boot_id')as boot,mock.patch.object(sl,'process_identity')as process,self.assertRaises(sl.e.Error):sl.same_process(self.j,222,value)
   boot.assert_not_called();process.assert_not_called()
 def test_load_refuses_missing_durable_coordinator_identity_or_boot_id(self):
  for field in ['coordinator_identity','boot_id']:
   for value in [None,'',123,False]:
    document=copy.deepcopy(self.j);document[field]=value
    with self.subTest(field=field,value=value),mock.patch.object(sl.t,'read',return_value=document),mock.patch.object(sl.e,'digest')as digest,self.assertRaises(sl.e.Error):sl.load(self.root,self.j['id'])
    digest.assert_not_called()
 def test_load_accepts_exact_service_and_pinned_helpers_with_durable_identity(self):
  document=copy.deepcopy(self.j);document.update(uid=os.getuid(),target=sl.domain()+'/'+self.j['label'],program=sl.PROGRAM,bundle=sl.BUNDLE,restore_helpers={'input_source':'sha','app_control':'sha'})
  with mock.patch.object(sl.t,'read',return_value=document),mock.patch.object(sl.e,'digest',return_value='sha'):self.assertEqual(sl.load(self.root,self.j['id']),document)
 def test_process_identity_uses_fixed_environment_despite_parent_locale(self):
  expected={'PATH':'/usr/bin:/bin','TZ':'UTC','LC_ALL':'C'}
  for timezone,locale in [('Asia/Shanghai','zh_CN.UTF-8'),('America/Los_Angeles','en_US.UTF-8')]:
   with self.subTest(timezone=timezone,locale=locale),mock.patch.dict(os.environ,{'TZ':timezone,'LC_ALL':locale,'PATH':'/untrusted/bin'}),mock.patch.object(sl.subprocess,'run',return_value=SimpleNamespace(returncode=0,stdout='  Thu Oct 22 01:02:03 2026 \n'))as ps:
    self.assertEqual(sl.process_identity(222),'Thu Oct 22 01:02:03 2026')
   self.assertEqual(ps.call_args.args[0],['/bin/ps','-p','222','-o','lstart=']);self.assertEqual(ps.call_args.kwargs['env'],expected)
 def test_process_identity_missing_or_unexpected_ps_error_fails_closed(self):
  with mock.patch.object(sl.subprocess,'run',return_value=SimpleNamespace(returncode=1,stdout='')):self.assertIsNone(sl.process_identity(222))
  with mock.patch.object(sl.subprocess,'run',return_value=SimpleNamespace(returncode=2,stdout='')),self.assertRaises(sl.e.Error):sl.process_identity(222)
 def test_early_recover_service_holds_workspace_lock_without_native_prepare(self):
  held=[False]
  @contextlib.contextmanager
  def locked(root):
   held[0]=True
   try:yield
   finally:held[0]=False
  def recover(root):self.assertTrue(held[0]);return {'leases':[],'dictionary_written':False}
  args=SimpleNamespace(command='recover-service',workspace=str(self.root),target='formal')
  with mock.patch.object(core.e,'safe_root',return_value=self.root),mock.patch.object(core.e,'locked',side_effect=locked)as lock,mock.patch.object(core,'prepare')as prepare,mock.patch.object(core.sl,'recover',side_effect=recover)as restore:
   self.assertFalse(core.execute(args)['dictionary_written'])
  lock.assert_called_once_with(self.root);restore.assert_called_once_with(self.root);prepare.assert_not_called();self.assertFalse(held[0])
 def test_early_recover_service_lock_conflict_never_calls_restore(self):
  args=SimpleNamespace(command='recover-service',workspace=str(self.root),target='formal')
  with mock.patch.object(core.e,'safe_root',return_value=self.root),mock.patch.object(core.e,'locked',side_effect=sl.e.Error('coordinator owns lock')),mock.patch.object(core.sl,'recover')as restore,self.assertRaises(sl.e.Error):core.execute(args)
  restore.assert_not_called()
 def test_early_recover_service_exception_releases_workspace_lock(self):
  held=[False]
  @contextlib.contextmanager
  def locked(root):
   held[0]=True
   try:yield
   finally:held[0]=False
  args=SimpleNamespace(command='recover-service',workspace=str(self.root),target='formal')
  with mock.patch.object(core.e,'safe_root',return_value=self.root),mock.patch.object(core.e,'locked',side_effect=locked),mock.patch.object(core.sl,'recover',side_effect=sl.e.Error('restore failed')),self.assertRaises(sl.e.Error):core.execute(args)
  self.assertFalse(held[0])
if __name__=='__main__':unittest.main(verbosity=2)
