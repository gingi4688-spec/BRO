# gev_standard / ARCHITECTURE_TASTE / ARCHITECTURE-Ի ՃԱՇԱԿ

> **EN:** How Gev wants systems built. **HY:** Ինչպես է Գևն ուզում համակարգերը կառուցվեն։

## The standard / Standard-ը

- **No empty scaffolds.** No folder, law-slot, or contract ships empty as a placeholder-that-looks-done. Prove capability, then generalize. / ոչ դատարկ scaffold։ ապացուցիր, հետո ընդհանրացրու։
- **Prove by vertical slices, extract after two** (rule of three). Generality is EARNED from real implementations, never invented top-down. / ապացուցիր slice-երով, extract 2-ից հետո։
- **Reuse over parallel structure.** Upgrade the existing 32 skills with contracts; don't build a parallel router or 11 empty adapters. / reuse, ոչ parallel router։
- **Tokens / zero hardcode (L13)** and **bilingual everything (L0)** from the FIRST commit — never retrofitted. / token + երկլեզու առաջին commit-ից։
- **Governed + reversible.** Branch, never main; irreversible tail (push/release/spine-seed) last; use the governed tools + `BRO_GEV_APPROVED`, never raw writes to the wall/spine. / governed + reversible. governed tool-երով։
- **D0 gates preserved.** High autonomy up to the gate; hard stop at push/delete/migrate/release/promote/lock/law/cross-memory/prod-creds. / D0 gate-երը պահված։
- **Sealed memory (L8).** Each work's memory is its own; memory never rides the spine; project brains never mix. / sealed memory. memory-ն spine չի հատում։

## Anti-taste / Հակա-ճաշակ

Empty abstraction before implementation · "universal" claimed off one slice · version theater · a parallel system where reuse would do · raw writes that could corrupt the wall/spine · memory leaking across projects. / դատարկ աբստրակցիա · «universal» մեկ slice-ից · version theater · parallel համակարգ · memory leak։
