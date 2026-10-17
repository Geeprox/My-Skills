#!/usr/bin/env python3
"""Version-pinned native build, path, validation and snapshot support."""
import argparse
import contextlib
import csv
import datetime as dt
import fcntl
import hashlib
import io
import json
import os
from pathlib import Path
import platform
import plistlib
import re
import shutil
import stat
import struct
import subprocess
import sys
import unicodedata
import uuid

APP = Path('/Library/Input Methods/WeType.app')
EXECUTABLE = APP / 'Contents/MacOS/WeType'
SOURCE_SHA = 'ba19f0c2783acb8c6f09cf2c9d95e55a33bbc93034ef3d97ab728021cdda14a8'
THIN_SHA = '861d0b7f61d6f666745aadfc3073b156e972be87d67ba71919938406b82adebb'
ABI = 'WeType-3.0.0-670-arm64-UserDictV2-kind128-v1'
HERE = Path(__file__).resolve().parent
SAFE_ID = re.compile(r'[a-z]+-[0-9a-f]{32}\Z')
SYLLABLES = set('''a ai an ang ao ba bai ban bang bao bei ben beng bi bian biao bie bin bing bo bu ca cai can cang cao ce cen ceng cha chai chan chang chao che chen cheng chi chong chou chu chua chuai chuan chuang chui chun chuo ci cong cou cu cuan cui cun cuo da dai dan dang dao de dei den deng di dia dian diao die ding diu dong dou du duan dui dun duo e ei en eng er fa fan fang fei fen feng fo fou fu ga gai gan gang gao ge gei gen geng gong gou gu gua guai guan guang gui gun guo ha hai han hang hao he hei hen heng hm hng hong hou hu hua huai huan huang hui hun huo ji jia jian jiang jiao jie jin jing jiong jiu ju juan jue jun ka kai kan kang kao ke kei ken keng kong kou ku kua kuai kuan kuang kui kun kuo la lai lan lang lao le lei leng li lia lian liang liao lie lin ling liu lo long lou lu luan lun luo lv lve m ma mai man mang mao me mei men meng mi mian miao mie min ming miu mo mou mu n na nai nan nang nao ne nei nen neng ng ni nian niang niao nie nin ning niu nong nou nu nuan nun nuo nv nve o ou pa pai pan pang pao pei pen peng pi pian piao pie pin ping po pou pu qi qia qian qiang qiao qie qin qing qiong qiu qu quan que qun ran rang rao re ren reng ri rong rou ru ruan rui run ruo sa sai san sang sao se sen seng sha shai shan shang shao she shei shen sheng shi shou shu shua shuai shuan shuang shui shun shuo si song sou su suan sui sun suo ta tai tan tang tao te teng ti tian tiao tie ting tong tou tu tuan tui tun tuo wa wai wan wang wei wen weng wo wu xi xia xian xiang xiao xie xin xing xiong xiu xu xuan xue xun ya yan yang yao ye yi yin ying yo yong you yu yuan yue yun za zai zan zang zao ze zei zen zeng zha zhai zhan zhang zhao zhe zhei zhen zheng zhi zhong zhou zhu zhua zhuai zhuan zhuang zhui zhun zhuo zi zong zou zu zuan zui zun zuo'''.split())

class Error(Exception):
    pass

def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

def json_bytes(value):
    return (json.dumps(value, ensure_ascii=False, indent=2, sort_keys=True) + '\n').encode()

def fsync_dir(path):
    fd = os.open(path, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)

def atomic_json(path, value):
    tmp = path.with_name('.' + path.name + '-' + uuid.uuid4().hex)
    with tmp.open('xb') as f:
        f.write(json_bytes(value)); f.flush(); os.fsync(f.fileno())
    os.replace(tmp, path)
    fsync_dir(path.parent)

def read_json(path):
    if path.stat().st_size > 128 * 1024 * 1024:
        raise Error('JSON file too large: ' + str(path))
    return json.loads(path.read_text('utf-8'))

def safe_tree(path):
    """Refuse links, device nodes, sockets, and any non-private writable file."""
    for base, dirs, files in os.walk(path, followlinks=False):
        for p in [Path(base)] + [Path(base) / n for n in dirs + files]:
            s = p.lstat()
            if stat.S_ISLNK(s.st_mode) or not (stat.S_ISDIR(s.st_mode) or stat.S_ISREG(s.st_mode)):
                raise Error('Unsafe link or special file: ' + str(p))
            if stat.S_ISREG(s.st_mode) and s.st_nlink != 1:
                raise Error('Hard-linked file refused: ' + str(p))
            if s.st_uid != os.getuid() or s.st_mode & 0o022:
                raise Error('Lab files must be owned by this user and not group/world writable: ' + str(p))

