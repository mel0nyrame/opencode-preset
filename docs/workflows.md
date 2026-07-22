# 工作流示例

> [返回 README](../README.md) · [安装指南](./installation.md) · [FAQ](./faq.md)

以下只是 Orchestrator 可能采用的**示例路由**，实际任务会被裁剪，不会每个 Agent 都参与。

---

## 跨文件 Bug 修复

1. 用户描述复现步骤与错误表现。
2. Orchestrator 派 Explorer 定位相关文件、符号和调用链。
3. 必要时派 Librarian 查上游 issue 或文档。
4. Fixer 实现修复；Fast-Generic 运行最小测试或 lint 验证。
5. Orchestrator 汇总结果，确认修复范围。

## UI/UX 改造

1. 用户给出改造目标和参考。
2. Designer 负责视觉层级、响应式布局与交互细节。
3. 需要代码改动时，Designer 给出方案后由 Fixer 实施。
4. Fast-Generic 或 Fixer 运行构建/预览验证。
5. Orchestrator 交付统一结果。

## 外部库/API 调研

1. 用户询问第三方库用法或 API 行为。
2. Orchestrator 派 Librarian 查官方文档、GitHub 和最新 release note。
3. 如需接入代码，Explorer 检索本地引用点，Fixer 实施最小集成。
4. Oracle 仅在涉及高风险架构选型时升级。
5. 结果经 Orchestrator 整理后返回。

## 发布前检查

1. 用户准备发布新版本。
2. Orchestrator 按范围选择验证：lint、typecheck、测试、构建、发布候选冒烟。
3. Fast-Generic 执行机械命令；Fixer 处理发现的问题。
4. 验证通过后由 Orchestrator 汇总发布状态。
5. 若涉及共享状态或 Git 发布，按 AGENTS.md 要求人工确认。

---

> 这些示例仅供参考，不保证覆盖所有项目。

[返回 README](../README.md)
