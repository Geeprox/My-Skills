"""Signed compensation permits, derived only from a trusted actual import report.

No arbitrary-word deletion API is exposed. The original report/receipt is private
trusted coordinator state, never a caller-supplied authorization. Native worker
rechecks the whole record hash and exact target metadata before any Remove call.
"""
import copy,hmac,json,subprocess
from pathlib import Path
import audit_helpers as a

def receipt_from_import(report,key,selected=None):
    a._require(type(report)is dict and report.get('mode')=='import','actual import report required')
    rows=[{'pinyin':r['pinyin'],'word':r['word']}for r in report['rows']]
    a._report_rows(rows,report,key)
    added={(r['pinyin'],r['word']):r for r in report['rows']if r['added'] and not r['existed']}
    if selected is None:selected=[{'pinyin':py,'word':word}for py,word in added]
    selected=a.validate_rows(selected)
    result=[]
    for r in selected:
        match=added.get((r['pinyin'],r['word']))
        a._require(match is not None,'existing or unowned pair is not eligible for compensation')
        a._require(match['before_metadata_tags']==[] and len(match['after_metadata_tags'])==1 and match['count']==1,'new pair proof rejected')
        result.append(dict(r,record_tag=match['record_tag'],metadata_tag=match['after_metadata_tags'][0]))
    return _seal_receipt({'schema':2,'kind':'compensation-new-pairs-only','after_hash':report['record_audit']['after_hash'],'after_count':report['record_audit']['after_count'],'origin_after_hash':report['record_audit']['after_hash'],'origin_after_count':report['record_audit']['after_count'],'rows':result},key)

def _receipt_body(receipt):
    return json.dumps({k:v for k,v in receipt.items() if k!='seal'},sort_keys=True,ensure_ascii=False,separators=(',',':')).encode('utf-8')

def _seal_receipt(receipt,key):
    result=copy.deepcopy(receipt)
    result['seal']=a.hmac_tag(key,b'owned-compensation-receipt-v2'+_receipt_body(result))
    return result

def _verify_receipt(receipt,key):
    a._require(type(receipt)is dict and receipt.get('schema')==2 and receipt.get('kind')=='compensation-new-pairs-only','receipt type rejected')
    a._require(type(receipt.get('seal'))is str and hmac.compare_digest(receipt['seal'],a.hmac_tag(key,b'owned-compensation-receipt-v2'+_receipt_body(receipt))),'owned receipt signature rejected')
    a._require(type(receipt.get('after_hash'))is str and a.HEX.fullmatch(receipt['after_hash'])is not None,'receipt hash rejected')
    a._int(receipt.get('after_count'),'record count',5_000_000)
    rows=a.validate_rows([{'pinyin':r['pinyin'],'word':r['word']}for r in receipt['rows']])
    for row,r in zip(rows,receipt['rows']):
        a._require(r['record_tag']==a.pair_tag(key,row['pinyin'],row['word'])and type(r.get('metadata_tag'))is str and a.HEX.fullmatch(r['metadata_tag'])is not None,'receipt target tag rejected')
    return rows

def _rebind_permit(receipt,inspection,key):
    """Rebind current aggregate only after proving every owned target unchanged.

    Ownership still comes from the immutable signed original import receipt.
    Unrelated main-record changes may be preserved. Missing targets, frequency
    learning, metadata changes, and partially completed undo reject the batch.
    """
    rows=_verify_receipt(receipt,key)
    a._require(inspection.get('mode')=='inspect','fresh native inspection required')
    current=a._report_rows(rows,inspection,key)
    for original,row in zip(receipt['rows'],current):
        a._require(row['existed'] is True and row['added'] is False and row['count']==1 and row['before_metadata_tags']==[original['metadata_tag']] and row['after_metadata_tags']==[original['metadata_tag']] and row['record_tag']==original['record_tag'],'owned target changed or already removed')
    rebound=copy.deepcopy(receipt)
    rebound['after_hash']=inspection['record_audit']['after_hash']
    rebound['after_count']=inspection['record_audit']['after_count']
    return _seal_receipt(rebound,key)

def rebase_receipt(receipt,current_inspect,key):
    """Coordinator may preview/rebind owned targets; compensate inspects again."""
    return _rebind_permit(receipt,current_inspect,key)

