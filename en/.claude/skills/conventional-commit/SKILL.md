---
name: conventional-commit
description: "Creates a commit with an English message (Conventional Commits) from the staged changes. Use it when someone asks to \"commit this\", \"make a commit\" or for a commit message."
argument-hint: "[optional hint about the change]"
disable-model-invocation: true
allowed-tools: Bash(git add *) Bash(git commit *) Bash(git status *) Bash(git diff *)
---

# Commit in English

## Status
!`git status --short`

## Staged changes
!`git diff --cached --stat`

## Instructions
1. If nothing is staged above, show me `git status` and ask what to add. Don't use `git add -A` without asking.
2. Read the staged diff with `git diff --cached` (only what you need).
3. Write the message: `type(scope): summary` in the imperative, in English, 72 characters max. Types: feat, fix, docs, refactor, test, chore. User's hint: $ARGUMENTS
4. If the change isn't obvious, add a 1-3 line body with the why.
5. Run `git commit -m "<summary>" -m "<body>"`. Never `--no-verify` or `--amend` unless I ask.
6. Show the hash and the final message.
