# AI_BUILDER_RULES.md

Rules for AI builders using STANDARD_PROJECT_DOCS_PACK.

## Rules

1. Do not create all files blindly.
2. Do not force fixed pack sizes.
3. Always create `PROJECT_DOCS_SELECTION.md` before build.
4. Show the full master list to the user.
5. Suggest decisions for each relevant file.
6. Let the user approve or edit the final selection.
7. Create only selected files and explicitly activated optional modules.
8. Follow `DOCS_DEPENDENCY_GRAPH.md`.
9. Use `SOURCE_OF_TRUTH_RULES.md` when documents conflict.
10. Do not invent missing decisions.
11. Put unresolved questions in `OPEN_ITEMS_LOG.md`.
12. Put approved decisions in `DECISIONS_LOG.md`.
13. Keep templates separate from project-specific truth.
14. Do not hardcode design decisions outside `DESIGN_TOKENS.md`.
15. Security-sensitive behavior must be documented.
