---
name: explain-code
description: "Explains in English what a file, folder or function of the project does and how it fits with the rest, without changing anything. Use it when someone asks \"what does this do\", \"explain this code\" or when joining a repository."
argument-hint: "<path or function name>"
context: fork
agent: Explore
model: haiku
effort: low
---

Explain in English, for someone who just joined the project, this target: $ARGUMENTS

Steps:
1. Find the target (if it's a function name, search for it with Grep). If it doesn't exist, say so and stop.
2. Read the code and at most 3 files that call it or that it uses.
3. Don't modify any file.

Answer format (25 lines max):
- **What it does**: 2-3 sentences.
- **Inputs and outputs**: parameters, return values, side effects (files, network, database).
- **Who uses it**: paths with line numbers (`path:line`).
- **Watch out for**: edge cases or odd behavior you see in the code.
