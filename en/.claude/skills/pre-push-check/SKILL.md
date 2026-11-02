---
name: pre-push-check
description: "Review before git push: runs the project's checks and looks for secrets, large files and leftover debugging in the changes. Use it before pushing a branch or opening a PR."
disable-model-invocation: true
allowed-tools: Bash(bash *pre-push-check/check.sh*)
---

# Before pushing

## Automatic review of the changes
!`bash "${CLAUDE_SKILL_DIR}/check.sh"`

## Instructions
1. Summarize what the script above found. A possible secret is blocking: tell me file and line and do **not** continue until I confirm.
2. Run the project checks listed in CLAUDE.md or AGENTS.md (tests, lint, types). If there are none, ask me which ones.
3. Return a list with ✅ / ❌ per item: secrets, large files, leftover debugging, tests, lint, types.
4. Don't push or commit: just report.
