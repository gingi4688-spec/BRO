# AUTOPILOT-PLAN — Bro (SuperBro) planned work

> The daily autopilot (`tools/bro-autopilot.ps1`) reads this. A task is **PENDING** while `- [ ]`, **DONE** when `- [x]`.
> **Idempotent:** the autopilot does the NEXT unchecked task, marks it `[x]`, commits locally (never pushes). A `[x]`
> task never re-runs. Keep every task **small, bounded, verifiable** — one clear unit. This same format lives in each
> project's `bro/AUTOPILOT-PLAN.md`; each project Bro works ONLY its own file, inside its own sealed boundary (L8).

## PENDING
<!-- (none — the 32-skill pack is complete + hardened; the automation system is live + green.
     Add a concrete, bounded item here when a real need arises; the daily autopilot will pick it up.) -->

## DONE
- [x] CI: CI-safe repo-only check (`tools/bro-ci-check.ps1`) + `.github/workflows/ci.yml` on every push/PR — GREEN
- [x] Skills Phase B — verified COMPLETE: every named OWNER_NOTES extra present (WSJF, homoglyph cheat-sheet, XGS-PON, RACI/schema-evolution, variety declaration, layered red-team); `skills/AUDIT_NOTES.md` reconciled (stale "remaining" line corrected); 0 unbuilt markers in any OWNER_NOTES; further additions declined under L2 (SKILL.md near-ceiling)