def safe_root(raw):
    p = Path(os.path.abspath(os.path.expanduser(raw)))
    for parent in [p] + list(p.parents):
        if parent.is_symlink():
            raise Error('Lab path contains a symbolic link: ' + str(parent))
    if len(p.parts) < 4 or p == Path.home() or p in Path.home().parents or any(x.casefold() in {'library', 'applications', 'wetype.app'} for x in p.parts):
        raise Error('Lab cannot be a home, system, application, or Library directory')
    if not p.name.startswith('wetype-lab'):
        raise Error('Isolation directory name must start with wetype-lab')
    return p

def manifest(data):
    safe_tree(data)
    return {str(p.relative_to(data)): digest(p) for p in sorted(data.rglob('*')) if p.is_file()}

def fingerprint(data):
    return hashlib.sha256(json_bytes(manifest(data))).hexdigest()

def check_db_paths(data):
    p = data / 'userDict/v5/db_path.conf'
    if p.exists():
        name = p.read_text('ascii')
        if not re.fullmatch(r'[0-9]{1,32}', name) or not (p.parent / name).is_dir():
            raise Error('Invalid or escaping native db_path.conf')

def sync_tree(path):
    for p in path.rglob('*'):
        if p.is_file():
            with p.open('rb') as f:
                os.fsync(f.fileno())
    for p in sorted([x for x in path.rglob('*') if x.is_dir()], reverse=True):
        fsync_dir(p)
    fsync_dir(path)

def copy_data(source, dest):
    check_db_paths(source)
    before = manifest(source)
    shutil.copytree(source, dest)
    if manifest(dest) != before:
        raise Error('Snapshot copy verification failed')

def adapter_hash():
    return hashlib.sha256(b''.join((HERE / n).read_bytes() for n in ('native_worker.cpp', 'dictionary_items.inc', 'abi_profile.hpp', 'audit.hpp', 'kv_hash.cpp', 'input_source.cpp', 'app_control.mm'))).hexdigest()

def section_hashes(content):
    """Hash every file-backed Mach-O section, excluding zero-fill sections."""
    count = struct.unpack_from('<I', content, 16)[0]
    offset, sections = 32, {}
    for _ in range(count):
        command, length = struct.unpack_from('<II', content, offset)
        if command == 0x19:
            nsects = struct.unpack_from('<I', content, offset + 64)[0]
            for i in range(nsects):
                s = offset + 72 + i * 80
                name = bytes(content[s:s+16]).split(b'\0')[0].decode('ascii')
                segment = bytes(content[s+16:s+32]).split(b'\0')[0].decode('ascii')
                size, start = struct.unpack_from('<QI', content, s + 40)
                flags = struct.unpack_from('<I', content, s + 64)[0]
                if size and (flags & 0xff) not in (1, 0xc, 0x12):
                    if not start or start + size > len(content):
                        raise Error('Invalid file-backed Mach-O section')
                    sections[segment + ',' + name] = hashlib.sha256(content[start:start+size]).hexdigest()
        offset += length
    if '__TEXT,__text' not in sections:
        raise Error('Mach-O code section missing')
    return sections

def dependency_identity():
    """Pin the actual read-only model / framework set, including artifact mode."""
    resources = re.findall(r'"(/Library/Input Methods/WeType.app/[^"\n]+)"', (HERE / 'dictionary_items.inc').read_text())
    paths = {Path(p) for p in resources}
    paths.add(APP / 'Contents/Resources/imeData.bundle/index.json')
    paths.add(APP / 'Contents/Info.plist')
    paths.update(p for p in (APP / 'Contents/Frameworks').rglob('*') if p.is_file())
    return {str(p): digest(p) for p in sorted(paths)}

