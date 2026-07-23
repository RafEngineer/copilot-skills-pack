#!/bin/bash

INPUT=$(cat)
# Extract the command from the tool input. Harnesses vary in the exact field
# name, so fall back to scanning the whole payload if the common fields are
# absent — this keeps the guardrail effective across agents.
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // .tool_input.commandLine // .command // empty' 2>/dev/null)
if [ -z "$COMMAND" ]; then
  COMMAND="$INPUT"
fi

DANGEROUS_PATTERNS=(
  "git push"
  "git reset --hard"
  "git clean -fd"
  "git clean -f"
  "git branch -D"
  "git checkout \."
  "git restore \."
  "push --force"
  "reset --hard"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qE "$pattern"; then
    echo "BLOCKED: '$COMMAND' matches dangerous pattern '$pattern'. The user has prevented you from doing this." >&2
    exit 2
  fi
done

exit 0
