# STANDARD_PROJECT_DOCS_PACK — SuperBro governance / SuperBro-ի կառավարում

> **EN:** This folder is the **ONE SuperBro-governed master** of the universal documentation framework (38 sections,
> ~390 docs, bilingual). It is versioned in the Bro repo like the spine and the project-bro template — a single source
> of truth, never duplicated into projects. It is **select-don't-copy**: a project receives ONLY the focused subset it
> needs (a lean ~15–25 docs for a small project), never the whole universe.
>
> **HY:** Այս folder-ը universal documentation framework-ի **ՄԵԿ SuperBro-governed master**-ն է (38 section, ~390 doc,
> երկլեզու)։ Versioned է Bro repo-ում՝ spine-ի ու project-bro template-ի պես — մեկ ճշմարտության աղբյուր, երբեք project-ի
> մեջ չկրկնված։ **Select-don't-copy** է՝ project-ը ստանում է ՄԻԱՅՆ իրեն պետք focused ենթաբազմությունը (փոքր project-ին lean
> ~15–25 doc), երբեք ամբողջ universe-ը։

## How it is used (the intake contract) / Ինչպես է օգտագործվում (intake-ի contract)

1. A new project is born via `bro-new-project` (the factory), which seeds `<project>\docs\PROJECT_DOCS_SELECTION.md`.
2. On the project's first session, its Bro runs **intake** using this master as the reference library:
   - read `00_MASTER/PACK_DECISION_TREE.md` + `00_MASTER/FILE_STATUS_MATRIX.md` + `00_MASTER/PACK_INDEX.md`,
   - decide the LEAN selection (MUST + the CONDITIONAL_MUST that truly apply + explicitly activated OPTIONAL modules),
   - record it in `PROJECT_DOCS_SELECTION.md`, and fill the selected docs (in `FILL_ORDER.md` order) using its skills.
3. SuperBro delivers the selected section templates into the project via **`bro-docs.ps1 -Deliver`** (gated, backup-safe).

## Rules / Կանոններ
- **Never** copy the whole universe into a project. Lean selection only ([[gev-careful-handwork-over-fanout]]).
- The master stays here (SuperBro-governed); projects hold only their selection + filled docs in `<project>\docs\`.
- Bump/replace this master deliberately (a new docs-pack version) — like a spine release, it is a governed change.
- Bilingual per L0; quality > speed per the laws.

*Source: `STANDARD_PROJECT_DOCS_PACK_FULL_FINAL_GREEN.zip` (391 files), adopted into SuperBro 2026-07-01.*
