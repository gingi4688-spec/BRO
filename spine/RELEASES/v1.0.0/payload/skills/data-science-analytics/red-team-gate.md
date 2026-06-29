# Data Science and Analytics red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (analysis plan, experiment readout, metric diagnostic, causal caveat memo, classifier threshold sheet). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **p-value treated as truth** — p read as "probability the null is true," or p<0.05 as "proven," or p>0.05 as "no effect." Require the effect size, the power/MDE, and the correct definition of p.
- **CI misread as a probability about the realized interval** — "95% chance the true value is in [a, b]." Require it restated as coverage of the procedure.
- **Peeking / optional stopping** — a result "called" early from repeated looks at fixed α. Require a valid sequential method (alpha-spending / group-sequential / always-valid) or re-evaluation at the planned N.
- **Multiple comparisons uncorrected** — a winner picked from a family of arms/metrics with no Bonferroni/Holm/BH. Require the family stated and the correction applied.
- **MVT interaction ignored or underpowered** — a multivariate test read as independent main effects, or an interaction claimed on a design with no power for it. Require a full-factorial design with a powered interaction term, or a main-effects-only disclaimer.
- **Correlation sold as causation** — a causal claim from non-randomized data with no identification strategy. Require confounders + a strategy (DiD/matching/IV), or a downgrade to descriptive/predictive.
- **Underpowered null read as "no effect"** — a non-significant result from an underpowered design treated as proof of no difference. Require the MDE and the "inconclusive" label.
- **Metric autopsy skipped** — a causal story for a KPI move with no check of definition/denominator/instrumentation/mix. Require the autopsy before the attribution.
- **AUC optimized while threshold economics ignored** — a model shipped on global AUC with no PR/calibration/error-cost at the operating threshold. Require the threshold sheet.
- **Invented numbers** — a p-value, sample size, conversion rate, or CI with no derivation. Require it computed from inputs or marked unknown.

### Reviewer probes (ask these of any answer)

