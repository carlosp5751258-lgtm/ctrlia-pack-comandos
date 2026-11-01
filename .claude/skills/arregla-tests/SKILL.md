---
name: arregla-tests
description: "Ejecuta los tests, encuentra la causa de cada fallo y lo arregla hasta que pasen, sin tocar los tests salvo que estén mal. Úsala cuando fallen los tests o pidan «arregla los tests»."
argument-hint: "[comando de tests]"
effort: high
---

# Arregla los tests

Comando de tests: $ARGUMENTS
(Si está vacío, usa el de CLAUDE.md o AGENTS.md; si no hay, detecta: `npm test`, `pnpm test`, `python3 -m pytest -q`, `go test ./...`, `cargo test`. Dime cuál vas a usar antes de empezar.)

## Bucle
1. Ejecuta el comando y quédate con el primer fallo real (ignora los que derivan de él).
2. Explica la causa en una frase **antes** de editar. Si no la sabes, añade una comprobación temporal en vez de adivinar.
3. Arregla el código de producción. Solo cambia un test si demuestras que el test es incorrecto, y dímelo explícitamente.
4. Vuelve a ejecutar solo ese test; luego la suite completa.
5. Repite. Si tras 3 intentos un mismo test sigue fallando, para y resúmeme lo probado.

## Prohibido
- Saltar o borrar tests (`skip`, `xfail`, `.only`, comentar asserts) para que pase.
- Cambiar dependencias o la configuración del runner sin preguntar.

Al terminar: lista de fallos arreglados con su causa y la salida final de la suite.
