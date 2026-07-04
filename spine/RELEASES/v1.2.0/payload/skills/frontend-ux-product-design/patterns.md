# Frontend, UX, and Product Design patterns

## English

These are canonical interface moves, one per role plus the verify gate. Each is a mechanism for a real deliverable (UX-research plan, states-and-microcopy pass, design-token set, component-API spec, performance/a11y verification). Choose the move that changes the next decision, not the nicest label. Page structure, IA, and the per-page state matrix belong to `ui-page-structure-design` — these patterns operate inside that structure.

### 1. Problem-validation research plan

- **Trigger:** A new surface or flow is requested, and the user, the job, or the problem is assumed rather than evidenced.
- **Mechanism:** State the user, the job-to-be-done, and the problem as a labeled assumption. Pick the method by the open question: generative **interviews** about past behavior and **contextual inquiry** for what/why and mental models; a **usability test** (give a realistic task, watch silently, 5 users surface ~80%) for "does the current design work"; a **tree test** for nav findability before screens exist. Run it, then carry the evidence into the design as the reason each element exists.
- **Do not use when:** The problem is already validated with recent evidence — do not re-run discovery as ritual; move to design and reserve research for the open questions.
- **Failure repair:** If design started at the pixel with no evidence, stop and validate the problem first; a week of research saves a quarter of building, and watching behavior beats trusting stated preference.

### 2. States and microcopy pass

- **Trigger:** A data-driven surface exists with only its full-data ("happy") state designed.
- **Mechanism:** Design every applicable state up front — **empty** (first-run teaches and offers the primary action; filtered-to-zero offers to clear filters), **loading** (skeleton over spinner for layout-stable content, no layout shift), **error** (what happened + what to do + retry, never a raw stack trace), **success**, **permission-denied** (explain + who to ask), **offline/stale**, **too-much-data** (paginate/virtualize/summarize). Write the microcopy so buttons name the action and result, errors are blameless and actionable, and empty states sell the feature.
- **Do not use when:** The page structure and which states apply is the open question — that is `ui-page-structure-design`'s state matrix; here you design the craft of each state, not enumerate the page's sections.
- **Failure repair:** If only the full state exists, it is a demo not a feature; add the missing states and verify each one rendered before calling it done.

### 3. Three-tier design-token set

- **Trigger:** Components hold hardcoded colors/pixels, theming would be a rewrite, or there are five button styles and eyedropper one-off colors.
- **Mechanism:** Define tokens in three tiers — **primitive** (`gray-700`, `space-4`) → **semantic** (`color-text-primary`, `color-bg-danger`, `space-inset-card`) → **component** (`button-bg-hover`). Make components consume **semantic** tokens only; store them in a tool-agnostic format (W3C DTCG JSON / Style Dictionary) so design and code read one source. Re-skin light/dark, density, brand, and high-contrast as alternate semantic-token values, not CSS forks. Add a lint rule banning raw hex/px in components and a contrast check on token pairs.
- **Do not use when:** A genuine one-off prototype that will be thrown away — the token tax is not worth it for a disposable spike; everything shipped or reused needs tokens.
- **Failure repair:** If a value has no token, you found a gap — add the token, do not hardcode; if dark mode became a rewrite, it means components consumed primitives, so re-point them at semantic tokens.

### 4. Component-API spec (a contract)

- **Trigger:** A component is being built or reused, or a 30-prop monolith with boolean flags has become unmaintainable.
- **Mechanism:** Design props as a minimal, composable, predictable contract; make controlled vs uncontrolled a deliberate choice; prefer slots/children and **compound components** over a forest of boolean props (composition over configuration), with polymorphism (`as`/`asChild`) and sensible defaults to keep the API small. Bake in the **full state set** (default/hover/active-pressed/focus-visible/disabled/loading/error/selected) and encode the **ARIA role, keyboard model, and focus** from a proven APG pattern (Radix / React Aria) so consumers cannot get a11y wrong. Document variants, states, do's/don'ts, and the a11y notes.
- **Do not use when:** The need is genuinely a one-screen layout, not a reusable class of problem — solve it with layout primitives, do not over-abstract a single use into a component API.
- **Failure repair:** If the component ships without focus-visible and disabled, it is half-built; if ARIA was bolted on after the fact, rebuild on the native element or the APG primitive so keyboard/focus/role come for free.

### 5. Verify-in-the-running-UI gate (performance + accessibility)

