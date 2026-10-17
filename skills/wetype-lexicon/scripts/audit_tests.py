"""Pure logic only: no native code, production path or personal words accessed."""
import copy
from pathlib import Path
import tempfile
import unittest
import audit_helpers as a

KEY = bytes(range(32))
ROWS = [{'pinyin': 'qing,ci', 'word': '虚构甲'},
        {'pinyin': 'qing,ci', 'word': '虚构乙'},
        {'pinyin': 'xu,gou', 'word': '虚构丙'}]


def tag(label):
    return a.hmac_tag(KEY, label.encode())


def snapshot(counter=None):
    hashes = {a.key_tag(KEY, b'!other!stable'): tag('stable')}
    info = {'action_header_hex': '', 'action_count': 0, 'action_max': 0,
            'action_sequences': {}, 'namespaces': {}}
    if counter is not None:
        raw = a.encode_header(counter)
        hashes[a.key_tag(KEY, a.HEADER_KEY)] = a.entry_tag(KEY, a.HEADER_KEY, raw)
        info.update(action_header_hex=raw.hex(), action_count=counter + 1, action_max=counter)
        for i in range(1, counter + 1):
            hashes[a.key_tag(KEY, b'!dcact!' + i.to_bytes(8, 'big'))] = tag('old-action-' + str(i))
    return {'hashes': hashes, 'info': info}


def fixture(rows=None, existing=(), counter=4, existing_buckets=()):
    rows = copy.deepcopy(ROWS if rows is None else rows)
    before = snapshot(counter)
    for py in existing_buckets:
        before['hashes'][a.key_tag(KEY, b'!v2u!' + py.encode())] = tag('prior-bucket-' + py)
    after = copy.deepcopy(before)
    result = []
    for i, r in enumerate(rows):
        exists = i in existing
        md = [tag('meta-' + str(i))] * (2 if exists else 1)
        result.append(dict(r, existed=exists, added=not exists, count=2 if exists else 1,
                           rank=0, candidates=0, truncated=False,
                           record_tag=a.pair_tag(KEY, r['pinyin'], r['word']),
                           metadata_unchanged=exists,
                           before_metadata_tags=md if exists else [], after_metadata_tags=md))
    n = sum(r['added'] for r in result)
    old = counter or 0
    if n:
        raw = a.encode_header(old + n)
        hk = a.key_tag(KEY, a.HEADER_KEY)
        after['hashes'][hk] = a.entry_tag(KEY, a.HEADER_KEY, raw)
        after['info'].update(action_header_hex=raw.hex(), action_count=before['info']['action_count'] + n + int(counter is None), action_max=old + n)
        after['info']['namespaces'][hk] = '!dcact!'
        after['info']['action_sequences'][hk] = 0
    index = 0
    for r in result:
        if r['added']:
            index += 1
            bk = a.key_tag(KEY, b'!v2u!' + r['pinyin'].encode())
            after['hashes'][bk] = tag('new-bucket-' + r['pinyin'])
            after['info']['namespaces'][bk] = '!v2u!'
            ak = a.key_tag(KEY, b'!dcact!' + (old + index).to_bytes(8, 'big'))
            after['hashes'][ak] = tag('new-action-' + str(old + index))
            after['info']['namespaces'][ak] = '!dcact!'
            after['info']['action_sequences'][ak] = old + index
    report = {'schema': 1, 'abi': a.ABI, 'add_option_bytes': 20, 'mode': 'import',
              'sandbox': dict.fromkeys(('applied','formal_read_denied','formal_write_denied','outside_write_denied','network_denied'), True),
              'rows': result,
              'record_audit': {'before_count': 20, 'after_count': 20 + n,
                               'before_hash': tag('before'), 'after_hash': tag('after') if n else tag('before'),
                               'existing_records_changed': 0, 'added_pairs': n,
                               'removed_pairs': 0, 'unexpected_pairs': 0, 'exact_add_only': True}}
    return before, after, rows, report


