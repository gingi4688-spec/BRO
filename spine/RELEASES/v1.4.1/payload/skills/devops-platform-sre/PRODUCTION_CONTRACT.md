# devops-platform-sre — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/`; it inherits the **PROVEN Code adapter** (CODESLICE-001) verification pattern for IaC/pipeline artifacts. **Not PROVEN:** not itself exercised on a slice with independent runtime evidence (L15/L18). Next proof slice: reuse the PROVEN Code adapter on an IaC/CI slice (plan/validate/apply-dry-run + rollback).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է, ժառանգում է PROVEN Code adapter-ի pattern-ը IaC/pipeline-ի համար։ **Ոչ PROVEN․** ինքը slice-ի վրա չի վազել։ Հաջորդ slice՝ Code adapter-ի reuse IaC/CI-ի վրա։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — SLI/SLO sheets, rollout/deploy plans, postmortems, CI/CD pipelines, IaC modules, observability/dashboards, capacity + FinOps cost reviews, incident runbooks. / SLO sheet, rollout plan, postmortem, pipeline, IaC, observability, cost review, runbook։
2. **Inputs** — the service + its SLOs · deploy target · error budget · traffic/capacity data · cost data · incident context. / service+SLO · deploy target · error budget · capacity · cost · incident։
3. **Evidence** — pipeline/IaC validates + plans clean · rollback path proven · SLO math correct · postmortem blameless with real timeline · cost numbers traced. / pipeline validate · rollback · SLO math · postmortem timeline · cost traced։
4. **Verification gate** — IaC `validate`/`plan` clean · deploy has rollback + health gate · SLO/error-budget arithmetic checked · dashboard reflects real signals. / IaC validate · rollback · SLO math · dashboard։
5. **GREEN** — the change validates/plans/dry-runs cleanly with a proven rollback, SLO math checks out, evidence is independent of author say-so (L18). / validate/plan/dry-run, rollback proven, SLO ճիշտ, independent։
6. **YELLOW** — plan clean but rollback untested, or SLO defined without a measurement source. / plan clean բայց rollback չստուգված կամ SLO առանց չափման։
7. **RED** — deploy with no rollback · SLO invented without signals · a cost claim with no source · postmortem that blames a person. / deploy առանց rollback · SLO հորինված · cost առանց source · blame postmortem։
8. **Approval-required (D0)** — apply to real infra · touch production routes/data · a release. Gev-gated. / real infra apply · prod routes · release։ Gev-gated։
9. **Refusal / boundary** — no `apply` to prod without approval · no rollback-less deploy · no invented reliability/cost numbers. / ոչ prod apply առանց approval · ոչ rollback-less deploy · ոչ հորինված թիվ։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (SLO/rollout/postmortem prompts) + `tests/red-team-prompts.md` (rollback-less deploy + invented-SLO traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
