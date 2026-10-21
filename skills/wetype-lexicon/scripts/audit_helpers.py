"""Private-job native invocation and strict, add-only logical audits.

The coordinator owns root identity, locking, consistent snapshots and publication.
These helpers never open the formal dictionary. All native invocations receive a
managed job and install their own denial sandbox before loading WeType code.
A transaction must reuse one 32-byte audit key across all compared clone jobs.
"""
from __future__ import annotations
import hashlib
import hmac
import json
import os
from pathlib import Path
import re
import secrets
import stat
import struct
import subprocess

ABI = 'WeType-3.0.0-670-arm64-UserDictV2-kind128-v1'
MAX_ROWS = 500
HEX = re.compile(r'[0-9a-f]{64}\Z')
PINYIN = re.compile(r'[a-z]+(?:,[a-z]+)*\Z')
HEADER_KEY = b'!dcact!' + bytes(8)
HEADER_ENVELOPE = bytes.fromhex('100000005aa55aa5')
UINT64_MAX = (1 << 64) - 1

class AuditError(RuntimeError):
    """Messages deliberately omit dictionary words, raw keys and native stderr."""


def _require(ok, message):
    if not ok:
        raise AuditError(message)


def _int(value, name, maximum=UINT64_MAX):
    _require(type(value) is int and 0 <= value <= maximum, 'invalid ' + name)
    return value


def _key(key):
    _require(type(key) is bytes and len(key) == 32, 'audit key must be 32 bytes')
    return key


def _part(value: bytes):
    return struct.pack('<Q', len(value)) + value


def hmac_tag(key: bytes, payload: bytes):
    _key(key)
    _require(type(payload) is bytes, 'invalid HMAC input')
    return hmac.new(key, payload, hashlib.sha256).hexdigest()


def key_tag(key: bytes, raw_key: bytes):
    _require(type(raw_key) is bytes, 'invalid raw key')
    return hmac_tag(key, b'key' + _part(raw_key))


def entry_tag(key: bytes, raw_key: bytes, raw_value: bytes):
    _require(type(raw_key) is bytes and type(raw_value) is bytes, 'invalid raw entry')
    return hmac_tag(key, b'entry' + _part(raw_key) + _part(raw_value))


def pair_tag(key: bytes, pinyin: str, word: str):
    _require(type(pinyin) is str and type(word) is str, 'invalid pair identity')
    return hmac_tag(key, b'pair' + _part(pinyin.encode('utf-8')) + _part(word.encode('utf-8')))


def validate_rows(rows):
    _require(type(rows) is list and 1 <= len(rows) <= MAX_ROWS, 'batch must contain 1..500 rows')
    result, seen = [], set()
    for row in rows:
        _require(type(row) is dict, 'invalid row')
        py, word = row.get('pinyin'), row.get('word')
        _require(type(py) is str and len(py) <= 256 and PINYIN.fullmatch(py) is not None, 'invalid pinyin')
        _require(type(word) is str and bool(word), 'invalid word')
        try:
            encoded = word.encode('utf-8')
        except UnicodeError:
            raise AuditError('invalid word encoding') from None
        _require(len(encoded) <= 512 and all(ord(c) >= 32 and ord(c) != 127 for c in word), 'invalid word bounds')
        _require((py, word) not in seen, 'duplicate request pair')
        seen.add((py, word))
        result.append({'pinyin': py, 'word': word})
    return result


def _safe_path(value, directory=True):
    path = Path(os.path.abspath(os.fspath(value)))
    _require(len(str(path)) <= 4096, 'managed path bounds')
    for node in reversed([path, *path.parents]):
        _require(node.name not in ('Library', 'Applications'), 'protected managed path')
        try:
            st = node.lstat()
        except OSError:
            raise AuditError('managed path unavailable') from None
        _require(not stat.S_ISLNK(st.st_mode), 'managed symlink rejected')
        _require(stat.S_ISDIR(st.st_mode) or stat.S_ISREG(st.st_mode), 'managed path type rejected')
        _require(not stat.S_ISREG(st.st_mode) or st.st_nlink == 1, 'managed hardlink rejected')
    _require(path.is_dir() if directory else path.is_file(), 'managed path type rejected')
    return path


def _job_paths(root, job):
    root, job = _safe_path(root), _safe_path(job)
    _require(job.parent == root / 'jobs', 'job must be a direct managed child')
    _safe_path(root / 'LAB.json', directory=False)
    return root, job