- **Trigger:** A UI is about to be called "done," or accessibility/performance is being claimed rather than measured.
- **Mechanism:** Open the running app and verify rendered reality: every state in the matrix, representative roles for role UIs, the smallest and a large viewport, dark mode if supported. Run the manual accessibility passes — keyboard-only (tab order, visible `:focus-visible`, `Esc`, focus trap+restore in modals, APG widget behavior), a screen-reader spot-check (names, `aria-live`, roles/states), and tested contrast including states. Read the **Core Web Vitals** from field/RUM data (LCP < 2.5s, INP < 200ms, CLS < 0.1) and a Lighthouse pass; fix the measured hotspot. Replace any claim with the verified result.
- **Do not use when:** Never skip it for a shipped surface — there is no "do not use." The only adjustment is depth: a tiny static change still gets a rendered glance, a complex interactive surface gets the full pass.
- **Failure repair:** If "done" rested on a green build, it is not verified — a passing pipeline is necessary, not sufficient; if "WCAG compliant" had no keyboard/screen-reader pass, the claim is unproven and must be replaced with the actual passes.

## Հայերեն

Սրանք canonical interface move-եր են՝ մեկ ամեն role-ի համար plus verify gate-ը։ Ամեն մեկը mechanism է իրական deliverable-ի համար (UX-research plan, states-և-microcopy pass, design-token set, component-API spec, performance/a11y verification)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ ամենագեղեցիկ անունը։ Էջի structure-ը, IA-ն և per-page state matrix-ը `ui-page-structure-design`-ինն են — այս pattern-ները գործում են այդ structure-ի *ներսում*։

### 1. Problem-validation research plan

- **Երբ է պետք․** Նոր surface կամ flow է խնդրվում, և user-ը, job-ը կամ problem-ը ենթադրված է, ոչ evidence-ով։
- **Մեխանիզմը․** Նշիր user-ը, job-to-be-done-ը և problem-ը որպես label-ված ենթադրություն։ Ընտրիր մեթոդը ըստ բաց հարցի՝ generative **interview** անցյալ վարքի մասին և **contextual inquiry**՝ ինչ/ինչու-ի և mental model-ի համար. **usability test** (տուր իրական task, դիտիր լուռ, 5 user-ը բացում է ~80%)՝ «ընթացիկ design-ը աշխատո՞ւմ է»-ի համար. **tree test**՝ nav-ի findability-ի համար նախքան էկրանները գոյություն ունենան։ Գործարկիր, հետո տար evidence-ը design-ի մեջ՝ որպես ամեն element-ի գոյության պատճառ։
- **Երբ չօգտագործել․** Problem-ը արդեն validate-ված է թարմ evidence-ով — discovery-ն ծես չանես. անցիր design-ի և research-ը պահիր բաց հարցերի համար։
- **Ուղղում․** Եթե design-ը սկսվեց pixel-ից առանց evidence-ի, կանգնիր և նախ validate արա problem-ը. մեկ շաբաթ research-ը խնայում է եռամսյակ կառուցում, և վարք դիտելը հաղթում է ասված preference-ին վստահելուն։

### 2. States-և-microcopy pass

- **Երբ է պետք․** Data-driven surface կա միայն իր full-data («happy») state-ով նախագծված։
- **Մեխանիզմը․** Նախագծիր ամեն կիրառելի state-ը նախապես — **empty** (first-run-ը սովորեցնում է ու առաջարկում primary action. filtered-to-zero-ն առաջարկում է clear filter), **loading** (skeleton > spinner layout-stable-ի համար, ոչ layout shift), **error** (ինչ եղավ + ինչ անել + retry, երբեք raw stack trace), **success**, **permission-denied** (բացատրիր + ում հարցնել), **offline/stale**, **too-much-data** (paginate/virtualize/summarize)։ Գրիր microcopy-ն այնպես, որ button-ն անվանի action-ն ու արդյունքը, error-ը ոչ-մեղադրող ու actionable լինի, և empty state-ը վաճառի feature-ը։
- **Երբ չօգտագործել․** Երբ էջի structure-ը և որ state-երն են կիրառվում բաց հարցն է — դա `ui-page-structure-design`-ի state matrix-ն է. այստեղ նախագծում ես ամեն state-ի craft-ը, ոչ թե թվարկում էջի բաժինները։
- **Ուղղում․** Եթե միայն full state-ը կա, դա demo է, ոչ feature. ավելացրու բացակայող state-երը և ստուգիր ամեն մեկը rendered-ում նախքան done ասելը։

### 3. Երեք-շերտ design-token set

