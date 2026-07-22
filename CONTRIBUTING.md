# 贡献指南

> [返回 README](./README.md) · [第三方声明](./THIRD_PARTY_NOTICES.md) · [更新日志](./CHANGELOG.md)

感谢参与 OpenCode Preset 的维护。本文约定 Bug 报告、新 Command、新 Skill 和 Pull Request 的基本要求。路由与审批规则以 [`AGENTS.md`](./AGENTS.md) 为准。

---

## 提交 Bug

- 先搜索已有 Issue，避免重复。
- 使用 `.github/ISSUE_TEMPLATE/bug_report.yml` 模板，提供：复现步骤、预期行为、实际行为、环境（OpenCode 版本、Preset commit、操作系统、相关 MCP/Skill）。
- 如日志、配置或截图包含敏感信息，请先脱敏：移除 API Key、Token、个人绝对路径、私仓 URL 等。

## 新增 Command

- Command 是 `.opencode/command/<name>.md` 形式的 Markdown 文件，前置元数据至少包含 `description`。
- 命名使用小写、连字符分隔；文件名与元数据保持一致。
- 在 PR 中说明触发场景、参数、是否需要额外 MCP/Plugin，以及是否需要在 `docs/` 中补充说明。

## 新增 Skill

- Skill 放在 `.opencode/skills/<skill-name>/` 目录，入口为 `SKILL.md`，可附带 `LICENSE`、示例和本地资源。
- 命名使用小写、连字符分隔；Office 相关 Skill 建议以 `officecli-` 前缀归类。
- 在 `docs/skills.md` 中补充条目，说明用途和触发条件。
- 若 Skill 派生自第三方项目，必须保留原始许可证与署名，并同步更新 [`THIRD_PARTY_NOTICES.md`](./THIRD_PARTY_NOTICES.md)。

## 第三方来源与许可证

- 随仓库分发的 Skills、模板、脚本若来自外部项目，须确认其许可证允许再分发，并保留版权声明。
- 不要假设根目录 MIT 许可证覆盖所有第三方内容。来源与许可证要求详见 [`THIRD_PARTY_NOTICES.md`](./THIRD_PARTY_NOTICES.md)。
- 贡献者应自行完成来源核对；仓库维护者保留要求补充许可证信息的权利。

## 安全与隐私

- 提交内容中不得包含 API Key、Secret Token、密码、个人绝对路径、私仓地址或其他敏感信息。
- 如果示例中需要占位符，请使用明显无意义的占位符（如 `YOUR_API_KEY`）。
- 配置示例应使用通用路径；避免提交 `.env`、本地缓存或个人凭据文件。

## 修改 Agent 路由或配置时的文档同步

- 修改 `AGENTS.md` 中的 Agent 分工、委派条件、审批边界、编码习惯或沟通风格时，应同步更新本文件及相关说明，确保规则一致。
- 修改 `.opencode/oh-my-opencode-slim.json` 中的模型、Skills 或 MCP 时，应同步更新 `docs/agents.md` 和 `docs/skills.md`。
- 新增或调整 Skill/Command 的命名、目录结构时，应同步更新本文件与 `docs/skills.md`。

## 最小验证要求

- 代码或配置变更应运行相关验证：测试、类型检查、lint、构建，或至少一次与变更范围匹配的冒烟测试。
- Skill 变更建议在受控环境中手动触发一次，确认入口可被正确加载且说明可被理解。
- 文档变更建议本地预览渲染，避免 Markdown 语法错误和链接失效。
- 本仓库目前未配置持续集成，请在本地完成验证并在 PR 描述中说明验证方式与结果；不要声称存在尚未配置的自动化检查。

## 命名与目录约定

- 目录与文件名使用小写、连字符分隔（kebab-case）。
- Skill 目录名与 `SKILL.md` 中的 `name` 保持一致，入口元数据包含 `description` 和可选的 `license`。
- Command 文件：`.opencode/command/<name>.md`，元数据包含 `description`。
- README、CHANGELOG、THIRD_PARTY_NOTICES 保留在仓库根目录；扩展说明放在 `docs/`。
- 二进制模板、图片等资源放在对应 Skill 目录下，不直接散落在根目录。

## Pull Request 建议

- 一个 PR 聚焦一个变更，避免附带无关调整。
- 标题简洁，正文说明改动动机、关键文件和验证方式。
- 若涉及 Skill/Command 新增或第三方内容，请在 PR 中明确说明来源与许可证。
- 不要提交、推送或修改他人的未合并分支，除非对方明确请求。
- 合并前保持提交历史整洁；如遇冲突请自行解决。