def _write_private(path, content, exclusive=False):
    path = Path(path)
    _safe_path(path.parent)
    if path.exists() or path.is_symlink():
        _safe_path(path, directory=False)
    flags = os.O_WRONLY | os.O_CREAT | os.O_NOFOLLOW | (os.O_EXCL if exclusive else os.O_TRUNC)
    try:
        fd = os.open(path, flags, 0o600)
        with os.fdopen(fd, 'wb') as f:
            _require(os.fstat(f.fileno()).st_nlink == 1, 'output hardlink rejected')
            f.write(content)
            f.flush()
            os.fsync(f.fileno())
    except OSError:
        raise AuditError('private job write failed') from None


def new_job_key(job, key=None):
    """Create key.bin once; reuse an identical key when invoked again."""
    job = _safe_path(job)
    key = secrets.token_bytes(32) if key is None else _key(key)
    path = job / 'key.bin'
    if path.exists() or path.is_symlink():
        _safe_path(path, directory=False)
        _require(path.stat().st_size == 32 and hmac.compare_digest(path.read_bytes(), key), 'job audit key mismatch')
    else:
        _write_private(path, key, exclusive=True)
    return key


def _json(path, limit=16 * 1024 * 1024):
    path = _safe_path(path, directory=False)
    _require(path.stat().st_size <= limit, 'JSON bounds exceeded')
    try:
        return json.loads(path.read_text(encoding='utf-8'))
    except (ValueError, OSError):
        raise AuditError('invalid audit JSON') from None


def _invoke(command, timeout):
    _require(type(timeout) in (int, float) and 0 < timeout <= 3600, 'invalid process timeout')
    try:
        result = subprocess.run(command, capture_output=True, timeout=timeout, check=False)
    except (OSError, subprocess.TimeoutExpired):
        raise AuditError('native worker unavailable or timed out; clone must be discarded') from None
    _require(result.returncode == 0, 'native worker failed; clone must be discarded')
    _require(len(result.stdout) <= 8 * 1024 * 1024 and len(result.stderr) <= 8 * 1024 * 1024, 'native output bounds')
    return result


def _report_rows(rows, report, key=None):
    _require(type(report) is dict and report.get('abi') == ABI and report.get('schema') == 1 and report.get('add_option_bytes') == 20, 'native report ABI rejected')
    sandbox = report.get('sandbox', {})
    _require(type(sandbox) is dict and all(sandbox.get(k) is True for k in ('applied','formal_read_denied','formal_write_denied','outside_write_denied','network_denied')), 'native sandbox evidence rejected')
    result = report.get('rows')
    _require(type(result) is list and len(result) == len(rows), 'native row count rejected')
    mode = report.get('mode')
    _require(mode in ('inspect','import','verify','candidates'), 'native report mode rejected')
    added = 0
    for request, row in zip(rows, result):
        _require(type(row) is dict and all(row.get(k) == request[k] for k in ('pinyin','word')), 'native row identity rejected')
        _require(type(row.get('existed')) is bool and type(row.get('added')) is bool, 'native row status rejected')
        _int(row.get('count'), 'pair count', (1 << 32) - 1)
        _require(type(row.get('metadata_unchanged')) is bool, 'metadata status rejected')
        _require(type(row.get('record_tag')) is str and HEX.fullmatch(row['record_tag']) is not None, 'record tag rejected')
        if key is not None:
            _require(hmac.compare_digest(row['record_tag'], pair_tag(key, request['pinyin'], request['word'])), 'record tag mismatch')
        before, after = row.get('before_metadata_tags'), row.get('after_metadata_tags')
        _require(type(before) is list and type(after) is list and len(before) <= 5_000_000 and len(after) <= 5_000_000, 'metadata shape rejected')
        _require(all(type(x) is str and HEX.fullmatch(x) for x in before + after), 'metadata tags rejected')
        _require(before == sorted(before) and after == sorted(after), 'metadata ordering rejected')
        _require(row['metadata_unchanged'] == (before == after), 'metadata status disagrees')
        if row['existed']:
            _require(not row['added'] and bool(before) and before == after, 'existing pair changed or Add called')
        elif row['added']:
            _require(mode == 'import' and before == [] and len(after) == 1 and row['count'] == 1, 'new pair record rejected')
            added += 1
        else:
            _require(mode in ('inspect','candidates') and before == [] and after == [] and row['count'] == 0, 'missing pair status rejected')
        if mode == 'verify':
            _require(row['existed'] and _int(row.get('rank'), 'candidate rank', 2048) > 0, 'recall evidence rejected')
            candidates = _int(row.get('candidates'), 'candidate count', 2048)
            _require(candidates >= row['rank'] and type(row.get('truncated')) is bool, 'candidate bounds rejected')
        if mode == 'candidates':
            rank = _int(row.get('rank'), 'candidate rank', 2048)
            _require(_int(row.get('candidates'), 'candidate count', 2048) >= rank and type(row.get('truncated')) is bool, 'candidate bounds rejected')
    audit = report.get('record_audit', {})
    _require(type(audit) is dict and audit.get('exact_add_only') is True, 'record audit absent')
    for name in ('existing_records_changed','removed_pairs','unexpected_pairs'):
        _require(type(audit.get(name)) is int and audit[name] == 0, 'record audit changed prior records')
    _require(type(audit.get('added_pairs')) is int and audit['added_pairs'] == added, 'record audit added count rejected')
    b = _int(audit.get('before_count'), 'record count', 5_000_000)
    a = _int(audit.get('after_count'), 'record count', 5_000_000)
    _require(a == b + added, 'record total delta rejected')
    _require(all(type(audit.get(k)) is str and HEX.fullmatch(audit[k]) for k in ('before_hash','after_hash')), 'record aggregate rejected')
    if not added:
        _require(audit['before_hash'] == audit['after_hash'], 'unchanged records aggregate rejected')
    return result


