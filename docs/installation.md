# 安装指南

> [返回 README](../README.md) · [工作流示例](./workflows.md) · [FAQ](./faq.md) · [安全说明](../SECURITY.md) · [贡献指南](../CONTRIBUTING.md)

本仓库可以作为**项目级预设**使用，也可以合并到 OpenCode 的**全局配置**中。

> [!CAUTION]
> 两种方式不要混用。

---

## 目录

- [安装指南](#安装指南)
  - [目录](#目录)
  - [安装前](#安装前)
  - [Minimal 安装](#minimal-安装)
  - [项目级安装](#项目级安装)
  - [全局安装](#全局安装)
  - [可选依赖](#可选依赖)
    - [`/context` Tokenizer](#context-tokenizer)
    - [CodeGraph](#codegraph)
    - [OfficeCLI](#officecli)
    - [Destructive Command Guard](#destructive-command-guard)
  - [安装成功检查清单](#安装成功检查清单)
  - [安装后检查](#安装后检查)

---

## 安装前

1. 备份已有的 `opencode.json`、`AGENTS.md` 和 `.opencode/` 配置。
2. 检查 `.opencode/oh-my-opencode-slim.json` 中的模型是否对你的账户可用。
3. 只安装需要的可选组件。

## Minimal 安装

> [!IMPORTANT]
> 最小核心文件为 `AGENTS.md`、`opencode.json`、`.opencode/oh-my-opencode-slim.json`，以及这些配置实际引用的必要内容。

当前完整配置在 `oh-my-opencode-slim.json` 的 `agents.skills` 中引用了大量 Skills。如果只做最小复制而不同步删除对应引用，OpenCode 会尝试加载不存在的 Skill，导致配置错误。

因此，Minimal 安装必须**同时**完成：

1. 保留你需要的 Skill 目录；
2. 从 `oh-my-opencode-slim.json` 的 Agent 配置里移除不需要的 Skill 名称；
3. 关闭这些 Skill 依赖的 MCP（如 `officecli`、`codegraph`）或移除相关插件配置。

可按需关闭的常用可选项：OfficeCLI、CodeGraph、Destructive Command Guard、tokenizer 依赖。

## 项目级安装

将以下内容复制到目标项目根目录：

```text
AGENTS.md
opencode.json
.opencode/
```

如果目标项目已有配置，应逐项合并：

- 合并 `opencode.json` 中的 `plugin`、`agent` 和 `mcp`；
- 将 `AGENTS.md` 的规则与项目原有规则整合，避免覆盖项目约定；
- 合并 `.opencode/skills/`、`.opencode/plugins/` 和 `.opencode/command/`；
- 检查 `.opencode/oh-my-opencode-slim.json` 的 preset 和模型配置。

## 全局安装

OpenCode 的全局配置目录是：

```text
~/.config/opencode/
```

全局安装时使用以下映射：

| 仓库路径 | 全局路径 |
|---|---|
| `AGENTS.md` | `~/.config/opencode/AGENTS.md` |
| `opencode.json` | `~/.config/opencode/opencode.json` |
| `.opencode/oh-my-opencode-slim.json` | `~/.config/opencode/oh-my-opencode-slim.json` |
| `.opencode/tui.json` | `~/.config/opencode/tui.json` |
| `.opencode/command/` | `~/.config/opencode/command/` |
| `.opencode/plugins/` | `~/.config/opencode/plugins/` |
| `.opencode/skills/` | `~/.config/opencode/skills/` |

> [!WARNING]
> 不要把整个仓库复制成 `~/.config/opencode/.opencode/`，否则会产生多余的目录层级。

## 可选依赖

### `/context` Tokenizer

项目级安装时，在预设根目录执行：

```sh
./.opencode/plugins/install.sh
```

全局安装后执行：

```sh
~/.config/opencode/plugins/install.sh
```

脚本需要 `npm`，并将依赖安装到插件目录下的 `vendor/node_modules/`。

### CodeGraph

按照 CodeGraph 项目的说明安装 CLI。`opencode.json` 期望以下命令可执行：

```sh
codegraph serve --mcp
```

CodeGraph 使用项目级索引；需要时由用户在具体项目中初始化，不应由预设自动创建。

### OfficeCLI

按照 OfficeCLI 项目的说明安装。`opencode.json` 期望以下命令可执行：

```sh
officecli mcp
```

### Destructive Command Guard

安装 `dcg` 后，`dcg-guard.js` 会自动发现该命令并注册 Bash 执行前检查。插件会自动为子进程设置 `DCG_ROBOT=1`。

## 安装成功检查清单

重新启动 OpenCode 后检查：

1. oh-my-opencode-slim 能读取 `me` preset；
2. Orchestrator、Designer、Explorer、Fixer、Librarian、Observer 和 Oracle 可用；
3. 已安装的 MCP 能正常启动；
4. 执行 `/context` 时能返回 Token 统计；
5. 未安装的可选组件不会阻断不相关的工作流。

> [!NOTE]
> OpenCode 配置在启动时加载，不会热更新。每次修改配置、Agent、Skill、Command 或 Plugin 后都需要退出并重新启动 OpenCode。

## 安装后检查

安装完成后，可在 OpenCode 对话中输入普通自然语言提示词：

```text
ping all agents
```

> 这不是 Slash Command，也不是确定性自动化测试，只是人工冒烟检查：观察配置中的主要 Agents 是否可见或可响应。

成功标准取决于当前配置中的模型、Provider 和 Agent 定义是否正确。如果配置或账户权限有问题，该提示可能失败。它不保证每个 Agent 都真实执行了网络调用或工具调用。

---

[返回 README](../README.md)
