Skills live as flat folders under `skills/`, one folder per skill:

- Each skill is `skills/<name>/SKILL.md`, plus any bundled assets (`scripts/`, sibling `.md` reference files) in the same folder.
- The skill's `name:` frontmatter field must match its folder name.
- `skills/deprecated/` is optional. If present, it should hold skills that are no longer used and should not be installed.

## Invocation

Every `SKILL.md` is either **user-invoked** or **model-invoked** (see the `description` and frontmatter):

- **User-invoked** — carries `disable-model-invocation: true`. Reachable only when the human types the slash command; the model won't auto-load it.
- **Model-invoked** — omits that flag. The model may load it automatically when the `description`'s trigger phrases match, and the human can still invoke it.

Keep `description` fields keyword-rich ("Use when…") so discovery works.

## Router

[`ask-matt`](./skills/ask-matt/SKILL.md) is the router that maps every user-reachable skill and how the flows relate. Whenever you add, rename, remove, or change how a user-reachable skill fits the flows, re-read `ask-matt`'s `SKILL.md` and update it so the map stays accurate — a stale router is a router that lies.

## Installing locally

To (re)link every skill into the local user-level skill directories that GitHub Copilot loads (`~/.copilot/skills`, plus `~/.agents/skills` for other Agent-Skills harnesses), run `scripts/link-skills.sh`. Each entry is a symlink into this repo, so a `git pull` keeps installed skills current; re-run the script after adding, removing, or renaming a skill.