def invoke_worker(root, job, mode, rows, *, worker=None, timeout=1800, fault_after=0):
    root, job = _job_paths(root, job)
    rows = validate_rows(rows)
    _require(mode in ('inspect','import','verify','candidates'), 'invalid worker mode')
    _require(type(fault_after) is int and 0 <= fault_after <= MAX_ROWS and (not fault_after or mode == 'import'), 'invalid fault mode')
    executable = _safe_path(worker or root / 'cache/worker', directory=False)
    _require(executable.parent == root / 'cache', 'worker must be in managed cache')
    _safe_path(job / 'key.bin', directory=False)
    _write_private(job / 'request.tsv', ''.join(r['pinyin'] + '\t' + r['word'] + '\n' for r in rows).encode('utf-8'))
    command = [str(executable), str(root), str(job), mode] + ([str(fault_after)] if fault_after else [])
    result = _invoke(command, timeout)
    blobs = [line[len(b'WETYPE_RESULT='):] for line in result.stdout.splitlines() if line.startswith(b'WETYPE_RESULT=')]
    _require(len(blobs) == 1, 'native result protocol rejected')
    try:
        report = json.loads(blobs[0])
    except (ValueError, UnicodeError):
        raise AuditError('native result JSON rejected') from None
    _report_rows(rows, report, (job / 'key.bin').read_bytes())
    _require(report['mode'] == mode, 'native result mode mismatch')
    _write_private(job / (mode + '.result.json'), json.dumps(report, ensure_ascii=False, indent=2).encode('utf-8'))
    return report


def invoke_kv(root, job, *, wanted_tags=(), binary=None, timeout=120):
    root, job = _job_paths(root, job)
    executable = _safe_path(binary or root / 'cache/kv_hash', directory=False)
    _require(executable.parent == root / 'cache', 'KV worker must be in managed cache')
    wanted = sorted(set(wanted_tags))
    _require(len(wanted) <= 3000 and all(type(x) is str and HEX.fullmatch(x) for x in wanted), 'invalid requested tags')
    _write_private(job / 'kv-wanted-tags.txt', ('\n'.join(wanted) + ('\n' if wanted else '')).encode('ascii'))
    for name in ('kv-hashes.json','kv-info.json'):
        p = job / name
        if p.exists() or p.is_symlink():
            _safe_path(p, directory=False)
            p.unlink()
    result = _invoke([str(executable), str(root), str(job)], timeout)
    _require(any(line.startswith(b'KV_AUDIT_COMPLETE entries=') for line in result.stdout.splitlines()), 'KV result protocol rejected')
    snapshot = {'hashes': _json(job / 'kv-hashes.json', 1024 * 1024 * 1024), 'info': _json(job / 'kv-info.json')}
    _snapshot(snapshot)
    return snapshot


def changes(before, after):
    return {'added': sorted(after.keys() - before.keys()), 'removed': sorted(before.keys() - after.keys()), 'modified': sorted(k for k in before.keys() & after.keys() if before[k] != after[k])}


def _snapshot(snapshot):
    _require(type(snapshot) is dict, 'invalid KV snapshot')
    hashes, info = snapshot.get('hashes'), snapshot.get('info')
    _require(type(hashes) is dict and len(hashes) <= 5_000_000 and all(type(k) is str and HEX.fullmatch(k) and type(v) is str and HEX.fullmatch(v) for k,v in hashes.items()), 'invalid KV hash map')
    _require(type(info) is dict, 'invalid KV info')
    _int(info.get('action_count'), 'action count', 5_000_000)
    _int(info.get('action_max'), 'action maximum')
    _require(type(info.get('action_header_hex')) is str and len(info['action_header_hex']) in (0,48), 'invalid header encoding')
    for name in ('namespaces','action_sequences'):
        mapping = info.get(name)
        _require(type(mapping) is dict and len(mapping) <= 3000 and all(type(k) is str and HEX.fullmatch(k) and k in hashes for k in mapping), 'invalid classified tags')
    _require(all(type(v) is str and (v == 'opaque' or re.fullmatch(r'![A-Za-z0-9_]{1,38}!', v)) for v in info['namespaces'].values()), 'invalid namespace classification')
    for v in info['action_sequences'].values():
        _int(v, 'classified sequence')
    return hashes, info


