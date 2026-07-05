---
name: "data-science-analytics"
description: >-
  use when the work is statistical inference, A/B and multivariate experiment design and readout, causal/observational diagnosis, metric and KPI investigation, classification/model evaluation and thresholding, or turning an uncertain business question into measurable evidence — for decisions, critique, planning, diagnostics, artifacts, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (analysis plan, experiment readout, metric diagnostic, causal caveat memo). do not use as lead when another skill owns the main artifact and the statistics are only one input — then support it. հայերեն՝ օգտագործիր վիճակագրական եզրակացության, A/B և multivariate փորձերի, պատճառային/observational ախտորոշման, metric-ի հետաքննության և classifier-ի գնահատման աշխատանքի համար։
---

# Data Science and Analytics / Տվյալագիտություն և վերլուծություն

## English

**Scope.** In: hypothesis testing and the meaning of p-values, confidence intervals, power/MDE; A/B and multivariate (MVT) experiment design, interaction effects, multiple-testing correction, sequential testing and peeking control; causal and observational diagnosis (confounders, identification strategy, DiD, CUPED, selection effects); metric/KPI autopsy (definition, denominator, instrumentation, mix, seasonality, missingness); classification evaluation (ROC-AUC vs PR, calibration, threshold economics); turning an uncertain business question into a measurable comparison with honest uncertainty. Out: the data pipeline/warehouse build (data-engineering owns it), the product/business decision itself (strategy owns the call; this skill supplies the evidence and its limits), and ML model training/serving infrastructure beyond evaluation (ML-engineering owns it). This skill converts uncertain questions into estimands, evidence, and decision limits — without claiming more than the data can prove.

**Leads / Supports.** Lead when the central deliverable is evidence-shaped: an analysis plan, an experiment readout, a metric diagnostic, a causal caveat memo, a classifier threshold sheet. Support when another skill owns the artifact and the statistics are one input — e.g. strategy owns the launch decision and you supply the experiment readout with its MDE and uncertainty; data-engineering owns the pipeline and you supply the metric-definition audit that says the denominator changed.

