# BRO v1.5.0 — CLOSURE / ՓԱԿՈՒՄ (2026-07-05)

> **EN:** Truth-doc for the v1.5.0 run — Gev's "do ALL the gaps in one piece, token given, non-stop" directive. Every claim below is evidence-anchored and was GREEN-gated (stop-on-YELLOW/RED; none forced). Read this first in a new chat.
>
> **HY:** v1.5.0-ի truth-doc — Գևի «բոլոր բացերը մի կտորով, token տված, non-stop» հրահանգը։ Ամեն պնդում evidence-ով է ու GREEN-gated (stop-on-YELLOW/RED. ոչ մեկը չի ստիպվել)։

**Repo:** origin/main → this run's HEAD · spine **v1.5.0** · selfcheck **OVERALL GREEN** · tree CLEAN · content-hash MATCH · all 4 bros reseeded + VERIFIED.

---

## What shipped (5 gaps closed, GREEN-gated, sequential)

### 1. Mode-B ACTIVATED (was SEEDED/awaiting Gev)
- Structural retune wired to `_core/production_os/01_INTAKE_AND_INTENT.md` §2 + `self/gev_standard/README.md` + `MODE_B_INTAKE.md` (status READY→ACTIVATED; do-not-auto-apply gate marked SATISFIED on Gev's go+token).
- Gauge GREEN (20 Gev-labeled ≥15). Answer-shape default = **verdict → proven → not-proven → caveat → exact next command**; Armenian-first; no fake hype. Evidence floors (a11y, verify-before-done, no-fake-green, D0) stay **absolute** regardless of Mode.
- `bro-modeb-check.ps1` reports **Mode-B ACTIVE**. Propagated to all 4 bros via the v1.5.0 reseed. Commit `eca15a4`.

### 2. CR-004 — orphan/dead-doc detection built
- `tools/checks/bro-refs-check.ps1` now scans for a governance/doc `.md` whose filename is referenced by NO other scanned `.md` (basename match → catches markdown links + backtick house-style paths, so **no false positives** on `/_core/laws/`-style prose refs). Excludes entry points, root docs, and `skills/`+`_core/laws/` (protocol-loaded).
- Informational only (never flips RESULT to RED). Surfaced **3 genuine orphans** (SECURITY_MODEL, TOPIST_UPGRADE_PLAN, SELF_CHECK_VNEXT), **0 false positives** (grep-verified). Resolved `OI-ORPHAN-SCAN` + `OI-MODEB`. Commit (CR-004).

### 3. 32/32 skill contracts PROVEN (was 2 PROVEN / 30 DECLARED) — DC-002
- Genuine independent **blind adversarial graded eval** (producer/grader SEPARATED, L18): Bro produced senior-bar answers to each skill's hardest `domain-rubric.md` prompt(s); independent graders scored EVERY rubric dimension, re-derived all arithmetic, hunted fabrication, checked every safety/UPL/HR/dual-use gate. Uniform bar: every dimension ≥4, arithmetic reconciles, no fabrication, gates held.
- **Pass-1** (6 clusters, single-prompt probe): **16/30 clean PASS, 14 FAIL** (13 coverage + 1 REAL arithmetic defect → `FL-012`).
- **Remediation** (R1–R3, full-rubric coverage + sales arithmetic fixed): **14/14 PASS** under the same strict bar.
- Result: **30 graded-eval-PROVEN + 2 runtime-PROVEN = 32/32 PROVEN, none inflated.** Two tiers labeled distinctly in every contract + `skills/CONTRACT_MATRIX.md` (graded-eval vs runtime).
- **The gate has teeth (GX-008):** it FAILed 14 skills in pass-1 and caught a real uncontrolled arithmetic error (`FL-012`) + genuine substance gaps (SOC had no deployable detection rule; data-arch had no MDM; ai-ml never compared adaptation) — none rubber-stamped.
- Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` (DC-002), `EVIDENCE_LEDGER.md` (DC-002 row), `FAILURE_LEDGER.md` (FL-012). Commit `2426e31`. content-hash re-stamped (skills baseline) + selfcheck GREEN.

### 4. On-demand evidence confirmed fresh
- `bro-ui-smoke.ps1` → **GREEN** (US-001 recorded 13/13, axe 0, age 0d). `bro-deepcheck.ps1` → **GREEN** (DC-001 7/7 + now DC-002). L2/L4 LLM grading + UI smoke stay **on-demand by design** (Gev's BX-010: daily path stays deterministic/free) — `OI-L2/L4/UI-SMOKE` are honest on-demand markers, not gaps.

### 5. spine v1.5.0 cut + all 4 bros reseeded
- `bro-release.ps1 -Version v1.5.0 -Execute -Yes` → **465 files, VERIFIED 465/465 + rollup match**. Manifest stamped v1.4.1→v1.5.0; born-latest → v1.5.0. Commit `11cfdf1`.
- Reseeded **EP · GAA · SCOUT · MENQ** one-at-a-time (`bro-update-spine`), each VERIFIED 465, stamped, registry bumped. DB stays RETIRED. Commit `04984f6`.
- **GAA (Gev's explicit go, "do what needs doing in GAA"):** HEAD unchanged (`66028d4`); `bro/` (memory+spine) fully gitignored → invisible to git; **zero tracked app/memory files touched by the reseed** (before==after, GX-009). The only working-tree delta in GAA is Gev's own `frontend/e2e/…` activity, unrelated to the reseed.

---

## Verification (evidence, not assertion)
- **selfcheck OVERALL GREEN:** doctor 0/0 · audit 0/0 · beast 1 attempt · content-hash MATCH · all-projects GREEN (4/4 bros pass doctor+audit at v1.5.0, registry↔manifest agree) · doc-hygiene GREEN (orphan-scan 3 info) · L2/L3/L4/L5 GREEN · tree CLEAN.
- **Discipline held:** token applied ONLY to critical actions (release/reseed/re-stamp), cleared for every check (token-free). Sequential, GREEN-gated, stop-on-fail. No app repo pushed (Gev's call). No `bro/memory` touched.

## Honest open (labeled, NOT blockers)
- **graded-eval-PROVEN ≠ runtime slice.** The 30 are proven by independent adversarial LLM-grading (measured evidence L17), not by a runtime slice like UISLICE/CODESLICE, and not by an external human audit. Any skill can be upgraded to runtime-PROVEN later by running a real domain slice — optional, not owed.
- L2/L4 LLM grading + UI weekly smoke remain **on-demand** (deterministic daily path unchanged).
- 3 informational doc orphans surfaced (2 historical build docs + SELF_CHECK_VNEXT) — not dead references, just uncross-linked.

*HY: v1.5.0 = Mode-B ակտիվ + orphan-scan + 32/32 PROVEN (իրական blind graded eval, ատամով gate) + release&reseed 4 bro (GAA՝ Գևի go-ով, app+memory 0 փոփոխ)։ Ամեն ինչ GREEN-gated, token միայն critical-ին, push՝ Գևի tokenով։*