- **Երբ է պետք․** Component-ները hardcode color/pixel են պահում, theming-ը rewrite կլիներ, կամ կա հինգ button style ու eyedropper one-off color։
- **Մեխանիզմը․** Սահմանիր token երեք շերտով — **primitive** (`gray-700`, `space-4`) → **semantic** (`color-text-primary`, `color-bg-danger`, `space-inset-card`) → **component** (`button-bg-hover`)։ Component-ները դարձրու միայն **semantic** token սպառող. պահիր tool-agnostic ձևով (W3C DTCG JSON / Style Dictionary), որ design-ն ու code-ը մեկ source կարդան։ Re-skin արա light/dark, density, brand և high-contrast-ը որպես semantic-token-ի այլընտրանքային արժեքներ, ոչ CSS fork։ Ավելացրու lint rule, որ արգելի raw hex/px component-ում, և contrast check token զույգերին։
- **Երբ չօգտագործել․** Իսկական one-off prototype, որ դեն կնետվի — token-ի tax-ը չարժի disposable spike-ի համար. ամեն ship-վող կամ reuse-վող բան token է ուզում։
- **Ուղղում․** Եթե արժեքը token չունի, gap ես գտել — ավելացրու token, մի՛ hardcode. եթե dark mode-ը rewrite դարձավ, նշանակում է component-ները primitive էին սպառում, ուստի վերա-ուղղիր դրանք semantic token-ին։

### 4. Component-API spec (contract)

- **Երբ է պետք․** Component է կառուցվում կամ reuse-վում, կամ 30-prop monolith՝ boolean flag-երով, դարձել է unmaintainable։
- **Մեխանիզմը․** Նախագծիր props-ը որպես minimal, composable, կանխատեսելի contract. controlled vs uncontrolled՝ գիտակցված ընտրություն. նախընտրիր slot/children և **compound component**՝ boolean prop-երի անտառի փոխարեն (composition over configuration), polymorphism-ով (`as`/`asChild`) ու խելամիտ default-ով՝ API-ն փոքր պահելու։ Կոդավորիր **ամբողջ state set**-ը (default/hover/active-pressed/focus-visible/disabled/loading/error/selected) և **ARIA role-ը, keyboard model-ը ու focus-ը** ապացուցված APG pattern-ից (Radix / React Aria), որ consumer-ը a11y-ն չսխալվի։ Փաստաթղթավորիր variant, state, do/don't և a11y note-ը։
- **Երբ չօգտագործել․** Երբ կարիքը իսկապես մեկ-էկրանի layout է, ոչ reusable problem-ի class — լուծիր layout primitive-ով, մի՛ over-abstract արա մեկ use-ը component API-ի։
- **Ուղղում․** Եթե component-ը ship է առանց focus-visible-ի ու disabled-ի, կիսատ է. եթե ARIA-ն հետո է կպցրած, վերակառուցիր native element-ի կամ APG primitive-ի վրա, որ keyboard/focus/role ձրի գան։

### 5. Verify-in-the-running-UI gate (performance + accessibility)

- **Երբ է պետք․** UI-ն պատրաստվում է «done» անվանվել, կամ accessibility/performance-ը պնդվում է, ոչ չափվում։
- **Մեխանիզմը․** Բացիր running app-ը և ստուգիր rendered իրականությունը՝ matrix-ի ամեն state-ը, role UI-ի representative role-երը, ամենափոքր ու մեծ viewport-ը, dark mode եթե կա։ Գործարկիր ձեռքի accessibility pass-երը՝ keyboard-only (tab order, տեսանելի `:focus-visible`, `Esc`, focus trap+restore modal-ում, APG widget-ի վարք), screen-reader spot-check (name, `aria-live`, role/state), և թեստավորված contrast ներառյալ state-երը։ Կարդա **Core Web Vitals**-ը field/RUM data-ից (LCP < 2.5s, INP < 200ms, CLS < 0.1) ու Lighthouse pass. ուղղիր չափված hotspot-ը։ Փոխարինիր ամեն claim verified արդյունքով։
- **Երբ չօգտագործել․** Երբեք մի՛ բաց թող ship-վող surface-ի համար — «չօգտագործել» չկա։ Միակ ճշգրտումը խորությունն է՝ փոքր static փոփոխությունը դեռ rendered հայացք է ստանում, բարդ interactive surface-ը՝ ամբողջ pass-ը։
- **Ուղղում․** Եթե «done»-ը հենվեց green build-ի վրա, verified չէ — անցնող pipeline-ը անհրաժեշտ է, ոչ բավարար. եթե «WCAG compliant»-ը keyboard/screen-reader pass չուներ, claim-ը ապացուցված չէ և պետք է փոխարինվի իրական pass-երով։