Conflict rules:
- **Business decision → supply evidence, do not make the call alone.** You own the estimand, the effect size, the uncertainty, and the decision threshold math; whether to launch given a $0.3M revenue bet sits with the business/strategy owner. State what the data does and does not license, then hand the decision over.
- **Significance vs business value → the effect size and threshold arbitrate, not the p-value.** When "is it significant?" collides with "does it matter?", do not let a star next to p<0.05 decide. A statistically significant 0.1-point lift below the decision threshold is a non-launch; a non-significant result that the design was underpowered to detect is "inconclusive," not "no effect."
- **Pipeline/instrumentation overlaps → defer the build to data-engineering.** You own the diagnosis that a metric's denominator or event instrumentation changed; the fix to the ETL/event schema routes to `data-engineering-pipelines`.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Question is fuzzy → name the estimand first.** Pin the effect, the population, the time window, the counterfactual, and the decision threshold before touching a number. "Did it work?" is not an estimand.
2. **Claim type unstated → label it descriptive / predictive / causal.** The bar for each differs: a causal claim needs an identification strategy (randomization, DiD, matched comparison); a descriptive one does not, and must not be dressed as causal.
3. **Every statistic reported → attach definition + assumption + decision use.** A p-value, CI, or AUC with no effect size and no decision attached is decoration. Pair the p-value with the effect size and the threshold it informs.
4. **Reporting an interval → state it as coverage, not as a probability about this interval.** A 95% CI is a procedure that covers the true parameter in 95% of repeated samples under its assumptions; it is NOT a 95% probability that the true value lies in this realized interval. Do not regress to the misinterpretation.
5. **Designing a test → fix α, power, MDE, and the peeking rule before launch.** Compute the minimum detectable effect and say plainly which effects the design cannot see, so a null is read as "inconclusive," not "no effect."
6. **More than one variant or metric → correct for multiple testing.** k comparisons at α=0.05 inflate the family-wise false-positive rate (~1−0.95^k). Control FWER (Bonferroni/Holm) or FDR (Benjamini–Hochberg) and say which, on which family.
7. **Multivariate test (MVT) → pre-declare whether interactions are in scope.** If factors may interact, a full-factorial MVT with an interaction term is required; an isolated-factor MVT will mis-attribute a combined effect. Power for the interaction, not just the main effects — interactions need far more N.
8. **Anyone peeking at results early → use a valid sequential method, not naive repeated tests.** Repeated looks at fixed α=0.05 drive the real false-positive rate well above 5%. Use alpha-spending (O'Brien–Fleming / Pocock), a group-sequential design, or always-valid p-values; a naive "it's significant now, stop" is p-hacking.
9. **A KPI moved and a causal story is wanted → run a metric autopsy before attribution.** Check definition, denominator, instrumentation, population mix, seasonality, and missingness first. A denominator change masquerading as a behavior change is the most common false story.
10. **Observational data, no randomization → state confounders + identification strategy or refuse the causal claim.** Name the plausible confounders, the selection effect, and the estimand; if none of DiD / matching / IV / a natural experiment is defensible, report it as descriptive/predictive only.
11. **Classifier looks good by AUC but acts badly → judge it at the operating threshold, not globally.** Under class imbalance, ROC-AUC can be high while precision at the deployed threshold is poor. Use the PR curve, pick the threshold from error costs, and check calibration.
12. **Sample size is small or effect is tiny → quantify uncertainty, don't round it away.** Report the CI on the effect; a point estimate with no interval hides whether the result is even distinguishable from zero.
13. **Result is "inconclusive" → say so explicitly and state the MDE.** Underpowered ≠ no effect. Name the smallest effect the design could detect and what N would be needed to resolve it.
14. **Asked for a number not in the inputs → compute it or label it unknown; never invent.** Do not fabricate p-values, sample sizes, conversion rates, or CIs. Derive from given inputs, or mark the gap and say what data is needed.
15. **Before finalizing → verify the analysis is reproducible.** Another analyst, given the same data and the stated method, must reach the same numbers. State the method precisely enough to be re-run, not just the conclusion.

### Failure modes to prevent / Ձախողման ձևեր

1. **p-value treated as truth.** Reading p as "probability the null is true," or p<0.05 as "proven," or p>0.05 as "no effect." Tell: a conclusion stated from a p-value with no effect size and no power statement.
2. **CI misinterpreted as a probability about the realized interval.** "There is a 95% chance the true lift is in [0.0003, 0.0157]." Tell: a probability claim about one computed interval instead of coverage of the procedure.
3. **Peeking / optional stopping.** Watching the dashboard and stopping the moment p dips below 0.05. Tell: an experiment "called" early with no alpha-spending, group-sequential plan, or always-valid p-value — the real false-positive rate is far above 5%.
4. **Multiple comparisons uncorrected.** Twenty metrics or five variants tested at α=0.05 and the one "winner" celebrated. Tell: a significant result picked from a family with no Bonferroni/Holm/BH correction and no stated family.
5. **MVT interaction ignored.** A multivariate test reported as independent main effects when the factors interact, or an interaction claimed on a design with no power for it. Tell: combined-effect attribution with no interaction term, or an interaction read off an underpowered cell.
6. **Underpowered null read as "no effect."** A non-significant result from a design that could never have detected the effect, reported as proof of no difference. Tell: a null conclusion with no MDE and no power calculation.
7. **Correlation sold as causation.** An observational association presented as a causal effect with no identification strategy. Tell: a "X caused Y" claim from non-randomized data with no confounder list and no DiD/matching/IV.
8. **Simpson's paradox / confounded aggregate.** A pooled result that reverses or vanishes within segments because of a confound or a mix shift. Tell: a headline aggregate with no segment/confounder check and a changing population mix.
9. **Metric autopsy skipped.** A causal story told for a KPI move that was actually a denominator, instrumentation, or definition change. Tell: an attribution with no check of definition/denominator/instrumentation/mix/seasonality.
10. **AUC optimized while threshold economics ignored.** A model shipped on a strong global AUC while precision/recall at the deployed threshold and the cost of each error type are never computed. Tell: a model "good" by AUC with no PR curve, no calibration, no error-cost threshold.
11. **Survivorship / selection bias.** Analyzing only the units that remained (active users, surviving funds, completed orders) and generalizing to all. Tell: a conclusion drawn from a filtered population with the dropped units never characterized.
12. **Invented or back-filled numbers.** A p-value, sample size, or CI stated that was never in the inputs and never computed. Tell: a precise statistic with no derivation and no source.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (analysis plan / experiment readout / metric diagnostic / causal caveat memo / classifier threshold sheet), not generic advice.
- Every statistic is defined, paired with an effect size, and attached to a decision; the CI is stated as coverage, not as a probability about the realized interval.
- Experiments fix α, power, MDE, and a peeking rule; multiple variants/metrics carry a stated multiple-testing correction; sequential looks use a valid method (alpha-spending / group-sequential / always-valid).
- Causal claims from non-randomized data name confounders and an identification strategy, or are reported as descriptive/predictive only.
- Classifier work judges the operating threshold (PR, calibration, error costs), not just global AUC.
- No invented p-values, sample sizes, conversion rates, or CIs; every number traces to an input or a shown computation.
- **The analysis is reproducible** — method stated precisely enough that another analyst reaches the same numbers from the same data.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled; "inconclusive" used honestly where the design is underpowered.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **estimand clarity** (effect, population, window, counterfactual, decision threshold explicit) · **uncertainty math** (p-value, CI-as-coverage, power/MDE, effect size, multiple-testing and sequential correctness) · **causal discipline** (confounders, identification strategy, limits of inference concrete) · **metric operations** (definition, denominator, instrumentation, missingness, mix, freshness audited) · **decision usefulness** (action, threshold, uncertainty, guardrail, next data collection stated).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, MVT/multiple-testing/sequential mechanisms) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (experiment readout + causal/observational diagnosis) · `output-templates.md` (analysis plan / experiment readout / metric diagnostic) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ hypothesis testing-ը և p-value-ի իմաստը, confidence interval-ները, power/MDE. A/B և multivariate (MVT) փորձի դիզայն, interaction effect-եր, multiple-testing correction, sequential testing և peeking-ի վերահսկում. պատճառային և observational ախտորոշում (confounder-ներ, identification strategy, DiD, CUPED, selection effect). metric/KPI autopsy (definition, denominator, instrumentation, mix, seasonality, missingness). classification-ի գնահատում (ROC-AUC ընդդեմ PR, calibration, threshold-ի economics). անորոշ բիզնես հարցը չափելի համեմատության վերածելը՝ ազնիվ uncertainty-ով։ Դուրս՝ data pipeline-ի/warehouse-ի կառուցումը (data-engineering-ինն է), բիզնես որոշումն ինքը (strategy-ն է որոշում. այս skill-ը տալիս է evidence-ը և նրա սահմանները), և ML model-ի training/serving infrastructure-ը գնահատումից այն կողմ (ML-engineering-ինն է)։ Այս skill-ը անորոշ հարցերը վերածում է estimand-ի, evidence-ի և որոշման սահմանների՝ առանց ավելին պնդելու, քան data-ն կարող է ապացուցել։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը evidence ձև ունի՝ analysis plan, experiment readout, metric diagnostic, causal caveat memo, classifier threshold sheet։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ վիճակագրությունը մեկ input է. օրինակ՝ strategy-ն տիրում է launch-ի որոշմանը, դու տալիս ես experiment readout-ը՝ MDE-ով և uncertainty-ով. data-engineering-ը տիրում է pipeline-ին, դու տալիս ես metric-definition audit-ը, որ ասում է՝ denominator-ը փոխվել է։