class AddOnlyTests(unittest.TestCase):
    def check_ok(self, args):
        return a.audit_add_only(*args, KEY)

    def check_bad(self, args):
        with self.assertRaises(a.AuditError):
            self.check_ok(args)

    def test_multiple_homophones_same_new_bucket(self):
        result = self.check_ok(fixture())
        self.assertEqual(result['added_pairs'], 3)
        self.assertEqual(result['target_buckets'], 2)
        self.assertEqual(len(result['delta']['added']), 5)

    def test_existing_bucket_modified_permitted(self):
        result = self.check_ok(fixture(existing_buckets=('qing,ci',)))
        self.assertEqual(len(result['delta']['modified']), 2)

    def test_existing_pair_skipped_even_count_two(self):
        result = self.check_ok(fixture(existing=(2,), existing_buckets=('xu,gou',)))
        self.assertEqual(result['added_pairs'], 2)
        self.assertEqual(result['skipped_pairs'], 1)
        self.assertEqual(result['target_buckets'], 1)

    def test_all_existing_is_exact_noop(self):
        result = self.check_ok(fixture(existing=(0,1,2)))
        self.assertEqual(result['delta'], dict(added=[], removed=[], modified=[]))

    def test_empty_header_initial_creation(self):
        result = self.check_ok(fixture(counter=None))
        self.assertTrue(result['header_created'])
        self.assertEqual(result['counter_before'], 0)
        self.assertEqual(len(result['delta']['added']), 6)

    def test_existing_zero_counter_header(self):
        result = self.check_ok(fixture(counter=0))
        self.assertFalse(result['header_created'])

    def test_header_empty_noop(self):
        self.check_ok(fixture(counter=None, existing=(0,1,2)))

    def test_unknown_added_key_rejected(self):
        args = fixture(); args[1]['hashes'][a.key_tag(KEY,b'!other!extra')] = tag('extra')
        self.check_bad(args)

    def test_unrelated_modified_key_rejected(self):
        args = fixture(); args[1]['hashes'][a.key_tag(KEY,b'!other!stable')] = tag('changed')
        self.check_bad(args)

    def test_removed_key_rejected(self):
        args = fixture(); del args[1]['hashes'][a.key_tag(KEY,b'!other!stable')]
        self.check_bad(args)

    def test_expected_bucket_not_changed_rejected(self):
        args = fixture(existing_buckets=('qing,ci',)); k=a.key_tag(KEY,b'!v2u!qing,ci');args[1]['hashes'][k]=args[0]['hashes'][k]
        self.check_bad(args)

    def test_extra_same_namespace_bucket_rejected(self):
        args=fixture();args[1]['hashes'][a.key_tag(KEY,b'!v2u!other')]=tag('extra')
        self.check_bad(args)

    def test_extra_action_rejected(self):
        args=fixture();args[1]['hashes'][a.key_tag(KEY,b'!dcact!'+(8).to_bytes(8,'big'))]=tag('extra')
        self.check_bad(args)

    def test_wrong_action_endian_rejected(self):
        args=fixture(); k=a.key_tag(KEY,b'!dcact!'+(5).to_bytes(8,'big'));v=args[1]['hashes'].pop(k);args[1]['info']['namespaces'].pop(k);args[1]['info']['action_sequences'].pop(k);args[1]['hashes'][a.key_tag(KEY,b'!dcact!'+(5).to_bytes(8,'little'))]=v
        self.check_bad(args)

    def test_wrong_sequence_classification_rejected(self):
        args=fixture(); k=a.key_tag(KEY,b'!dcact!'+(5).to_bytes(8,'big'));args[1]['info']['action_sequences'][k]=9
        self.check_bad(args)

    def test_action_count_wrong_rejected(self):
        args=fixture();args[1]['info']['action_count']+=1
        self.check_bad(args)

    def test_header_counter_wrong_rejected(self):
        args=fixture();raw=a.encode_header(8);args[1]['info']['action_header_hex']=raw.hex();args[1]['hashes'][a.key_tag(KEY,a.HEADER_KEY)]=a.entry_tag(KEY,a.HEADER_KEY,raw)
        self.check_bad(args)

    def test_header_envelope_wrong_rejected(self):
        args=fixture();raw=a.encode_header(7)[:-1]+b'\x00';args[1]['info']['action_header_hex']=raw.hex();args[1]['hashes'][a.key_tag(KEY,a.HEADER_KEY)]=a.entry_tag(KEY,a.HEADER_KEY,raw)
        self.check_bad(args)

    def test_header_trailing_bytes_rejected(self):
        args=fixture();args[1]['info']['action_header_hex']+='00'
        self.check_bad(args)

    def test_header_hash_metadata_mismatch_rejected(self):
        args=fixture();args[1]['info']['action_header_hex']=a.encode_header(8).hex()
        self.check_bad(args)

    def test_header_payload_wrong_rejected(self):
        args=fixture();raw=bytearray(a.encode_header(7));raw[0]=7;raw=bytes(raw);args[1]['info']['action_header_hex']=raw.hex();args[1]['hashes'][a.key_tag(KEY,a.HEADER_KEY)]=a.entry_tag(KEY,a.HEADER_KEY,raw)
        self.check_bad(args)

    def test_actions_without_header_rejected(self):
        args=fixture(counter=None);args[0]['info']['action_count']=1
        self.check_bad(args)

    def test_metadata_existing_changed_rejected(self):
        args=fixture(existing=(2,));r=args[3]['rows'][2];r['after_metadata_tags']=[tag('changed')];r['metadata_unchanged']=False
        self.check_bad(args)

    def test_existing_pair_add_called_rejected(self):
        args=fixture(existing=(2,));args[3]['rows'][2]['added']=True
        self.check_bad(args)

    def test_extra_record_metadata_rejected(self):
        args=fixture();args[3]['rows'][0]['after_metadata_tags'].append(tag('extra'))
        self.check_bad(args)

    def test_new_count_two_rejected(self):
        args=fixture();args[3]['rows'][0]['count']=2
        self.check_bad(args)

    def test_aggregate_changed_old_records_rejected(self):
        args=fixture();args[3]['record_audit']['existing_records_changed']=1
        self.check_bad(args)

    def test_wrong_pair_identity_rejected(self):
        args=fixture();args[3]['rows'][0]['record_tag']=tag('wrong')
        self.check_bad(args)

    def test_wrong_job_key_rejected(self):
        with self.assertRaises(a.AuditError):
            a.audit_add_only(*fixture(), bytes(32))

    def test_noop_aggregate_change_rejected(self):
        args=fixture(existing=(0,1,2));args[3]['record_audit']['after_hash']=tag('changed')
        self.check_bad(args)

    def test_counter_overflow_rejected(self):
        args=fixture();old=2**64-1;raw=a.encode_header(old);args[0]['info'].update(action_header_hex=raw.hex(),action_max=old);args[0]['hashes'][a.key_tag(KEY,a.HEADER_KEY)]=a.entry_tag(KEY,a.HEADER_KEY,raw)
        self.check_bad(args)

    def test_non_import_report_rejected(self):
        args=fixture();args[3]['mode']='inspect'
        self.check_bad(args)

    def test_inspect_existing_count_two_accepted(self):
        args=fixture(existing=(0,1,2));args[3]['mode']='inspect'
        a._report_rows(args[2], args[3], KEY)

    def test_verify_requires_all_rows_recalled(self):
        args=fixture(existing=(0,1,2));report=args[3];report['mode']='verify'
        for r in report['rows']:
            r.update(rank=1,candidates=3,truncated=False)
        a._report_rows(args[2], report, KEY)
        report['rows'][1]['rank']=0
        with self.assertRaises(a.AuditError):a._report_rows(args[2], report, KEY)

    def test_max500_rows(self):
        rows=[{'pinyin':'xu,gou','word':'虚构'+str(i)} for i in range(500)]
        self.assertEqual(a.audit_add_only(*fixture(rows=rows), KEY)['added_pairs'],500)
        with self.assertRaises(a.AuditError):a.validate_rows(rows+[{'pinyin':'xu','word':'加'}])

    def test_duplicate_pair_rejected_homophone_allowed(self):
        a.validate_rows(ROWS)
        with self.assertRaises(a.AuditError):a.validate_rows([ROWS[0],ROWS[0]])

    def test_bad_pinyin_and_word_rejected(self):
        for py, word in [('', '甲'),('a,,b','甲'),('a,b,','甲'),('A,b','甲'),('a\tb','甲'),('a',''),('a','甲\n'),('a','\ud800')]:
            with self.subTest(py=py):
                with self.assertRaises(a.AuditError):a.validate_rows([{'pinyin':py,'word':word}])

    def test_private_key_reuse_and_link_rejection(self):
        with tempfile.TemporaryDirectory(dir=Path(__file__).parent) as temp:
            root=Path(temp);job=root/'job';job.mkdir()
            self.assertEqual(a.new_job_key(job,KEY),KEY)
            self.assertEqual(a.new_job_key(job,KEY),KEY)
            with self.assertRaises(a.AuditError):a.new_job_key(job,bytes(32))
            linked=root/'linked';linked.symlink_to(job,target_is_directory=True)
            with self.assertRaises(a.AuditError):a.new_job_key(linked,KEY)
            import os
            os.link(job/'key.bin',root/'hard')
            with self.assertRaises(a.AuditError):a.new_job_key(job,KEY)


if __name__=='__main__':
    unittest.main(verbosity=2)
