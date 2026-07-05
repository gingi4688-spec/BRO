# ARCHITECTURE DECISION RECORDS / ARCHITECTURE ՈՐՈՇՄԱՆ ԳՐԱՌՈՒՄՆԵՐ

> **EN:** Heavier decisions that shape the system's structure (the ones worth a full record). Append-only. **HY:** Համակարգի կառուցվածքը ձևող ավելի ծանր որոշումներ (լրիվ գրառման արժանի)։ Append-only։

## ADR-001 — Universal Production Core + Domain Adapters, proven by vertical slices

- **Status:** ACCEPTED (Gev) · Universal Core = DECLARED until slice 2.
- **Context:** Bro was a strong advisor/auditor but not a production machine. The gap is the missing production loop, not skill count.
- **Decision:** one domain-agnostic engine (`_core/production_os/`) runs every result-task through Intake→Evidence→Options→Plan→Execute→Verify→Repair→Ledger→Report; domains are thin Production Contracts on the existing 32 skills; artifact-specific GREEN. Prove on a UI slice, then a Code slice, THEN extract the shared core (rule of three).
- **Consequences:** no empty adapters; GREEN needs independent evidence (L18); the "universal" claim waits for two proven slices. UI slice is PROVEN; Code slice pending.

## ADR-002 — Production-OS laws L14–L19 as inviolable, all-agents-inherit

- **Status:** ACCEPTED (Gev, 2026-07-05).
- **Decision:** L14 (no advice without execution path) · L15 (proof or label) · L16 (no done without verification) · L17 (measured success) · L18 (no GREEN without independent evidence) · L19 (no agreement without a check) become dedicated bilingual law files, registered in `00_inviolable.md`, inherited by every bro via spine.
- **Consequences:** the production loop is law-backed, not advisory; fake-PROVEN / fake-GREEN / yes-man are defined defects.

## ADR-003 — Install via governed tools on a branch; spine-seed + push last

- **Status:** ACCEPTED · in progress (this session).
- **Decision:** all install writes go in-home on a feature branch, committed per-phase; the irreversible tail (spine release + seed 5 bros + push) runs LAST through `bro-release`/`bro-update-spine`/`git push` with `BRO_GEV_APPROVED=1`, after the beast-check verifies the tree.
- **Consequences:** reversible until the remote; D0 gates honored; the wall/release integrity is preserved.

## ADR-004 — Code adapter PROVEN (proof slice 2); Universal Core extraction now honest

- **Status:** ACCEPTED (Gev, 2026-07-05) · Universal Core still DECLARED until extracted+validated.
- **Context:** ADR-001 set the rule of three — extract the Universal Core only after TWO proven adapters. UI was proven (UISLICE-001); Code was the missing second slice.
- **Decision:** the Code adapter (`skills/software-systems-architecture/PRODUCTION_CONTRACT.md`) flips DECLARED→PROVEN on a real sandbox slice (`billingPeriod`, TypeScript): red→green 13/13, `tsc`+`eslint`+build exit 0, controlled boundary defect caught+repaired (FL-008), unplanned build-config defect caught (FL-009). Evidence: CODESLICE-001.
- **Consequences:** two proven adapters now exist → Universal Core extraction is honest and unblocked (Phase 10). The Universal Core label itself remains DECLARED until the shared core is lifted from both slices and both re-validate — proving generality is measured (L17), not a byproduct of the second slice.

## ADR-005 — Universal Core PROVEN by extraction from two proven adapters

- **Status:** ACCEPTED (Gev, 2026-07-05).
- **Context:** ADR-001's rule of three — extract the Universal Core only after TWO proven adapters. UI (UISLICE-001) + Code (CODESLICE-001) are now both proven via the same documented loop.
- **Decision:** flip Universal Core DECLARED→PROVEN. The core (loop + Executor/Verifier/Repairer + statuses + gates + ledgers + label system + contract template) is audited adapter-neutral; the reference runs in 05–08 now show each role across BOTH artifact classes; the `ui/` and `code/` recipes stay adapter-specific. Extraction record: `_core/production_os/UNIVERSAL_CORE.md`. Evidence: UNIV-CORE-001. Extraction was validate+generalize+relabel, NOT a rewrite (guards the empty-abstraction trap).
- **Consequences:** generality is measured (two artifact classes, independent runtime evidence), not asserted (L17). The engine is ready to propagate via a v1.3.0 spine release + reseed (Phase 10C). The honesty gate (`bro-production-check`) is retuned: Universal PROVEN requires BOTH adapter proofs referenced (fake-universal still RED). UI re-validation is evidence-backed (recorded), not a fresh run — honestly labeled.
