# EVIDENCE LEDGER / ԱՊԱՑՈՒՅՑԻ ՄԱՏՅԱՆ

> **EN:** Append-only record of load-bearing claims and their proof (L15/L18). One row per material claim used in a decision. Henceforth appended, never rewritten. **HY:** Կրող claim-ների ու դրանց ապացույցի append-only գրառում (L15/L18)։ Այսուհետ append, երբեք չի վերագրվում։

| task_id | claim | evidence_type | source / anchor | verification_method | status | used_in_decision | date |
|---|---|---|---|---|---|---|---|
| UISLICE-001 | Neutral-CRM list-detail page renders with all 6 states | runtime | `scratchpad/slice-evidence/screenshots/*` (10 PNGs) | Playwright render + screenshot | **PROVEN** | y | 2026-07-05 |
| UISLICE-001 | Static gates pass (types/lint/build) | build output | `tsc --noEmit`=0 · `eslint`=0 · `next build`=0 | command exit codes observed | **PROVEN** | y | 2026-07-05 |
| UISLICE-001 | 4 viewports + interactions + keyboard operable | runtime | Playwright spec `e2e/customers.spec.ts` (23 tests) | Playwright run 23/23 pass | **PROVEN** | y | 2026-07-05 |
| UISLICE-001 | Accessibility: axe 0 serious/critical across 5 states | runtime | `scratchpad/slice-evidence/axe/*.json` (all `[]` post-fix) | @axe-core/playwright analyze | **PROVEN** | y | 2026-07-05 |
| UISLICE-001 | Controlled failure (ESC no-close) caught by the gate | runtime | run #1 failing test `drawer closes on Escape` | Playwright verdict | **PROVEN** | y | 2026-07-05 |
| PROD-OS-001 | Universal Core generality (domain-agnostic beyond UI) | — | none yet — Code slice (proof 2) not built | — | **DECLARED / UNKNOWN** | flagged | 2026-07-05 |
| CODESLICE-001 | Code change reaches runtime GREEN via TDD red→green | runtime | `scratchpad/phase9-code-slice/evidence/02,03` | vitest run: stub 13/13 FAIL (exit 1) → impl 13/13 PASS (exit 0) | **PROVEN** | y | 2026-07-05 |
| CODESLICE-001 | Static + build gates pass (types/lint/build) | build output | `tsc --noEmit`=0 · `eslint`=0 · `tsc` build=0 → `dist/billingPeriod.js`+`.d.ts` | command exit codes observed | **PROVEN** | y | 2026-07-05 |
| CODESLICE-001 | Controlled boundary defect caught by the gate | runtime | `evidence/09,10`: `isWithinPeriod` `<=`→`<` | vitest: exactly 1 test RED (`expected false to be true`), exit 1 | **PROVEN** | y | 2026-07-05 |
| CODESLICE-001 | Unplanned build-config defect (TS5011) caught | build output | `evidence/07`: first `build` exit 2 (missing rootDir) → fixed | tsc build exit code observed | **PROVEN** | y | 2026-07-05 |
| PROD-OS-001 | Universal Core generality — progress after proof 2 | reasoning | TWO proven adapters now exist (UI + Code); extraction+revalidation against both = Phase 10 | not yet run against an extracted core | **DECLARED / UNKNOWN** | flagged | 2026-07-05 |
| UNIV-CORE-001 | Universal Core proven: one loop drives two artifact classes | runtime + reasoning | UISLICE-001 (UI render/axe) + CODESLICE-001 (code test/build) via the same 10-step loop; `_core/production_os/UNIVERSAL_CORE.md`; core audited adapter-neutral | both adapter proofs independent + Code re-run fresh in 10B (tsc/lint/test/build 0, 13/13) | **PROVEN** | y | 2026-07-05 |
| PROD-OS-001 | Universal Core generality — RESOLVED | runtime + reasoning | superseded by UNIV-CORE-001 (two proven artifact classes, one loop) | measured across UI + Code, L17 | **PROVEN** | y | 2026-07-05 |

> **Note (L18):** UISLICE-001 rows are PROVEN by independent runtime artifacts (Playwright + axe + screenshots), not by builder assertion or file-presence. PROD-OS-001 is honestly UNKNOWN until the Code slice runs. / UISLICE-001-ը PROVEN է անկախ runtime artifact-ով. PROD-OS-001-ը ազնվորեն UNKNOWN է մինչ Code slice-ը։