- What is the estimand — the effect, the population, the window, the counterfactual, the decision threshold — and is the claim descriptive, predictive, or causal?
- Show the uncertainty math: what is the CI on the *effect*, and is it stated as coverage of the procedure rather than a probability about this interval?
- Is the result distinguishable from zero *and* above the business decision threshold? If significant but below threshold, why is that not a non-ship?
- Was the experiment looked at before the planned N? If so, what sequential method (alpha-spending / group-sequential / always-valid) protects the false-positive rate, or is this peeking?
- How many arms/metrics are in the family, and what multiple-testing correction (Holm / Benjamini–Hochberg) was applied? Is the "winner" still significant after correction?
- If this is a multivariate test, are interactions in scope, is the design full-factorial, and is the interaction term powered — or is it (correctly) reported as main effects only?
- For a causal claim from non-randomized data: what are the confounders, what is the identification strategy, is the parallel-trends (or matching) assumption checked, and was Simpson's-paradox segmentation done?
- For a KPI move: was the metric autopsy (definition, denominator, instrumentation, mix, seasonality, missingness) run before any causal story?
- For a classifier: is it judged at the operating threshold (PR, calibration, error costs), or only on global AUC under imbalance?
- Did the answer invent any p-value, sample size, conversion rate, or CI, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (analysis plan, experiment readout, metric diagnostic, causal caveat memo, classifier threshold sheet)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **p-value՝ որպես ճշմարտություն** — p-ն կարդացված «null-ը true լինելու հավանականություն», կամ p<0.05՝ «ապացուցված», կամ p>0.05՝ «no effect»։ Պահանջիր effect size-ը, power/MDE-ն և p-ի ճիշտ սահմանումը։
- **CI՝ realized interval-ի մասին հավանականություն կարդացված** — «95% chance true value-ն [a, b]-ում է»։ Պահանջիր վերաձևակերպել որպես procedure-ի coverage։
- **Peeking / optional stopping** — արդյունք «called» early՝ fixed α-ով կրկնվող look-երից։ Պահանջիր վավեր sequential method (alpha-spending / group-sequential / always-valid) կամ վերագնահատում պլանավորված N-ին։
- **Multiple comparison-ը uncorrected** — winner ընտրված arm/metric-ների family-ից առանց Bonferroni/Holm/BH-ի։ Պահանջիր family-ն նշված և correction-ը կիրառված։
- **MVT interaction-ը անտեսված կամ underpowered** — multivariate test կարդացված որպես անկախ main effect, կամ interaction պնդված design-ի վրա, որ power չունի դրա համար։ Պահանջիր full-factorial design՝ powered interaction term-ով, կամ main-effects-only disclaimer։
- **Correlation-ը՝ causation վաճառված** — causal claim non-randomized data-ից առանց identification strategy-ի։ Պահանջիր confounder + strategy (DiD/matching/IV), կամ իջեցում descriptive/predictive-ի։
- **Underpowered null՝ «no effect» կարդացված** — non-significant արդյունք underpowered design-ից՝ համարված տարբերության բացակայության ապացույց։ Պահանջիր MDE-ն և «inconclusive» label-ը։
- **Metric autopsy-ն բաց թողնված** — causal story KPI move-ի համար առանց definition/denominator/instrumentation/mix ստուգման։ Պահանջիր autopsy-ն attribution-ից առաջ։
- **AUC-ն optimize արված, threshold-ի economics-ը անտեսված** — model ship արված global AUC-ով՝ առանց PR/calibration/error-cost-ի operating threshold-ին։ Պահանջիր threshold sheet-ը։
- **Հորինված թվեր** — p-value, sample size, conversion rate կամ CI՝ առանց derivation-ի։ Պահանջիր հաշված input-ից կամ նշված unknown։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ո՞րն է estimand-ը — effect-ը, population-ը, window-ը, counterfactual-ը, decision threshold-ը — և claim-ը descriptive է, predictive, թե causal։
- Ցույց տուր uncertainty math-ը․ ո՞րն է CI-ն *effect*-ի վրա, և ներկայացված է՞ որպես procedure-ի coverage, ոչ թե այս interval-ի մասին հավանականություն։
- Արդյունքը զրոյից տարբերելի՞ է *և* բիզնես decision threshold-ից վեր։ Եթե significant է, բայց threshold-ից ցածր, ինչու՞ դա non-ship չէ։
- Փորձին նայե՞լ են նախքան պլանավորված N-ը։ Եթե այո, ի՞նչ sequential method (alpha-spending / group-sequential / always-valid) է պաշտպանում false-positive rate-ը, թե սա peeking է։
- Քանի՞ arm/metric է family-ում, և ի՞նչ multiple-testing correction (Holm / Benjamini–Hochberg) կիրառվեց։ «Winner»-ը correction-ից հետո դեռ significant է՞։
- Եթե սա multivariate test է, interaction-ները scope-ո՞ւմ են, design-ը full-factorial է՞, և interaction term-ը powered է՞ — թե (ճիշտ կերպով) ներկայացված է որպես միայն main effect։
- Non-randomized data-ից causal claim-ի համար․ ո՞րն են confounder-ները, ո՞րն է identification strategy-ն, parallel-trends (կամ matching) assumption-ը ստուգվա՞ծ է, և Simpson-ի paradox-ի segmentation արվե՞ց։
- KPI move-ի համար․ metric autopsy-ն (definition, denominator, instrumentation, mix, seasonality, missingness) արվե՞ց ցանկացած causal story-ից առաջ։
- Classifier-ի համար․ դատվու՞մ է operating threshold-ով (PR, calibration, error cost), թե միայն global AUC-ով imbalance-ի տակ։
- Պատասխանը հորինե՞ց որևէ p-value, sample size, conversion rate կամ CI, և հայերենը equal-depth ու punctuation-clean է՞։
