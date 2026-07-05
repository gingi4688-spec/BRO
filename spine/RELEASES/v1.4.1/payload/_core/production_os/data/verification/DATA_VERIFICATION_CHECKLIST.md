# DATA adapter — verification checklist / DATA adapter-ի ստուգման ցուցակ

> **EN:** The Data artifact-class recipe for the Universal Core loop (Executor → Verifier → Repairer). Its GREEN is
> **golden-report conformance over a LABELED dataset** — a distinct evidence type from the UI adapter (render + axe +
> screenshots) and the Code adapter (tsc/lint/test/build). PROVEN by **DATASLICE-001** (3rd artifact class; §8 rule of
> three exceeded). A data artifact is validation/transformation code whose correctness is *data conformance*, verified
> by comparing its report over known-good/known-bad rows to an expected golden. No golden run → no Data GREEN (L18).
>
> **HY:** Data artifact-դասի recipe-ն Universal Core loop-ի համար։ GREEN-ը՝ **golden-report conformance պիտակավորված
> dataset-ի վրա** — UI-ից (render+axe) և Code-ից (tsc/lint/test/build) տարբեր evidence-տեսակ։ PROVEN՝ **DATASLICE-001**-ով
> (3-րդ artifact-դաս)։ Golden run չկա → Data GREEN չկա (L18)։

## Artifact types / Artifact-ի տեսակներ
CSV/JSON/tabular validators, schema-conformance checkers, data-transformation/normalization jobs, rule/decision-table evaluators, report/document-content validators.

## Required inputs / Պահանջվող input
- The **schema / rules** (columns, types, ranges, allowed sets, uniqueness, cross-field constraints).
- A **labeled dataset** — real rows tagged valid/invalid with the specific reason (error code) per invalid row.
- An **expected golden report** — per-row verdicts + error codes + summary counts + the transformed output contract.

## Verification gate / Ստուգման gate
1. **Golden-report conformance** — run the validator over the labeled dataset; its report must EXACTLY match the golden (per-row `valid` + sorted error codes, summary counts, and the clean/transformed output contract).
2. **Red→green** — a stub (e.g. marks all rows valid) MUST fail the golden (proves the test has teeth) before the real implementation makes it pass.
3. **Controlled defect** — loosen one real rule (e.g. drop the allowed-set check); a known-bad row must then wrongly pass and the golden test must catch it; repair → re-verify.
4. **Static check** — the artifact compiles/parses clean (`py_compile` / `tsc --noEmit` / equivalent for the language).

## GREEN / YELLOW / RED
- **GREEN** — golden conformance passes, red→green demonstrated, a controlled defect was caught + repaired + re-verified, static check clean — evidence = the runner's own exit codes + output, independent of the author (L18).
- **YELLOW** — validator runs but the golden is incomplete (a row/edge unlabeled), or the controlled-defect step not run.
- **RED** — the report diverges from the golden · GREEN claimed with no run · the stub already "passes" (toothless test) · a labeled-invalid row silently passes.

## Reference proof / Հղումային ապացույց
**DATASLICE-001** (`memory/_evidence/DATASLICE_EVIDENCE.md`): a CSV invoice validator/transformer (Python + `unittest`).
9-row labeled dataset (2 valid, 7 invalid across bad_id_format · duplicate_id · empty_client · amount_not_number ·
amount_not_positive · bad_status · bad_date). Stub → **FAILED failures=3** (valid 9/0) → impl → **OK 4/4** (valid 2/7);
controlled defect (status-set check disabled) → **FAILED** (INV-005 wrongly valid, 3/6) → repaired → **OK 4/4**;
`py_compile` exit 0. Toolchain: python 3.12.10 · stdlib `unittest`. Sandbox: `scratchpad/data-slice/` (not committed).
