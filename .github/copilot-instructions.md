# Copilot instructions

This repository is a collection of GitHub Copilot **agent skills** — on-demand slash commands and behaviours for real engineering work.

- Skills live as flat folders under `skills/<name>/`, each with a `SKILL.md` (its `name:` must match the folder).
- Repo conventions, invocation rules, and the docs/router workflow are described in [AGENTS.md](../AGENTS.md).
- To install the skills globally so they work in every workspace, run `scripts/link-skills.sh` — it symlinks each skill into `~/.copilot/skills`.
- Start with [`ask-matt`](../skills/ask-matt/SKILL.md), the router that points you at the right skill for your situation.

When editing a skill, keep its `description` keyword-rich, keep `SKILL.md` focused, and reference bundled assets with relative `./` paths one level deep.
