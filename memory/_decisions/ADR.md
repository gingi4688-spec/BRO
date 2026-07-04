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
