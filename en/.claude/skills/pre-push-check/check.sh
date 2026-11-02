#!/usr/bin/env bash
# Reviews what you're about to push: unpushed commits + uncommitted changes.
# Always exits with 0: if a command injected into a skill fails, the whole skill is aborted.
set -euo pipefail
git rev-parse --git-dir >/dev/null 2>&1 || { echo "Not a git repository."; exit 0; }
base=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null \
  || git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null \
  || { [ "$(git branch --show-current 2>/dev/null)" != main ] && git rev-parse --verify -q main >/dev/null && echo main; } \
  || echo HEAD)
since=$(git merge-base "$base" HEAD 2>/dev/null || echo HEAD)
files=$( { git diff --name-only "$since" 2>/dev/null || true; git ls-files --others --exclude-standard 2>/dev/null || true; } | sed '/^$/d' | sort -u)
[ -z "$files" ] && { echo "No changes against $base."; exit 0; }
changes=$(git diff "$since" -U0 2>/dev/null || true)
show() { if [ -n "$1" ]; then echo "$1"; else echo "None"; fi; }
search() { grep -E "$@" || true; }   # grep with no matches is not an error here
echo "Base: $base · Changed files: $(echo "$files" | wc -l)"
echo "## Possible secrets"
show "$(echo "$changes" | search '^\+.*(sk-ant-|sk-[A-Za-z0-9]{20,}|gh[pousr]_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|BEGIN [A-Z ]*PRIVATE KEY|(password|secret|token)["'"'"']?[[:space:]]*[:=])' | cut -c1-160 | head -20)"
echo "## .env or key files"
show "$(echo "$files" | search '(^|/)\.env($|\.)|\.pem$|\.key$|id_rsa' | search -v '\.env\.(example|sample|template)$')"
echo "## Files over 1 MB"
show "$(while read -r f; do if [ -f "$f" ] && [ "$(wc -c < "$f")" -gt 1048576 ]; then echo "$f"; fi; done <<< "$files")"
echo "## Leftover debugging added"
show "$(echo "$changes" | search '^\+.*(console\.log\(|debugger;|breakpoint\(\)|pdb\.set_trace)' | cut -c1-160 | head -20)"
exit 0
