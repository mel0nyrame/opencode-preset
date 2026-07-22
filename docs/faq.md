# 常见问题

> [返回 README](../README.md) · [安装指南](./installation.md) · [工作流示例](./workflows.md) 

---

## 1. 为什么 Orchestrator 不直接包办所有工作？

Orchestrator 的核心职责是规划、调度和验收。如果它同时执行检索、实现、设计或外部调研，会快速耗尽上下文并降低专业性。将具体工作委派给对应 Agent，可以并行推进、控制上下文并提高结果质量。详见 [AGENTS.md 路由原则](../README.md#agentsmd-路由原则)。

## 2. Agent 越多越好吗？

不是。Agent 数量多意味着调度、验证和上下文管理的成本也更高。本预设只在确实需要专业分工的场景才引入 specialist，日常机械命令由 Fast-Generic 处理，避免过度委派。

## 3. 没有 CodeGraph 或 OfficeCLI 还能使用吗？

可以。CodeGraph、OfficeCLI、DCG 和 tokenizer 都是可选依赖。未安装时，对应 MCP 或 Skills 不可用，但不会阻断不相关的工作流。具体见 [前置要求](../README.md#前置要求) 和 [安装指南](./installation.md)。

## 4. 如何替换模型或 Provider？

编辑 `.opencode/oh-my-opencode-slim.json` 中的模型分配，并确认目标 Provider 在你的 OpenCode 环境中可用。替换后需要重启 OpenCode。详细模型列表见 [Agent 分工](../README.md#agent-分工)。

## 5. 项目级与全局配置能否同时使用？

不建议同时使用。项目级配置放在目标项目根目录，全局配置放在 `~/.config/opencode/`；混用会导致规则、Skills 或 MCP 冲突。选择其中一种方式即可。详见 [安装指南](./installation.md)。

---

[返回 README](../README.md)
