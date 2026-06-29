# Frontend, UX, and Product Design output templates

## English

Domain-shaped deliverables. Fill the real fields; keep every claim traceable to evidence, a measured number, or a verified-rendered observation. Do not invent benchmarks, prices, or untested conformance claims. Page structure, IA, and the per-page state matrix belong to `ui-page-structure-design`.

### Template 1 — Component-API spec

- **Component & job:** what reusable problem it solves (one class of problem, not one screen)
- **API (a contract):**
  - props as enums/slots, not contradictory booleans (e.g. `variant`, `size`, `iconStart` slot)
  - controlled vs uncontrolled — stated and deliberate (or N/A)
  - composition: slots / children / compound parts / `asChild` over boolean-prop forests
- **Variants:** the named variants and when to use each
- **Full state set (all required):** default · hover · active-pressed · **focus-visible** · **disabled** · loading · error · selected
- **Accessibility baked in:** native element or APG primitive used · ARIA role · keyboard model · focus behavior (trap/restore if applicable) · accessible name source
- **Tokens consumed:** semantic tokens only (no primitives, no hardcodes)
- **Do's / Don'ts:** usage guidance
- **Acceptance:** full state set present · a11y encoded not bolted-on · semantic tokens only
- **Verify rendered:** keyboard pass + focus-visible + disabled-contrast (3:1) + screen-reader name, observed in the running app

### Template 2 — Design-token set (three tiers)

- **Primitive / global:** raw palette and scales (`gray-700`, `space-4`, `radius-md`) — the only place raw values live
- **Semantic / alias:** intent-named tokens components consume (`color-text-primary`, `color-bg-danger`, `space-inset-card`, `color-focus-ring`)
- **Component (optional):** component-scoped tokens (`button-bg-hover`)
- **Themes as token-value swaps:** light / dark / density (comfortable·compact) / high-contrast — alternate values for the same semantic tokens, not CSS forks
- **Format & source of truth:** tool-agnostic (W3C DTCG JSON / Style Dictionary) so design and code read one source
- **Governance guard:** lint bans raw hex/px in components · CI checks contrast on token pairs · visual-regression catches drift
- **Acceptance:** components consume semantic only · theming is a swap · no hardcoded values · contrast floors met
- **Verify rendered:** the same component re-skins across light/dark/density by changing only semantic values, observed in the running app

### Template 3 — UX-research plan

- **Decision this informs:** what design/product decision the research will change (route prioritization itself to `product-project-management`)
- **User & job-to-be-done:** stated; labeled as assumption if not yet evidenced ("When [situation], I want to [motivation], so I can [outcome]")
- **Open question:** the single question the study must answer
- **Method (by the question):** generative interview / contextual inquiry (what & why) · usability test (does the design work) · tree test or card sort (findability/IA) · analytics (where they drop) — and why this method fits
- **Protocol:** realistic task(s), think-aloud, participants (~5 for usability), what you measure (success/time/error/hesitation), watch-don't-lead
- **Evidence → design:** how each finding becomes the reason an element exists or changes
- **Acceptance:** method fits the question · behavior measured over opinion · problem validated before drawing
- **Bias guard:** non-leading questions · past behavior over hypothetical · revealed behavior over stated preference

### Template 4 — Performance budget (Core Web Vitals)

- **Surface & user journey:** the flow this protects
- **LCP target < 2.5s:** the LCP element identified · prioritized (fetch-priority, no render-blocking) · what moves it
- **INP target < 200ms:** the heaviest interaction · long-task breakup / main-thread yield · what moves it
- **CLS target < 0.1:** reserved space / set dimensions / no late-injected layout shift · what moves it
- **JS budget:** bytes shipped per route · code-split / lazy-load plan · virtualization for long lists
- **Measurement:** field/RUM (truth) + lab/Lighthouse (regression) · gated in CI
- **Acceptance:** measured against field data, not lab feel · a budget exists and is gated · optimization targets a measured hotspot
- **Verify rendered:** read the live CWV numbers in the running app, not a green build

## Հայերեն

Domain-ձև deliverable-ներ։ Լրացրու իրական field-երը. ամեն claim պահիր հետագծելի evidence-ի, չափված թվի կամ verified-rendered observation-ի։ Մի՛ հորինիր benchmark, price կամ չ-test-ված conformance claim։ Էջի structure-ը, IA-ն և per-page state matrix-ը `ui-page-structure-design`-ինն են։

### Template 1 — Component-API spec

- **Component & job․** ինչ reusable problem է լուծում (problem-ի մեկ class, ոչ մեկ էկրան)
- **API (contract)․**
  - props որպես enum/slot, ոչ հակասող boolean (օր.՝ `variant`, `size`, `iconStart` slot)
  - controlled vs uncontrolled — նշված ու գիտակցված (կամ N/A)
  - composition՝ slot / children / compound part / `asChild`՝ boolean-prop անտառի փոխարեն
