---
name: handoff-bg
description: Hand the current conversation off to a fresh background subagent that picks up the work immediately.
argument-hint: "What will the next session be used for?"
disable-model-invocation: true
---

Write a handoff summary of the current conversation so a fresh agent can continue the work. Instead of saving it to a file, launch a background subagent seeded with the summary as its prompt, using the `runSubagent` tool. Give the subagent a descriptive task name and a detailed prompt containing the full handoff summary; it runs from the current working directory and reports back when it finishes.

Include a "suggested skills" section in the summary, which suggests skills that the subagent should invoke.

Do not duplicate content already captured in other artifacts (PRDs, plans, ADRs, issues, commits, diffs). Reference them by path or URL instead.

Redact any sensitive information, such as API keys, passwords, or personally identifiable information — the summary becomes the subagent's prompt.

If the user passed arguments, treat them as a description of what the next session will focus on and tailor the summary accordingly.
