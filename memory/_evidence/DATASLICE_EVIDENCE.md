# DATASLICE-001 EVIDENCE — 3rd artifact-class slice (Data validation/transformation)

> **EN:** Real runtime evidence for the 3rd Universal-Core adapter (Data), hardening generality beyond UI + Code (§8
> rule of three exceeded). Verification shape = **golden-report conformance over a labeled dataset** (distinct from
> UI render/axe and Code tsc/build). Evidence is the test runner's own exit codes + output, not author assertion (L18).
> Sandbox lives in a scratchpad (not committed — same pattern as UISLICE-001 / CODESLICE-001).
>
> **HY:** Իրական runtime evidence 3-րդ adapter-ի (Data) համար՝ UI+Code-ից անդին (§8 rule of three)։ Verification =
> golden-report conformance պիտակավորված dataset-ի վրա։ Evidence = runner-ի exit code + output, ոչ հեղինակի խոսք (L18)։

## The slice / Slice-ը
- **Artifact:** `validator.py` — a CSV invoice validator + transformer. Validates each row against a schema (id `^INV-\d{3,}$`, non-empty client, positive numeric amount, status ∈ {Paid,Overdue,Pending}, `YYYY-MM-DD` due_date, unique id) and emits a conformance report + a `clean` transformed dataset (valid rows only, amount normalized to float).
- **Labeled dataset:** `invoices.csv` — 9 data rows: 2 valid, 7 invalid, one distinct error each (empty_client · amount_not_positive · bad_status · bad_date · duplicate_id · bad_id_format · amount_not_number).
- **Golden:** `expected_report.json` — per-row `valid` + error codes, summary {total 9, valid 2, invalid 7}, `clean_ids` [INV-001, INV-002].
- **Test:** `test_validator.py` — `unittest` asserting the report matches the golden (summary + per-row verdict/errors + clean transform + amount-is-float).
- **Toolchain:** python 3.12.10 · stdlib `csv`/`unittest`/`py_compile`. Sandbox `scratchpad/data-slice/` (not committed).

## Runtime evidence (observed) / Runtime evidence (դիտարկված)
| Phase | Command | Observed result |
|---|---|---|
| **RED (stub)** | `python -m unittest test_validator` | `FAILED (failures=3)` — stub summary valid=9/invalid=0 ≠ golden 2/7 (test has teeth) |
| **GREEN (impl)** | `python -m unittest test_validator -v` | `OK` — Ran 4 tests, all pass; summary valid=2/invalid=7 |
| **Controlled defect** | status-set check disabled (`if False and …`) | `FAILED (failures=3)` — INV-005 "Shipped" wrongly valid, summary valid=3/invalid=6; caught by golden |
| **Repair + re-verify** | restore status check → `python -m unittest test_validator` | `OK` — 4/4 re-verified |
| **Static check** | `python -m py_compile validator.py test_validator.py` | exit 0 |
| **Real output** | `validate_csv('invoices.csv')` | `summary={total 9, valid 2, invalid 7}`, `clean_ids=["INV-001","INV-002"]` |

## Why this hardens the Universal Core / Ինչու է սա կարծրացնում Universal Core-ը
The **same** 10-step loop (Executor → Verifier → Repairer) drove a THIRD, genuinely different artifact class (Data
validation/transformation, in a third language, with a distinct evidence type) to runtime GREEN with a real red→green
and a controlled defect caught+repaired. The Universal Core was already PROVEN at 2 adapters (UISLICE-001 + CODESLICE-001);
DATASLICE-001 strengthens that from the §8 minimum toward a broader base (rule of three exceeded), measured not asserted
(L17). The PROVEN label does not inflate — it is the same PROVEN, now backed by three artifact classes instead of two.
