# Skills 说明

> [返回 README](../README.md) · [安装指南](./installation.md) · [Agent 配置](./agents.md)

以下为随仓库分发的 Skills。具体触发条件和操作规则以各目录中的 `SKILL.md` 为准。

---

## 目录

- [编排、验证与代码工作流](#编排验证与代码工作流)
- [前端与构建工具](#前端与构建工具)
- [设计、产品与图像](#设计产品与图像)
- [Office 文档](#office-文档)
- [配置维护](#配置维护)
- [精简建议](#精简建议)

---

## 编排、验证与代码工作流

| Skill | 用途 |
|---|---|
| `adhd` | 多视角发散、评分、聚类和收敛构思 |
| `clonedeps` | 将关键依赖源码克隆到本地忽略目录供只读分析 |
| `codemap` | 为陌生仓库生成分层代码地图 |
| `deepwork` | 大型、高风险、多阶段工程的阶段门控和评审协调 |
| `karpathy-guidelines` | 减少过度实现、错误假设和不可验证修改 |
| `reflect` | 从近期工作中提炼可复用工作流和配置 |
| `release-smoke-test` | 验证发布候选、打包产物和运行时兼容性 |
| `simplify` | 在行为不变前提下简化代码 |
| `verification-planning` | 为非平凡变更设计主张到证据的验证路径 |
| `worktrees` | 使用 Git worktree 隔离并行编码通道 |

## 前端与构建工具

| Skill | 用途 |
|---|---|
| `nuxt` | Nuxt SSR、自动导入、文件路由和混合渲染 |
| `pnpm` | workspace、catalog、patch、override 和依赖管理 |
| `tsdown` | 基于 Rolldown 的 TypeScript/JavaScript 库构建 |
| `vite` | Vite 配置、插件、SSR 和迁移 |
| `vitest` | 单元测试、Mock、覆盖率、过滤和 fixtures |
| `vue` | Vue 3.5+/Nuxt 4 生态、状态管理、渲染和无障碍 |
| `workers-best-practices` | Cloudflare Workers 生产实践审查 |

## 设计、产品与图像

| Skill | 用途 |
|---|---|
| `icon-set-generator` | 生成风格一致的项目专属 SVG 图标集 |
| `make-interfaces-feel-better` | 优化圆角、对齐、动效、反馈和界面细节 |
| `marketing-psychology` | 将行为科学和认知偏差应用于营销 |
| `product-discovery` | 规划访谈、综合洞察并组织产品发现证据 |

## Office 文档

| Skill | 用途 |
|---|---|
| `officecli` | OfficeCLI 通用操作和交付验证 |
| `officecli-docx` | Word 文档创建、读取和编辑 |
| `officecli-xlsx` | Excel 表格、公式、图表和数据导入 |
| `officecli-pptx` | PowerPoint 创建、读取、编辑和版式处理 |
| `officecli-academic-paper` | 学术论文、引用、公式和参考文献排版 |
| `officecli-data-dashboard` | 多 KPI、多图表的 Excel 仪表盘 |
| `officecli-financial-model` | 三表、DCF、LBO 和情景分析模型 |
| `officecli-pitch-deck` | 融资和投资人路演演示文稿 |
| `officecli-word-form` | 内容控件、表单字段和文档保护 |
| `morph-ppt` | 跨幻灯片 Morph 连续动画 |
| `morph-ppt-3d` | 带 GLB 模型和摄像机设计的 3D Morph 演示 |

## 配置维护

| Skill | 用途 |
|---|---|
| `oh-my-opencode-slim` | 调整 agents、models、prompts、skills、MCP 和 preset |

`customize-opencode` 由 OpenCode 内置，用于修改 OpenCode 自身配置，因此不会出现在本仓库的 Skills 目录中。

## 精简建议

公开预设不要求用户保留所有 Skills。可以根据实际用途删除整个 Skill 目录，并同步从 `.opencode/oh-my-opencode-slim.json` 的 Agent 配置中移除对应名称。

> [!TIP]
> - 不处理 Office 文档：移除 `officecli-*`、`morph-ppt*` 及 `officecli` MCP；
> - 不使用 Vue/Nuxt：移除 `vue`、`nuxt`；
> - 不需要发布验证：移除 `release-smoke-test`。

---

[返回 README](../README.md)
