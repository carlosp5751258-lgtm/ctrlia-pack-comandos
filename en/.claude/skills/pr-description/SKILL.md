---
name: pr-description
description: "Writes a pull request description in English from the commits and the diff of the current branch against the base branch. Use it when someone asks for a PR description, a branch summary or \"what does this PR change\"."
argument-hint: "[base-branch]"
allowed-tools: Bash(bash *pr-description/context.sh*) Bash(git diff *) Bash(git log *)
---

# PR description

## Branch context
!`bash "${CLAUDE_SKILL_DIR}/context.sh" $ARGUMENTS`

## Instructions
Write Markdown, in English, without making up anything that isn't in the commits or the diff:

- **What changes**: 2-4 bullets for the reviewer, most important first.
- **Why**: one sentence (if the commits don't say, write "Why: pending" and ask me).
- **How to test it**: concrete commands or steps.
- **Risks**: migrations, API changes, new configuration. If there are none, "None known".

Return only the Markdown. Don't create the PR or push.
