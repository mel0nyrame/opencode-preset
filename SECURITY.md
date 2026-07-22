# 安全说明

> [返回 README](./README.md) · [贡献指南](./CONTRIBUTING.md) · [第三方声明](./THIRD_PARTY_NOTICES.md)

本文说明使用本预设时的信任边界和基本安全建议。

## 信任边界

- **Shell 与本地文件**：本预设会调用 Bash 命令和文件读写工具；DCG 插件可拦截部分高风险命令，但它不是沙箱，不能替代人工审查。
- **MCP 与网络**：CodeGraph、OfficeCLI、websearch、context7、gh_grep 等 MCP 会访问本地或网络资源，其信任级别独立于 OpenCode 本身。
- **Git 与共享状态**：Git 提交、推送、破坏性操作以及写入共享配置前，需要按 AGENTS.md 要求人工确认。
- **会话数据**：`context-usage` 和 `reflect` 等插件/技能会读取会话历史与本地数据；避免在示例或日志中留下 API Key、Secret、个人绝对路径或私仓 URL。

## 建议

- 不要把 API Key 或 Secret 写入 `opencode.json`、AGENTS.md 或 Skill 文件；使用环境变量或 OpenCode 提供的凭据管理方式。
- 审查 `.opencode/skills/` 和 `.opencode/plugins/` 中第三方来源的内容，确认其许可证和可信度。
- 遇到未知来源的 Skill/Command 时，先在受控环境中手动触发一次。
- 在 Git 仓库中共享配置前，检查是否包含个人路径或凭据。

## 报告安全问题

请通过仓库维护者公开的沟通渠道（如 Issue）报告安全漏洞。不要公开泄露未修复的密钥或敏感信息。

