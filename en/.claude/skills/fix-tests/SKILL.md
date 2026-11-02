---
name: fix-tests
description: "Runs the tests, finds the cause of each failure and fixes it until they pass, without touching the tests unless they are wrong. Use it when tests fail or someone asks to \"fix the tests\"."
argument-hint: "[test command]"
effort: high
---

# Fix the tests

Test command: $ARGUMENTS
(If empty, use the one in CLAUDE.md or AGENTS.md; if there is none, detect it: `npm test`, `pnpm test`, `python3 -m pytest -q`, `go test ./...`, `cargo test`. Tell me which one you'll use before you start.)

## Loop
1. Run the command and take the first real failure (ignore the ones that follow from it).
2. Explain the cause in one sentence **before** editing. If you don't know it, add a temporary check instead of guessing.
3. Fix the production code. Only change a test if you show the test is wrong, and tell me explicitly.
4. Re-run just that test; then the full suite.
5. Repeat. If the same test still fails after 3 attempts, stop and summarize what you tried.

## Forbidden
- Skipping or deleting tests (`skip`, `xfail`, `.only`, commenting out asserts) to make it pass.
- Changing dependencies or the test runner configuration without asking.

When done: list of fixed failures with their cause and the final output of the suite.
