# ctrlia-pack-comandos

**5 Spanish-language commands (skills) for Claude Code**, ready to copy (Claude answers in Spanish with them):

| Command | What it does |
| --- | --- |
| `/commit-es` | Creates a commit with a Spanish message (Conventional Commits) from the staged changes. Only you launch it |
| `/pr-descripcion [base-branch]` | Writes a PR description from the commits and the diff. It does not create the PR or push |
| `/arregla-tests [command]` | Test loop until green, with `effort: high` and no cheating (no `skip`, `xfail` or deleted asserts) |
| `/explica <path or function>` | Explains code in an Explore subagent on Haiku 5.5 (`model: haiku`, `effort: low`). It changes nothing |
| `/antes-de-subir` | Looks for secrets, `.env` or key files, files over 1 MB and leftover debugging before the push. Only you launch it |

- Page explaining every field: https://ctrlia.dev/en/recetas/pack-comandos.html
- Español: https://ctrlia.dev/recetas/pack-comandos.html

Tested with Claude Code **2.1.316**: names that do not clash with built-in commands, valid YAML and scripts tested on Linux.

## Install

```bash
git clone https://github.com/carlosp5751258-lgtm/ctrlia-pack-comandos
# For all your projects:
mkdir -p ~/.claude/skills && cp -r ctrlia-pack-comandos/.claude/skills/. ~/.claude/skills/
chmod +x ~/.claude/skills/pr-descripcion/contexto.sh ~/.claude/skills/antes-de-subir/revisar.sh
```

For a single repository (and your team), copy `.claude/skills/` into that repository's root and commit it. Inside Claude Code, `/skills` lists them; no restart needed (if the `skills` folder did not exist when the session started, run `/reload-skills`).

## Files

```text
.claude/skills/
├── commit-es/SKILL.md
├── pr-descripcion/SKILL.md
├── pr-descripcion/contexto.sh
├── arregla-tests/SKILL.md
├── explica/SKILL.md
├── antes-de-subir/SKILL.md
└── antes-de-subir/revisar.sh
```

Both scripts are bash (`set -euo pipefail`) and always exit with 0, because a failing injected command aborts the skill. On Windows they need Git Bash or WSL.

## License

MIT. See [LICENSE](LICENSE).
