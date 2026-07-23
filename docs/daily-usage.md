# 日常使用说明

> [返回 README](../README_zh.md) · [安装指南](./installation.md) · [工作流示例](./workflows.md) · [Skills 说明](./skills.md)

这份说明面向已经安装本预设、准备在日常工作中使用它的人。它不重复每个 Skill 的完整规则，而是回答四个问题：

1. 什么情况下直接用自然语言交给 Orchestrator；
2. 什么情况下应在提示词中明确点名 Skill；
3. 常见任务通常会组合哪些 Skills；
4. 如何判断任务是否真的完成。

> [!IMPORTANT]
> 当前配置让 Orchestrator 可以看到除 `simplify` 外的全部已配置 Skills，并负责将任务交给合适的专业 Agent。日常使用时不需要自己逐个指定 Agent；只有在你明确需要某种工作方法或产物标准时，才建议点名 Skill。

## 三种使用方式

### 方式一：只描述目标

适合普通任务。告诉 Orchestrator 目标、项目路径、约束和成功标准，由它决定是否委派以及使用哪些 Skills。

```text
修复登录后偶尔跳回登录页的问题。

项目路径：/path/to/project
不要改变登录接口；先确认根因，再做最小修复，并运行相关测试。
```

这种写法比“调用所有 Agent 检查一下”更好，因为它给出了可验证目标，又没有强迫系统使用过重的工作流。

### 方式二：明确点名工作方法

当你明确需要某种专业流程时，在自然语言任务中点名 Skill。Orchestrator 仍负责拆分和委派，而不是由你手工安排所有 Agent。

```text
请使用 verification-planning 为支付回调重构制定验证路径，
确认关键行为和证据后再实施。
```

适合点名 Skill 的情况：

- 希望严格按某种方法执行，例如 `verification-planning`、`deepwork`；
- 需要特定格式的产物，例如 `officecli-financial-model`、`morph-ppt`；
- 希望限制工具选择，例如明确使用 `pnpm` 而不是其他包管理器；
- 需要高成本能力且不希望误触发，例如 `adhd`、`codemap`。

### 方式三：显式执行 Command

Command 是用户主动触发的快捷入口。目前仓库提供：

```text
/context
```

它会调用 `context_usage`，显示不同工具消耗的 Token 数量和占比。它用于观察会话上下文，不负责修改代码，也不需要委派给子 Agent。

你也可以补充输出偏好：

```text
/context 只总结消耗最高的三个工具
```

## 先判断任务属于哪一类

| 你遇到的情况 | 建议说法 | 主要 Skills 或能力 |
|---|---|---|
| 已知文件中的小改动 | 直接描述文件、改法和验证标准 | 通常不需要专门 Skill |
| 不知道代码在哪里 | 描述现象和相关入口，请先定位调用链 | Explorer、CodeGraph |
| 外部库行为或 API 可能已变化 | 明确要求查官方文档和当前版本 | Librarian、Context7、GitHub 调研 |
| 非平凡功能或重构 | 要求先设计证据路径再实现 | `verification-planning`、`karpathy-guidelines` |
| 大型、高风险、多阶段工程 | 明确要求使用高成本阶段门控 | `deepwork`，必要时 `worktrees` |
| 陌生大型仓库需要系统地图 | 明确要求生成代码地图 | `codemap` |
| 需要阅读依赖内部实现 | 明确要求检查依赖源码 | `clonedeps` |
| Vue/Nuxt 前端功能 | 描述技术栈、行为和浏览器验收条件 | `vue`、`nuxt`、`vite`、`vitest` |
| UI 视觉或交互需要打磨 | 提供页面路径、参考和响应式尺寸 | `make-interfaces-feel-better`，必要时 `vue`/`nuxt` |
| 产品定位或用户问题不清晰 | 描述产品背景和需要做出的决策 | `product-discovery` |
| 营销页面转化问题 | 给出受众、套餐、约束和现有问题 | `marketing-psychology` |
| 需要一套项目专属图标 | 描述项目、图标清单和视觉约束 | `icon-set-generator` |
| Word、Excel、PPT 交付物 | 明确文件类型、内容、输出路径和检查要求 | 对应 `officecli-*` Skill |
| Cloudflare Workers 代码或配置 | 明确运行环境、bindings 和生产约束 | `workers-best-practices` |
| 需要大量发散方案 | 明确使用 `/adhd` 或 `adhd` Skill | `adhd` |
| 发布候选需要真实运行验证 | 提供产物、版本和崩溃特征 | `release-smoke-test` |
| 最近反复做同一种工作 | 要求回顾并提炼可复用改进 | `reflect` |
| 修改 OpenCode 或本预设配置 | 明确配置目标和作用域 | `customize-opencode`、`oh-my-opencode-slim` |

## 常见任务的 Skill 组合

