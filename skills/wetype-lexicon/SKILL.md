---
name: wetype-lexicon
description: 在 macOS 微信输入法中批量导入个人学习词典，校验词表、查重和预览，支持备份、原子写回、冲突保护回滚与中断恢复。适用于按自然拼音召回的个人词库，不用于常用语短码展开。
metadata:
  version: "1.0.0"
---

# 微信输入法个人词库

使用随附工具处理 `word + pinyin` 词表，由微信输入法自己的学习接口生成记录和索引。运行命令前读取 [使用与恢复](references/usage.md)。验证已有行为或决定是否扩大规模时，再读 [兼容与验证边界](references/validation.md)。无需安装 REA 或其他 MCP；研究归档不属于执行依赖。

## 确定目标与兼容性

- 当前仅支持 **Apple Silicon macOS、微信输入法 3.0.0（670）的精确产物**。由工具核对主程序、资源和依赖摘要；版本号相同也可能不兼容。不修改哈希、地址或沙箱绕过拒绝；适配其他构建需要单独追踪并重新验证。
- 默认目标是 `lab`。仅在用户已明确授权写入当前词表的正式个人词库时指定 `--target formal`；一次单词测试不授权后续整批导入。整理 Skill、预览或归档报告不授权正式导入。已有清楚授权时，完成具体预览后继续执行，不重复索要确认。
- 将 `SKILL_DIR` 解析为本 Skill 的实际安装目录。将工作目录放在当前任务的私有工作空间内，末级名以 `wetype-lab` 开头，不能位于 Library、Applications 或 Skill/仓库中。正式与隔离模式使用不同工作目录。
- 需要 Python 3.9+ 和 Xcode Command Line Tools。`init` 编译本地 helper，仅对新建的隔离代码副本进行 ad-hoc 签名；不修改或签名已安装 App，不使用 sudo、不联网安装依赖。缺少依赖时报告具体缺项，不擅自安装开发工具。

## 校验、预览、执行

1. 取得用户的 UTF-8 TSV/CSV/JSON 文件；缺少文件或拼音时先补齐。模板见 [示例词表](assets/example-words.tsv)。不凭字形猜多音字读音。格式规范化不能保证读音正确。
2. 在私有目录运行工具，始终使用已解析的绝对脚本路径；不要在 Skill/仓库目录内创建运行数据。首次使用该工作目录运行 `init`，然后 `validate`、`preview`。报告输入行数、文件内重复、已存在词对、拟新增数量和目标模式。
3. 导入使用刚返回的计划 ID。已有词对由原生查询判定，不调用 Add、不加频；相同拼音的不同词允许新增。预览过期或任一词召回失败时整批不提交，按照错误重新预览或处理词表，不自动重发旧计划。
4. 保留结果中的事务 ID、备份 ID、逐词新进程验证和恢复状态。工具自动备份，且只有全部核对通过才原子写回。报告实际新增/跳过数量；区分隔离验证、正式写回和官方 UI 验证。

```sh
# 示例中的变量需替换为已解析的实际绝对路径；先从当前会话确定 TARGET。
# TARGET=lab 为默认隔离；已获正式导入授权时才用 TARGET=formal。
"$SKILL_DIR/scripts/wetype" --workspace "$PRIVATE_WORKSPACE/wetype-lab-$TARGET" --target "$TARGET" init
"$SKILL_DIR/scripts/wetype" validate "$WORD_FILE"
"$SKILL_DIR/scripts/wetype" --workspace "$PRIVATE_WORKSPACE/wetype-lab-$TARGET" --target "$TARGET" preview "$WORD_FILE"
"$SKILL_DIR/scripts/wetype" --workspace "$PRIVATE_WORKSPACE/wetype-lab-$TARGET" --target "$TARGET" import --plan "$PLAN_ID"
```

每批 **最多500条输入行（含重复）、2MiB**。不自动拆成多个提交；超限时先说明分批会改变整表的原子性并按用户范围处理。词须为1–16个汉字，拼音为同数量、不带声调的合法音节；长词、分词和同音拥挤可能导致召回拒绝。

## 备份、回滚、中断

- 正式模式的 `preview / backup / verify` 会正常退出输入法以取得一致快照，恢复原状态后在副本查询；`import / rollback` 会在校验期间持续停用输入法。执行前说明会暂时切到 ABC；长批次不要承诺瞬时完成。
- 回滚使用 `preview-rollback BACKUP_ID`，再以回滚计划 ID 执行 `rollback --plan PLAN_ID`。这是完整 v5 快照恢复。工具先备份当前版本，并拒绝覆盖导入后的新词或词频变化；不绕过冲突、不手改数据库。正常 UI 选词也可能改变词频并触发此保护。
- 异常或硬中断时先 `status`，对待恢复事务使用 `recover TX_ID`；检查实际结果后再决定下一步。若恢复状态不明或有新学习冲突，停止写入，保留所有副本、备份和日志；不要删 LOCK 或手工移动数据库。
- 不直接打开正在运行的正式 LevelDB，不修改 WAL/SST，不扩大 worker 对正式库的权限。Add-only 提交副本与候选验证副本必须分开，避免候选曝光统计进入待提交数据；这些约束由脚本实现，不另写简化导入逻辑。

## 验证与交付

通常使用工具结果中的新进程词对与候选验证。仅在用户范围允许正式 UI 测试时，在已知空白输入框逐键输入拼音、按空格并核对实际文字；不能粘贴中文冒充召回。读取独立候选窗不可用时可直接核对上屏结果，不反复绑定后台输入法 App。

重新打包或修改关键代码后，可运行 `scripts/audit_tests.py`；需要真实原生回归时运行 `scripts/selftest.py --workspace /私有路径/wetype-lab-selftest-唯一名称`（该目录必须不存在）。完整自测仅用虚构词和隔离库，耗时约数分钟；不把历史通过当作新机器、新版本已通过。

运行工作区含词表、完整词库快照、HMAC密钥和诊断，均保持私有，不能放进 Skill、仓库或公开报告。交付用户可读摘要、实际目标、备份/事务标识、验证证据和未完成项。原理与 REA 作用的脱敏历史报告在仓库 `archives/wetype-lexicon/2026-10-17/`，复制安装本 Skill 后运行不依赖该归档。
