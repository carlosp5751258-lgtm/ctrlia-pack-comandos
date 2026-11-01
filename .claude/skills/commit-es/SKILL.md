---
name: commit-es
description: "Crea un commit con mensaje en español (Conventional Commits) a partir de los cambios preparados. Úsala cuando pidan «haz commit», «commitea esto» o un mensaje de commit."
argument-hint: "[pista opcional sobre el cambio]"
disable-model-invocation: true
allowed-tools: Bash(git add *) Bash(git commit *) Bash(git status *) Bash(git diff *)
---

# Commit en español

## Estado
!`git status --short`

## Cambios preparados
!`git diff --cached --stat`

## Instrucciones
1. Si no hay nada preparado arriba, enséñame `git status` y pregúntame qué añadir. No uses `git add -A` sin preguntar.
2. Lee el diff preparado con `git diff --cached` (solo lo necesario).
3. Escribe el mensaje: `tipo(ámbito): resumen` en imperativo, en español, máximo 72 caracteres. Tipos: feat, fix, docs, refactor, test, chore. Pista del usuario: $ARGUMENTS
4. Si el cambio no es obvio, añade un cuerpo de 1-3 líneas con el porqué.
5. Ejecuta `git commit -m "<resumen>" -m "<cuerpo>"`. Nunca `--no-verify` ni `--amend` salvo que te lo pida.
6. Muestra el hash y el mensaje final.
