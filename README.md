<p align="center">
  <img src="./assets/readme/hero.svg" width="100%" alt="OpenCode Preset routes work through specialist agents and a verification gate">
</p>

<p align="center">
  <strong>A multi-agent orchestration preset for OpenCode.</strong><br>
  Keep the primary session focused while specialists handle retrieval, research, design, implementation, media analysis, and high-risk review.
</p>

<p align="center">
  <a href="./README_zh.md">中文</a> ·
  <a href="#quick-start">Quick start</a> ·
  <a href="./docs/daily-usage.md">Daily usage</a> ·
  <a href="./docs/installation.md">Installation</a> ·
  <a href="./docs/workflows.md">Workflows</a> ·
  <a href="./docs/faq.md">FAQ</a>
</p>

> [!WARNING]
> **v0.1.0 is an early release.** Models, providers, optional tools, and configuration fields reflect a personal setup and should be adapted before broader use.

## See the preset in action

<p align="center">
  <img src="./assets/basic.png" width="100%" alt="OpenCode running the preset with Orchestrator, connected MCP tools, and specialist agents">
</p>

The interface above is the configured workflow running in OpenCode: one **Orchestrator** owns the conversation, delegates bounded work, and accepts results only after relevant verification.

## Why this preset exists

A capable general agent can still become the bottleneck in a long engineering task. Search results, library documentation, screenshots, implementation details, and test output all compete for the same context—and the same model is asked to be fast, creative, precise, and skeptical at once.

OpenCode Preset separates those jobs:

- **Protect the primary context** by compressing specialist work into focused results.
- **Route by responsibility** instead of asking one model to do everything.
- **Parallelize independent work** such as code retrieval and external research.
- **Verify proportionately** with the narrowest check that proves the requested behavior.
- **Escalate deliberately** when architecture, security, or data integrity makes mistakes expensive.

## How work moves

<p align="center">
  <img src="./assets/readme/workflow.svg" width="100%" alt="A user request moves through Orchestrator planning, selected specialists, verification, and unified delivery">
</p>

The diagram is a routing model, not a fixed pipeline. A small known-path edit may stay local; a cross-cutting task can activate several independent lanes. The Orchestrator chooses the lightest workflow that can produce credible evidence.

## The specialist bench

| Agent | Owns | Typical handoff |
|---|---|---|
| **Orchestrator** | Planning, scheduling, boundaries, reconciliation, acceptance | Turns one request into a small dependency graph |
| **Explorer** | Codebase search, symbols, call chains, impact scope | Returns compressed repository evidence |
| **Librarian** | Current documentation, APIs, GitHub projects, external facts | Returns source-backed research rather than memory |
| **Designer** | UI/UX, responsive behavior, presentation design, visual polish | Owns user-visible layout and interaction quality |
| **Fixer** | Bounded implementation and structured Office work | Makes scoped mechanical changes from a concrete plan |
| **Observer** | Images, screenshots, PDFs, diagrams | Isolates visual input and returns structured observations |
| **Oracle** | High-risk architecture, persistent debugging, strategic review | Escalation path when the cost of a wrong choice is high |
| **Fast-Generic** | Git reconnaissance, lint, typecheck, tests, builds | Runs routine command-only validation without code edits |

Council mode adds three independent technical seats and a synthesis step when genuine multi-model consensus is worth the cost.

## What is included

```text
.
├── AGENTS.md                    # orchestration, routing, safety, verification
├── opencode.json                # OpenCode plugins, MCPs, built-in agent overrides
├── .opencode/
│   ├── oh-my-opencode-slim.json # models, specialist skills, council configuration
│   ├── tui.json                 # terminal UI settings
│   ├── command/                 # custom commands
│   ├── plugins/                 # /context and destructive-command guard
│   └── skills/                  # packaged specialist workflows
├── docs/                        # installation, agents, skills, workflows, FAQ
└── img/                         # real interface screenshots
```

### Capability layers

| Layer | Included capabilities |
|---|---|
| **Orchestration** | Delegation rules, approval boundaries, Council, worktrees, deep-work and verification planning |
| **Code work** | CodeGraph-assisted retrieval, Vite, pnpm, Vitest, tsdown, dependency inspection, release smoke tests |
| **Design & product** | Vue/Nuxt guidance, UI polish, product discovery, marketing psychology, icon generation |
| **Documents** | DOCX, XLSX, dashboards, financial models, academic papers, pitch decks, Morph presentations |
| **Session safety** | Context usage reporting, optional tokenizer support, destructive-command interception |

