---
name: explica
description: "Explica en español qué hace un archivo, carpeta o función del proyecto y cómo encaja con el resto, sin modificar nada. Úsala cuando pregunten «qué hace esto», «explícame este código» o al incorporarse a un repositorio."
argument-hint: "<ruta o nombre de función>"
context: fork
agent: Explore
model: haiku
effort: low
---

Explica en español, para alguien que acaba de llegar al proyecto, este objetivo: $ARGUMENTS

Pasos:
1. Localiza el objetivo (si es un nombre de función, búscalo con Grep). Si no existe, dilo y para.
2. Lee el código y, como mucho, 3 archivos que lo llamen o que use.
3. No modifiques ningún archivo.

Formato de la respuesta (máximo 25 líneas):
- **Qué hace**: 2-3 frases.
- **Entradas y salidas**: parámetros, valores de retorno, efectos (archivos, red, base de datos).
- **Quién lo usa**: rutas con número de línea (`ruta:línea`).
- **Cuidado con**: casos límite o comportamientos raros que veas en el código.
