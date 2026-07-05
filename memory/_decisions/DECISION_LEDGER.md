# DECISION LEDGER / ՈՐՈՇՈՒՄՆԵՐԻ ՄԱՏՅԱՆ

> **EN:** Append-only record of consequential decisions (lightweight ADR). Each: decision · why · alternatives rejected · what would flip it. **HY:** Հետևանքային որոշումների append-only գրառում (թեթև ADR)։ Ամեն մեկը՝ որոշում · ինչու · մերժված այլընտրանք · ինչ կշրջեր։

| id | date | decision | why | rejected | flips if |
|---|---|---|---|---|---|
| D-001 | 2026-07-05 | Prove production engine by a **vertical UI slice** before extracting a universal core | avoids empty-abstraction trap (3rd time); generality is earned from real slices | top-down 13-layer/11-adapter scaffold | two proven slices exist |
| D-002 | 2026-07-05 | Build the slice in an **external sandbox**, no Bro-repo write | Gate model; keep repo clean until proven | build directly in repo | — |
| D-003 | 2026-07-05 | Controlled failure = **ESC no-close**, scoped to the `escape-key` reason | deterministic, realistic, one-line repair | reason-agnostic swallow (would break X/backdrop too) | — |
| D-004 | 2026-07-05 | Fix FL-002 with **solid destructive fill** (white-on-red 4.77:1) | meets AA, keeps red semantic, stays in tokens | neutral badge (loses semantic) · outline (fragile on hover) | — |
| D-005 | 2026-07-05 | GO-INSTALL executed as **full install** per Gev's explicit choice | D0: Gev is root authority; chose it with risks stated | safe non-spine increment (Bro's recommendation, overridden) | — |
| D-006 | 2026-07-05 | Ship Universal Core + Code adapter labeled **DECLARED**, not PROVEN | L16/L18 forbid fake-GREEN; only 1 of 2 slices proven | stamp "universally proven" off one slice | Code slice reaches runtime GREEN |
| D-007 | 2026-07-05 | Install on a **branch**, push/seed last, via governed tools + `BRO_GEV_APPROVED` | reversible-first; D0 gates honored | write straight to main | — |
| D-008 | 2026-07-05 | Prove the Code adapter with a **pure-logic TypeScript** module in a throwaway sandbox (`billingPeriod`), full red→green + controlled defect | matches the declared contract (tsc+lint+build); reuses the proven Node toolchain (low risk); pure logic exercises a genuinely non-UI capability | Python/pytest (more setup risk, no extra §8 credit) · a UI-flavored change (would not earn generality) · building inside the Bro repo (D-002 keeps it sandboxed) | a different-language 3rd slice is later wanted |
| D-009 | 2026-07-05 | Extract the Universal Core as **validate + generalize + relabel** (NOT a rewrite); flip DECLARED→PROVEN backed by two proven adapters | the engine was built domain-agnostic; generality is earned by two real slices through one loop (§8); a rewrite would re-open the empty-abstraction trap | rebuild a fresh "core" top-down · leave Universal DECLARED despite two proofs (dishonest under-claim) | either adapter proof is invalidated |

> **Note:** D-005 records an honest override — Bro recommended the safe non-spine increment and insisted on the two-slice rule; Gev chose full install with the risks in front of him (L19: truth is Bro's, the decision is Gev's/D0). / D-005-ը ազնիվ override է. Bro-ն առաջարկեց safe increment ու պնդեց two-slice-ը. Գևը ընտրեց full install՝ ռիսկերը տեսնելով (L19/D0)։