以下是组合参考，不是必须逐项点名的固定流水线。Orchestrator 应根据任务裁剪。

### 1. 修复跨文件 Bug

典型组合：

```text
Explorer 定位调用链
→ 必要时 Librarian 查询上游行为
→ karpathy-guidelines 约束最小修改
→ vitest 或项目现有测试验证
```

推荐提示词：

```text
修复用户保存设置后页面仍显示旧值的问题。

项目路径：/path/to/project
先复现并定位数据从 API 到界面的完整链路，不要猜根因。
只修改与问题直接相关的代码；补充回归测试，并运行最小相关验证。
如果依赖库行为不确定，请查询当前官方文档。
```

验收重点：

- 能说明根因，而不只是描述修改；
- 修改范围与根因一致；
- 回归测试在修复前能暴露问题、修复后通过；
- 没有顺手重构无关代码。

### 2. 实现一个非平凡功能

典型组合：

```text
verification-planning
→ Explorer 调查现有模式
→ karpathy-guidelines
→ 框架或工具链 Skill
→ 相关测试
```

推荐提示词：

```text
为现有 Vue 应用增加草稿自动保存。

先使用 verification-planning 明确需要保持的行为和证据路径，
调查项目已有的数据保存模式后再实施。不要增加新依赖。
需要覆盖保存成功、网络失败和离开页面三个场景。
```

如果任务具有多个阶段、多个系统或高风险迁移，再考虑 `deepwork`；不要因为普通多文件修改就启动它。

### 3. Vue/Nuxt 页面开发

常见组合：

| 场景 | 建议组合 |
|---|---|
| Vue 组件和状态 | `vue` + `vite` + `vitest` |
| Nuxt 路由、SSR、Server Route | `nuxt` + `vue`，必要时 `vite` |
| 视觉与微交互打磨 | `make-interfaces-feel-better` + `vue`/`nuxt` |
| pnpm workspace 中的前端包 | `pnpm` + `vite` 或 `tsdown` |

推荐提示词：

```text
改善结账页在 375px 和 1440px 下的布局、表单焦点和按钮反馈。
保持现有 Vue 技术栈，不改变支付逻辑，不增加 UI 库。
请使用 make-interfaces-feel-better，并在修改后运行相关构建和测试。
```

### 4. 创建 Word 文档

按产物选择：

| 产物 | Skill 组合 |
|---|---|
| 普通报告、合同、说明书 | `officecli` + `officecli-docx` |
| 可填写并受保护的 Word 表单 | `officecli` + `officecli-word-form` |
| 论文、引用、公式、参考文献 | `officecli` + `officecli-docx` + `officecli-academic-paper` |

推荐提示词：

```text
根据 /path/to/source.md 创建正式的中文 Word 报告。
输出到 /path/to/report.docx。
需要目录、标题层级、页眉、页脚、页码和两张表格。
实际生成文件后重新解析并检查结构；如果支持渲染，请检查页面预览。
```

不要只说“写一份报告”。至少提供来源、受众、输出路径、结构和验收要求。

### 5. 创建 Excel 工作簿

| 产物 | Skill 组合 |
|---|---|
| 普通表格、公式、图表 | `officecli` + `officecli-xlsx` |
| 多 KPI 管理仪表盘 | `officecli` + `officecli-xlsx` + `officecli-data-dashboard` |
| DCF、LBO、三表、情景分析 | `officecli` + `officecli-xlsx` + `officecli-financial-model` |

推荐提示词应明确：

- 工作表名称和关系；
- 原始数据来自哪里；
- 哪些单元格必须是公式，不能写死；
- 金额、日期和百分比格式；
- 图表和条件格式；
- 输出路径和公式错误检查。

### 6. 创建演示文稿

| 产物 | Skill 组合 |
|---|---|
| 普通演示文稿 | `officecli` + `officecli-pptx` |
| 融资或投资人路演 | `officecli-pptx` + `officecli-pitch-deck` |
| 跨页连续动画 | `officecli-pptx` + `morph-ppt` |
| 带 3D 模型的 Morph 演示 | `officecli-pptx` + `morph-ppt` + `morph-ppt-3d` |

推荐提示词：

```text
根据这个仓库的真实内容制作一份 10 页中文产品介绍 PPT。
输出到 /path/to/launch.pptx。
使用 16:9、现代工程工具风格，包含工作流图、能力对比和限制说明。
不要虚构用户数或性能数据。每页添加演讲者备注。
生成后检查页数、备注、元素越界和重叠，并渲染全部页面进行视觉检查。
```

PPT 的内容结构、视觉设计和文件生成通常由 Designer 统一负责，避免多个执行者同时修改同一文件。

### 7. 产品发现和营销表达

两个 Skill 的职责不同：

