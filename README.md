# ctrlia-pack-comandos

**5 comandos (skills) en español para Claude Code**, listos para copiar:

| Comando | Qué hace |
| --- | --- |
| `/commit-es` | Crea un commit con mensaje en español (Conventional Commits) a partir de los cambios preparados. Solo lo lanzas tú |
| `/pr-descripcion [rama-base]` | Redacta la descripción de un PR desde los commits y el diff. No crea el PR ni hace push |
| `/arregla-tests [comando]` | Bucle de tests hasta verde, con `effort: high` y sin trampas (nada de `skip`, `xfail` ni borrar asserts) |
| `/explica <ruta o función>` | Explica código en un subagente Explore con Haiku 5.5 (`model: haiku`, `effort: low`). No modifica nada |
| `/antes-de-subir` | Busca secretos, archivos `.env` o de claves, archivos de más de 1 MB y restos de depuración antes del push. Solo lo lanzas tú |

- Página con la explicación de cada campo: https://ctrlia.dev/recetas/pack-comandos.html
- English: https://ctrlia.dev/en/recetas/pack-comandos.html

Probado con Claude Code **2.1.316**: nombres que no chocan con los comandos integrados, YAML válido y scripts probados en Linux.

## Instalar

```bash
git clone https://github.com/carlosp5751258-lgtm/ctrlia-pack-comandos
# Para todos tus proyectos:
mkdir -p ~/.claude/skills && cp -r ctrlia-pack-comandos/.claude/skills/. ~/.claude/skills/
chmod +x ~/.claude/skills/pr-descripcion/contexto.sh ~/.claude/skills/antes-de-subir/revisar.sh
```

Para un solo repositorio (y tu equipo), copia `.claude/skills/` en la raíz de ese repositorio y haz commit. Dentro de Claude Code, `/skills` las lista; no hace falta reiniciar (si la carpeta `skills` no existía al abrir la sesión, ejecuta `/reload-skills`).

## Archivos

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

Los dos scripts son bash (`set -euo pipefail`) y siempre terminan con 0, porque un comando inyectado que falla aborta la skill. En Windows necesitan Git Bash o WSL.

## Licencia

MIT. Ver [LICENSE](LICENSE).
