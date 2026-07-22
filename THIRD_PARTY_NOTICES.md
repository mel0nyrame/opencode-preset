# Third-Party Notices

> [Back to README](./README.md)

This repository contains configuration that integrates with third-party software and includes skills or templates derived from third-party projects. Each third-party component remains subject to its own license and attribution requirements.

> [!NOTE]
> This file is an attribution aid, not a replacement for the license files distributed with individual components.

---

## Runtime integrations

| Project | Source | Role |
|---|---|---|
| OpenCode | <https://opencode.ai/> | Host application |
| oh-my-opencode-slim | <https://github.com/alvinunreal/oh-my-opencode-slim> | Agent orchestration plugin |
| opencode-notifier | <https://github.com/mohak34/opencode-notifier> | Notification plugin |
| CodeGraph | <https://github.com/colbymchenry/codegraph> | Code graph MCP server |
| OfficeCLI | <https://github.com/iOfficeAI/OfficeCLI> | Office document CLI and MCP server |
| Destructive Command Guard | <https://github.com/Dicklesworthstone/destructive_command_guard> | Destructive command detection |

## Redistributed or derived skills

The following sources are explicitly identified in the files currently distributed by this repository:

| Component | Source or attribution | License information retained in repository |
|---|---|---|
| `adhd` | <https://github.com/UditAkhourii/adhd> | `SKILL.md` declares MIT |
| `product-discovery` | <https://github.com/mshadmanrahman/discovery-md> | `.opencode/skills/product-discovery/LICENSE` |
| `deepwork`, `verification-planning`, `reflect`, `worktrees`, `clonedeps`, `codemap`, `release-smoke-test`, and `oh-my-opencode-slim` | <https://github.com/alvinunreal/oh-my-opencode-slim> | MIT in the upstream repository |
| `simplify` | Adapted from <https://github.com/addyosmani/agent-skills/tree/main/skills/code-simplification> and distributed by <https://github.com/alvinunreal/oh-my-opencode-slim> | See both upstream projects and the component README |
| `tsdown` | <https://github.com/rolldown/tsdown> | `.opencode/skills/tsdown/LICENSE.md` |
| `nuxt` | <https://github.com/nuxt/nuxt> and <https://github.com/antfu/skills> | Source metadata retained in `SKILL.md` |
| `pnpm` | <https://github.com/pnpm/pnpm> and <https://github.com/antfu/skills> | Source metadata retained in `SKILL.md` |
| `vite` | <https://github.com/vitejs/vite> and <https://github.com/antfu/skills> | Source metadata retained in `SKILL.md` |
| `vitest` | <https://github.com/vitest-dev/vitest> and <https://github.com/antfu/skills> | Source metadata retained in `SKILL.md` |
| `vue` | Vue ecosystem documentation and references listed in the Skill | `SKILL.md` declares Apache-2.0 |
| OfficeCLI skills, `morph-ppt`, and `morph-ppt-3d` | <https://github.com/iOfficeAI/OfficeCLI> | Apache-2.0 in the upstream repository; 详见[下文](#officecli-skills-与-morph-模板) |
| `karpathy-guidelines` | <https://github.com/forrestchang/andrej-karpathy-skills> | `SKILL.md` declares MIT |
| `workers-best-practices` | <https://github.com/cloudflare/skills> | Apache-2.0 in the upstream repository |
| `make-interfaces-feel-better` | <https://github.com/jakubkrehel/make-interfaces-feel-better> | No upstream license identified; verify before redistribution |
| `icon-set-generator` | <https://github.com/jezweb/claude-skills/tree/main/plugins/design-assets/skills/icon-set-generator> | No upstream license identified; verify before redistribution |
| `marketing-psychology` | Possibly derived from <https://github.com/coreyhaines31/marketingskills>; exact source not confirmed | License and exact origin require verification |

The `codemap.md` files bundled with `codemap`, `clonedeps`, and `simplify` are part of the upstream oh-my-opencode-slim skill packages. They describe the skills in the context of that upstream repository and may therefore mention paths that are not present in this preset.

### OfficeCLI skills 与 Morph 模板

- 上游仓库：<https://github.com/iOfficeAI/OfficeCLI>
- 上游 LICENSE：<https://github.com/iOfficeAI/OfficeCLI/blob/main/LICENSE>
- 上游 NOTICE：<https://github.com/iOfficeAI/OfficeCLI/blob/main/NOTICE>
- 本地相关路径：`.opencode/skills/morph-ppt/reference/styles/`
- 上游 NOTICE 要求保留的声明：`OfficeCLI, Copyright 2026 OfficeCLI (https://OfficeCLI.AI). Created and maintained by goworm.`
- 当前本地 PPTX 模板未发现嵌入式图片、字体文件或其他媒体；字体仅按名称引用，不随模板分发字体文件。
- 这并不表示所有第三方版权风险已归零；二进制模板仍需单独审查。

## Before publishing

> [!WARNING]
> Not every redistributed Skill or binary template currently carries complete machine-readable origin and license metadata. Before publishing or accepting contributions, the repository owner should verify the origin and redistribution terms of every Skill and template, preserve upstream copyright and license notices, add missing entries to this file, and avoid claiming that the repository's root license relicenses third-party material.

The PowerPoint templates under `.opencode/skills/morph-ppt/` deserve particular review because binary files cannot be audited from their text content alone.
