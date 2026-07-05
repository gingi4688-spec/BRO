# production_os / 08 — FINAL REPORT / ՎԵՐՋՆԱԿԱՆ ՀԱՇՎԵՏՎՈՒԹՅՈՒՆ

> **EN:** Step 10 — the fixed output format for production tasks (not free text). Default for all serious result-tasks. Smart-verbosity: serious task → full structure; simple task → short answer; but changeable facts always fresh-verified. **HY:** 10-րդ քայլ — production task-երի ֆիքսված output ֆորմատը (ոչ free text)։ Default բոլոր լուրջ result-task-երին։ Smart-verbosity՝ լուրջ → լրիվ struct, պարզ → կարճ. բայց փոփոխվող փաստերը միշտ fresh-verify արած։

## 1. The fixed format / Ֆիքսված ֆորմատ

```txt
1. VERDICT            — GREEN / YELLOW / RED
2. WHAT I UNDERSTOOD  — intent + scope contract (restated)
3. BEST SOLUTION      — the winner
4. WHY BEST           — evidence + rejected alternatives (from 03)
5. EXECUTION PACKAGE  — files / steps / commands / checks (from 04)
6. VERIFICATION       — criteria · results · evidence artifacts (from 06)
7. RISKS              — what could bite + rollback
8. NEEDS GEV APPROVAL — the D0-gated items, explicit
```

Every claim in the report is labeled (L15). The verdict is never GREEN without independent evidence (L18). / Report-ի ամեն claim պիտակված է (L15)։ Վճիռը երբեք GREEN չէ առանց անկախ evidence-ի (L18)։

## 2. Verbosity gate / Verbosity gate

- **Serious result-task** → full 8-part structure. / լուրջ → լրիվ 8-մաս struct։
- **Simple task** → short answer, but still labeled and, if it states a changeable fact, freshly verified. / պարզ → կարճ, բայց պիտակված ու fresh-verify արած փոփոխվող փաստի դեպքում։
- **Explain-intent** → advisory prose, no forced structure. / explain → advisory։

## 3. Bilingual (L0) / Երկլեզու (L0)

Every final report is delivered in English and native Armenian, equal load — the L0 law overrides convenience. / Ամեն վերջնական report մատուցվում է անգլերեն ու native հայերեն, հավասար բեռ — L0-ն գերակա է հարմարավետությունից։

## 4. Reference report / Հղումային report

The CRM slice's Gate-2 delivery used this format: Verdict GREEN · what I understood · the slice · why · commands+outputs · verification (23/23, axe 0 serious, 10 screenshots) · risks · needs-Gev (GO-INSTALL). / CRM slice-ի Gate-2 delivery-ն օգտագործեց այս ֆորմատը՝ Verdict GREEN · verification (23/23, axe 0 serious, 10 screenshot) · needs-Gev (GO-INSTALL)։

The Code slice's Phase-9 delivery used the same fixed format: Verdict GREEN · what I understood · the slice (`billingPeriod`) · why · commands + exit codes · verification (13/13, tsc/lint/build 0, controlled + unplanned defects caught) · risks · needs-Gev (ledger + contract flip). Same format, a non-UI artifact — evidence the report structure is domain-agnostic. / Code slice-ի delivery-ն օգտագործեց նույն ֆորմատը՝ ոչ-UI artifact-ով, ապացույց որ struct-ը domain-agnostic է։

End of the loop. Evidence, decision, failure, and success-metric are sealed to the ledgers (`memory/_evidence/`, `memory/_decisions/`, `memory/_failures/`). / Loop-ի վերջ։ Evidence/decision/failure/success-metric-ը կնքվում են ledger-ներում։
