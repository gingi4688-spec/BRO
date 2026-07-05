# code / verification — CODE GREEN RECIPE (WIRED) / CODE GREEN ԲԱՂԱԴՐԱՏՈՄՍ (ԼԱՐՎԱԾ)

> **EN:** The wired verification gate for code-change artifacts. Not a reminder — a runnable recipe. GREEN requires ALL of it to pass with attached evidence (L16/L18). This is the Code analogue of the proven UI recipe. **HY:** Code-change artifact-ների լարված verification gate-ը։ Ոչ հիշեցում — վազեցվող recipe։ GREEN-ը պահանջում է ամբողջը pass լինի կցված evidence-ով (L16/L18)։ Սա UI recipe-ի Code analog-ն է։

## Status / Կարգավիճակ (L15/L18)

**Code capability check = PROVEN & runnable.** Proven end-to-end on the `billingPeriod` pure-logic TypeScript slice: TDD red→green 13/13 · `tsc`+`eslint`+build exit 0 · controlled boundary defect caught+repaired+re-verified (FL-008) · unplanned build-config defect caught (FL-009). Evidence: [`memory/_evidence/EVIDENCE_LEDGER.md`](../../../../memory/_evidence/EVIDENCE_LEDGER.md) (CODESLICE-001). / Code capability check = PROVEN, `billingPeriod` slice-ով ապացուցված։

## Static + test gates / Ստատիկ + test gate-եր

```
npx tsc --noEmit                 # types: exit 0
npm run lint        # eslint     # lint: exit 0
npm test            # vitest run # tests: N/N pass (observed output, not "should pass")
npm run build       # tsc build  # production build: exit 0 → emitted artifacts
```

## Red → green gate (mandatory) / Red → green gate (պարտադիր)

Write the failing test(s) FIRST → run → observe **RED** (tests fail because behavior is wrong, not because a file is missing) → implement → run → **GREEN**. A test that never failed proves nothing (it may be tautological). / Գրիր ձախողվող test-ը ԱՌԱՋ → RED → implement → GREEN։ Test, որ երբեք չի ձախողվել, ոչինչ չի ապացուցում։

## Controlled-failure gate (mandatory) / Վերահսկվող-ձախողման gate (պարտադիր)

Plant one deterministic defect (e.g. an inclusive boundary made exclusive, or an off-by-one) → the Verifier's test suite MUST catch it (a specific test goes RED) → the Repairer fixes ONLY that (minimal diff) → re-verify. Record what failed · why · which gate caught it · the fix · the re-verification (→ `memory/_failures/`). A gate that can't catch a planted defect is theater. / Տնկիր մեկ deterministic defect → suite-ը պիտի բռնի → Repairer ուղղի միայն այն → re-verify. գրանցիր failure ledger-ում։

## Verdict / Վճիռ

- **GREEN** — types + lint + tests + build all pass, red→green demonstrated, controlled failure caught+repaired+re-verified, evidence attached, no unrelated changes rode along. / ամեն gate pass, red→green, controlled failure caught+repaired, evidence, ոչ scope creep։
- **YELLOW** — builds but ≥1 required check missing/blocked (named). / build, ≥1 check պակասում/blocked (անվանված)։
- **RED** — any type/lint/test/build fail · GREEN claimed without a run · a planted defect not caught or not repaired · "should pass" used as proof · file-presence substituted for a run. / ցանկացած fail · GREEN առանց run · defect չբռնված/չուղղված · «պիտի անցնի» · ֆայլ-presence։

## Reference / Հղում

The `billingPeriod` slice passed this exact recipe: stub 13/13 fail → impl 13/13 pass · `tsc`/`eslint`/build 0/0/0 · controlled `<=`→`<` boundary defect caught (1 test) + FL-009 unplanned TS5011 build defect caught → both repaired → re-verify GREEN. Evidence: `memory/_evidence/`, `memory/_failures/`, sandbox `scratchpad/phase9-code-slice/evidence/*`. / `billingPeriod` slice-ը անցավ հենց այս recipe-ով։
