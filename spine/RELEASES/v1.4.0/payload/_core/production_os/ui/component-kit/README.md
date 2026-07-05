# ui / component-kit — COMPONENTS + STATE SETS / COMPONENT + STATE ՀԱՎԱՔԱԾՈՒ

> **EN:** The kit the Executor assembles from. Each component is a shadcn/Base-UI primitive with a required state set; a component is not "done" until every state is built and verified. **HY:** Kit-ը, որից Executor-ը հավաքում է։ Ամեն component՝ shadcn/Base-UI primitive՝ պահանջվող state-set-ով. component-ը «done» չէ, մինչև ամեն state կառուցված ու verify արած չլինի։

## Proven components / Ապացուցված component-ներ

From the CRM slice (PROVEN):

| Component | Primitive | States that MUST exist |
|---|---|---|
| **Button** | Base UI Button | default · hover · focus-visible · disabled · aria-disabled (permission) |
| **Input (filter/search)** | shadcn Input | empty · typing · disabled (non-ready) · labeled (sr-only) |
| **Table (DataTable)** | shadcn Table | header · rows · empty-body · responsive column-collapse (md/lg) |
| **Badge (StatusBadge)** | shadcn Badge | one variant per status · **AA-verified at 12px** (FL-002) |
| **Skeleton (Loading)** | shadcn Skeleton | row skeletons · `aria-busy` |
| **Drawer (detail)** | Base UI Sheet/Dialog | closed · open · focus-trap · focus-restore · ESC-close · backdrop-close |

## Page-level state set (required) / Էջի state-set (պարտադիր)

Every data page must build all six: **loading · empty-first-run · empty-filtered-to-zero · error+retry · populated · permission-denied**. Missing a state = RED (L16). / Ամեն data էջ պիտի կառուցի վեցն էլ. պակասող state = RED (L16)։

## Accessibility contract / Accessibility contract

Semantic HTML · labels · focus-visible rings · drawer focus-trap + restore · keyboard-operable primary actions · ESC-close · **axe 0 serious/critical**. Verified in the running app, not asserted. / Semantic HTML · label · focus-visible · drawer focus-trap+restore · keyboard · ESC · axe 0 serious — verify արած աշխատող app-ում։

## Reference implementation / Հղումային implementation

The runnable, verified source is the sandbox slice (`customers-view.tsx` + `ui/*` kit). It is the PROVEN artifact behind this contract; vendoring a trimmed `/templates/nextjs/` into the kit is a follow-up, not a claim made here. / Աշխատող, verify արած source-ը sandbox slice-ն է. սա է PROVEN artifact-ը. trimmed template vendor անելը follow-up է։
