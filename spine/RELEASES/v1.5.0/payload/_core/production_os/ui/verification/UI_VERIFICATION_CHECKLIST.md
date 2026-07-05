# ui / verification — UI GREEN RECIPE (WIRED) / UI GREEN ԲԱՂԱԴՐԱՏՈՄՍ (ԼԱՐՎԱԾ)

> **EN:** The wired verification gate for UI artifacts. Not a reminder — a runnable recipe. GREEN requires ALL of it to pass with attached evidence (L16/L18). **HY:** UI artifact-ների լարված verification gate-ը։ Ոչ հիշեցում — վազեցվող recipe։ GREEN-ը պահանջում է ամբողջը pass լինի կցված evidence-ով (L16/L18)։

## Static gates / Ստատիկ gate-եր

```
npx tsc --noEmit      # types: exit 0
npm run lint          # eslint: exit 0
npm run build         # production build: exit 0
```

## Runtime gates (Playwright + axe) / Runtime gate-եր

- **States (6):** loading · empty-first-run · empty-filtered-to-zero · error+retry · populated · permission-denied.
- **Viewports (4):** 375 · 768 · 1024 · 1440.
- **Interactions:** filter · select row · open drawer · keyboard tab path · primary action keyboard-operable · ESC-close · focus-restore.
- **A11y:** `@axe-core/playwright` → **0 serious/critical** (dump violations to evidence, not just assert).
- **Screenshots:** one per required state/viewport (≥10), saved to evidence.

## Controlled-failure gate (mandatory) / Վերահսկվող-ձախողման gate (պարտադիր)

Plant one intentional defect (e.g. drawer ESC no-close) → the Verifier MUST catch it → the Repairer fixes it → re-verify. Record what failed · why · which gate caught it · the fix · the re-verification (→ `memory/_failures/`). A gate that can't catch a planted defect is theater. / Տնկիր մեկ defect → Verifier-ը պիտի բռնի → Repairer ուղղի → re-verify. գրանցիր failure ledger-ում։

## Verdict / Վճիռ

- **GREEN** — every gate above passes, evidence attached, controlled failure caught+repaired+re-verified. / ամեն gate pass, evidence կցված, controlled failure caught+repaired։
- **YELLOW** — builds, ≥1 gate missing/blocked (named). / build, ≥1 gate պակասում/blocked (անվանված)։
- **RED** — any static/runtime/a11y fail · a missing state/interaction · GREEN claimed without evidence · a planted defect not repaired. / ցանկացած fail · բացակա state · GREEN առանց evidence · չուղղված defect։

## Reference / Հղում

The CRM slice passed this exact recipe: static 0/0/0 · 23/23 Playwright · axe 0 serious · 10 screenshots · FL-001+FL-002 caught→repaired→re-verified. Evidence: `memory/_evidence/`, `memory/_failures/`. / CRM slice-ը անցավ հենց այս recipe-ով՝ 0/0/0 · 23/23 · axe 0 serious · 10 screenshot · FL-001+FL-002։
