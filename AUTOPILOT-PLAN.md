# AUTOPILOT-PLAN — Bro (SuperBro) planned work

> The daily autopilot (`tools/bro-autopilot.ps1`) reads this. A task is **PENDING** while `- [ ]`, **DONE** when `- [x]`.
> **Idempotent:** the autopilot does the NEXT unchecked task, marks it `[x]`, commits locally (never pushes). A `[x]`
> task never re-runs. Keep every task **small, bounded, verifiable** — one clear unit. This same format lives in each
> project's `bro/AUTOPILOT-PLAN.md`; each project Bro works ONLY its own file, inside its own sealed boundary (L8).

## PENDING
- [ ] CI: add a CI-safe check subset (doctor/audit that skips machine-local `bro.home.json`) + a GitHub Actions workflow that runs it on every push
- [ ] Skills Phase B: next secondary OWNER_NOTES worked-example — one skill, surgical, EN+HY, verify each (diminishing-value backlog; opportunistic)

## DONE
<!-- completed tasks move here with their commit sha -->
