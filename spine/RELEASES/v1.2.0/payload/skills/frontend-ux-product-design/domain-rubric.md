# Frontend, UX, and Product Design domain rubric

## English

Use this rubric before finalizing any interface deliverable (UX-research plan, states-and-microcopy pass, design-token set, component-API spec, performance budget, accessibility implementation). A score of 5 requires the mechanism, the evidence, and a checkable artifact — and, where the work is built, a verified-rendered result, not a claim.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Research validity | Design started at the pixel; user/problem assumed. | A method is named. | The method fits the question, behavior is observed over opinion, and the problem is validated before design with the evidence carried into each element. |
| Interaction design | Flat hierarchy; only the happy state. | Hierarchy and some states present. | One primary action and explicit hierarchy (squint-test passes); all applicable states designed; microcopy names the result; motion is purposeful; the right laws (Fitts/Hick/Jakob/Tesler/Gestalt) are applied. |
| Design-system rigor | Hardcoded values; one-off components. | Some tokens or shared components. | Three-tier tokens with components consuming semantic only; atomic composition; the component API is a contract (slots/compound, deliberate controlled state); theming is a token swap; governance is enforceable. |
| Frontend implementation | Server data in a global store; rendering by fashion. | State and rendering choices named. | State is owned by data (local/query-cache/global/URL/form); the rendering model fits content×interactivity×SEO×scale; Core Web Vitals are measured with field data and budgeted in CI; optimization targets a measured hotspot. |
| Accessibility — verified | "WCAG compliant" claimed, or ignored. | Automated scan run. | Semantic HTML first, ARIA only for gaps; keyboard/focus/`Esc`/trap correct; contrast tested on states; the screen-reader and keyboard passes were actually run and the result is verified, never asserted. |

## Հայերեն

Կիրառիր այս rubric-ը ցանկացած interface deliverable վերջնականացնելուց առաջ (UX-research plan, states-և-microcopy pass, design-token set, component-API spec, performance budget, accessibility-ի իրականացում)։ 5 միավորի համար պետք է mechanism, evidence և ստուգելի artifact — և, որտեղ աշխատանքը կառուցված է, verified-rendered արդյունք, ոչ claim։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Research validity | Design-ը սկսվեց pixel-ից. user/problem ենթադրված։ | Մեթոդ նշված է։ | Մեթոդը համապատասխանում է հարցին, վարքը observed է կարծիքից առաջ, և problem-ը validate-ված է նախքան design-ը՝ evidence-ը տարված ամեն element-ի մեջ։ |
| Interaction design | Հարթ hierarchy. միայն happy state։ | Hierarchy և որոշ state կա։ | Մեկ primary action ու հստակ hierarchy (squint-test անցնում է). ամեն կիրառելի state նախագծված. microcopy-ն անվանում է արդյունքը. motion-ը իմաստալից է. ճիշտ law-երը (Fitts/Hick/Jakob/Tesler/Gestalt) կիրառված են։ |
| Design-system rigor | Hardcode արժեք. one-off component։ | Որոշ token կամ shared component։ | Երեք-շերտ token՝ component-ները միայն semantic սպառող. atomic composition. component-API-ն contract է (slot/compound, գիտակցված controlled state). theming-ը token swap է. governance-ը enforceable է։ |
| Frontend implementation | Server data global store-ում. rendering նորաձևությամբ։ | State և rendering ընտրությունները նշված են։ | State-ը բաշխված է ըստ data-ի ownership-ի (local/query-cache/global/URL/form). rendering model-ը համապատասխանում է content×interactivity×SEO×scale-ին. Core Web Vitals-ը չափված է field data-ով ու budget-ված CI-ում. optimization-ը թիրախավորում է չափված hotspot։ |
| Accessibility — verified | «WCAG compliant» պնդված, կամ անտեսված։ | Automated scan գործարկված։ | Semantic HTML նախ, ARIA միայն բացերի. keyboard/focus/`Esc`/trap ճիշտ. contrast թեստավորված state-երին. screen-reader-ի և keyboard-ի pass-երը իրականում գործարկվել են և արդյունքը verified է, երբեք պնդված։ |
