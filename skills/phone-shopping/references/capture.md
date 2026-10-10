# 商详采集协议

## 当前候选记录

```
platform/device_alias/time；item_id（无则 unknown）；标题；选中 SKU；数量；店铺/官方身份/广告标记
price: 金额 / 标签与必要条件 / 数量口径 / source(native|image)
sections: overview, sku_parameters, required_accessories, review_summary, shop,
          image_body, product_limits = read|partial|not_present|unknown
body_progress: 已读标题/图序号/续段/小字；最近证据；未读区块
stop: recommendation_boundary|explicit_end|generic_disclaimer_skipped|blocked|budget；evidence；coverage
```

完整商详指当前正文走到边界且关键区块已读/明确缺失，不含所有评价、全部 SKU 和推荐商品。按当次任务决定完整或重点阅读，首屏/跳读不称全文完成；来源矛盾保留两种说法。

## 停止与进度

- 挑选必要字段读完，后续只有通用免责声明/价格解释/重复注解时可停，记 generic_disclaimer_skipped；相关规格/配件/适用限制/优惠脚注仍读。未读介绍保留 partial。
- 完整模式的可靠边界：正文已进入且连续读取，看到正文收尾，紧接独立推荐卡片/信息流；保存交界证据并停止继续读推荐。
- 推荐前的店铺/组合/中段推荐、固定推荐按钮、图片价表、没有新原生文字、白屏、单次滚动失败均不单独证明结束。
- 没进度先看截图；有界等待加载后仍不动且缺末尾证据，记 blocked/partial，不加大盲滚次数。
- 每段默认最多 8 次手势后检查账本、内容新颖度与预算；正文明确继续可开下一段。预算停止不是全文完成。

## 密度与证据

优先细读影响选择的规格、兼容性、配置/包装、对比表、适用限额与脚注；场景照、品牌故事、重复卖点略读。只能依据已看到内容判断略读，不把未知图片当装饰。目录跳读减少重复，但完整模式需补齐断点。

原生可读字段先做任务投影，图片无原生文字使用视觉读取。不要每轮重复完整树/schema/图像；只读树的 Token 不证明图片任务省 Token。计时区分本地 API、加载、截图、模型与总耗时，短跑不证明长期稳定。记录不含地址、账号、通知等无关内容。