Կոնֆլիկտի կանոններ․
- **Բիզնես որոշում → տուր evidence-ը, մենակ որոշումը մի՛ կայացրու։** Դու տիրում ես estimand-ին, effect size-ին, uncertainty-ին և decision threshold-ի հաշվին. արդյոք launch անել $0.3M revenue խաղադրույքի դեպքում՝ բիզնես/strategy-ի տիրոջն է։ Ասա՛, թե data-ն ինչ է թույլ տալիս և ինչ՝ ոչ, հետո որոշումը հանձնիր։
- **Significance ընդդեմ business value → որոշում են effect size-ը և threshold-ը, ոչ p-value-ը։** Երբ «նշանակալի՞ է»-ն բախվում է «կարևո՞ր է»-ի հետ, թող p<0.05-ի աստղը չորոշի։ Statistically significant 0.1-point lift-ը decision threshold-ից ներքև non-launch է. non-significant արդյունքը, որը design-ը underpowered էր նկատելու, «inconclusive» է, ոչ «no effect»։
- **Pipeline/instrumentation համընկնում → կառուցումը զիջիր data-engineering-ին։** Դու տիրում ես այն diagnosis-ին, որ metric-ի denominator-ը կամ event instrumentation-ը փոխվել է. ETL/event schema-ի fix-ը ուղղորդվում է `data-engineering-pipelines`-ին։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Հարցը մշուշոտ է → նախ անվանի՛ր estimand-ը։** Ամրացրու effect-ը, population-ը, time window-ը, counterfactual-ը և decision threshold-ը՝ նախքան թվին դիպչելը։ «Աշխատե՞ց» estimand չէ։
2. **Claim-ի տեսակը չասված է → label արա descriptive / predictive / causal։** Ամեն մեկի նշաձողը տարբեր է. causal claim-ին պետք է identification strategy (randomization, DiD, matched comparison). descriptive-ին՝ ոչ, և այն չպետք է causal-ի հագուստ հագնի։
3. **Ամեն statistic ներկայացված է → կցի՛ր definition + assumption + decision use։** p-value, CI կամ AUC՝ առանց effect size-ի և առանց կցված որոշման, դեկորացիա է։ p-value-ը զուգիր effect size-ի և այն threshold-ի հետ, որ սնում է։
4. **Interval ես ներկայացնում → ասա այն coverage-ով, ոչ թե այս interval-ի մասին հավանականությամբ։** 95% CI-ն procedure է, որ repeated sample-ների 95%-ում ծածկում է true parameter-ը՝ իր assumption-ների տակ. այն ԱՅՍ realized interval-ում true value-ի «95% հավանականություն» ՉԷ։ Մի՛ regress արա դեպի սխալ մեկնաբանությունը։
5. **Test ես նախագծում → ամրացրու α, power, MDE և peeking rule-ը մինչև launch-ը։** Հաշվիր minimum detectable effect-ը և ասա բացահայտ, թե որ effect-ները design-ը չի կարող տեսնել, որ null-ը կարդացվի «inconclusive», ոչ «no effect»։
6. **Մեկից ավելի variant կամ metric → correct արա multiple testing-ի համար։** k համեմատությունը α=0.05-ով ուռճացնում է family-wise false-positive rate-ը (~1−0.95^k)։ Control արա FWER (Bonferroni/Holm) կամ FDR (Benjamini–Hochberg) և ասա՛ որը, որ family-ի վրա։
7. **Multivariate test (MVT) → նախապես հայտարարիր՝ interaction-ները scope-ո՞ւմ են։** Եթե factor-ները կարող են interact անել, պետք է full-factorial MVT՝ interaction term-ով. isolated-factor MVT-ն սխալ կվերագրի համակցված effect-ը։ Power արա interaction-ի համար, ոչ միայն main effect-ի — interaction-ին շատ ավելի մեծ N է պետք։
8. **Որևէ մեկը early նայում է արդյունքին → օգտագործիր վավեր sequential method, ոչ naive կրկնվող test։** Fixed α=0.05-ով կրկնվող look-երը իրական false-positive rate-ը բարձրացնում են 5%-ից շատ վեր։ Օգտագործիր alpha-spending (O'Brien–Fleming / Pocock), group-sequential design կամ always-valid p-value. naive «հիմա significant է, կանգնի՛ր»-ը p-hacking է։
9. **KPI շարժվեց և causal պատմություն են ուզում → նախ metric autopsy արա, հետո attribution։** Նախ ստուգիր definition, denominator, instrumentation, population mix, seasonality և missingness։ Denominator-ի փոփոխությունը՝ որպես behavior change ներկայացված, ամենահաճախ կեղծ պատմությունն է։
10. **Observational data, randomization չկա → ասա confounder + identification strategy կամ հրաժարվիր causal claim-ից։** Անվանի՛ր հավանական confounder-ները, selection effect-ը և estimand-ը. եթե ոչ DiD, ոչ matching, ոչ IV, ոչ natural experiment պաշտպանելի չէ, ներկայացրու որպես միայն descriptive/predictive։
11. **Classifier-ը AUC-ով լավ է, բայց վատ է գործում → դատիր operating threshold-ով, ոչ global-ով։** Class imbalance-ի դեպքում ROC-AUC-ը կարող է բարձր լինել, մինչ deployed threshold-ի precision-ը վատ է։ Օգտագործիր PR curve, ընտրիր threshold-ը error cost-երից, ստուգիր calibration-ը։
12. **Sample size-ը փոքր է կամ effect-ը՝ փոքր → quantify արա uncertainty-ն, մի՛ կլորացրու։** Ներկայացրու CI-ն effect-ի վրա. point estimate առանց interval-ի թաքցնում է՝ արդյունքը զրոյից տարբերվում է, թե ոչ։
13. **Արդյունքը «inconclusive» է → ասա բացահայտ և նշիր MDE-ն։** Underpowered ≠ no effect։ Անվանի՛ր ամենափոքր effect-ը, որ design-ը կարող էր տեսնել, և ինչ N կպահանջվեր լուծելու համար։
14. **Խնդրում են թիվ, որ input-ում չկա → հաշվիր կամ label արա unknown. երբեք մի՛ հորինիր։** Մի՛ ֆաբրիկացրու p-value, sample size, conversion rate կամ CI։ Բխեցրու տրված input-ից, կամ նշիր բացը և ասա ինչ data է պետք։
15. **Մինչ վերջնականացումը → ստուգիր, որ վերլուծությունը reproducible է։** Մեկ այլ analyst, նույն data-ով և նշված method-ով, պետք է հասնի նույն թվերին։ Ասա method-ը այնքան ճշգրիտ, որ կարելի լինի re-run անել, ոչ միայն conclusion-ը։

### Ձախողման ձևեր

1. **p-value՝ որպես ճշմարտություն ընդունված։** p-ն կարդալ «null-ը true լինելու հավանականություն», կամ p<0.05՝ «ապացուցված», կամ p>0.05՝ «no effect»։ Tell՝ conclusion p-value-ից՝ առանց effect size-ի և power statement-ի։
2. **CI՝ որպես realized interval-ի մասին հավանականություն մեկնաբանված։** «95% հավանականություն կա, որ true lift-ը [0.0003, 0.0157]-ում է»։ Tell՝ հավանականության պնդում մեկ հաշված interval-ի մասին՝ procedure-ի coverage-ի փոխարեն։
3. **Peeking / optional stopping։** Dashboard-ին նայել և կանգնել այն պահին, երբ p-ն ընկնում է 0.05-ից ներքև։ Tell՝ փորձ, որ «called» է early՝ առանց alpha-spending-ի, group-sequential plan-ի կամ always-valid p-value-ի — իրական false-positive rate-ը 5%-ից շատ վեր է։
4. **Multiple comparison-ը uncorrected։** Քսան metric կամ հինգ variant test արված α=0.05-ով, և մեկ «winner»-ը տոնված։ Tell՝ significant արդյունք՝ ընտրված family-ից առանց Bonferroni/Holm/BH correction-ի և առանց նշված family-ի։
5. **MVT interaction-ը անտեսված։** Multivariate test, որ ներկայացված է որպես անկախ main effect-եր, մինչ factor-ները interact են անում, կամ interaction պնդված design-ի վրա, որ power չունի դրա համար։ Tell՝ համակցված-effect attribution առանց interaction term-ի, կամ interaction՝ կարդացված underpowered cell-ից։
6. **Underpowered null՝ որպես «no effect» կարդացված։** Non-significant արդյունք design-ից, որ երբեք չէր կարող effect-ը նկատել, ներկայացված որպես տարբերության բացակայության ապացույց։ Tell՝ null conclusion՝ առանց MDE-ի և power calculation-ի։
7. **Correlation-ը՝ որպես causation վաճառված։** Observational association ներկայացված որպես causal effect՝ առանց identification strategy-ի։ Tell՝ «X-ը պատճառեց Y» claim՝ non-randomized data-ից առանց confounder ցուցակի և առանց DiD/matching/IV-ի։
8. **Simpson-ի paradox / confounded aggregate։** Pooled արդյունք, որ հակադարձվում կամ անհետանում է segment-ների ներսում՝ confound-ի կամ mix shift-ի պատճառով։ Tell՝ headline aggregate՝ առանց segment/confounder ստուգման և փոփոխվող population mix-ով։
9. **Metric autopsy-ն բաց թողնված։** Causal պատմություն, որ պատմվում է KPI move-ի համար, որն իրականում denominator-ի, instrumentation-ի կամ definition-ի փոփոխություն էր։ Tell՝ attribution՝ առանց definition/denominator/instrumentation/mix/seasonality ստուգման։
10. **AUC-ն optimize արված, threshold-ի economics-ը անտեսված։** Model ship արված ուժեղ global AUC-ով, մինչ deployed threshold-ի precision/recall-ը և ամեն error-ի cost-ը երբեք չեն հաշվվում։ Tell՝ model «լավ» AUC-ով՝ առանց PR curve-ի, calibration-ի, error-cost threshold-ի։
11. **Survivorship / selection bias։** Վերլուծել միայն մնացած unit-ները (active user, surviving fund, completed order) և ընդհանրացնել բոլորին։ Tell՝ conclusion՝ ֆիլտրված population-ից, dropped unit-ները երբեք չբնութագրված։
12. **Հորինված կամ back-filled թվեր։** p-value, sample size կամ CI ներկայացված, որ երբեք input-ում չկար և երբեք չհաշվվեց։ Tell՝ ճշգրիտ statistic՝ առանց derivation-ի և source-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (analysis plan / experiment readout / metric diagnostic / causal caveat memo / classifier threshold sheet), ոչ generic advice։
- Ամեն statistic սահմանված է, զուգված effect size-ի հետ և կցված որոշման. CI-ն ներկայացված է որպես coverage, ոչ որպես realized interval-ի մասին հավանականություն։
- Փորձերը ամրացնում են α, power, MDE և peeking rule. մի քանի variant/metric կրում են նշված multiple-testing correction. sequential look-երը օգտագործում են վավեր method (alpha-spending / group-sequential / always-valid)։
- Non-randomized data-ից causal claim-ները անվանում են confounder և identification strategy, կամ ներկայացված են որպես միայն descriptive/predictive։
- Classifier-ի աշխատանքը դատում է operating threshold-ը (PR, calibration, error cost), ոչ միայն global AUC-ը։
- Ոչ մի հորինված p-value, sample size, conversion rate կամ CI. ամեն թիվ հետ է գնում input-ի կամ ցույց տրված computation-ի։
- **Վերլուծությունը reproducible է** — method-ը նշված այնքան ճշգրիտ, որ մեկ այլ analyst նույն data-ից հասնի նույն թվերին։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված. «inconclusive»-ը ազնվորեն կիրառված, որտեղ design-ը underpowered է։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **estimand-ի հստակություն** (effect, population, window, counterfactual, decision threshold բաց) · **uncertainty math** (p-value, CI-as-coverage, power/MDE, effect size, multiple-testing և sequential ճշտություն) · **causal կարգապահություն** (confounder, identification strategy, inference-ի սահմաններ կոնկրետ) · **metric operations** (definition, denominator, instrumentation, missingness, mix, freshness audit արված) · **որոշման օգտակարություն** (action, threshold, uncertainty, guardrail, հաջորդ data collection նշված)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, MVT/multiple-testing/sequential մեխանիզմներ) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (experiment readout + պատճառային/observational ախտորոշում) · `output-templates.md` (analysis plan / experiment readout / metric diagnostic) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
