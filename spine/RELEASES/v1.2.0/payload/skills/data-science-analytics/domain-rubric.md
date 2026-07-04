# Data Science and Analytics domain rubric

## English

Use this rubric before finalizing an analysis plan, experiment readout, metric diagnostic, causal caveat memo, or classifier threshold sheet. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Estimand clarity | Question is "what happened?" only. | Metric and segment are named. | Effect, population, window, counterfactual, and decision threshold are all explicit. |
| Uncertainty math | No interval or p-value meaning. | CI or p-value appears but is loosely read. | p-value, CI-as-coverage (not a probability about the realized interval), power/MDE, effect size are correct; multiple variants/metrics carry a stated multiple-testing correction and any early look uses a valid sequential method. |
| Causal discipline | Correlation becomes causation. | A caveat is mentioned. | Confounders, an identification strategy (DiD/matching/IV/natural experiment with its assumption checked), Simpson's-paradox segment check, and the limits of inference are concrete. |
| Metric operations | Trusts dashboard face value. | Checks the definition. | Audits definition, denominator, instrumentation, missingness, population mix, and freshness before any attribution. |
| Decision usefulness | Ends with an insight. | Offers a recommendation. | States the action, the threshold, the uncertainty, the guardrail, and the next data collection; an underpowered result is called "inconclusive," not "no effect." |

## Հայերեն

Այս rubric-ը կիրառիր analysis plan, experiment readout, metric diagnostic, causal caveat memo կամ classifier threshold sheet-ը վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Estimand-ի հստակություն | Հարցը միայն «ինչ եղավ» է։ | Metric-ը և segment-ը նշված են։ | Effect-ը, population-ը, window-ը, counterfactual-ը և decision threshold-ը բոլորը բաց են։ |
| Uncertainty math | Interval կամ p-value-ի իմաստ չկա։ | CI կամ p-value կա, բայց սխալ է կարդացվում։ | p-value, CI-as-coverage (ոչ realized interval-ի մասին հավանականություն), power/MDE, effect size ճիշտ են. մի քանի variant/metric կրում են նշված multiple-testing correction, և ցանկացած early look օգտագործում է վավեր sequential method։ |
| Causal կարգապահություն | Correlation-ը դառնում է causation։ | Caveat կա, բայց թույլ է։ | Confounder-ները, identification strategy-ն (DiD/matching/IV/natural experiment՝ ստուգված assumption-ով), Simpson-ի paradox-ի segment ստուգումը և inference-ի սահմանները կոնկրետ են։ |
| Metric operations | Dashboard-ի թիվը վերցնում է անմիջապես։ | Definition-ը ստուգում է։ | Audit է անում definition, denominator, instrumentation, missingness, population mix և freshness՝ ցանկացած attribution-ից առաջ։ |
| Որոշման օգտակարություն | Ավարտվում է insight-ով։ | Recommendation կա։ | Կա action, threshold, uncertainty, guardrail և հաջորդ data collection. underpowered արդյունքը անվանվում է «inconclusive», ոչ «no effect»։ |
