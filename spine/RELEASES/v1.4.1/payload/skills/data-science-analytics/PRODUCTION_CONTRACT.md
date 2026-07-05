# data-science-analytics — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/`; analysis code inherits the **PROVEN Code adapter** (CODESLICE-001) pattern. **Not PROVEN:** no independent stats/experiment eval RUN yet (L15/L18). Next proof slice: reuse the Code adapter on a stats/experiment slice (power calc + readout with computed CI, planted p-hacking caught).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է, code-ը ժառանգում է PROVEN Code adapter-ի pattern-ը։ **Ոչ PROVEN․** անկախ stats/experiment eval դեռ չի վազել։ Հաջորդ slice՝ Code adapter-ի reuse experiment-ի վրա։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — analysis plans, A/B and MVT designs + readouts, causal/observational diagnoses, metric/KPI investigations, classifier evaluation + thresholding, sample-size/power calcs. / analysis plan, A/B design+readout, causal diagnosis, metric investigation, classifier eval, power calc։
2. **Inputs** — the question · the data + its provenance · the metric definition · design constraints · decision at stake. / հարց · data+provenance · metric · constraint · որոշում։
3. **Evidence** — power/sample-size computed before the test · CI + effect size reported (not just p) · confounders named · leakage checked · thresholds justified by cost. / power հաշված · CI+effect · confounder · leakage · threshold։
4. **Verification gate** — pre-registered metric · assumptions checked · multiple-comparison correction where needed · CI coverage · train/val/test hygiene. / pre-reg · assumptions · FWER/FDR · CI · split hygiene։
5. **GREEN** — the readout computes CI/effect from the actual data, corrections applied, confounders addressed, independent of the analyst's say-so (L18). / readout CI/effect իրական data-ից, correction, confounder, independent։
6. **YELLOW** — analysis run but power not pre-computed, or CI reported without checking assumptions. / power չpre-compute կամ CI առանց assumption-ի։
7. **RED** — p-hacking / cherry-picked window · a causal claim from correlation · leakage into the test set · an invented statistic · "significant" with no effect size. / p-hacking · causal-from-corr · leakage · հորինված statistic · significant առանց effect-ի։
8. **Approval-required (D0)** — shipping a metric that drives a business decision · running an experiment on real users. Gev-gated. / decision-driving metric · real-user experiment։ Gev-gated։
9. **Refusal / boundary** — no causal claim from observational data without caveats · no manufactured statistic (route raw-data modeling appropriately) · no significance without effect size. / ոչ causal առանց caveat · ոչ հորինված statistic · ոչ significance առանց effect-ի։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (design/readout/causal prompts) + `tests/red-team-prompts.md` (p-hacking + correlation-as-cause traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
