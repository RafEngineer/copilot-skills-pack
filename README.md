# Copilot Skills Pack

A pack of engineering agent skills for GitHub Copilot (VS Code) — slash commands and behaviors for real engineering work. Adapted from Matt Pocock's skills (originally built for Claude Code) to run as local Copilot skills.

Important note:
- This is not a native marketplace plugin.
- It works as a personal plugin through local skills loaded by Copilot.
- Practical result: skills appear in chat when you type /, in any project.

## 1) Prerequisites

- VS Code with GitHub Copilot Chat enabled
- Git installed
- Terminal with permission to create symlinks
- This repository cloned into a fixed directory

## 2) Global installation (one time)

1. Clone this repository into a permanent folder:

```bash
git clone https://github.com/RafEngineer/copilot-skills-pack.git ~/copilot-skills-pack
```

2. Enter the folder and run the linker:

```bash
cd ~/copilot-skills-pack
./scripts/link-skills.sh
```

The script creates symlinks in:
- ~/.copilot/skills
- ~/.agents/skills

3. Reload VS Code:
- Command Palette -> Developer: Reload Window

4. Quick validation:
- Open Copilot Chat
- Type /
- Confirm skills like /ask-matt, /to-spec, and /implement are listed

## 3) How to use it in any project

After global installation, you do not need to reinstall per project.

Flow:
1. Open the target repository in VS Code
2. Open Copilot Chat
3. Run /setup-agent-skills (first time in that project)
4. Continue with the engineering workflow as needed

## 4) Initial project setup (required)

Command:
- /setup-agent-skills

This setup prepares the configuration artifacts used by the engineering skills, including:
- issue tracker
- triage label vocabulary
- domain docs organization

Expected output in the target project:
- docs/agents/issue-tracker.md
- docs/agents/domain.md
- docs/agents/triage-labels.md (when applicable)

If you skip this step, skills like /to-spec, /to-tickets, and /triage may run without operational context.

## 5) Recommended daily workflow

### Intake and alignment
- /ask-matt
   - When to use: when you are not sure which skill to run
   - Outcome: routes you to the correct flow

- /grill-with-docs
   - When to use: at the beginning of a change with unclear requirements
   - Outcome: alignment plus context artifacts

### Planning
- /to-spec
   - Converts conversation context into a specification

- /to-tickets
   - Breaks the specification into executable tickets

### Implementation
- /implement
   - Executes tickets
   - Uses /tdd internally for red-green-refactor cycles

### Quality and maintenance
- /code-review
   - Review against standards and intended outcome

- /diagnosing-bugs
   - Structured investigation for difficult bugs and regressions

- /improve-codebase-architecture
   - Periodic architecture improvement passes

## 6) Important utility skills

- /handoff
   - Compacts context to continue in a new session

- /handoff-bg
   - Hands off work to a background subagent

- /git-guardrails
   - Configures guardrails for dangerous git commands

- /research
   - Runs source-based research and returns consolidated findings

- /teach
   - Guided learning workflow across sessions

## 7) Updating the pack

When you change skills or pull updates:

```bash
cd ~/copilot-skills-pack
git pull
./scripts/link-skills.sh
```

Run the linker again especially if you:
- added a skill
- removed a skill
- renamed a skill folder

## 8) Troubleshooting

### Skills do not appear when typing /
Checklist:
1. Run ./scripts/link-skills.sh again
2. Confirm that folders exist in ~/.copilot/skills
3. Reload VS Code (Developer: Reload Window)
4. Close and reopen Copilot Chat

### A skill appears but does not behave as expected
Checklist:
1. Confirm SKILL.md exists in the skill folder
2. Confirm frontmatter name matches the folder name
3. Confirm frontmatter YAML is valid

### Errors after renaming skills
Checklist:
1. Run ./scripts/link-skills.sh to refresh symlinks
2. Reload VS Code

### /to-spec, /to-tickets, or /triage without context
Likely cause:
- project was not initialized

Fix:
- run /setup-agent-skills in the current project

## 9) Repository structure

- skills/<name>/SKILL.md
   - skill definition

- scripts/link-skills.sh
   - installs/updates links in your Copilot profile

