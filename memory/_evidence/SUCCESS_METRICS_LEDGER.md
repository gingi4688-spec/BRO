# SUCCESS METRICS LEDGER / ՀԱՋՈՂՈՒԹՅԱՆ ՉԱՓԱՆԻՇՆԵՐԻ ՄԱՏՅԱՆ

> **EN:** Measured production history — the ONLY basis for any success-rate claim (L17). No invented percentages. When history is thin, the honest statement is "UNKNOWN — expected confidence based on architecture, not on measured history." **HY:** Չափված production պատմություն — success-rate-ի ՄԻԱԿ հիմքը (L17)։ Ոչ հորինված տոկոս։ Երբ պատմությունը բարակ է՝ «UNKNOWN — architecture-ի հիման վրա, ոչ չափված պատմության»։

## Workflow: ui_page_build

| metric | value | note |
|---|---|---|
| attempts (measured) | **1** | the neutral-CRM list-detail slice |
| passed (first-pass, no repair) | **0** | run #1 had 4 failing tests |
| passed (final, after repair) | **1** | run #2 = 23/23 GREEN |
| repaired | 1 | FL-001 + FL-002 in one repair cycle |
| avg repair cycles | 1.0 | |
| common failure types | a11y contrast (1) · controlled-defect (1) | |
| last verified | 2026-07-05 | |
| **success rate** | **UNKNOWN — n=1** | one measured build is not a rate; do not claim a percentage. Expected confidence MEDIUM–HIGH based on architecture completeness, NOT on measured history. |

## Workflow: code_fix

| metric | value | note |
|---|---|---|
| attempts (measured) | **1** | the `billingPeriod` pure-logic TypeScript slice |
| passed (first-pass, no repair) | **0** | stub run failed 13/13 by design (TDD red); first build hit TS5011 |
| passed (final, after repair) | **1** | 13/13 green · tsc/eslint/build exit 0 |
| repaired | 1 | FL-008 (controlled boundary) + FL-009 (unplanned build-config), one cycle |
| avg repair cycles | 1.0 | |
| common failure types | boundary/off-by-one (1 controlled) · build-config (1 unplanned) | |
| last verified | 2026-07-05 | |
| **success rate** | **UNKNOWN — n=1** | one measured build is not a rate. Expected confidence MEDIUM–HIGH from architecture, NOT measured history. |

## Workflows: audit · agent_creation · research_answer · bilingual_quality · memory_isolation

| workflow | measured history | success rate |
|---|---|---|
| code_fix | measured n=1 (see "Workflow: code_fix" above) | **UNKNOWN — n=1** |
| audit · agent_creation · research_answer · bilingual_quality · memory_isolation | none yet | **UNKNOWN** |

> **Rule (L17):** every cell above is either a measured count or an explicit UNKNOWN. No rate is stated without the records behind it. / Ամեն վանդակ՝ չափված թիվ կամ բացահայտ UNKNOWN։ Ոչ մի rate առանց գրառման։
