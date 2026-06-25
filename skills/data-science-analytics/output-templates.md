# Data Science and Analytics output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every number traceable to an input or a shown computation. Do not invent p-values, sample sizes, conversion rates, or CIs.

### Template 1 — Analysis plan (pre-registration)

- **Decision to unblock:** what choice this analysis informs, and the decision threshold (the effect size that flips the decision)
- **Estimand:** the effect, the population, the time window, the counterfactual
- **Claim type:** descriptive | predictive | causal — and, if causal, the identification strategy (randomization / DiD / matching / IV)
- **Primary metric & guardrail metrics:** exact definitions (good events / valid events; denominator)
- **Design:** unit of randomization; A/B or multivariate (if MVT, whether interactions are in scope and powered)
- **α, power, MDE, required N:** the smallest effect the design can detect, stated plainly
- **Multiple-testing plan:** the family (which arms/metrics) and the correction (Holm / Benjamini–Hochberg)
- **Stopping / peeking rule:** fixed-horizon, or the sequential method (alpha-spending O'Brien–Fleming/Pocock, group-sequential, or always-valid)
- **Decision rule:** what result ships, what is inconclusive, what reverts
- **Assumptions & unknowns:** labeled; what data is missing
- **Acceptance:** estimand explicit · MDE stated · correction + stopping rule pre-declared · reproducible method

### Template 2 — Experiment readout

- **Estimand & decision threshold:** restated from the plan
- **Observed effect:** point estimate, with the arithmetic (rates → difference)
- **Uncertainty:** SE (formula shown) and the CI on the effect — **stated as coverage, not as a probability about this interval**
- **Significance vs value:** is it distinguishable from zero, and is it above the business decision threshold (these can disagree)
- **Peeking check:** was the stopping rule honored; if looks were taken, was a valid sequential boundary used
- **Multiplicity check:** the family of metrics/arms and the correction applied; raw vs corrected significance
- **Guardrails:** did any guardrail metric regress
- **Verdict:** ship | do not ship | **inconclusive at MDE** (never "no effect" for an underpowered null) — and the next step (run to N, re-run powered, etc.)
- **Acceptance:** numbers derived not asserted · CI as coverage · peeking + multiplicity addressed · verdict tied to the threshold, not the p-value

### Template 3 — Metric diagnostic (autopsy)

- **The move:** which KPI changed, by how much, over what window
- **Definition & denominator audit:** did the metric definition or denominator change (the first thing to rule out)
- **Instrumentation:** did event logging / tracking change at the same time
- **Population mix & seasonality:** did the user/segment mix shift; is the period seasonally comparable
- **Missingness:** is the data complete, or did coverage change
- **Descriptive vs causal split:** the number moved (descriptive) vs our change moved it (causal — needs an identification strategy)
- **Confounder / Simpson's check:** does the aggregate hold within segments, or does it reverse
- **Finding:** the most likely explanation, with what would confirm or refute it
- **Acceptance:** denominator/definition ruled out before any causal story · segments checked · finding states confidence and the confirming data

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն թիվ պահիր հետագծելի input-ի կամ ցույց տրված computation-ի։ Մի՛ հորինիր p-value, sample size, conversion rate կամ CI։

### Template 1 — Analysis plan (pre-registration)

- **Unblock անելի որոշումը․** ինչ ընտրություն է սա սնում, և decision threshold-ը (effect size-ը, որ շրջում է որոշումը)
- **Estimand․** effect-ը, population-ը, time window-ը, counterfactual-ը
- **Claim-ի տեսակը․** descriptive | predictive | causal — և, եթե causal, identification strategy-ն (randomization / DiD / matching / IV)
- **Primary metric & guardrail metric-ներ․** ճշգրիտ definition-ներ (good events / valid events. denominator)
- **Design․** randomization-ի unit. A/B թե multivariate (եթե MVT, interaction-ները scope-ո՞ւմ են և powered-ո՞ւմ)
- **α, power, MDE, պահանջվող N․** ամենափոքր effect-ը, որ design-ը կարող է տեսնել, ասված բացահայտ
- **Multiple-testing plan․** family-ն (որ arm/metric) և correction-ը (Holm / Benjamini–Hochberg)
- **Stopping / peeking rule․** fixed-horizon, կամ sequential method (alpha-spending O'Brien–Fleming/Pocock, group-sequential, կամ always-valid)
- **Decision rule․** որ արդյունքը ship է, որը՝ inconclusive, որը՝ revert
- **Assumption-ներ & unknown-ներ․** label-ված. ինչ data է բացակայում
- **Acceptance․** estimand բաց · MDE նշված · correction + stopping rule նախ-հայտարարված · reproducible method

### Template 2 — Experiment readout

- **Estimand & decision threshold․** plan-ից վերա-նշված
- **Observed effect․** point estimate, arithmetic-ով (rate → difference)
- **Uncertainty․** SE (formula ցույց տրված) և CI-ն effect-ի վրա — **ներկայացված որպես coverage, ոչ որպես այս interval-ի մասին հավանականություն**
- **Significance ընդդեմ value․** զրոյից տարբերելի՞ է, և բիզնես decision threshold-ից վե՞ր է (սրանք կարող են համաձայն չլինել)
- **Peeking ստուգում․** stopping rule-ը հարգվե՞ց. եթե look-եր եղել են, վավեր sequential boundary օգտագործվե՞ց
- **Multiplicity ստուգում․** metric/arm-ների family-ն և կիրառված correction-ը. raw ընդդեմ corrected significance
- **Guardrail-ներ․** որևէ guardrail metric regress արե՞ց
- **Վճիռ․** ship | ship մի՛ արա | **inconclusive MDE-ին** (երբեք «no effect» underpowered null-ի համար) — և հաջորդ քայլը (run արա N-ին, վերա-run powered, և այլն)
- **Acceptance․** թվերը բխեցված, ոչ պնդված · CI որպես coverage · peeking + multiplicity հասցեագրված · վճիռը կապված threshold-ին, ոչ p-value-ին

### Template 3 — Metric diagnostic (autopsy)

- **Move-ը․** որ KPI-ն փոխվեց, որքանով, որ window-ում
- **Definition & denominator audit․** metric definition-ը կամ denominator-ը փոխվե՞ց (առաջին բանը՝ բացառելու)
- **Instrumentation․** event logging / tracking-ը նույն ժամանակ փոխվե՞ց
- **Population mix & seasonality․** user/segment mix-ը shift արե՞ց. period-ը seasonally համեմատելի՞ է
- **Missingness․** data-ն ամբողջակա՞ն է, թե coverage-ը փոխվեց
- **Descriptive ընդդեմ causal բաժանում․** թիվը շարժվեց (descriptive) ընդդեմ մեր փոփոխությունը այն շարժեց (causal — պետք է identification strategy)
- **Confounder / Simpson ստուգում․** aggregate-ը պահվու՞մ է segment-ների ներսում, թե հակադարձվում է
- **Գտածո․** ամենահավանական բացատրությունը, ինչը կհաստատի կամ կհերքի այն
- **Acceptance․** denominator/definition բացառված ցանկացած causal story-ից առաջ · segment-ները ստուգված · գտածոն նշում է confidence-ը և հաստատող data-ն
