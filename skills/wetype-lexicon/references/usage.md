# 使用与恢复

`SKILL_DIR` 为实际安装目录；命令从任务的私有工作空间执行。下文工具源码文件均位于 `scripts/`。

微信输入法个人学习词库工具 · 同步保护版 1.1

用途
将 UTF-8 词表写入个人学习词典（UserDictV2），沿用微信输入法的原生 Add、索引和持久化流程。支持隔离词库的完整导入/回滚；本机正式词库当前仅开放校验、预览、备份和验证。正式 import、preview-rollback、rollback 因同步一致性风险暂停，不能通过授权或旧计划绕过。详见 synchronization.md。

兼容条件
Apple Silicon macOS；本次验证环境为 macOS 27.0.1、微信输入法 3.0.0 (670)。必须精确匹配固定 SHA256 的主程序、资源和依赖；更新应用后会拒绝继续。需要 Python 3.9+、Xcode Command Line Tools（xcrun clang++/lipo/codesign）。无需 pip 或联网依赖。不使用 sudo，不修改或签名已安装的 WeType.app；只对工作区中新生成的代码副本进行本地签名。

词表
支持 .tsv / .csv / .json；CSV/TSV 两列必须准确为 word、pinyin；JSON 为对象数组。
示例：
word\tpinyin
青瓷脉阵\tqing,ci,mai,zhen

请使用文件中的实际制表符；本 Skill 的 assets/example-words.tsv可直接参考。拼音用逗号、空格或撇号分隔，不带声调；ü 规范化为 v。词表按 NFKC 规范化，支持1–16个汉字、相同数量的合法拼音音节。格式检查无法判断多音字读音是否正确，需自行核对。每次最多500条输入行（包含文件内重复行），最多2MiB。没有自动分块写入，以保持整个计划的原子性。较长词、连续拼音分词、同音拥挤都可能影响召回；任一请求词召回失败，整批不提交。

工作目录
--workspace 必须是独立且受管理的本地目录，末级目录名以 wetype-lab 开头，即使正式模式也一样：这里始终是副本/备份/缓存工作区，不是正式词库。不能放进 Library、Applications 或 WeType.app，不能使用符号链接/硬链接/特殊文件或组/全局可写文件。所有工作区数据按当前用户私有权限创建。不要将含个人词库快照的工作区打包分享。

所有命令输出 JSON。<计划ID> 和 <备份ID> 使用上一步返回的 id；参数请替换为真实路径。

先跑隔离流程
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-demo init
"$SKILL_DIR/scripts/wetype" validate "$SKILL_DIR/assets/example-words.tsv"
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-demo preview "$SKILL_DIR/assets/example-words.tsv"
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-demo import --plan <计划ID>
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-demo verify "$SKILL_DIR/assets/example-words.tsv"

正式只读流程（当前不能提交）
用另一个工作区保存正式备份；同一工作区不能切换 target。
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-formal --target formal init
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-formal --target formal preview 我的词表.tsv
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-formal --target formal verify 我的词表.tsv

init 只准备本地工具和工作目录，不写正式词库。preview / backup / verify 会短暂切到 ABC、正常退出微信输入法以取得一致快照，再立即恢复原运行状态和输入源；后续查询都在副本进行。正式 import / rollback 当前在访问词库前拒绝；只读命令请在不输入文字时执行。500词按逐词召回验证需要约数分钟，实际时间取决于原词库、候选数和机器负载。

预览与查重
预览展示规范化词表、文件内重复、词库中已存在的 word+pinyin、拟新增及跳过数量，生成签名执行计划。导入前重新取得正式快照；主词记录或词频等元数据发生变化时会拒绝旧计划，需再次 preview。纯操作日志或曝光统计变化会被新快照保留。对已存在的精确 word+pinyin 不调用 Add，不加频。相同拼音的不同词允许新增；重复导入全部跳过时，工具不交换词库。

备份
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-formal --target formal backup
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-formal --target formal backups
导入/回滚前自动保存完整 v5 快照、文件 SHA256 清单、ABI/工作区标识和签名元数据。手工备份亦支持。备份及诊断仅保存在指定工作目录；不上传。user_hot_word 等旁路目录不纳入也不修改。

回滚（仅隔离）
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-demo preview-rollback <备份ID>
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-demo rollback --plan <回滚计划ID>
隔离库执行完整 v5 恢复，先检查主记录冲突并备份当前版本。正式库禁止完整快照回滚：快照内同时包含学习操作序号与同步本地水位，恢复会复用旧序号，无法一起恢复服务器状态。主词记录未变也不能证明安全。

中断恢复
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-formal --target formal status
"$SKILL_DIR/scripts/wetype" --workspace /绝对路径/wetype-lab-formal --target formal recover <事务ID>
事务在停输入法前保存原输入源和运行状态，在原子交换前保存前后快照/记录摘要。隔离普通异常仍按既有逻辑验证后换回旧数据。正式交换后的异常保留当前数据和所有备份、副本，尽力恢复应用状态并标记 recovery-required，绝不自动换回历史快照。硬中断由 recover 根据已审核前/后主记录摘要分类并恢复输入法状态；这种分类不证明辅助同步状态或服务器一致性。recover 不盲目覆盖当前词库；无法判定时保留所有数据并拒绝。存在待恢复事务时禁止新的 import / rollback。请勿手动删除锁文件、日志或中间目录。

安全与证据边界
原生 worker 在 dlopen 前启用 macOS 沙箱，直接读取/写入正式词库、作业外写入和网络访问都被拒绝。协调器先正常退出官方进程，排除其他打开者，取得与 LevelDB 兼容的 fcntl 排他锁；哈希和复制 LOCK 使用持有的 fd，避免打开/关闭相同 inode 导致锁释放。写入只发生于 Add-only 副本。另一个副本以新进程逐字输入拼音并查询候选，防止曝光统计污染待提交数据。全量主记录 HMAC 摘要及逐项元数据核对，辅以完整逻辑 KV 差异审核；只允许目标拼音桶、精确连续的原生操作记录和日志头递增。最后 fsync 后使用同文件系统 RENAME_SWAP 原子交换，不回退到两步移动。

召回只枚举前2048候选；目标未找到就拒绝提交，即使更后位置可能存在。找到时会保留 truncated 状态。此枚举边界、每批500行和工具运行时限均不是微信输入法词库容量上限。工具不模拟官方 UI 的所有上下文、云同步及跨设备行为；正式 GUI 已验证的范围是此前一个测试词逐键输入+Space实际上屏，新整合的批量流程在隔离库验收。

文件
lexicon_cli.py：目标、预览、备份、交换、回滚、恢复协调。
engine_support.py：词表校验、路径/版本约束、缓存编译与快照工具。
native_worker.cpp / audit.hpp：3.0.0原生Add、全记录审计、候选回放。
kv_hash.cpp / audit_helpers.py：只读逻辑键摘要与严格批量差异审核。
app_control.mm / input_source.cpp：正常终止官方进程与恢复输入源。
audit_tests.py、selftest.py：审核规则与可重复隔离验收。历史验收见仓库归档 archives/wetype-lexicon/2026-10-17/acceptance.json。
