#!/usr/bin/env bash
# Commits y resumen del diff de la rama actual frente a la base (por defecto, la rama por defecto del remoto o main).
# Siempre termina con 0: si un comando inyectado en una skill falla, la skill entera se aborta.
set -euo pipefail
git rev-parse --git-dir >/dev/null 2>&1 || { echo "No es un repositorio git."; exit 0; }
base="${1:-$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || echo main)}"
echo "Rama: $(git branch --show-current 2>/dev/null || true) · Base: $base"
echo "## Commits"; { git log --oneline --no-merges "$base"..HEAD 2>&1 || true; } | head -50
echo "## Archivos"; { git diff --stat "$base"...HEAD 2>&1 || true; } | tail -40
exit 0
