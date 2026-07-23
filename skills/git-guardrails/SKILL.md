---
name: git-guardrails
description: Set up a Copilot hook to block dangerous git commands (push, reset --hard, clean, branch -D, etc.) before they execute. Use when user wants to prevent destructive git operations, add git safety hooks, or block git push/reset in the agent.
---

# Setup Git Guardrails

Sets up a `PreToolUse` hook that intercepts and blocks dangerous git commands before the agent executes them.

## What Gets Blocked

- `git push` (all variants including `--force`)
- `git reset --hard`
- `git clean -f` / `git clean -fd`
- `git branch -D`
- `git checkout .` / `git restore .`

When blocked, the agent sees a message telling it that it does not have authority to access these commands.

## Steps

### 1. Copy the hook script

The bundled script is at: [scripts/block-dangerous-git.sh](scripts/block-dangerous-git.sh)

Copy it to:

- `.github/hooks/block-dangerous-git.sh`

Make it executable with `chmod +x`.

### 2. Register the hook

Create `.github/hooks/block-dangerous-git.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "type": "command",
        "command": "./.github/hooks/block-dangerous-git.sh",
        "timeout": 10
      }
    ]
  }
}
```

If the file already exists, merge the hook into the existing `hooks.PreToolUse` array — don't overwrite other settings.

### 3. Ask about customization

Ask if user wants to add or remove any patterns from the blocked list. Edit the copied script accordingly.

### 4. Verify

Run a quick test:

```bash
echo '{"tool_input":{"command":"git push origin main"}}' | <path-to-script>
```

Should exit with code 2 and print a BLOCKED message to stderr.
