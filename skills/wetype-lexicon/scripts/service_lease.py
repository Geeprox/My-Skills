#!/usr/bin/env python3
"""Bounded launchd interlock with independent crash/timeout restoration.

The guardian never opens the dictionary. Expiry first terminates its own direct
parent coordinator, then restores launch permission and original input intent.
A signed recovery journal also supports recovery after a machine restart.
"""
import argparse,contextlib,json,os,re,select,signal,subprocess,sys,time
from pathlib import Path
import engine_support as e
import lexicon_cli as t

HERE=Path(__file__).resolve().parent
BUNDLE='com.tencent.inputmethod.wetype'
PROGRAM='/Library/Input Methods/WeType.app/Contents/MacOS/WeType'
PREFIX='application.'+BUNDLE+'.'
MUTATIONS={'import','batch-import'}
ACTIVE={}

def run(*args):
    p=subprocess.run(args,capture_output=True,text=True,timeout=15)
    t.require(p.returncode==0,'Service control failed: '+args[1]);return p.stdout

def domain():return 'gui/'+str(os.getuid())

def boot_id():return run('/usr/sbin/sysctl','-n','kern.bootsessionuuid').strip()

def process_identity(pid):
    p=subprocess.run(['/bin/ps','-p',str(pid),'-o','lstart='],capture_output=True,text=True,timeout=10,env={'PATH':'/usr/bin:/bin','TZ':'UTC','LC_ALL':'C'})
    t.require(p.returncode in (0,1),'Cannot inspect recovery process identity')
    return p.stdout.strip() or None

def same_process(j,pid,identity):
    t.require(isinstance(identity,str) and bool(identity),'Missing recovery process identity; preserve the lease')
    return j['boot_id']==boot_id() and process_identity(pid)==identity

def service_labels():
    labels=[]
    for line in run('/bin/launchctl','list').splitlines():
        v=line.split()
        if len(v)==3 and v[2].startswith(PREFIX):labels.append(v[2])
    return labels

def discover():
    labels=service_labels()
    t.require(len(labels)==1,'Expected exactly one registered official WeType service')
    label=labels[0]
    t.require(re.fullmatch(re.escape(PREFIX)+r'[0-9]+\.[0-9]+',label),'Unexpected WeType service label')
    target=domain()+'/'+label
    # Raw launchctl output contains environment values. Never return or log it.
    text=run('/bin/launchctl','print',target)
    def field(name):
        m=re.search(r'^\s*'+re.escape(name)+r' = (.*?)\s*$',text,re.M)
        return m.group(1) if m else None
    t.require(field('program')==PROGRAM and field('bundle id')==BUNDLE,'Service executable/bundle mismatch')
    return {'target':target,'label':label,'program':PROGRAM,'bundle':BUNDLE}

def disabled(label):
    output=run('/bin/launchctl','print-disabled',domain())
    m=re.search(r'"'+re.escape(label)+r'"\s*=>\s*(disabled|enabled|true|false)',output)
    return bool(m and m.group(1) in ('disabled','true'))

def state_path(root,lease):return root/'service-leases'/(lease+'-state.json')
def journal_path(root,lease):return root/'service-leases'/(lease+'.json')

def load(root,lease):
    t.ident(lease,'lease');j=t.read(root,journal_path(root,lease))
    t.require(isinstance(j.get('coordinator_identity'),str) and bool(j['coordinator_identity']) and isinstance(j.get('boot_id'),str) and bool(j['boot_id']),'Missing durable coordinator identity')
    t.require(j['uid']==os.getuid() and j['target']==domain()+'/'+j['label'] and re.fullmatch(re.escape(PREFIX)+r'[0-9]+\.[0-9]+',j['label']),'Recovery service identity mismatch')
    t.require(j['program']==PROGRAM and j['bundle']==BUNDLE,'Recovery executable mismatch')
    for name,digest in j['restore_helpers'].items():
        t.require(name in ('input_source','app_control') and e.digest(root/'cache'/name)==digest,'Restoration helper changed')
    return j

def set_state(root,j,phase,**kw):
    t.save(root,state_path(root,j['id']),t.base_meta(root,'service-lease-state')|{'id':j['id'],'phase':phase,'updated_at':t.now(),'guardian_pid':os.getpid(),'guardian_identity':process_identity(os.getpid())}|kw)