```text
product-discovery
→ 谁遇到了什么问题，哪些证据支持它，应该优先验证什么

marketing-psychology
→ 用户为什么犹豫，页面如何降低决策阻力，如何设计诚实的实验
```

它们可以组合，但不要把没有证据的产品假设包装成营销事实。

推荐提示词：

```text
我们要为面向独立开发者的 AI 工具重新设计定价页策略。
先用 product-discovery 整理目标用户、问题和证据缺口，
再用 marketing-psychology 设计信息顺序和 A/B 测试。
禁止虚假稀缺、伪造评价和虚构使用数据。
```

### 8. 陌生仓库和依赖源码调查

- 只是找文件、符号和调用关系：使用 Explorer/CodeGraph，不需要 `codemap`。
- 用户明确要求完整仓库文档或分层地图：使用 `codemap`。
- 需要理解依赖内部实现：使用 `clonedeps`，克隆到忽略目录后只读分析。
- 只是查询库的公开 API：交给 Librarian，不要为此克隆源码。

### 9. 发布前验证

典型组合：

```text
verification-planning 确定发布声明
→ pnpm/vite/tsdown/vitest 执行相关检查
→ release-smoke-test 验证打包产物和真实运行
→ Orchestrator 汇总证据
```

任何 commit、push、Tag、Release 或其他外部写入都不应由 Skill 自动推定。用户必须针对当次 Git 操作明确授权。

### 10. 架构决策、发散和 Council

不要把三者混为一谈：

| 需求 | 使用方式 |
|---|---|
| 需要一个高风险技术取舍 | 升级 Oracle |
| 需要大量不同方向和非明显方案 | 明确使用 `adhd` |
| 需要多个模型独立判断并形成共识 | 明确要求 Council |

`adhd` 和 Council 都会显著增加调用成本。普通“给我一个标准方案”不应触发它们。

## 如何写出高质量任务提示词

推荐包含以下六项：

```text
目标：最终要得到什么结果
路径：项目、输入文件和输出文件在哪里
事实：已知现象、技术栈、数据来源
约束：不能改什么、不能增加什么、哪些操作需确认
验收：怎样证明任务完成
交付：最终回答需要列出什么
```

通用模板：

```text
目标：
[描述最终结果]

项目或输入路径：
[绝对路径]

约束：
- [不得修改的行为]
- [允许或禁止增加依赖]
- [允许写入的范围]

验收标准：
- [可观察行为]
- [需要运行的最小测试或检查]
- [产物解析、渲染或视觉检查]

请先调查现有实现，再决定如何拆分任务。
可以并行处理互不依赖的调查，但不要让多个执行者写同一文件。
子任务报告完成后，请重新检查实际结果。
```

## 哪些情况下不要点名 Skill

以下情况通常直接描述目标更好：

- 已知文件中的一处简单修正；
- 只需要读取一个明确路径的文件；
- 普通解释、翻译或文字调整；
- 你并不在意具体方法，只在意结果和验证；
- 不确定 Skill 名称，只知道业务目标。

不建议写：

```text
调用所有 Skills 和所有 Agent，全面检查并优化项目。
```

这种提示会扩大范围、增加重复劳动和调用成本，而且没有可验证的完成条件。

## 验收不是可选步骤

| 任务 | 最小可信证据 |
|---|---|
| Bug 修复 | 能复现原问题的测试或步骤，修复后不再出现 |
| 功能实现 | 针对用户行为的测试、类型检查或可运行演示 |
| UI 修改 | 构建通过，并检查关键桌面和移动尺寸 |
| DOCX | 文件可解析，标题、表格、页眉页脚等结构存在 |
| XLSX | 工作表、公式、图表、格式存在且无公式错误 |
| PPTX | 文件可解析，页数正确，渲染后无明显重叠或越界 |
| 外部调研 | 有当前来源链接、查询日期和证据缺口 |
| 架构建议 | 结合当前项目约束，明确取舍和建议，而非通用清单 |
| 发布候选 | 在隔离环境中运行实际产物，并检查已知崩溃特征 |

当子 Agent 只报告“已完成”，但没有提供上述证据时，Orchestrator 仍应继续验收。

## 日常建议

1. **默认说目标，不背 Skill 名称。** 让 Orchestrator 先做路由。
2. **对方法有明确要求时再点名。** 例如 Morph PPT、财务模型、验证规划。
3. **复杂任务先缩小成功标准。** 不要用“全面优化”代替验收条件。
4. **高成本流程显式触发。** `deepwork`、`codemap`、`adhd`、Council 不应成为默认步骤。
5. **定期运行 `/context`。** 当主会话变长时观察哪些工具占用最多上下文。
6. **重复工作使用 `reflect`。** 先从真实使用记录中提炼改进，再决定是否新增 Skill 或 Command。

---

[返回 README](../README_zh.md)
