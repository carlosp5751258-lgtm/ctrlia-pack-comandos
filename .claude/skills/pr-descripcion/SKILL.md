---
name: pr-descripcion
description: "Redacta en español la descripción de un pull request a partir de los commits y el diff de la rama actual frente a la rama base. Úsala cuando pidan descripción de PR, resumen de la rama o «qué cambia este PR»."
argument-hint: "[rama-base]"
allowed-tools: Bash(bash *pr-descripcion/contexto.sh*) Bash(git diff *) Bash(git log *)
---

# Descripción de PR

## Contexto de la rama
!`bash "${CLAUDE_SKILL_DIR}/contexto.sh" $ARGUMENTS`

## Instrucciones
Escribe en Markdown, en español, sin inventar nada que no esté en los commits o el diff:

- **Qué cambia**: 2-4 viñetas para quien revisa, de lo más importante a lo menos.
- **Por qué**: una frase (si los commits no lo dicen, escribe «Por qué: pendiente» y pregúntamelo).
- **Cómo probarlo**: comandos concretos o pasos.
- **Riesgos**: migraciones, cambios de API, configuración nueva. Si no hay, «Ninguno conocido».

Devuelve solo el Markdown. No crees el PR ni hagas push.
