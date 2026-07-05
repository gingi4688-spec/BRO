# databases-storage-engineering — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: PROVEN (graded-eval, DC-002 · 2026-07-05).** An independent, blind, adversarial grader scored every `domain-rubric.md` dimension ≥4 (5-senior bar), re-derived the arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held (DC-002 · C2 clean). Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), NOT an external human audit or a runtime slice. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` + `skills/CONTRACT_MATRIX.md`. Graded-eval-PROVEN (distinct from the runtime-PROVEN reference adapters); a runtime domain slice can upgrade it later (optional).
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ PROVEN (graded-eval, DC-002 · 2026-07-05)։** Անկախ blind adversarial grader-ը գնահատեց `domain-rubric.md`-ի ամեն dimension ≥4 (5-senior), ինքը վերահաշվեց arithmetic-ը, չգտավ fabrication, ու հաստատեց բոլոր safety/UPL/HR/dual-use gate-երը (DC-002 · C2 clean)։ Producer/grader բաժանված (L18)․ session-orchestrated ՉԱՓՎԱԾ evidence (L17), ՈՉ արտաքին human audit կամ runtime slice։ Evidence՝ `memory/_evidence/DEEPCHECK_EVIDENCE.md`։

## The 10 answers / 10 պատասխանը

1. **Artifacts** — schema + data models, index/query-plan tuning, isolation/consistency decisions, replication/partitioning/sharding plans, migration + backup-restore plans, multi-store architectures. / schema, index/plan tuning, isolation decision, replication plan, migration, multi-store arch։
2. **Inputs** — workload (OLTP/OLAP) · access patterns · consistency needs · data volume · SLA · existing schema. / workload · access pattern · consistency · volume · SLA · schema։
3. **Evidence** — migration runs + reverses · query plan improves measurably · isolation level correct for the anomaly · backup restores · no data loss. / migration↔reverse · plan improves · isolation ճիշտ · restore · no loss։
4. **Verification gate** — migration up+down · `EXPLAIN`/plan before-after · isolation reproduces-then-prevents the anomaly (write-skew, lost update) · restore drill. / migration up/down · EXPLAIN · isolation repro · restore։
5. **GREEN** — the change migrates reversibly, the plan/anomaly behavior is measured, restore works, independent of author say-so (L18). / migrate reversibly, plan measured, restore works, independent։
6. **YELLOW** — schema/index designed but plan not measured, or migration lacks a tested down-path. / plan չչափված կամ migration առանց down-path-ի։
7. **RED** — an irreversible migration with no backup · isolation chosen without naming the anomaly · a "faster" index with no plan evidence · claimed restore never drilled. / անդառնալի migration առանց backup · isolation առանց anomaly · index առանց plan · restore չդրիլ արած։
8. **Approval-required (D0)** — run a migration on real data · drop/alter production tables · change replication topology. Gev-gated. / real-data migration · prod DDL · replication change։ Gev-gated։
9. **Refusal / boundary** — no destructive migration without a proven backup+restore · no consistency claim without naming the anomaly it prevents · no perf claim without a plan. / ոչ destructive migration առանց backup · ոչ consistency առանց anomaly · ոչ perf առանց plan։
10. **Eval cases (scaffold, DECLARED)** — `tests/eval-prompts.md` (schema/index/isolation prompts) + `tests/red-team-prompts.md` (irreversible-migration + write-skew traps). Prompts written; **not yet RUN** through an independent grader — that RUN is the next proof slice.
