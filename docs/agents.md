# Agent 配置说明

> [返回 README](../README.md) · [安装指南](./installation.md) · [Skills 说明](./skills.md)

Agent、模型、Skills 和 MCP 的权威配置位于 `.opencode/oh-my-opencode-slim.json`。本文只解释其设计意图，配置变化时应同步更新。

---

## 目录

- [Agent 配置说明](#agent-配置说明)
  - [目录](#目录)
  - [Orchestrator](#orchestrator)
  - [Designer](#designer)
  - [Explorer](#explorer)
  - [Fixer](#fixer)
  - [Librarian](#librarian)
  - [Observer](#observer)
  - [Oracle](#oracle)
  - [Council](#council)
  - [Fast-Generic](#fast-generic)

---

## Orchestrator

- 模型：`kimi-for-coding/k3`
- 定位：规划、调度、依赖管理、结果整合和验收
- MCP：`codegraph`
- 主要 Skills：
  - `*`
  - `!simplify`

> 让 Orchestrator 知道全部skill，可以在委派任务的时候明确指出提出调用提高效率

## Designer

- 模型：`opencode-go/kimi-k2.7-code`
- 定位：UI/UX、响应式布局、视觉层级、交互和演示文稿设计
- MCP：`codegraph`、`officecli`
- 主要 Skills：Vue/Nuxt、设计与产品、图像生成、Office 演示

## Explorer

- 模型：`opencode-go/deepseek-v4-flash`
- 定位：快速代码库检索、符号定位、依赖和影响范围侦察
- MCP：`codegraph`

## Fixer

- 模型：`opencode-go/kimi-k2.7-code`
- 定位：边界明确的代码实现、机械修复和 Office 结构化编辑
- MCP：`codegraph`、`websearch`、`officecli`
- 主要 Skills：pnpm、Vite、tsdown、Vitest、worktree、发布验证和 Office 文档

## Librarian

- 模型：`opencode-go/deepseek-v4-flash`
- 定位：外部文档、API、GitHub 项目和时效性事实调研
- MCP：`websearch`、`context7`、`gh_grep`

这些 MCP 由 oh-my-opencode-slim 及其运行环境提供，不在根目录 `opencode.json` 中定义。

## Observer

- 模型：`zhipuai/glm-4.6v`
- 定位：分析图片、截图、PDF 和图表，向主会话返回结构化观察

## Oracle

- 模型：`opencode-go/qwen3.7-max`
- 定位：高风险架构决策、复杂调试、性能权衡和代码审查
- MCP：`codegraph`、`websearch`
- 主要 Skills：`simplify`、`workers-best-practices`、`adhd`、`karpathy-guidelines`

> [!NOTE]
> Oracle 是升级通道，不用于每次修改后的常规复核。

## Council

- 综合模型：`opencode-go/qwen3.7-max`
- oh-my-opencode-slim 整体 preset：`me`
- Council 默认成员 preset：`default`
- 执行方式：并行

成员：

| 席位 | 模型 | 关注点 |
|---|---|---|
| alpha | `opencode-go/glm-5.2` | 架构、正确性、系统集成 |
| beta | `opencode-go/kimi-k2.7-code` | 实现质量、细节、边界情况 |
| gamma | `opencode-go/kimi-k2.6` | 性能、资源、现实权衡 |

## Fast-Generic

- 模型：`opencode-go/deepseek-v4-flash`
- 定位：Git 状态和差异侦察、普通提交与推送、Lint、Typecheck、测试和构建

> 它不负责代码编辑、设计、架构、调研或破坏性 Git 历史操作。

---

[返回 README](../README.md)