def prepare(root, artifact=None):
    if platform.system() != 'Darwin' or platform.machine() != 'arm64':
        raise Error('Native adapter requires Apple Silicon macOS')
    cache = root / 'cache'
    if cache.exists():
        meta = read_json(cache / 'identity.json')
        if meta.get('source_mode') == 'installed' and (not EXECUTABLE.is_file() or digest(EXECUTABLE) != SOURCE_SHA):
            raise Error('Installed WeType changed; native execution refused. Create a separately reviewed lab.')
        if meta['adapter_sha256'] != adapter_hash():
            raise Error('Adapter changed; create a new lab to rebuild safely')
        for name in ('worker', 'WeType-lab.bundle', 'kv_hash', 'input_source', 'app_control'):
            if digest(cache / name) != meta['files'][name]:
                raise Error('Native cache hash mismatch: ' + name)
        if meta.get('dependencies') != dependency_identity():
            raise Error('WeType models/frameworks/metadata changed since lab preparation; native execution refused. Create a new lab and rerun selftest.')
        return meta
    source = Path(artifact).absolute() if artifact else EXECUTABLE
    expected = THIN_SHA if artifact else SOURCE_SHA
    if not source.is_file() or digest(source) != expected:
        raise Error('Unsupported WeType artifact. Requires exact validated 3.0.0 (670) bytes. --artifact accepts only the pinned ARM64 slice, never arbitrary binaries.')
    build = root / ('build-' + uuid.uuid4().hex)
    build.mkdir(mode=0o700)
    try:
        if artifact:
            shutil.copyfile(source, build / 'thin')
        else:
            subprocess.run(['/usr/bin/lipo', str(EXECUTABLE), '-thin', 'arm64', '-output', str(build / 'thin')], check=True, capture_output=True)
        if digest(build / 'thin') != THIN_SHA:
            raise Error('ARM64 slice hash mismatch')
        b = bytearray((build / 'thin').read_bytes())
        original_sections = section_hashes(b)
        magic, cpu, sub, typ, count, size, flags, reserved = struct.unpack_from('<8I', b)
        if magic != 0xfeedfacf or typ != 2:
            raise Error('Unexpected Mach-O header')
        offset, commands = 32, []
        for _ in range(count):
            cmd, length = struct.unpack_from('<II', b, offset)
            if cmd not in (0x80000028, 0xe, 0x1d):
                commands.append(bytes(b[offset:offset + length]))
            offset += length
        rpath = str(APP / 'Contents/Frameworks').encode() + b'\0'
        length = (12 + len(rpath) + 7) & ~7
        commands.append(struct.pack('<III', 0x8000001c, length, 12) + rpath + bytes(length - 12 - len(rpath)))
        new = b''.join(commands)
        if len(new) > size:
            raise Error('Mach-O load commands exceed original header space')
        struct.pack_into('<8I', b, 0, magic, cpu, sub, 8, len(commands), len(new), flags & ~0x200000, reserved)
        b[32:32 + size] = new + bytes(size - len(new))
        (build / 'WeType-lab.bundle').write_bytes(b)
        # Only this new local copy is ad-hoc signed. Installed application is read-only.
        subprocess.run(['/usr/bin/codesign', '--force', '--sign', '-', str(build / 'WeType-lab.bundle')], check=True, capture_output=True)
        if section_hashes((build / 'WeType-lab.bundle').read_bytes()) != original_sections:
            raise Error('Derived code/data sections changed; refusing to execute')
        subprocess.run(['/usr/bin/xcrun', 'clang++', '-std=c++17', '-O0', str(HERE / 'native_worker.cpp'), '-lsandbox', '-o', str(build / 'worker')], check=True, capture_output=True)
        subprocess.run(['/usr/bin/xcrun', 'clang++', '-std=c++17', '-O0', str(HERE / 'kv_hash.cpp'), '-lsandbox', '-o', str(build / 'kv_hash')], check=True, capture_output=True)
        subprocess.run(['/usr/bin/xcrun', 'clang++', '-std=c++17', str(HERE / 'input_source.cpp'), '-framework', 'Carbon', '-o', str(build / 'input_source')], check=True, capture_output=True)
        subprocess.run(['/usr/bin/xcrun', 'clang++', str(HERE / 'app_control.mm'), '-framework', 'Cocoa', '-o', str(build / 'app_control')], check=True, capture_output=True)
        (build / 'thin').unlink()
        host = plistlib.loads((APP / 'Contents/Info.plist').read_bytes())
        meta = {'abi': ABI, 'source_sha256': SOURCE_SHA, 'source_mode': 'pinned-arm64-artifact' if artifact else 'installed', 'source_path': str(source),
                'resource_host_version': host.get('CFBundleShortVersionString'), 'resource_host_build': host.get('CFBundleVersion'),
                'dependencies': dependency_identity(), 'code_sections_unchanged': True, 'source_sections': original_sections,
                'adapter_sha256': adapter_hash(), 'files': {n: digest(build / n) for n in ('worker', 'WeType-lab.bundle', 'kv_hash', 'input_source', 'app_control')}}
        atomic_json(build / 'identity.json', meta)
        sync_tree(build); build.rename(cache); fsync_dir(root)
        return meta
    finally:
        if build.exists():
            shutil.rmtree(build)

