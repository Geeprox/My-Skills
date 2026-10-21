# 个人学习词库批量导入

把词表分批加入微信输入法个人学习词库，之后按自然拼音参与候选召回。支持正式词库与隔离词库；重复词对跳过，队列繁忙时保留进度，稍后续导。

适配 Apple Silicon macOS 微信输入法3.0.0（670）的精确产物，需要 Python3.9+ 与 Xcode Command Line Tools。本机个人词库须已正常初始化、官方输入服务可用且同步队列/组信息可读取；跨设备需同账号并开启同步。私有工作区须与正式词库位于同一文件系统，以支持原子目录交换。以下将 `SKILL_DIR` 设为本 Skill 的实际目录；所有运行数据保存在私有工作区，末级目录以 `wetype-lab` 开头。正式目标显式使用 `--target formal`，默认 `lab`。

## 1. 准备词表

UTF-8 CSV、TSV、JSON，≤2 MiB，最多 100000 输入行。每词 1–16 个汉字，拼音不带声调，一个汉字对应一个音节。音节用逗号、空格或撇号分开，`ü` / `v` 均可；程序规范化为小写与逗号。多音字的实际读音需自行核对。

CSV（恰好两个表头 `word,pinyin`；含逗号的字段加引号）：

```csv
word,pinyin
知识图谱,"zhi,shi,tu,pu"
麦克风,"mai,ke,feng"
```

JSON（数组内每条恰好两个字符串字段）：

```json
[{"word":"知识图谱","pinyin":"zhi shi tu pu"},{"word":"麦克风","pinyin":"mai ke feng"}]
```

同一拼音/词对在文件内只处理一次；正式词库中已存在的词对直接跳过，不增加学习次数。相同文字、不同读音按不同词对处理。

## 2. 校验、准备与预览

```sh
"$SKILL_DIR/scripts/wetype-sync" validate ./words.csv
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal init
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal prepare ./words.csv
```

保存返回的 `importjob-…` ID。`prepare` 固化词表内容与 SHA，之后编辑原文件不改变该任务；修改词表应建立新任务。

```sh
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal preview --job importjob-ID
```

预览给出新增、已有、文件内重复和队列可用量；执行时会重新检查当前词库。预览也会短暂协调官方输入服务，以取得一致副本；不会提交词条变化。

## 3. 导入与续导

```sh
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal run --job importjob-ID
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal status --job importjob-ID
```

每段最多 500 个去重条目，按当前队列余量可缩小。正式操作段使用 launchd 互锁与独立 guardian；只提交经过原生 Add、全量记录与逻辑 KV 审核的副本。每段期间会临时切换ABC并暂停官方输入法，结束或失败后恢复，供其正常使用与同步；单段保护最长15分钟。

队列达到保守窗口时返回 `waiting_sync`，已经提交的进度保留，未处理条目仍在任务内。待官方消费者自然推进后执行：

```sh
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal resume --job importjob-ID --max-wait-seconds 300
```

等待参数可为 0–900 秒，默认 0；到时仍无余量会再次返回等待，继续沿用原 ID 即可。程序不会在退出后后台自动续导。

状态中的 `cursor` 是已经处理的去重条目数；`added` 是实际新增数；`skipped_existing` 是已有跳过数；`completed` 表示全部去重条目在本地处理完毕。同步消费者水位和这些计数均不是云端 ACK，跨设备到达需另行观察。

## 4. 异常恢复

协调进程异常退出或单段超时，独立 guardian 会尝试恢复输入服务。若出现恢复错误或发生机器重启，先执行：

```sh
"$SKILL_DIR/scripts/wetype-tx" --workspace ./wetype-lab-personal --target formal recover-service
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal status --job importjob-ID
"$SKILL_DIR/scripts/wetype-sync" --workspace ./wetype-lab-personal --target formal resume --job importjob-ID
```

如果返回 `recovery_classified`，先核对分类结果，再显式执行一次 `resume`；恢复调用只分类，不立即重发。如果提示状态不明确，保留 workspace 与副本供检查，不手工替换正式目录、不删除队列或重置序号。

正式整库快照回滚与跨端纯撤销尚未交付；备份保全不等于可安全回退云状态。官方“删除该词”包含屏蔽行为，也不是精确撤销 Add。

## 5. 已有证据与本轮验收

正式3词已在 iPhone 和另一台 Mac 从0/3变为3/3；本轮新版完整正式流程对这3个已有词执行全跳过、零新增、零目录交换验收。隔离分批与异常恢复的结果见 [验证记录](validation.md)。文件上限是工具输入契约，不是引擎词库容量结论。

## 6. 备份与隔离恢复

每个实际新增批次在交换前保存带清单与签名的完整备份，事务日志中保留 `backup_id`。`status --job` 返回最后一个事务ID，完整任务及事务记录在 workspace 的 `batch-jobs/` 与 `sync-transactions/` 中。不要将这些文件提交到 GitHub。

隔离库可使用旧的 `scripts/wetype` 的 `preview-rollback ID`、`rollback --plan ID` 流程验证快照恢复，详见其 `--help`。正式库支持断点恢复和提交状态分类，保留已提交的新序号；不把旧快照交换回正式库。

低层同步诊断使用 `scripts/wetype-tx ... queue` / `recover TRANSACTION_ID`。正式补偿写入被拒绝。历史 `scripts/wetype` 用于隔离快照恢复；正式词表导入统一走 `scripts/wetype-sync`。
