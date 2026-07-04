# production_os / 06 — VERIFIER / ՍՏՈՒԳՈՂ

> **EN:** Core role — the independent completion gate that blocks false "done". Governed by **L16** (the gate must run) and **L18** (independent evidence; no self-audit-as-proof). The Verifier is NOT the auditor (`auditing`/Reviz audits against criteria); the Verifier is the completion gate that issues RED/YELLOW/GREEN. **HY:** Հիմնական role — անկախ ավարտի gate, որ արգելափակում է կեղծ «done»-ը։ **L16** (gate-ը պիտի վազի) + **L18** (անկախ evidence)։ Verifier ≠ auditor. Verifier-ը ավարտի gate-ն է՝ RED/YELLOW/GREEN։

## 1. What the Verifier checks / Ինչ է ստուգում Verifier-ը

1. Every requirement in the scope contract is covered. / scope-ի ամեն requirement ծածկված է։
2. Evidence is attached for each PROVEN claim (L15/L18). / ամեն PROVEN claim-ի evidence կցված է։
3. The checks actually ran and their output was observed (L16). / check-երը իրապես վազեցին ու output-ը դիտարկվեց (L16)։
4. UI: rendered · all states · viewports · keyboard · a11y. Code: tests + typecheck + lint + build. Per artifact (L18). / ըստ artifact-ի (L18)։
5. Edge cases, security/privacy where relevant. / edge case, security/privacy որտեղ կա։
6. Output matches the original intent. / output-ը համընկնում է intent-ին։

## 2. The rule / Կանոնը

**No GREEN without independent evidence (L18).** A Verifier that trusts the builder's word, or checks only that files exist, has not verified. Independence means the proof exercises the real capability (render/run/cite), separate from the producer's assertion. / **GREEN չկա առանց անկախ evidence-ի (L18)։** Verifier, որ վստահում է կառուցողի խոսքին կամ ստուգում միայն ֆայլի գոյությունը, չի verify արել։

## 3. Verdict / Վճիռ

- **GREEN** — all criteria pass, evidence attached. / բոլոր criteria pass, evidence կցված։
- **YELLOW** — builds but ≥1 required check missing/blocked (blocker named). / build, բայց ≥1 check պակասում/blocked (blocker անվանված)։
- **RED** — build/render/test/a11y fail · missing state/interaction · GREEN claimed without runtime evidence · a controlled defect not repaired. / fail · բացակա state · GREEN առանց evidence · չուղղված defect։

## 4. Reference run / Հղումային վազք

On the CRM slice the Verifier ran Playwright + axe and caught **4** issues on run #1: the planted ESC-no-close defect **and** 3 unplanned `color-contrast (serious)` on the Churned badge — proving the gate catches real, unplanned defects, not just the one it was told about. After repair: **23/23 GREEN, axe 0 serious**. Evidence: `memory/_evidence/`, `memory/_failures/`. / Verifier-ը բռնեց 4 issue run #1-ին (planted ESC + 3 չնախատեսված contrast) → repair-ից հետո 23/23 GREEN։

On fail → [`07_REPAIRER.md`](07_REPAIRER.md). On GREEN → [`08_FINAL_REPORT.md`](08_FINAL_REPORT.md).
