# ctrlia-pack-comandos

The Spanish version is at the repo root and in [README.md](README.md); the English files are in `en/`.

**5 commands (skills) for Claude Code**, ready to copy:

| Command | What it does |
| --- | --- |
| `/conventional-commit` | Creates a commit with an English message (Conventional Commits) from the staged changes. Only you launch it |
| `/pr-description [base-branch]` | Writes a PR description from the commits and the diff. It does not create the PR or push |
| `/fix-tests [command]` | Test loop until green, with `effort: high` and no cheating (no `skip`, `xfail` or deleted asserts) |
| `/explain-code <path or function>` | Explains code in an Explore subagent on Haiku 5.5 (`model: haiku`, `effort: low`). It changes nothing |
| `/pre-push-check` | Looks for secrets, `.env` or key files, files over 1 MB and leftover debugging before the push. Only you launch it |

- Page explaining every field: https://ctrlia.dev/en/recetas/pack-comandos.html
- Español: https://ctrlia.dev/recetas/pack-comandos.html

Tested with Claude Code **2.1.316**: names that do not clash with built-in commands, valid YAML and scripts tested on Linux.

## Install

```bash
git clone https://github.com/carlosp5751258-lgtm/ctrlia-pack-comandos
# For all your projects:
mkdir -p ~/.claude/skills && cp -r ctrlia-pack-comandos/en/.claude/skills/. ~/.claude/skills/
chmod +x ~/.claude/skills/pr-description/context.sh ~/.claude/skills/pre-push-check/check.sh
```

For a single repository (and your team), copy `en/.claude/skills/` into that repository's `.claude/skills/` and commit it. Inside Claude Code, `/skills` lists them; no restart needed (if the `skills` folder did not exist when the session started, run `/reload-skills`).

## Files

```text
en/.claude/skills/
├── conventional-commit/SKILL.md
├── pr-description/SKILL.md
├── pr-description/context.sh
├── fix-tests/SKILL.md
├── explain-code/SKILL.md
├── pre-push-check/SKILL.md
└── pre-push-check/check.sh
```

Both scripts are bash (`set -euo pipefail`) and always exit with 0, because a failing injected command aborts the skill. On Windows they need Git Bash or WSL.

## License

MIT. See [LICENSE](LICENSE).
