# data-science-analytics — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · C3 clean). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · C3 clean)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

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
