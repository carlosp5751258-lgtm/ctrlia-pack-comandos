---
name: antes-de-subir
description: "Revisión previa a git push: ejecuta las comprobaciones del proyecto y busca secretos, archivos grandes y restos de depuración en los cambios. Úsala antes de subir una rama o abrir un PR."
disable-model-invocation: true
allowed-tools: Bash(bash *antes-de-subir/revisar.sh*)
---

# Antes de subir

## Revisión automática de los cambios
!`bash "${CLAUDE_SKILL_DIR}/revisar.sh"`

## Instrucciones
1. Resume lo que haya encontrado el script de arriba. Un posible secreto es bloqueante: dime archivo y línea y **no** sigas hasta que lo confirme.
2. Ejecuta las comprobaciones del proyecto que indique CLAUDE.md o AGENTS.md (tests, lint, tipos). Si no hay, pregúntame cuáles.
3. Devuelve una lista con ✅ / ❌ por punto: secretos, archivos grandes, restos de depuración, tests, lint, tipos.
4. No hagas push ni commit: solo informa.
