# OpenCode Preset v0.1.0：面向复杂工程任务的多 Agent 编排配置预设

> 副标题：把检索、实现、调研、设计与审查拆给不同角色，让 Orchestrator 专注于调度与验收

---

## 开场

如果你正在用 OpenCode 处理跨文件、多阶段、需要外部调研或视觉设计的复杂软件工程任务，可能会遇到同一个会话里同时塞满规划、检索、实现、调研和审查的情况。OpenCode Preset 是一份**个人偏好的配置预设**，它尝试通过角色边界、并行委派和验证规则，把这类任务拆给 Explorer、Librarian、Fixer、Designer、Observer、Oracle 等专业 Agent，由 Orchestrator 统一规划、调度与交付。

【仓库事实】本预设当前版本为 **v0.1.0**，仓库明确声明仍处于早期迭代阶段，配置接口、Agent 模型分配和 Skills 清单可能继续调整。详见 [`CHANGELOG.md`](../opencode-preset/CHANGELOG.md) 与 [`README_zh.md`](../opencode-preset/README_zh.md)。

【定位表达】它的定位不是“开箱即用的通用发行版”，而是一套需要按环境调整模型、Provider 和可选 MCP 的编排起点。

---

## 核心问题

复杂任务中，单一 Agent 往往需要同时承担规划、检索、实现、外部调研、UI 设计和审查，带来几类风险：

- 上下文窗口快速膨胀，关键决策和中间产物难以保留；
- 不同子任务需要不同专业能力，通用模式容易稀释专业性；
- Agent 直接汇报“已完成”时，若缺少测试或构建验证，交付结果难以核对。

【定位表达】以上问题描述来自仓库设计假设，主要作为本预设的分工依据，并非经过定量实证的行业结论。

---

## 解决方案

本预设采用 **Orchestrator + Specialist Agent** 的协作方式：

- **Orchestrator** 负责规划、调度、依赖管理和验收；
- **Explorer / Librarian / Fixer / Designer / Observer / Oracle / Fast-Generic** 分别负责代码检索、外部调研、机械实现、视觉设计、多媒体分析、高风险决策与常规验证；其中 Fast-Generic 用于 lint、typecheck、测试、构建及常规 Git/机械命令验证，不执行代码编辑、设计、架构、调研或破坏性 Git 历史操作；
- 无依赖的任务尽量并行；
- 子 Agent 交付后，优先用测试、类型检查、构建或冒烟测试验证，不直接采信“已完成”的汇报；
- 共享状态写入、Git 操作和破坏性命令需人工确认；
- 通过委派、可选的 CodeGraph MCP 和 `/context` 命令，尝试控制主会话上下文膨胀。

【仓库事实】角色分工、默认模型和 MCP 配置已在 [`oh-my-opencode-slim.json`](../opencode-preset/.opencode/oh-my-opencode-slim.json) 中实现；路由规则与审批边界写在 [`AGENTS.md`](../opencode-preset/AGENTS.md)；编排流程与验证要求详见 [`docs/agents.md`](../opencode-preset/docs/agents.md) 与 [`docs/workflows.md`](../opencode-preset/docs/workflows.md)。

【定位表达】“上下文控制”和“验证优先”是设计目标，实际效果取决于任务类型、模型响应和可选组件是否安装。

---

## 主要能力

| 能力 | 说明 | 仓库来源 |
|---|---|---|
| 角色分工 | Orchestrator 规划/调度，专业任务交给对应 Agent | [`AGENTS.md`](../opencode-preset/AGENTS.md) |
| 并行执行 | 互不依赖的检索、研究、实现、视觉分析可并行推进 | [`docs/agents.md`](../opencode-preset/docs/agents.md) |
| 验证优先 | 按变更范围选择测试、类型检查、构建或冒烟验证 | [`docs/agents.md`](../opencode-preset/docs/agents.md) |
| 上下文辅助 | 委派摘要、CodeGraph、自定义 `/context` 命令 | [`README_zh.md`](../opencode-preset/README_zh.md)、[`.opencode/command/context.md`](../opencode-preset/.opencode/command/context.md) |
| 可选安全边界 | 安装 `dcg` 后可启用命令执行前检查 | [`.opencode/plugins/dcg-guard.js`](../opencode-preset/.opencode/plugins/dcg-guard.js) |
| 扩展 Skills | 前端工程、Office 文档、产品发现、图像生成、构建工具等 | [`docs/skills.md`](../opencode-preset/docs/skills.md) |