def restore(root,j):
    # Enable is idempotent even if the service was removed when its process quit.
    run('/bin/launchctl','enable',j['target'])
    t.require(not disabled(j['label']),'Launch permission restoration failed')
    t.Source(root,'formal').restore(j['original_running'],j['original_source'])

def guardian(root,lease,read_fd,ready_fd):
    j=load(root,lease);set_state(root,j,'armed',guardian_pid=os.getpid(),guardian_identity=process_identity(os.getpid()))
    cause='coordinator-exit';error=None;safe_to_restore=True
    try:
        os.write(ready_fd,b'1');os.close(ready_fd);ready_fd=None
        remaining=max(0,j['deadline_monotonic']-time.monotonic())
        ready,_,_=select.select([read_fd],[],[],remaining)
        if ready:
            cause='normal-release' if os.read(read_fd,1)==b'R' else 'coordinator-exit'
        else:cause='deadline-expired'
        if cause!='normal-release':
            try:set_state(root,j,'revoked',cause=cause)
            except BaseException:pass
            # Unexpected EOF also needs a fence: a live coordinator could have
            # accidentally closed its writer while still able to publish.
            if os.getppid()==j['coordinator_pid']:
                os.kill(j['coordinator_pid'],signal.SIGTERM)
                end=time.monotonic()+3
                while os.getppid()==j['coordinator_pid'] and time.monotonic()<end:time.sleep(.05)
                if os.getppid()==j['coordinator_pid']:
                    os.kill(j['coordinator_pid'],signal.SIGKILL)
                    end=time.monotonic()+3
                    while os.getppid()==j['coordinator_pid'] and time.monotonic()<end:time.sleep(.05)
                safe_to_restore=os.getppid()!=j['coordinator_pid']
    except BaseException as ex:
        error=type(ex).__name__+': '+str(ex)
        # On unexpected control errors, revoke by terminating our coordinator.
        if os.getppid()==j['coordinator_pid']:
            try:
                os.kill(j['coordinator_pid'],signal.SIGKILL)
                end=time.monotonic()+3
                while os.getppid()==j['coordinator_pid'] and time.monotonic()<end:time.sleep(.05)
            except BaseException:pass
        safe_to_restore=os.getppid()!=j['coordinator_pid']
    finally:
        for fd in (read_fd,ready_fd):
            if fd is not None:
                try:os.close(fd)
                except OSError:pass
        if safe_to_restore:
            for attempt in range(3):
                try:restore(root,j);error=None;break
                except BaseException as ex:error=type(ex).__name__+': '+str(ex);time.sleep(.3)
        else:error='Coordinator could not be fenced; launch permission remains restricted. Run recover-service after coordinator exits.'
        try:set_state(root,j,'restore-failed' if error else 'restored',cause=cause,error=error)
        except BaseException:error=error or 'Restoration journal unavailable; verify service state with recover-service'
    return 2 if error else 0

def assert_active(root,plan_id=None,mutation=False,job_id=None):
    entry=ACTIVE.get(str(root))
    t.require(entry is not None,'Formal access requires a live service interlock; use wetype-sync batch commands')
    j,child,fd=entry
    t.require(child.poll() is None and time.monotonic()+10<j['deadline_monotonic'],'Service interlock expired or near expiry')
    state=t.read(root,state_path(root,j['id']))
    t.require(state['phase']=='armed' and state.get('guardian_pid')==child.pid,'Service guardian is not active')
    t.require(disabled(j['label']),'Official service is no longer launch-restricted')
    t.require(set(service_labels()).issubset({j['label']}),'Official service registration changed during interlock')
    if mutation:t.require(j['operation'] in MUTATIONS,'Read-only interlock cannot authorize an import')
    t.require(not plan_id or not j.get('plan_id') or j['plan_id']==plan_id,'Service interlock plan mismatch')
    if mutation and j['operation']=='batch-import':
        t.require(bool(job_id) and j.get('job_id')==job_id,'Service interlock batch job mismatch')
    # A different LaunchServices instance must not bypass the captured label.
    t.require(not t.Source(root,'formal').pids(),'Official input method is running during isolated access')
    return j['id']