- **Variant-ներ․** անվանված variant-ները և երբ կիրառել ամեն մեկը
- **Ամբողջ state set (բոլոր պարտադիր)․** default · hover · active-pressed · **focus-visible** · **disabled** · loading · error · selected
- **Accessibility ներսից․** native element կամ APG primitive օգտագործված · ARIA role · keyboard model · focus behavior (trap/restore եթե կիրառելի) · accessible name-ի աղբյուր
- **Սպառվող token-ներ․** միայն semantic token (ոչ primitive, ոչ hardcode)
- **Do/Don't․** կիրառման ուղեցույց
- **Acceptance․** ամբողջ state set կա · a11y կոդավորված, ոչ կպցրած · միայն semantic token
- **Verify rendered․** keyboard pass + focus-visible + disabled-contrast (3:1) + screen-reader name, դիտված running app-ում

### Template 2 — Design-token set (երեք շերտ)

- **Primitive / global․** raw palette ու scale (`gray-700`, `space-4`, `radius-md`) — միակ տեղը, որտեղ raw արժեքն ապրում է
- **Semantic / alias․** intent-անվանված token, որ component-ները սպառում են (`color-text-primary`, `color-bg-danger`, `space-inset-card`, `color-focus-ring`)
- **Component (ընտրովի)․** component-scoped token (`button-bg-hover`)
- **Theme-եր որպես token-արժեքի swap․** light / dark / density (comfortable·compact) / high-contrast — նույն semantic token-ի այլընտրանքային արժեքներ, ոչ CSS fork
- **Format & source of truth․** tool-agnostic (W3C DTCG JSON / Style Dictionary), որ design-ն ու code-ը մեկ source կարդան
- **Governance guard․** lint-ն արգելում է raw hex/px component-ում · CI-ն ստուգում է contrast token զույգերին · visual-regression-ը բռնում է drift-ը
- **Acceptance․** component-ները միայն semantic են սպառում · theming-ը swap է · hardcode արժեք չկա · contrast հատակները բավարարված
- **Verify rendered․** նույն component-ը re-skin է լինում light/dark/density-ով՝ միայն semantic արժեքները փոխելով, դիտված running app-ում

### Template 3 — UX-research plan

- **Որ որոշումն է սնում․** ինչ design/product որոշում է research-ը փոխելու (prioritization-ն ինքը ուղղորդիր `product-project-management`-ին)
- **User & job-to-be-done․** նշված. label-ված որպես ենթադրություն, եթե դեռ evidence չկա («Երբ [իրավիճակ], ուզում եմ [շարժառիթ], որ կարողանամ [արդյունք]»)
- **Բաց հարց․** այն մեկ հարցը, որ study-ն պետք է պատասխանի
- **Մեթոդ (ըստ հարցի)․** generative interview / contextual inquiry (ինչ ու ինչու) · usability test (design-ը աշխատո՞ւմ է) · tree test կամ card sort (findability/IA) · analytics (որտեղ են ընկնում) — և ինչու է այս մեթոդը համապատասխանում
- **Protocol․** իրական task(եր), think-aloud, մասնակից (~5 usability-ի համար), ինչ ես չափում (success/time/error/hesitation), դիտիր-մի՛-առաջնորդիր
- **Evidence → design․** ոնց է ամեն finding դառնում element-ի գոյության կամ փոփոխության պատճառ
- **Acceptance․** մեթոդը համապատասխանում է հարցին · վարքը չափված կարծիքից առաջ · problem-ը validate-ված նախքան նկարելը
- **Bias guard․** ոչ-առաջնորդող հարց · անցյալ վարք > հիպոթետիկ · revealed behavior > ասված preference

### Template 4 — Performance budget (Core Web Vitals)

- **Surface & user journey․** այս flow-ն է պաշտպանում
- **LCP target < 2.5s․** LCP element-ը նույնականացված · prioritize-ված (fetch-priority, ոչ render-blocking) · ինչն է այն շարժում
- **INP target < 200ms․** ամենածանր interaction-ը · long-task breakup / main-thread yield · ինչն է այն շարժում
- **CLS target < 0.1․** ռեզերվ տեղ / set չափ / ոչ ուշ-injected layout shift · ինչն է այն շարժում
- **JS budget․** ship-վող byte ամեն route-ի · code-split / lazy-load plan · virtualization երկար list-ի համար
- **Չափում․** field/RUM (ճշմարտություն) + lab/Lighthouse (regression) · gated CI-ում
- **Acceptance․** չափված field data-ով, ոչ lab զգացումով · budget կա և gated է · optimization-ը թիրախավորում է չափված hotspot
- **Verify rendered․** կարդա live CWV թվերը running app-ում, ոչ green build
