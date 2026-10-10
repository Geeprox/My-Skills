#!/usr/bin/env python3
"""Offline projection of native phone snapshots. No phone control or network."""
import argparse,hashlib,json,re
from pathlib import Path

def unwrap(data):
    if 'content' in data:
        data=json.loads(next(c['text'] for c in data['content'] if c.get('type')=='text'))
    return data.get('observation',data.get('error',{}).get('observation',data))

def project(data):
    o=unwrap(data);app=o.get('package',o.get('app'));width=o.get('viewport',{}).get('width');height=o.get('viewport',{}).get('height')
    cards=[];seen=set();nav=[];signals=[]
    for n in o.get('nodes',[]):
        if n.get('password') or n.get('package') and n['package']!=app:continue
        r=n.get('rect');v=n.get('content_desc') or n.get('text') or n.get('label') or ''
        if not v or not r or len(r)!=4:continue
        if width and height and (r[0]>=width or r[1]>=height or r[0]+r[2]<=0 or r[1]+r[3]<=0):continue
        selector={k:n[k] for k in ('class_name','resource_id','content_desc') if n.get(k)} if o.get('package') else {k:n[k] for k in ('type','label') if n.get(k)}
        if v in ('首页','搜索','搜索 按钮','宝贝','商品','评价','大家评','详情','推荐','返回','目录','宝贝详情','商品介绍','规格参数','包装清单','售后保障','价格说明','猜你喜欢','看了又看','为你推荐','商品推荐'):
            nav.append({'label':v,'rect':r,'selector':selector})
        if any(t in v for t in ('宝贝详情','商品介绍','售后保障','价格说明','猜你喜欢','看了又看','为你推荐','商品推荐')) and len(v)<100:signals.append(v)
        # Aggregate native card, not isolated amount/title/toolbar. Sales/browser
        # wording is preserved, never normalized into a single invented metric.
        if re.search(r'\d+(?:\.\d+)?元',v) and re.search(r'人付款|已售',v) and v not in seen:
            seen.add(v)
            cards.append({'exposed_row_key':hashlib.sha256(v.encode()).hexdigest()[:12],
                          'native_card_text':v,'amounts':re.findall(r'(\d+(?:\.\d+)?)元',v),
                          'rect':r,'selector':selector,'item_id':None})
    return {'app':app,'viewport':o.get('viewport'),'truncated':o.get('truncated'),
            'cards':cards,'navigation':nav,'boundary_hints':list(dict.fromkeys(signals)),
            'stop_decision':'requires_stage_and_visual_evidence','image':o.get('image'),
            'scope':'visible native rows only; no image OCR, product ID or full-list coverage; no shipping/history/notification projection'}

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('snapshot',type=Path);p.add_argument('--output',type=Path);a=p.parse_args()
    result=project(json.loads(a.snapshot.read_text()));s=json.dumps(result,ensure_ascii=False,separators=(',',':'))
    if a.output:a.output.write_text(s+'\n')
    else:print(s)
if __name__=='__main__':main()