See the complete [Skills Guide](./docs/skills.md) and [Agent Configuration](./docs/agents.md) for the current assignments.

## Quick start

### 1. Try it in one project

Clone this repository, then copy or merge these entries into the project you want OpenCode to use:

```text
your-project/
├── AGENTS.md
├── opencode.json
└── .opencode/
```

> [!CAUTION]
> If the target project already contains files with these names, merge them manually. Do not overwrite an existing OpenCode setup.

### 2. Adapt the model assignments

Open [`.opencode/oh-my-opencode-slim.json`](./.opencode/oh-my-opencode-slim.json) and replace providers or models that are unavailable or unsuitable for your budget.

### 3. Install the optional `/context` tokenizer dependency

```sh
./.opencode/plugins/install.sh
```

The dependency is placed under `.opencode/plugins/vendor/` and remains ignored by Git.

### 4. Restart OpenCode

OpenCode loads configuration-time files at startup. Exit and restart it after changing configuration, Agents, Skills, Commands, or Plugins.

For global installation, optional components, and a complete checklist, use the [Installation Guide](./docs/installation.md).

<a id="前置要求"></a>

## Optional integrations

| Component | What it adds | Without it |
|---|---|---|
| [CodeGraph](https://github.com/colbymchenry/codegraph) | Symbol, call-chain, dependency, and blast-radius queries | The `codegraph` MCP is unavailable |
| [OfficeCLI](https://github.com/iOfficeAI/OfficeCLI) | Creation and inspection of Office documents | Office MCP and related Skills are unavailable |
| [Destructive Command Guard](https://github.com/Dicklesworthstone/destructive_command_guard) | Preflight interception for high-risk shell commands | The local guard stays disabled |
| npm tokenizer packages | More accurate `/context` token counts | `/context` may not provide exact counts |

`websearch`, `context7`, and `gh_grep` come from the oh-my-opencode-slim runtime rather than this repository's local MCP declarations.

## Use it through OpenChamber

[OpenChamber](https://github.com/openchamber/openchamber) provides a desktop interface for OpenCode and makes the configured Orchestrator visible at session start.

<p align="center">
  <img src="./assets/openchamber.png" width="100%" alt="OpenChamber session screen with Kimi K3 selected as the Orchestrator">
</p>

## Boundaries before adoption

- This is a **personal-preference preset**, not a universal drop-in configuration.
- Some dependencies use `@latest`; pin verified versions when reproducibility matters.
- CodeGraph, OfficeCLI, DCG, and tokenizer packages require separate installation.
- Provider availability and model pricing vary; replace the defaults for your environment.
- Some distributed Skills and templates are third-party works with their own licenses.
- Agent completion reports are not proof: the Orchestrator is expected to run relevant checks.

## Documentation

| Start here | Reference |
|---|---|
| [Daily usage](./docs/daily-usage.md) | When to rely on orchestration, name a Skill, combine workflows, and verify results |
| [Installation](./docs/installation.md) | Project-level and global setup, optional dependencies, smoke checks |
| [Workflow examples](./docs/workflows.md) | Cross-file bugs, UI work, external research, release checks |
| [Agents](./docs/agents.md) | Responsibilities, models, delegation boundaries |
| [Skills](./docs/skills.md) | Packaged capabilities and intended use |
| [FAQ](./docs/faq.md) | Configuration choices and common failure modes |
| [Security](./SECURITY.md) | Trust and safety boundaries |
| [Contributing](./CONTRIBUTING.md) | Issues, Skills, Commands, licensing, pull requests |
| [Changelog](./CHANGELOG.md) | Release history |

## Third-party work and license

This preset integrates with or builds upon [OpenCode](https://opencode.ai/), [oh-my-opencode-slim](https://github.com/alvinunreal/oh-my-opencode-slim), [opencode-notifier](https://github.com/mohak34/opencode-notifier), [CodeGraph](https://github.com/colbymchenry/codegraph), [OfficeCLI](https://github.com/iOfficeAI/OfficeCLI), and [Destructive Command Guard](https://github.com/Dicklesworthstone/destructive_command_guard).

Original configuration, scripts, and documentation are licensed under the [MIT License](./LICENSE). Distributed third-party Skills, templates, and other components retain their own terms; review [`THIRD_PARTY_NOTICES.md`](./THIRD_PARTY_NOTICES.md) before redistribution.
