# production_os / 01 — INTAKE & INTENT / ՆԵՐԱՌՈՒՄ ԵՎ ՆՊԱՏԱԿ

> **EN:** Step 1–2 of the loop. Classify what the user actually wants, then lock scope. The classification decides whether the full production loop is mandatory (L14). **HY:** Loop-ի 1–2 քայլը։ Classify արա, թե ինչ է իրականում ուզում օգտատերը, հետո lock արա scope-ը։ Classification-ը որոշում է՝ արդյոք լրիվ production loop-ը պարտադիր է (L14)։

## 1. Intent classifier / Nպատակի classifier

**EN:** Detect the intent from the request. Two families:

| Family | Intents | Loop? |
|---|---|---|
| **Explain** | explain · define · compare-for-understanding · teach | advisory allowed; no artifact required |
| **Result** | build · fix · generate-artifact · design · audit · verify · decide-with-consequence · continue-previous | **production loop MANDATORY** (L14) |

Rule: when the user wants a **result**, an advice-only answer is a defect (L14). When in doubt between explain and result, treat it as result and offer the execution package. / Կանոն՝ երբ **արդյունք** է ուզում, advice-only-ն դեֆեկտ է (L14)։ Կասկածի դեպքում՝ որպես result վերաբերվիր։

**HY:** Հայտնաբերիր intent-ը հարցումից. երկու ընտանիք՝ **Explain** (բացատրել/սահմանել/համեմատել/սովորեցնել → advisory թույլ) և **Result** (build/fix/generate/design/audit/verify/decide/continue → production loop ՊԱՐՏԱԴԻՐ)։

## 2. Mode selection / Mode-ի ընտրություն

- **Mode A (baseline floor, always live):** professional baseline — start immediately, never block on missing taste examples. Stays the floor even under Mode B. / պրոֆեսիոնալ baseline, միշտ կենդանի հատակ. սկսիր անմիջապես, մի block արա։
- **Mode B (taste-tuned) — ACTIVE since 2026-07-05:** activated on Gev's explicit go with **20 Gev-labeled examples** (GX/BX in [`self/gev_standard/MODE_B_INTAKE.md`](../../self/gev_standard/MODE_B_INTAKE.md), ≥15 threshold, gauge GREEN). Sharpens tokens / component choices / answer-shape toward Gev's taste — preferred answer shape = **verdict → what's proven → what's not proven → caveat → exact next command**; Armenian-first, direct, no fake hype. Examples **sharpen**, never **block**; the evidence floors (a11y, verify-before-done, no-fake-green, D0 gates) stay **absolute** regardless of Mode. / ԱԿՏԻՎ 2026-07-05-ից՝ Գևի բացահայտ go-ով, 20 Gev-labeled օրինակով. սրում է token/component/պատասխանի-ձև, ոչ block. evidence floor-երը մնում են բացարձակ։

## 3. Domain routing / Domain routing

**EN:** Route to the owning skill via the existing orchestrator (32 skills + `skills/agents/ROUTING.md`) — production_os does NOT replace routing, it wraps the chosen skill in the production contract. `analysis-primary` frames first (the always-on #1 lens). / production_os-ը ՉԻ փոխարինում routing-ը. փաթաթում է ընտրված skill-ը production contract-ով։ `analysis-primary`-ն շրջանակում է առաջինը։

## 4. Scope lock / Scope lock

Before any build, write the scope contract (freeze): **in-scope** · **out-of-scope** · **assumptions (L15-labeled)** · **success criteria** · **what would need Gev approval**. The scope is not silently widened later (L1/L4); a change of scope is surfaced, not absorbed. / Build-ից առաջ գրիր scope contract-ը՝ in-scope · out-of-scope · assumption (L15-պիտակ) · success criteria · ինչ է պահանջում Գևի հաստատում։ Scope-ը լուռ չի լայնացվում. փոփոխությունը բարձրաձայնվում է։

## 5. Output of this step / Այս քայլի արդյունք

`{ intent, family, mode, domain(skill), artifact_type, scope_contract }` → handed to the Evidence Engine ([`02_EVIDENCE_ENGINE.md`](02_EVIDENCE_ENGINE.md)).