【仓库事实】可选组件如 CodeGraph、OfficeCLI、tokenizer 和 Destructive Command Guard 需额外安装，未安装时对应能力不可用，但不会阻断其他工作流。详见 [`README_zh.md`](../opencode-preset/README_zh.md) 的“可选”表格。

---

## 适合人群

- 已经在使用 OpenCode 作为 IDE 或 AI 编程助手的开发者；
- 经常处理跨文件、多阶段、需要外部调研或视觉设计的复杂工程任务；
- 愿意手动检查并替换默认模型、Provider 和 MCP 以匹配自身环境；
- 希望尝试通过 Orchestrator + Specialist Agent 分工来管理主会话上下文占用。

【定位表达】适合人群基于仓库对自身用途的描述，是否真正适合你，仍取决于你的任务规模和团队习惯。

---

## 不适合人群

- 期望“无需配置、开箱即用”的用户——仓库明确声明这是个人偏好预设，不是通用发行版；
- 无法使用默认模型或 Provider（`opencode-go`、`kimi-for-coding`、`zhipuai`）且不愿手动替换的用户；
- 只执行简单、孤立、单文件小改动——本预设会引入调度成本，可能显得过度设计；
- 需要在高度敏感或受严格审计环境中使用，且不愿自行审查第三方 Skills 与模板许可证的用户。

【仓库事实】不适合人群主要来自 [`README_zh.md`](../opencode-preset/README_zh.md) 与 [`AGENTS.md`](../opencode-preset/AGENTS.md) 的声明。

---

## 使用流程

以下只是典型示意，Orchestrator 会按实际任务只调用相关 Agent，不强制走完整流水线：

```
用户请求 → Orchestrator 规划
              ↓
    按需委派 Explorer / Librarian / Fixer / Designer / Observer / Oracle / Fast-Generic
              ↓
        各 Agent 执行并返回摘要
              ↓
        最小相关验证（测试 / 类型检查 / 构建 / 冒烟）
              ↓
        Orchestrator 统一结果 / 交付
```

具体场景示例：

- **跨文件 Bug 修复**：Explorer 定位文件与调用链，Librarian 查上游 issue，Fixer 修复，Fast-Generic 跑最小验证。
- **UI/UX 改造**：Designer 负责视觉层级与交互，需要代码改动时由 Fixer 实施，再跑构建验证。
- **外部库/API 调研**：Librarian 查官方文档与最新 release note，Explorer 找本地引用点，Fixer 做最小集成。
- **发布前检查**：Fast-Generic 跑 lint、typecheck、测试、构建；Fixer 处理发现的问题；涉及 Git 发布时人工确认。

【定位表达】流程图为仓库文档中的设计示意，并非确定性的自动化流水线。

---

## 快速开始

> 以下步骤严格遵循仓库 README 与安装指南，不使用 oh-my-opencode-slim 的独立安装命令替代。

### 前置条件

