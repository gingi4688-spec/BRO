# Cybersecurity Operations and SOC domain rubric

## English

Use this rubric before finalizing a triage note, detection rule, severity call, IR/containment plan, eradication runbook, log-source map, or post-incident review. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Technique mapping | Alert name only. | Tactic named. | Technique, tactic, confirming data sources, expected next behavior, and response action are mapped; mapping changes collection/detection/response. |
| Detection logic | Vague suspiciousness. | A threshold exists. | Logic, fields, threshold, the log source it runs on, a TP case, an FP case, and a tuning dimension are concrete; new rules bake silent/log-only first. |
| Severity reasoning | Everything is critical. | Impact noted. | Impact and confidence are scored separately and drive the tier, owner, and next evidence; low confidence blocks destructive action. |
| IR & eradication | "Removed the malware." | Contain → eradicate named. | Sequence is detection→containment→eradication→recovery; evidence preserved before destructive steps; credential/persistence scope, reimage-vs-clean, krbtgt-double-reset/AD-tier-0 and firmware addressed where relevant; legal/breach routing named. |
| Metrics & collection | No metrics; logs assumed. | MTTD/MTTR named. | MTTD, MTTR, dwell, and FP rate are defined and segmented by detection type; log-source coverage and retention are mapped, and gaps become collection requests. |

## Հայերեն

Այս rubric-ը կիրառիր triage note, detection rule, severity call, IR/containment plan, eradication runbook, log-source map կամ post-incident review վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Technique mapping | Միայն alert name է։ | Tactic-ը նշված է։ | Technique-ը, tactic-ը, հաստատող data source-ները, սպասվող հաջորդ behavior-ը և response action-ը քարտեզագրված են. mapping-ը փոխում է collection/detection/response։ |
| Detection logic | Vague suspiciousness է։ | Threshold կա։ | Logic-ը, field-երը, threshold-ը, log source-ը, որի վրա run է, TP case, FP case և tuning dimension կոնկրետ են. նոր rule-ները նախ bake են silent/log-only։ |
| Severity reasoning | Ամեն ինչ critical է։ | Impact նշված է։ | Impact-ը և confidence-ը առանձին են score-ված և շարժում են tier-ը, owner-ը և next evidence-ը. ցածր confidence-ը block է անում destructive action-ը։ |
| IR & eradication | «Malware-ը հանեցինք»։ | Contain → eradicate նշված է։ | Հերթականությունը՝ detection→containment→eradication→recovery. ապացույցը պահպանված մինչ destructive քայլերը. credential/persistence scope, reimage-ընդդեմ-clean, krbtgt-double-reset/AD-tier-0 և firmware անդրադարձված, որտեղ տեղին է. legal/breach routing անվանված։ |
| Metrics & collection | Metric չկա. log-երը ենթադրված։ | MTTD/MTTR նշված են։ | MTTD, MTTR, dwell և FP rate-ը սահմանված և segment-ված են detection type-ով. log-source coverage-ը և retention-ը քարտեզագրված, և gap-երը դառնում են collection request։ |
