# REPAIR PATTERNS / ՎԵՐԱՆՈՐՈԳՄԱՆ ՕՐԻՆԱՉԱՓՈՒԹՅՈՒՆՆԵՐ

> **EN:** Reusable fixes distilled from real repairs — so the next build reaches for the pattern, not the pain. Append-only. **HY:** Իրական վերանորոգումներից թորած reusable fix-եր — որ հաջորդ build-ը վերցնի pattern-ը, ոչ ցավը։ Append-only։

## RP-001 — Small-text token contrast (from FL-002)
- **Pattern:** a semantic color-token PAIR can pass AA at large sizes but FAIL at 12–13px. Soft "tint bg + colored text" variants are the usual culprit.
- **Fix:** verify contrast at the USED font size; for small labels prefer a SOLID fill (white on the strong color) over a tint — e.g. destructive badge → `bg-destructive text-white` (4.77:1) instead of `bg-destructive/10 text-destructive` (4.0:1).
- **Prevention:** run axe against every state that renders the token at small size; never assume a token pair is AA from its large-size ratio.

## RP-002 — Deterministic controlled failure (from FL-001)
- **Pattern:** to plant a catchable, one-line-reversible defect in a modal, target the specific close *reason* (Base UI `escape-key`) in a controlled `onOpenChange`, leaving other close paths intact.
- **Fix / revert:** a single boolean flag flip — minimal diff, clean Repairer step.

## RP-003 — Windows `next start` teardown hang (tooling, from the sandbox run)
- **Pattern:** Playwright's `webServer` hangs tearing down `next start` on Windows → no report flush.
- **Fix:** run the server harness-side and set `reuseExistingServer: true` so Playwright never tears it down; add `gracefulShutdown` as a bound.