def initialize(root):
    if root.exists() and not (root / 'LAB.json').exists():
        if any(root.iterdir()):
            raise Error('Refusing to initialize a nonempty unmarked directory')
    root.mkdir(mode=0o700, parents=True, exist_ok=True)
    root.chmod(0o700)
    if not (root / 'LAB.json').exists():
        atomic_json(root / 'LAB.json', {'schema': 1, 'id': uuid.uuid4().hex, 'abi': ABI, 'purpose': 'isolated-personal-learning-dictionary-only'})
        for name in ('versions', 'backups', 'plans', 'jobs'):
            (root / name).mkdir(mode=0o700)
        v = root / 'versions' / ('gen-' + uuid.uuid4().hex)
        v.mkdir(mode=0o700); (v / 'engine').mkdir(); (v / 'userDict').mkdir()
        atomic_json(v / 'registry.json', [])
        atomic_json(root / 'CURRENT.json', {'generation': v.name})

@contextlib.contextmanager
def locked(root):
    if not (root / 'LAB.json').is_file():
        raise Error('Not initialized. Run init first.')
    safe_tree(root)
    with (root / 'LOCK').open('a+b') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            raise Error('Another command holds this lab lock; retry after it finishes')
        safe_tree(root)
        lab = read_json(root / 'LAB.json')
        if lab.get('schema') != 1 or lab.get('abi') != ABI or not re.fullmatch('[0-9a-f]{32}', lab.get('id', '')):
            raise Error('Lab marker or ABI mismatch')
        yield lab

def current(root):
    name = read_json(root / 'CURRENT.json').get('generation', '')
    if not SAFE_ID.fullmatch(name) or not name.startswith('gen-'):
        raise Error('Invalid CURRENT generation')
    path = root / 'versions' / name
    if not path.is_dir():
        raise Error('CURRENT generation missing')
    check_db_paths(path)
    return path

def han(c):
    return '\u3400' <= c <= '\u9fff' or '\U00020000' <= c <= '\U000323af'

def normalize_rows(source):
    if source.stat().st_size > 2 * 1024 * 1024:
        raise Error('Word list exceeds 2 MiB')
    text = source.read_text('utf-8-sig')
    if source.suffix.lower() == '.json':
        raw = json.loads(text)
        if not isinstance(raw, list):
            raise Error('JSON input must be an array of {word,pinyin}')
    elif source.suffix.lower() in ('.csv', '.tsv'):
        reader = csv.DictReader(io.StringIO(text), delimiter='\t' if source.suffix.lower() == '.tsv' else ',')
        if set(reader.fieldnames or ()) != {'word', 'pinyin'}:
            raise Error('CSV/TSV requires exactly two headers: word,pinyin')
        raw = list(reader)
    else:
        raise Error('Supported word lists: UTF-8 .tsv, .csv, .json')
    if not 1 <= len(raw) <= 500:
        raise Error('Each batch must contain 1–500 input rows')
    rows, seen, duplicates, errors = [], {}, [], []
    for number, r in enumerate(raw, 1):
        try:
            if not isinstance(r, dict) or set(r) != {'word', 'pinyin'} or not all(isinstance(v, str) for v in r.values()):
                raise Error('expected two string fields: word,pinyin')
            word = unicodedata.normalize('NFKC', r['word']).strip()
            if not 1 <= len(word) <= 16 or not all(han(c) for c in word):
                raise Error('word must contain 1–16 Han characters only')
            pinyin = unicodedata.normalize('NFKC', r['pinyin']).lower().strip().replace('ü', 'v')
            if not re.fullmatch(r"[a-zv]+(?:[ ,'’\t]+[a-zv]+)*", pinyin):
                raise Error('use untoned syllables separated by commas, spaces or apostrophes; ü/v supported')
            syllables = re.split(r"[ ,'’\t]+", pinyin)
            unknown = [s for s in syllables if s not in SYLLABLES]
            if unknown:
                raise Error('unknown pinyin syllable(s): ' + ','.join(unknown))
            if len(syllables) != len(word):
                raise Error('Han character / pinyin syllable count mismatch')
            normalized = {'word': word, 'pinyin': ','.join(syllables)}
            key = (normalized['pinyin'], word)
            if key in seen:
                duplicates.append({'row': number, 'first_row': seen[key], **normalized})
            else:
                seen[key] = number; rows.append(normalized)
        except Error as e:
            errors.append({'row': number, 'error': str(e)})
    if errors:
        raise Error(json.dumps({'validation_errors': errors}, ensure_ascii=False))
    return {'input_rows': len(raw), 'unique_rows': len(rows), 'duplicates_in_file': duplicates, 'rows': rows,
            'note': 'Validates spelling format and character/syllable counts; pronunciation correctness requires human review.'}

def job_clone(root, data):
    job = root / 'jobs' / ('job-' + uuid.uuid4().hex)
    job.mkdir(mode=0o700)
    copy_data(data, job / 'data')
    return job