def encode_header(counter):
    _int(counter, 'header counter')
    raw = bytes(8) + counter.to_bytes(8, 'little')
    return bytes((b + 6) & 255 for b in raw) + HEADER_ENVELOPE


def _header(snapshot, key):
    hashes, info = _snapshot(snapshot)
    header_tag = key_tag(key, HEADER_KEY)
    encoded = info['action_header_hex']
    _require(re.fullmatch(r'(?:[0-9a-f]{2})*', encoded) is not None, 'invalid header hex')
    raw = bytes.fromhex(encoded)
    if header_tag not in hashes:
        _require(raw == b'' and info['action_count'] == 0 and info['action_max'] == 0, 'action state exists without header')
        return 0, False
    _require(len(raw) == 24 and raw[16:] == HEADER_ENVELOPE, 'unknown action header envelope')
    decoded = bytes((b - 6) & 255 for b in raw[:16])
    _require(decoded[:8] == bytes(8), 'unknown action header payload')
    counter = int.from_bytes(decoded[8:], 'little')
    _require(hashes[header_tag] == entry_tag(key, HEADER_KEY, raw), 'header hash disagrees with metadata')
    _require(info['action_count'] >= 1 and info['action_max'] <= counter, 'action metadata disagrees with counter')
    return counter, True


def audit_add_only(before, after, rows, report, key):
    """Return strict proof or raise AuditError. Inputs are HMAC snapshots.

    Existing pinyin buckets may change when new homophones are appended. Every
    affected bucket must change, and each newly added pair must have one exact
    consecutive BE64 action key. Header creation contributes one additional KV.
    Optional requested-tag classifications, when present, must also agree.
    """
    _key(key)
    rows = validate_rows(rows)
    _require(type(report) is dict and report.get('mode') == 'import', 'Add audit requires import report')
    reported = _report_rows(rows, report, key)
    old, oldinfo = _snapshot(before)
    new, newinfo = _snapshot(after)
    counter, had_header = _header(before, key)
    after_counter, has_header = _header(after, key)
    delta = changes(old, new)
    _require(not delta['removed'], 'Add-only operation deleted keys')
    added_rows = [r for r in reported if r['added']]
    n = len(added_rows)
    _require(counter <= UINT64_MAX - n and after_counter == counter + n, 'action counter did not increment exactly')
    header = key_tag(key, HEADER_KEY)
    buckets = {key_tag(key, b'!v2u!' + r['pinyin'].encode('ascii')) for r in added_rows}
    sequences = {key_tag(key, b'!dcact!' + i.to_bytes(8, 'big')): i for i in range(counter + 1, counter + n + 1)}
    _require(not set(sequences) & old.keys(), 'new action sequence already exists')
    expected_added = (buckets - old.keys()) | set(sequences)
    expected_modified = buckets & old.keys()
    if n:
        _require(has_header, 'new actions require header')
        (expected_modified if had_header else expected_added).add(header)
        _require(newinfo['action_max'] == counter + n, 'action maximum did not reach final sequence')
    else:
        _require(had_header == has_header, 'zero-Add operation changed header presence')
        _require(newinfo['action_max'] == oldinfo['action_max'], 'zero-Add operation changed action maximum')
    _require(set(delta['added']) == expected_added and set(delta['modified']) == expected_modified, 'logical KV delta exceeds or misses Add-only keys')
    _require(newinfo['action_count'] == oldinfo['action_count'] + n + int(bool(n) and not had_header), 'action record count delta rejected')
    for tag in buckets:
        if tag in newinfo['namespaces']:
            _require(newinfo['namespaces'][tag] == '!v2u!', 'bucket namespace mismatch')
    for tag, seq in sequences.items():
        if tag in newinfo['namespaces']:
            _require(newinfo['namespaces'][tag] == '!dcact!', 'action namespace mismatch')
        if tag in newinfo['action_sequences']:
            _require(newinfo['action_sequences'][tag] == seq, 'action sequence classification mismatch')
    if header in newinfo['action_sequences']:
        _require(newinfo['action_sequences'][header] == 0, 'header sequence classification mismatch')
    return {'ok': True, 'added_pairs': n, 'skipped_pairs': len(rows) - n,
            'target_buckets': len(buckets), 'counter_before': counter,
            'counter_after': after_counter, 'header_created': bool(n) and not had_header,
            'delta': delta, 'record_audit': report['record_audit']}