- .github/copilot-instructions.md
   - agent behavior instructions for this repository

- AGENTS.md
   - general maintenance conventions for this pack

## 10) Safe customization

You can safely edit:
- skill descriptions and instructions
- skill names (as long as frontmatter name is also updated)
- routing flow in /ask-matt

Best practices:
- keep each skill focused on one objective
- keep descriptions clear (usage triggers)
- rerun the linker after structural changes

## 11) Full skill catalog

Every skill installed by the linker. Sections 5 and 6 cover the ones you will use most; this is the complete list.

### Engineering — core flow
- /ask-matt — router that points you to the right skill or flow
- /grill-with-docs — relentless interview that also produces ADRs and a glossary
- /grill-me — relentless interview to sharpen a plan or design (no artifacts)
- /grilling — the underlying interview primitive other skills reuse
- /to-spec — turns the conversation into a spec published to the tracker
- /to-tickets — breaks a plan/spec into tracer-bullet tickets with blocking edges
- /implement — builds work from a spec or tickets (drives /tdd internally)
- /tdd — test-driven red-green-refactor loop
- /code-review — reviews changes on Standards + Spec axes in parallel
- /wayfinder — plans a huge, multi-session effort as a map of decision tickets
- /triage — moves issues/PRs through a triage state machine into agent-ready briefs
- /setup-agent-skills — one-time per-project configuration (tracker, labels, docs)

### Engineering — design and quality
- /codebase-design — shared vocabulary for designing deep modules
- /domain-modeling — build and sharpen the project's domain model
- /improve-codebase-architecture — scan for deepening opportunities, report, then grill
- /diagnosing-bugs — diagnosis loop for hard bugs and performance regressions
- /prototype — throwaway prototype to answer a design question
- /research — source-based research captured as a Markdown file
- /resolving-merge-conflicts — resolve an in-progress merge/rebase conflict

### Repository setup and safety
- /git-guardrails — hook that blocks dangerous git commands
- /setup-pre-commit — Husky + lint-staged pre-commit hooks
- /setup-ts-deep-modules — wire dependency-cruiser to enforce deep modules
- /migrate-to-shoehorn — migrate test `as` assertions to shoehorn

### Sessions and productivity
- /handoff — compact the conversation into a handoff document
- /handoff-bg — hand off to a fresh background subagent
- /teach — teach a concept using the workspace as a stateful classroom
- /scaffold-exercises — scaffold exercise directory structures

### Writing and personal
- /edit-article — edit and improve article drafts
- /writing-fragments — mine raw fragments (explore)
- /writing-shape — shape raw material into an article (exploit)
- /writing-beats — assemble material into a journey of beats (exploit)
- /writing-great-skills — reference for writing and editing skills well
- /obsidian-vault — manage notes in an Obsidian vault

### Experimental / in-progress
- /batch-grill-me — asks every frontier question at once, round by round
- /loop-me — grill about specs for workflows built in this workspace
- /to-questionnaire — turn an open decision into a questionnaire for someone else
- /wizard — generate an interactive bash setup wizard

## 12) Optional: minimum profile

If the full command list feels noisy, keep only the skills you want. The linker searches `skills/` recursively for `SKILL.md` files and skips only the `skills/deprecated/` folder.

To disable a skill:
1. Move its folder under `skills/deprecated/` (so the linker stops linking it)
2. Remove the leftover symlink the linker created, e.g. `rm ~/.copilot/skills/<skill> ~/.agents/skills/<skill>`
3. Reload VS Code

Note: rerunning the linker does not delete stale symlinks, so step 2 is required.

A reasonable minimum set to keep active: `ask-matt`, `grill-with-docs`, `to-spec`, `to-tickets`, `implement`, `tdd`, `code-review`, `diagnosing-bugs`, `setup-agent-skills`.

## Credits

This project is inspired by and derived from Matt Pocock's agent skills, originally built for Claude Code. The skill content comes from that work; this repository adapts it to run as local skills in GitHub Copilot (VS Code).

- Original work: Matt Pocock's skills (https://github.com/mattpocock/skills)
- License: MIT (see [LICENSE](LICENSE)), Copyright (c) Matt Pocock