def recover(root,lease=None):
    directory=root/'service-leases';results=[]
    if not directory.exists():return {'leases':[]}
    paths=[journal_path(root,t.ident(lease,'lease'))] if lease else sorted(directory.glob('lease-*.json'))
    for path in paths:
        if path.name.endswith('-state.json'):continue
        j=load(root,path.stem);sp=state_path(root,j['id'])
        state=t.read(root,sp) if sp.exists() else {'phase':'unarmed'}
        if state['phase']=='restored':continue
        # Never race a still-running coordinator/guardian. Recovery is for a
        # dead lease, including journaled launch overrides surviving reboot.
        live=same_process(j,j['coordinator_pid'],j.get('coordinator_identity'))
        if state.get('guardian_pid'):
            live=live or same_process(j,state['guardian_pid'],state.get('guardian_identity'))
        t.require(not live,'Coordinator or guardian is still alive; do not restore a live lease')
        restore(root,j);set_state(root,j,'restored',cause='explicit-recovery');results.append(j['id'])
    return {'leases':results,'dictionary_written':False}

@contextlib.contextmanager
def guard(root,src,operation,plan_id=None,job_id=None,seconds=900):
    if src.mode!='formal':yield None;return
    t.require(str(root) not in ACTIVE,'Nested service interlocks are forbidden')
    t.require(operation in MUTATIONS|{'preview','queue','recover'},'Unknown service interlock operation')
    t.require(30<=seconds<=900,'Service interlock must be bounded to 30–900 seconds')
    directory=root/'service-leases';directory.mkdir(exist_ok=True,mode=0o700)
    recover(root)
    info=discover();t.require(not disabled(info['label']),'Official service was already disabled; preserve user intent')
    running=bool(src.pids());source=src.input_source();lease=t.token('lease')
    j=t.base_meta(root,'service-lease')|info|{'id':lease,'uid':os.getuid(),'operation':operation,'plan_id':plan_id,'job_id':job_id,'coordinator_pid':os.getpid(),'coordinator_identity':process_identity(os.getpid()),'boot_id':boot_id(),'deadline_monotonic':time.monotonic()+seconds,'original_running':running,'original_source':source,'restore_helpers':{n:e.digest(root/'cache'/n) for n in ('input_source','app_control')}}
    t.save(root,journal_path(root,lease),j)
    read_fd,write_fd=os.pipe();ready_read,ready_write=os.pipe()
    child=None;body_error=None
    try:
        child=subprocess.Popen([sys.executable,str(HERE/'service_lease.py'),'--guardian',str(root),lease,str(read_fd),str(ready_write)],pass_fds=(read_fd,ready_write),stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,start_new_session=True)
        os.close(read_fd);read_fd=None;os.close(ready_write);ready_write=None
        ready,_,_=select.select([ready_read],[],[],10)
        t.require(ready and os.read(ready_read,1)==b'1','Service guardian did not arm')
        run('/bin/launchctl','disable',info['target']);t.require(disabled(info['label']),'Service launch restriction failed')
        src.input_source('com.apple.keylayout.ABC');src.stop()
        ACTIVE[str(root)]=(j,child,write_fd);assert_active(root,plan_id,operation in MUTATIONS,job_id=job_id)
        yield lease
    except BaseException as ex:body_error=ex;raise
    finally:
        ACTIVE.pop(str(root),None)
        for fd in (read_fd,ready_write,ready_read):
            if fd is not None:
                try:os.close(fd)
                except OSError:pass
        try:os.write(write_fd,b'R')
        except OSError:pass
        os.close(write_fd)
        if child:
            try:child.wait(timeout=60)
            except subprocess.TimeoutExpired:
                if body_error is None:raise e.Error('Service guardian restoration pending; run recover-service before continuing')
            sp=state_path(root,lease)
            if body_error is None:
                t.require(sp.exists() and t.read(root,sp)['phase']=='restored','Input service restoration failed; run recover-service')
        elif not body_error:
            restore(root,j);set_state(root,j,'restored',cause='guardian-start-failed')

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--guardian',nargs=4,required=True);a=p.parse_args()
    root,lease,fd,ready=a.guardian
    raise SystemExit(guardian(Path(root),lease,int(fd),int(ready)))
