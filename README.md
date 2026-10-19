# My-Skills

A collection of reusable skills for Codex/Claude Code.

## Skill index

| Skill | 名称 | 介绍 |
|---|---|---|
| [xunbo-writing-style](skills/xunbo-writing-style/SKILL.md) | 勋博写作风格 | 按既有写作风格撰写和改写中文内容，支持剪贴板工作流。 |
| [phone-shopping](skills/phone-shopping/SKILL.md) | 操作手机挑选采购商品 | 自动准备缺失的手机操作能力；先调研推荐信息，再跨品牌、店铺、SPU/SKU 核对商详与到手价，优先官方/平台旗舰店并综合优惠；多设备动态并行，必要时问客服、加购分类，长任务留档并交付决策文档。 |
| [wetype-lexicon](skills/wetype-lexicon/SKILL.md) | 微信输入法个人词库 | 校验、查重、预览并在隔离库导入自然拼音个人学习词典；支持正式只读备份，正式提交与整库回滚因同步风险暂停；当前适配 macOS Apple Silicon 微信输入法 3.0.0（670）。 |

## 操作手机挑选采购商品

使用 `$phone-shopping` 启动。适用于通用品类，需求和个人适配信息仅保存在当前私有任务记录中，不预设某个用户或商品类型。

- 手机控制能力已可用时复用；缺失时按实际主机与设备自动选型、安装和验收。操作能力不随本仓库捆绑，具体来源与流程见 [自动准备能力](skills/phone-shopping/references/bootstrap.md)。解锁、登录、设备信任和系统授权仍需用户本人完成。
- 淘宝/京东按任务范围比较同款具体 SKU 的显示到手价、补贴价和券后价；可用手机均未安装山姆时跳过山姆，不自动安装该 App。
- 选购前可通过搜索引擎、小红书、抖音、微博拓展候选池；已安装小红书优先使用 App。广告/商单可作线索，规格和型号仍需核对。
- 优先官方旗舰店或平台旗舰店，综合价格、补贴、配置和店铺证据；设备分工动态调整，不固定绑定电商平台。
- 付款与下单由用户人工操作。复杂任务可用 [选购决策文档模板](skills/phone-shopping/assets/selection-task-template.md)，记录推荐、待决策项、价格依据、来源和购物车状态。

## 微信输入法个人词库

使用 `$wetype-lexicon`，提供 UTF-8 词表及目标（默认隔离；1.1 暂停正式导入与整库回滚，保留正式只读预览/备份/验证）。随附原生工具针对微信输入法 3.0.0（670）的精确安装产物，每批最多500输入行。词库、备份、密钥和运行日志只放在私有任务工作区，不放入仓库。

- [Skill 入口](skills/wetype-lexicon/SKILL.md) · [使用与恢复](skills/wetype-lexicon/references/usage.md) · [验证边界](skills/wetype-lexicon/references/validation.md)
- [2026-10-17 原理报告（HTML，下载后本地打开）](archives/wetype-lexicon/2026-10-17/report.html) · [脱敏证据索引](archives/wetype-lexicon/2026-10-17/evidence-index.json) · [历史验收](archives/wetype-lexicon/2026-10-17/acceptance.json)
- 归档明确区分 REA 静态证据、原生运行、新进程召回与正式单词实际上屏。未宣称对任意版本、正式大批词表或无限规模通过验证。

## Structure

- `skills/<skill-name>/`
  - `SKILL.md`
  - `agents/openai.yaml`
  - `references/`
  - `scripts/` and `assets/` when needed

## Usage

- Copy or symlink a skill folder into your `$CODEX_HOME/skills` directory; when unset, Codex uses `~/.codex/skills`.
- For example, install `skills/phone-shopping/` and invoke `$phone-shopping` with the current purchase requirements.
- For other hosts, use that host's skill and MCP installation mechanism.
- Keep this repo as the single source of truth; keep device configuration, credentials, screenshots, shopping records and private logs outside it.

- [2026-10-19 同步兼容性核查（HTML）](archives/wetype-lexicon/2026-10-19/report.html) · [同步限制与保护](skills/wetype-lexicon/references/synchronization.md)
