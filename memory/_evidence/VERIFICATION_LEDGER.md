# VERIFICATION LEDGER / ՍՏՈՒԳՄԱՆ ՄԱՏՅԱՆ

> **EN:** Append-only record of Verifier verdicts with the evidence behind each (L16/L18). A verdict without an evidence anchor is not a verdict. **HY:** Verifier-ի վճիռների append-only գրառում՝ ամեն մեկի ապացույցով (L16/L18)։ Վճիռ առանց խարիսխի՝ վճիռ չէ։

| task_id | run | verdict | criteria checked | evidence anchor | date |
|---|---|---|---|---|---|
| UISLICE-001 | #1 | **RED** | states · viewports · interactions · a11y · controlled-failure | 4 failing tests (ESC + 3× axe contrast) | 2026-07-05 |
| UISLICE-001 | #2 (post-repair) | **GREEN** | 23 tests: 10 screenshots · 5 axe (0 serious) · 8 interactions · ESC gate | `slice-evidence/playwright-report.json` (30 KB) · `axe/*.json` all `[]` · 10 screenshots | 2026-07-05 |
| PROD-OS-INSTALL | pending | — | laws present · production_os present · beast-check · isolation | Phase H (`bro-beast-check`) — not yet run | 2026-07-05 |

> **Rule (L18):** GREEN rows carry an independent runtime artifact (Playwright/axe/screenshot). The install's own GREEN (PROD-OS-INSTALL) is not claimed until Phase H's beast-check runs. / GREEN տողերը կրում են անկախ runtime artifact. Install-ի GREEN-ը չի հայտարարվում մինչ Phase H-ի beast-check-ը վազի։
