#!/usr/bin/env bash
# Commits and diff summary of the current branch against the base (by default, the remote's default branch or main).
# Always exits with 0: if a command injected into a skill fails, the whole skill is aborted.
set -euo pipefail
git rev-parse --git-dir >/dev/null 2>&1 || { echo "Not a git repository."; exit 0; }
base="${1:-$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || echo main)}"
echo "Branch: $(git branch --show-current 2>/dev/null || true) · Base: $base"
echo "## Commits"; { git log --oneline --no-merges "$base"..HEAD 2>&1 || true; } | head -50
echo "## Files"; { git diff --stat "$base"...HEAD 2>&1 || true; } | tail -40
exit 0