- 已安装 [OpenCode](https://opencode.ai/) 与受支持的 oh-my-opencode-slim 版本。
- 默认配置使用 `opencode-go`、`kimi-for-coding` 和 `zhipuai` 下的模型，使用前请确认它们在你的环境中可用，否则需要替换。

### 项目级安装

1. 克隆本仓库。
2. 将 `AGENTS.md`、`opencode.json`、`.opencode/` 复制到目标项目根目录。
3. 如果目标项目已有同名配置，请**手动合并**，不要直接覆盖。
4. 编辑 `.opencode/oh-my-opencode-slim.json`，把模型替换为你可用的 Provider/模型。
5. **重启 OpenCode**。

### 全局安装

1. 将仓库根目录与 `.opencode/` 的内容按以下映射合并到 `~/.config/opencode/`，**不要**把整个仓库复制成 `~/.config/opencode/.opencode/`：

   ```text
   AGENTS.md          → ~/.config/opencode/AGENTS.md
   opencode.json      → ~/.config/opencode/opencode.json
   .opencode/oh-my-opencode-slim.json → ~/.config/opencode/oh-my-opencode-slim.json
   .opencode/tui.json                 → ~/.config/opencode/tui.json
   .opencode/command/  → ~/.config/opencode/command/
   .opencode/plugins/  → ~/.config/opencode/plugins/
   .opencode/skills/   → ~/.config/opencode/skills/
   ```

2. 编辑模型配置，替换为可用模型。
3. **重启 OpenCode**。

> 项目级与全局配置**不建议混用**，选择其中一种即可。

### 安装可选 tokenizer（用于 `/context` 精确统计）

项目级安装后，在预设根目录运行：

```sh
./.opencode/plugins/install.sh
```

全局安装后，运行：

```sh
~/.config/opencode/plugins/install.sh
```

脚本需要 `npm`，依赖会安装到 `.opencode/plugins/vendor/node_modules/`（已被 `.gitignore` 忽略）。未安装时 `/context` 只能使用近似统计。

### 安装后检查

重启后建议：

1. 确认 oh-my-opencode-slim 能读取 `me` preset；
2. 确认主要 Agent 可见或可响应（可尝试输入 `ping all agents` 做人工冒烟，这不是确定性自动化测试）；
3. 确认已安装的 MCP 能正常启动；
4. 执行 `/context` 查看是否返回 Token 统计（若已安装 tokenizer）。

【仓库事实】完整安装细节与注意事项见 [`docs/installation.md`](../opencode-preset/docs/installation.md) 与 [`README_zh.md`](../opencode-preset/README_zh.md)。

---

## 当前限制

- 当前版本为 **v0.1.0**，配置接口、模型分配和 Skills 清单可能继续调整；
- 默认模型和 Provider 带有明显个人偏好，不保证对所有账户或地区可用；
- 部分功能依赖外部安装：CodeGraph、OfficeCLI、Destructive Command Guard、tokenizer；
- OpenCode 配置不热更新，修改后需重启；
- 仓库使用 `@latest` 引用部分插件依赖，可能引入未经本仓库验证的行为变化；
- 部分 Skills 和模板来自第三方项目，再分发前需确认其许可证与署名；
- 没有定量性能数据，无法声称“节省多少 Token”或“提速多少”。

【仓库事实】以上限制整理自 [`README_zh.md`](../opencode-preset/README_zh.md)、[`docs/installation.md`](../opencode-preset/docs/installation.md) 与 [`FACT_BASELINE.md`](./FACT_BASELINE.md)。

---

## 未来计划

【仓库事实】当前仓库未在文档中明确承诺具体路线图或发布计划。如果后续有调整，会体现在 [`CHANGELOG.md`](../opencode-preset/CHANGELOG.md) 与 [`README_zh.md`](../opencode-preset/README_zh.md) 中。

---

## 行动号召

如果你希望尝试一份可调整的多 Agent 编排配置，可以：

1. 克隆仓库并阅读 [`README_zh.md`](../opencode-preset/README_zh.md) 与 [`docs/installation.md`](../opencode-preset/docs/installation.md)；
2. 先在单个项目中试用，完成模型替换后再决定是否合并到全局配置；
3. 根据自己的任务范围，安装可选的 CodeGraph、OfficeCLI、tokenizer 或 DCG；
4. 遇到问题时查看 [`docs/faq.md`](../opencode-preset/docs/faq.md) 与 [`SECURITY.md`](../opencode-preset/SECURITY.md)。

【仓库事实】本仓库原创配置、脚本与文档采用 [MIT License](../opencode-preset/LICENSE)；第三方 Skills 与模板保留各自许可证，详见 [`THIRD_PARTY_NOTICES.md`](../opencode-preset/THIRD_PARTY_NOTICES.md)。

---

## 5 个发布帖短标题

1. OpenCode Preset v0.1.0：一份可调整的多 Agent 编排配置预设
2. 把复杂工程任务拆给专业 Agent：OpenCode Preset 的早期实践
3. 不想让一个会话扛下所有任务？试试 OpenCode Preset 的角色分工
4. OpenCode 进阶配置：Orchestrator + Specialist Agent 的调度起点
5. 从单 Agent 到多角色协作：OpenCode Preset v0.1.0 发布

---

*本稿基于 [`FACT_BASELINE.md`](./FACT_BASELINE.md) 统一事实口径撰写，未修改源仓库、FACT_BASELINE.md 或其他交付文件。*
