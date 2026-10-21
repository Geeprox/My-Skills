---
name: wetype-lexicon
description: 在 macOS 微信输入法中校验、预览并分批导入个人学习词库，支持正式词库与隔离词库、查重跳过、队列背压和断点续导。用于自然拼音召回，不用于常用语短码展开。
metadata:
  version: "1.2.0"
---

# 微信输入法个人学习词库导入

使用 `scripts/wetype-sync` 接收用户提供的词表，支持写入日常使用的正式个人词库。先读 [使用说明](references/usage.md)；同步与恢复细节见 [同步流程](references/synchronization.md)。运行不依赖 REA 或 MCP。

## 范围

用户提供有效词表后，完成校验、查重预览、正式个人词库 Add-only 分批导入和进度交付。默认 `--target lab`；用户明确要求导入正在使用的个人词库时使用 `--target formal`，沿用该授权完成任务，不重复询问已经授权的步骤。

支持 UTF-8 CSV / TSV / JSON，文件 ≤2 MiB，1–100000 输入行；每条词为 1–16 个汉字，提供不带声调且逐字同长的合法拼音音节。格式校验不判断多音字读音是否符合用户意图。“任意有效词表”指此输入契约，不代表输入法容量无限或每条均能自然召回。

## 操作顺序

1. 仅支持 Apple Silicon macOS 微信输入法 **3.0.0（670）的精确产物**。需要 Python 3.9+ 与 Xcode Command Line Tools。工具核对 App、模型、依赖及源码身份；版本变化时停止，不改哈希、地址或沙箱来绕过检查。将 `SKILL_DIR` 解析为本 Skill 实际安装目录，私有工作区末级名称以 `wetype-lab` 开头，正式与隔离分开，运行数据不要放入 Skill 或 Git 仓库。
2. `scripts/wetype-sync validate 文件` 校验；初始化专用 workspace；`prepare 文件` 固化规范化内容和原始文件 SHA，保存 importjob ID。
3. `preview --job ID` 显示新增、已有、文件内重复、队列余量。已有相同拼音/词对直接跳过，不调用 Add 提升频率。不要把预览输出中的私人词表复制到公开报告。
4. `run --job ID` 执行。正式每段使用 launchd 服务互锁、独立 guardian 和受签名日志约束的事务；每段最多 500 个去重条目，实时窗口最多 900 个尚未越过本地水位的动作。提交前重新查重/探测，不沿用过期预览。
5. `waiting_sync` 是可续导状态：保留原任务，官方输入法恢复运行后等待本地同步消费者自然推进，再 `resume --job ID`。可用 `--max-wait-seconds 0..900` 有界等待；不伪造 ACK、不清 action、不把用户要求的词表丢弃或改为仅隔离结果。
6. `status --job ID` 交付已处理游标、新增数、已有跳过数、待处理数和状态。`completed` 表示本地任务处理完，不代表所有设备收到。

## 恢复

guardian 在协调进程退出或段超时后先限制该协调进程继续提交，再尝试恢复服务启动许可和原输入状态。若工具报告恢复失败或机器重启，先运行 `scripts/wetype-sync ... recover-service`，再查看任务。`resume` 遇到未完成事务先分类已保存状态；返回 `recovery_classified` 后需显式再次续导，不在同次恢复中重新发送。无法确定已提交状态时保留副本，停止覆盖。

正式整库快照回滚、跨设备纯撤销不属于此版本交付。备份用于保全与诊断，不能将恢复旧 v5 描述为同步安全的 undo。官方“删除该词”也会加入屏蔽词典，不等同于只撤销导入。

## 证据表达

- 区分实现、纯逻辑测试、真实隔离 native 测试、正式本机候选验证与跨设备观察。
- 历史固定三词已观察到 iPhone / Mac 到达，仅覆盖该次实验，不推广为整表云端验收。
- 本地消费水位不是严格云 ACK；窗口和队列连续性是本地准入条件。
- REA 用于静态函数、类型、引用定位；原 objdump、自编原生隔离 harness 分别补充机器码与运行验证。3.0 全量 Ghidra 分析未完成；局部 LevelDB 锁函数的反编译与机器码、运行实验交叉核对，不能表述为全 App 反编译；这些工具均不能证明服务端实现。
- 本轮与历史验收分别记录在 [验证记录](references/validation.md)，公开报告在仓库 `archives/wetype-lexicon/2026-10-22/`。改动后运行 `batch_tests.py`、`service_lease_tests.py`、`audit_tests.py`、`sync_policy_tests.py`、`sync_flow_tests.py`、`sync_recovery_tests.py`。故障注入只在隔离库进行。
