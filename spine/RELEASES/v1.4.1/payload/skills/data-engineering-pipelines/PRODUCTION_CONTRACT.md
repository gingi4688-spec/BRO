# data-engineering-pipelines — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED.** Contract complete and anchored to this skill's `domain-rubric.md` + `tests/`; it inherits the **PROVEN Code adapter** (CODESLICE-001) verification pattern for pipeline artifacts. **Not PROVEN:** not itself exercised on a slice with independent runtime evidence (L15/L18). Next proof slice: reuse the PROVEN Code adapter on a pipeline slice (idempotent backfill + delivery-semantics test + DLQ).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ DECLARED։** Contract-ը լրիվ է, ժառանգում է PROVEN Code adapter-ի pattern-ը pipeline-ի համար։ **Ոչ PROVEN․** ինքը slice-ի վրա չի վազել։ Հաջորդ slice՝ Code adapter-ի reuse pipeline-ի վրա։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — batch/stream pipeline designs, freshness/SLA contracts, idempotent backfill runbooks, schema-evolution plans, DLQ/error handling, data-quality gates, windowing/watermark designs. / pipeline design, freshness contract, backfill runbook, schema-evolution, DLQ, DQ gate, windowing։
2. **Inputs** — source(s) + shape · delivery guarantee needed · latency/freshness SLA · volume · schema registry · downstream contract. / source · guarantee · SLA · volume · registry · downstream։
3. **Evidence** — delivery semantics (exactly/at-least-once) demonstrated · backfill idempotent (re-run = same result) · DLQ catches bad records · schema change is compatible · freshness meets SLA. / semantics · idempotent backfill · DLQ · schema-compat · freshness։
4. **Verification gate** — pipeline runs on sample · re-run proves idempotency · malformed record → DLQ · registry compat-mode check · window/watermark correctness. / run · idempotency · DLQ · registry · window։
5. **GREEN** — the pipeline runs, re-runs identically (idempotent), routes bad data to DLQ, meets freshness, evidence independent of author say-so (L18). / run, idempotent, DLQ, freshness, independent։
6. **YELLOW** — pipeline runs but idempotency not re-run-proven, or freshness SLA not measured. / idempotency չre-run արած կամ freshness չչափված։
7. **RED** — a backfill that double-counts on re-run · silent record loss (no DLQ) · a breaking schema change shipped · exactly-once claimed with no dedup mechanism. / re-run double-count · silent loss · breaking schema · exactly-once առանց dedup։
8. **Approval-required (D0)** — run against real source data · deploy to prod orchestration · alter a production schema/topic. Gev-gated. / real-source run · prod deploy · prod schema։ Gev-gated։
9. **Refusal / boundary** — no non-idempotent backfill on prod · no silent drop of bad records · no delivery-guarantee claim without the mechanism. / ոչ non-idempotent backfill · ոչ silent drop · ոչ guarantee առանց mechanism-ի։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (semantics/backfill/windowing prompts) + `tests/red-team-prompts.md` (double-count backfill + silent-loss traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
