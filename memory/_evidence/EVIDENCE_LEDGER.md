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

> **Note (L18):** UISLICE-001 rows are PROVEN by independent runtime artifacts (Playwright + axe + screenshots), not by builder assertion or file-presence. PROD-OS-001 is honestly UNKNOWN until the Code slice runs. / UISLICE-001-ը PROVEN է անկախ runtime artifact-ով. PROD-OS-001-ը ազնվորեն UNKNOWN է մինչ Code slice-ը։
