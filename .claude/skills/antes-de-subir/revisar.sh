#!/usr/bin/env bash
# Revisa lo que vas a subir: commits sin subir + cambios sin commit.
# Siempre termina con 0: si un comando inyectado en una skill falla, la skill entera se aborta.
set -euo pipefail
git rev-parse --git-dir >/dev/null 2>&1 || { echo "No es un repositorio git."; exit 0; }
base=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null \
  || git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null \
  || { [ "$(git branch --show-current 2>/dev/null)" != main ] && git rev-parse --verify -q main >/dev/null && echo main; } \
  || echo HEAD)
desde=$(git merge-base "$base" HEAD 2>/dev/null || echo HEAD)
archivos=$( { git diff --name-only "$desde" 2>/dev/null || true; git ls-files --others --exclude-standard 2>/dev/null || true; } | sed '/^$/d' | sort -u)
[ -z "$archivos" ] && { echo "Sin cambios respecto a $base."; exit 0; }
cambios=$(git diff "$desde" -U0 2>/dev/null || true)
mostrar() { if [ -n "$1" ]; then echo "$1"; else echo "Ninguno"; fi; }
busca() { grep -E "$@" || true; }   # grep sin coincidencias no es un error aquí
echo "Base: $base · Archivos cambiados: $(echo "$archivos" | wc -l)"
echo "## Posibles secretos"
mostrar "$(echo "$cambios" | busca '^\+.*(sk-ant-|sk-[A-Za-z0-9]{20,}|gh[pousr]_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|BEGIN [A-Z ]*PRIVATE KEY|(password|secret|token)["'"'"']?[[:space:]]*[:=])' | cut -c1-160 | head -20)"
echo "## Archivos .env o claves"
mostrar "$(echo "$archivos" | busca '(^|/)\.env($|\.)|\.pem$|\.key$|id_rsa' | busca -v '\.env\.(example|sample|template)$')"
echo "## Archivos de más de 1 MB"
mostrar "$(while read -r f; do if [ -f "$f" ] && [ "$(wc -c < "$f")" -gt 1048576 ]; then echo "$f"; fi; done <<< "$archivos")"
echo "## Restos de depuración añadidos"
mostrar "$(echo "$cambios" | busca '^\+.*(console\.log\(|debugger;|breakpoint\(\)|pdb\.set_trace)' | cut -c1-160 | head -20)"
exit 0
