# data-engineering-pipelines — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · C2 clean). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · C2 clean)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

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
