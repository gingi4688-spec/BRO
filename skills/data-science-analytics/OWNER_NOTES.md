# Data Science and Analytics owner notes

## English

### Needs human review when

This skill produces evidence and its limits; it must route the *decision* — and any high-stakes or regulated use of the analysis — to a human owner, not let a number auto-trigger an irreversible or consequential action. Escalate and require explicit human sign-off when:

- **The analysis drives an irreversible or high-stakes business decision** — a launch/kill, a pricing change, a large spend, a layoff or headcount model. Supply the estimand, the effect size, the uncertainty, and the decision threshold; the call belongs to the business/strategy owner. State plainly what the data does and does not license.
- **A decision affects people in a regulated or fairness-sensitive way** — credit, hiring, lending, insurance, healthcare, housing, education. A model or analysis that allocates access or risk-scores people can encode bias and trigger legal exposure; route to legal/compliance and require a fairness/disparate-impact review before deployment. This skill does not green-light such a model on accuracy metrics alone.
- **The result will be published or stated externally** — a press claim, an investor metric, a regulatory filing, a public benchmark. External statistical claims carry legal and reputational risk; the wording and the disclosure of method/uncertainty are owned by legal/comms/leadership, not the analyst alone.
- **Personal or sensitive data is involved** — re-identification risk, PII joins, sensitive attributes (health, ethnicity, location traces). Privacy review and the data-governance owner gate the analysis; do not widen access or join datasets to chase a finding.
- **A causal claim would justify a costly intervention** — when an observational/DiD estimate (not a randomized result) is about to fund a rollout or a budget. The assumption (parallel trends, no confound) is doing the heavy lifting; require the owner to accept the identification risk, or hold for a randomized confirmation.
- **The honest read is "inconclusive" but there is pressure to call a winner** — an underpowered or peeking-contaminated result being pushed to "significant." Report it as inconclusive with the MDE and the path to resolve it; the decision to ship anyway is an explicit, owned business risk, not a statistical conclusion.

The default posture for all of the above: produce the analysis, the uncertainty, and the limits; then stop and route the decision to the owner. Do not let a statistic auto-authorize a consequential or irreversible action.

### Owned future-improvement items

- Add a **Bayesian A/B template** (posterior on the lift, probability the treatment beats control by ≥ the decision threshold, expected loss) as an alternative readout to the frequentist one, since stakeholders often want a "probability it's better" framed correctly.
- Add a worked **MVT example with an estimated interaction term and its CI**, end-to-end, to make the interaction-power requirement concrete beyond the manual's mechanism.
- Add a **fairness/disparate-impact mini-rubric** for classifier work (subgroup precision/recall, calibration by group, the regulated-decision gate) so the people-impact case is checkable, not just flagged.
- Add a **sample-ratio-mismatch (SRM) check** to the experiment-readout template — a chi-square on arm allocation that catches a broken randomization before any effect is trusted.
- Cross-link the pipeline/instrumentation handoff explicitly to `data-engineering-pipelines` for the cases where a metric autopsy finds the fix is an ETL/event-schema change owned there.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը արտադրում է evidence և նրա սահմանները. այն պետք է ուղղորդի *որոշումը* — և վերլուծության ցանկացած high-stakes կամ regulated օգտագործումը — մարդ-տիրոջը, ոչ թե թույլ տա, որ թիվը ինքնաշխատ trigger անի անդառնալի կամ հետևանքային գործողություն։ Escalate արա և պահանջիր մարդկային հստակ sign-off, երբ․

- **Վերլուծությունը շարժում է անդառնալի կամ high-stakes բիզնес որոշում** — launch/kill, pricing change, մեծ spend, layoff կամ headcount model։ Տուր estimand-ը, effect size-ը, uncertainty-ն և decision threshold-ը. որոշումը բիզնես/strategy-ի տիրոջն է։ Ասա բացահայտ, թե data-ն ինչ է թույլ տալիս և ինչ՝ ոչ։
- **Որոշումը մարդկանց է ազդում regulated կամ fairness-զգայուն ձևով** — credit, hiring, lending, insurance, healthcare, housing, education։ Model կամ վերլուծություն, որ access է բաշխում կամ մարդկանց risk-score է անում, կարող է bias կոդավորել և legal ռիսկ trigger անել. ուղղորդիր legal/compliance-ին և պահանջիր fairness/disparate-impact review՝ նախքան deployment-ը։ Այս skill-ը այդպիսի model-ը միայն accuracy metric-ով green-light չի անում։
- **Արդյունքը կհրապարակվի կամ արտաքին կհայտարարվի** — press claim, investor metric, regulatory filing, public benchmark։ Արտաքին վիճակագրական claim-ները legal և reputational ռիսկ ունեն. ձևակերպումը և method/uncertainty-ի բացահայտումը legal/comms/leadership-ինն է, ոչ միայն analyst-ի։
- **Ներգրավված է անձնական կամ sensitive data** — re-identification ռիսկ, PII join-եր, sensitive attribute-ներ (health, ethnicity, location trace)։ Privacy review-ն և data-governance-ի տերը gate են անում վերլուծությունը. մի՛ լայնացրու access-ը և մի՛ join արա dataset-եր գտածոյի հետևից։
- **Causal claim-ը կարդարացներ costly intervention** — երբ observational/DiD estimate-ը (ոչ randomized արդյունք) պատրաստվում է fund անել rollout կամ budget։ Assumption-ը (parallel trends, confound չկա) ծանր բեռն է կրում. պահանջիր, որ owner-ը ընդունի identification ռիսկը, կամ պահիր randomized հաստատման համար։
- **Ազնիվ ընթերցումը «inconclusive» է, բայց ճնշում կա winner հայտարարելու** — underpowered կամ peeking-աղտոտված արդյունք, որ հրվում է «significant»-ի։ Ներկայացրու որպես inconclusive՝ MDE-ով և լուծելու path-ով. այնուամենայնիվ ship անելու որոշումը հստակ, owned բիզնես ռիսկ է, ոչ վիճակագրական conclusion։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր վերլուծությունը, uncertainty-ն և սահմանները. հետո կանգնի՛ր և ուղղորդիր որոշումը owner-ին։ Մի՛ թող, որ statistic-ը ինքնաշխատ authorize անի հետևանքային կամ անդառնալի գործողություն։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու **Bayesian A/B template** (lift-ի posterior, treatment-ի control-ից ≥ decision threshold-ով լավ լինելու հավանականություն, expected loss)՝ որպես frequentist-ին այլընտրանքային readout, քանի որ stakeholder-ները հաճախ ուզում են «լավ լինելու հավանականություն»՝ ճիշտ ձևակերպված։
- Ավելացրու worked **MVT օրինակ՝ գնահատված interaction term-ով և նրա CI-ով**, ծայրից ծայր, որ interaction-power պահանջը կոնկրետ լինի manual-ի mechanism-ից այն կողմ։
- Ավելացրու **fairness/disparate-impact mini-rubric** classifier-ի աշխատանքի համար (subgroup precision/recall, calibration ըստ group-ի, regulated-decision gate), որ people-impact case-ը ստուգելի լինի, ոչ միայն flag արված։
- Ավելացրու **sample-ratio-mismatch (SRM) check** experiment-readout template-ին — chi-square arm allocation-ի վրա, որ կոտրված randomization-ը բռնի, նախքան որևէ effect-ի վստահելը։
- Cross-link արա pipeline/instrumentation handoff-ը բացահայտ `data-engineering-pipelines`-ին այն դեպքերի համար, երբ metric autopsy-ն գտնում է, որ fix-ը այնտեղ տիրվող ETL/event-schema փոփոխություն է։