def write_permit(job,receipt,key,inspection=None):
    _verify_receipt(receipt,key)
    bound=receipt if inspection is None else _rebind_permit(receipt,inspection,key)
    lines=['WETYPE_REMOVE_RECEIPT_V1',bound['after_hash'],str(bound['after_count'])]
    for r in bound['rows']:
        lines.append('\t'.join([r['pinyin'],r['word'],r['record_tag'],r['metadata_tag']]))
    body=('\n'.join(lines)+'\n').encode('utf-8')
    sig=a.hmac_tag(key,b'remove-permit-v1'+body)
    a._write_private(Path(job)/'remove-permit.txt',body+b'SIGNATURE\t'+sig.encode()+b'\n')
    return bound

def _json_process(command,prefix,timeout):
    p=subprocess.run(command,capture_output=True,timeout=timeout)
    if p.returncode!=0:
        if len(command)>=3:a._write_private(Path(command[2])/'remove.failure.stderr.log',p.stderr[:4096])
        raise a.AuditError('compensation/probe rejected; isolated job must be discarded')
    lines=[v[len(prefix):]for v in p.stdout.splitlines()if v.startswith(prefix)]
    a._require(len(lines)==1,'native compensation protocol rejected')
    return json.loads(lines[0])

def audit_remove_delta(before,after,receipt,result,key):
    old,_=a._snapshot(before);new,_=a._snapshot(after)
    qb,qa=result['queue_before'],result['queue_after']
    n=len(receipt['rows']);lo=qb['counter'];hi=qa['counter']
    a._require(type(lo)is int and type(hi)is int and hi==lo+n,'pair Remove must append one action per pair')
    a._require(qb['watermark']==qa['watermark'],'Remove must not move local consumer watermark')
    added=[x for x in qa['actions']if x['seq']>lo]
    a._require(len(added)==n and {x['seq']for x in added}==set(range(lo+1,hi+1)) and all(x['type']==2 and x['kind']==128 for x in added),'unexpected compensation action')
    delta=a.changes(old,new)
    action_keys={a.key_tag(key,b'!dcact!'+seq.to_bytes(8,'big'))for seq in range(lo+1,hi+1)}
    buckets={a.key_tag(key,b'!v2u!'+r['pinyin'].encode('utf-8'))for r in receipt['rows']}
    header=a.key_tag(key,a.HEADER_KEY)
    a._require(set(delta['added'])==action_keys,'unexpected Remove added keys')
    a._require(set(delta['removed'])<=buckets and set(delta['modified'])==({header}|(buckets-set(delta['removed']))),'unexpected Remove changed keys')
    a._require(all(k in old for k in buckets),'missing pre-Remove target bucket')
    a._require(a._header(before,key)==(lo,True) and a._header(after,key)==(hi,True),'Remove header mismatch')
    return delta

def compensate(root,job,receipt,key,timeout=1800):
    root,job=a._job_paths(root,job)
    rows=_verify_receipt(receipt,key)
    before=a.invoke_kv(root,job)
    inspection=a.invoke_worker(root,job,'inspect',rows)
    inspected=a.invoke_kv(root,job)
    a._require(before['hashes']==inspected['hashes'],'inspection changed logical keys; clone must be discarded')
    bound=write_permit(job,receipt,key,inspection)
    result=_json_process([str(root/'cache/remove_worker'),str(root),str(job),'compensate'],b'WETYPE_REMOVE_RESULT=',timeout)
    a._require(result.get('mode')=='compensate'and result.get('removed')==len(receipt['rows'])and result.get('other_metadata_unchanged')is True,'Remove result audit rejected')
    a._require(result['before_hash']==bound['after_hash'] and result['before_count']==bound['after_count'] and result['after_count']==result['before_count']-result['removed'],'Remove record delta rejected')
    after=a.invoke_kv(root,job)
    result['exact_kv_delta']=audit_remove_delta(before,after,receipt,result,key)
    result['ownership_receipt_seal']=receipt['seal']
    result['original_import_record_hash']=receipt['origin_after_hash']
    result['fresh_before_record_hash']=bound['after_hash']
    result['unrelated_record_changes_preserved']=bound['after_hash']!=receipt['origin_after_hash']
    a._write_private(job/'compensate.result.json',json.dumps(result,ensure_ascii=False,indent=2).encode())
    return result

def queue(root,job):
    root,job=a._job_paths(root,job)
    return _json_process([str(root/'cache/queue_probe'),str(root),str(job)],b'QUEUE_RESULT=',120)
