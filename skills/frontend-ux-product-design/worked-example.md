# Frontend, UX, and Product Design worked examples

## English

### Example A — component-API + token spec for a reusable Button

**Prompt.** We have five different button styles across the app and dark mode is a mess. Design a `Button` we can standardize on.

**Senior answer.** Build it as a system component with a contract API and semantic tokens, not a sixth style.

**Tokens (three tiers).** Primitive: `gray-900`, `blue-600`, `red-600`, `space-2`, `space-3`, `radius-md`. Semantic (what the button consumes): `color-action-primary-bg` → `blue-600`, `color-action-primary-text` → `white`, `color-action-danger-bg` → `red-600`, `color-action-disabled-bg`, `color-focus-ring`, `space-button-inset-x` → `space-3`, `space-button-inset-y` → `space-2`. Dark mode is **alternate values for the same semantic tokens** (`color-action-primary-bg` → `blue-500` on dark), so the button never changes — that is why dark mode stops being a rewrite.

**API (a contract, not flags).** `variant: 'primary' | 'secondary' | 'danger' | 'ghost'` (one prop, not four booleans); `size: 'sm' | 'md' | 'lg'`; `isLoading`; `isDisabled`; `iconStart` / `iconEnd` as slots; `asChild` for polymorphism (render as a link when it navigates). Controlled-ness does not apply — a button is action, not state. No `isPrimary` + `isDanger` combination that can contradict.

**Full state set, designed and built:** default, hover, active-pressed, **focus-visible** (a `color-focus-ring` outline via `:focus-visible`, never `outline:none` with no replacement), **disabled** (with `aria-disabled` and a non-color cue, since color-only fails contrast and color-blind users), **loading** (a spinner replaces the label, the button keeps its width to avoid layout shift, and `aria-busy="true"` announces it). Accessibility baked in: it renders a native `<button>` (keyboard, focus, and role for free), the label names the result ("Send invoice," not "Submit"), disabled state still meets the 3:1 UI-component contrast floor so it is perceivable.

**Why this passes.** It refuses to add a sixth style and instead fixes the cause: the five styles existed because there were no tokens and no contract, so it defines a three-tier set where the component consumes only semantic tokens — which is precisely why dark mode becomes a token-value swap, not a rewrite (the stated problem). The API is a contract: one `variant` enum instead of contradictory booleans, slots and `asChild` over a forest of flags (composition over configuration). The full state set is present including the two that are usually skipped — focus-visible and disabled — and accessibility is built into the native element rather than claimed, with the disabled state held to the 3:1 floor and `aria-busy` on loading. Nothing here is "WCAG compliant" by assertion; the keyboard and contrast behavior is in the spec to be verified rendered.

### Example B — research + accessibility + performance critique of a "finished" dashboard

**Prompt.** This analytics dashboard is done — it compiles, the tests pass, and it looks great with our demo data. Ship it?

**Senior answer.** Not yet — "compiles" and "tests pass" are not "verified rendered," and three things are unproven.

**Research.** Was the dashboard's job validated, or assumed? A dashboard is the right answer only if the user came to *monitor*; if they came to *act*, a passive metrics wall is the wrong surface (lead with actionable work, not a chart grid). Confirm the job with the one piece of evidence that settles it — a five-user task test ("using this screen, do the thing you actually came to do") — before polishing it.

**States.** It "looks great with demo data" means only the full-data state was built. Design and verify the rest: empty / first-run (teach + offer the primary action), filtered-to-zero (offer to clear filters), loading (skeleton, no layout shift), error (a recovery action, never a raw stack trace), permission-denied (explain + who to ask), and too-much-data (virtualize the long table — do not render 10k DOM rows). The unhappy path is the product.

**Accessibility — verified, not claimed.** Do not write "accessible." Run the manual passes: keyboard-only (can you reach every control, is `:focus-visible` visible, does `Esc` close the filter drawer, is focus trapped and restored?), a screen-reader spot-check (do the charts have text alternatives, does the results count announce via `aria-live`, are status colors paired with text/icon so they survive deuteranopia?), and tested contrast on body (4.5:1) and the chart/UI elements (3:1) including disabled and focus states. The automated scan you ran catches ~30–40%; it is not the proof.

**Performance — measured, not felt.** "Looks great" is lab feel on demo data. Read field/RUM Core Web Vitals: LCP < 2.5s (is the largest chart the LCP element, and is it prioritized?), INP < 200ms (do the filter interactions block the main thread — break up the long task), CLS < 0.1 (do late-loading widgets shift the layout — reserve their space?). Budget these in CI; code-split the heavy chart library; virtualize the table. Then verify rendered, then ship.

**Why this passes.** It rejects the three false signals explicitly — green build, passing tests, and demo-data polish — and replaces each with the verified-in-the-running-UI gate this domain requires. It questions whether a dashboard is even the right surface (the research/job question) rather than accepting the format, then names the exact missing states with the right treatment for each (skeleton for loading, virtualization for too-much-data). Critically, it refuses to call accessibility done from an automated scan and lists the specific manual passes — keyboard, screen-reader, tested contrast on states — that constitute real conformance, with color-only status flagged. And it converts "looks fast" into the three Core Web Vitals with what moves each, measured on field data and gated in CI, so performance is a number with a hotspot, not a feeling.

## Հայերեն

### Օրինակ A — component-API + token spec reusable Button-ի համար

**Prompt.** App-ում ունենք հինգ տարբեր button style, և dark mode-ը խառնաշփոթ է։ Նախագծիր `Button`, որ կարող ենք standardize անել։

**Senior պատասխան.** Կառուցիր այն որպես system component՝ contract API-ով և semantic token-ով, ոչ վեցերորդ style-ով։

**Token (երեք շերտ).** Primitive՝ `gray-900`, `blue-600`, `red-600`, `space-2`, `space-3`, `radius-md`։ Semantic (ինչ է button-ը սպառում)՝ `color-action-primary-bg` → `blue-600`, `color-action-primary-text` → `white`, `color-action-danger-bg` → `red-600`, `color-action-disabled-bg`, `color-focus-ring`, `space-button-inset-x` → `space-3`, `space-button-inset-y` → `space-2`։ Dark mode-ը **նույն semantic token-ի այլընտրանքային արժեքներն** են (`color-action-primary-bg` → `blue-500` dark-ի վրա), ուստի button-ը երբեք չի փոխվում — հենց դա է, որ dark mode-ը դադարում է rewrite լինելուց։

**API (contract, ոչ flag).** `variant: 'primary' | 'secondary' | 'danger' | 'ghost'` (մեկ prop, ոչ չորս boolean). `size: 'sm' | 'md' | 'lg'`. `isLoading`. `isDisabled`. `iconStart` / `iconEnd`՝ որպես slot. `asChild`՝ polymorphism-ի համար (render որպես link, երբ navigate է անում)։ Controlled-ությունը չի կիրառվում — button-ը action է, ոչ state։ Չկա `isPrimary` + `isDanger` համադրություն, որ կարող է հակասել։

**Ամբողջ state set, նախագծված ու կառուցված՝** default, hover, active-pressed, **focus-visible** (`color-focus-ring` outline `:focus-visible`-ով, երբեք `outline:none` առանց փոխարինման), **disabled** (`aria-disabled`-ով և ոչ-color cue-ով, քանի որ միայն-color-ը ձախողում է contrast-ը ու color-blind user-ին), **loading** (spinner-ը փոխարինում է label-ին, button-ը պահում է իր լայնքը՝ layout shift-ից խուսափելու, և `aria-busy="true"`-ն հայտարարում է)։ Accessibility ներսից՝ render է անում native `<button>` (keyboard, focus, role ձրի), label-ն անվանում է արդյունքը («Send invoice», ոչ «Submit»), disabled state-ը դեռ բավարարում է 3:1 UI-component contrast հատակը, որ perceivable լինի։

**Ինչու է անցնում gate-ը.** Այն հրաժարվում է վեցերորդ style ավելացնելուց և փոխարենը ուղղում է պատճառը՝ հինգ style-ը գոյություն ուներ, որովհետև token ու contract չկար, ուստի սահմանում է երեք-շերտ set, որտեղ component-ը միայն semantic token է սպառում — հենց դա է, որ dark mode-ը դարձնում է token-արժեքի swap, ոչ rewrite (նշված problem-ը)։ API-ն contract է՝ մեկ `variant` enum՝ հակասող boolean-ների փոխարեն, slot ու `asChild`՝ flag-երի անտառի փոխարեն (composition over configuration)։ Ամբողջ state set-ը կա՝ ներառյալ սովորաբար բաց թողվող երկուսը՝ focus-visible և disabled — և accessibility-ն կառուցված է native element-ի մեջ, ոչ պնդված, disabled state-ը պահված 3:1 հատակին և `aria-busy`-ն loading-ին։ Ոչինչ այստեղ «WCAG compliant» չէ պնդմամբ. keyboard-ի և contrast-ի վարքը spec-ում է՝ verified rendered լինելու։

### Օրինակ B — «ավարտված» dashboard-ի research + accessibility + performance քննադատություն

**Prompt.** Այս analytics dashboard-ը done է — compile է լինում, test-երն անցնում են, և հիանալի տեսք ունի մեր demo data-ով։ Ship անե՞նք։

**Senior պատասխան.** Դեռ ոչ — «compile է լինում»-ն ու «test-երն անցան»-ը «verified rendered» չեն, և երեք բան ապացուցված չէ։

**Research.** Dashboard-ի job-ը validate-վե՞ց, թե ենթադրվեց։ Dashboard-ը ճիշտ պատասխան է միայն, եթե user-ը եկել է *monitor* անելու. եթե եկել է *գործելու*, passive metrics wall-ը սխալ surface է (առաջ բեր actionable work, ոչ chart grid)։ Հաստատիր job-ը այն մեկ evidence-ով, որ լուծում է հարցը — հինգ-user task test («այս էկրանով արա այն, ինչի համար իրականում եկել ես») — նախքան հղկելը։

**State-եր.** «Հիանալի տեսք ունի demo data-ով»-ը նշանակում է, որ միայն full-data state-ն է կառուցված։ Նախագծիր ու ստուգիր մնացածը՝ empty / first-run (սովորեցրու + առաջարկիր primary action), filtered-to-zero (առաջարկիր clear filter), loading (skeleton, ոչ layout shift), error (recovery action, երբեք raw stack trace), permission-denied (բացատրիր + ում հարցնել), և too-much-data (virtualize արա երկար table-ը — մի՛ render արա 10k DOM row)։ Unhappy path-ը product-ն է։

**Accessibility — verified, ոչ պնդված.** Մի՛ գրիր «accessible»։ Գործարկիր ձեռքի pass-երը՝ keyboard-only (հասնո՞ւմ ես ամեն control-ին, տեսանելի՞ է `:focus-visible`-ը, `Esc`-ը փակո՞ւմ է filter drawer-ը, focus-ը trap ու restore-վա՞ծ է), screen-reader spot-check (chart-երը text alternative ունե՞ն, results count-ը հայտարարվո՞ւմ է `aria-live`-ով, status color-ները զուգվա՞ծ են text/icon-ի հետ, որ դիմանան deuteranopia-ին), և թեստավորված contrast body-ին (4.5:1) ու chart/UI element-ին (3:1) ներառյալ disabled ու focus state-երը։ Քո գործարկած automated scan-ը բռնում է ~30–40%. դա ապացույցը չէ։

**Performance — չափված, ոչ զգացված.** «Հիանալի տեսք ունի»-ն lab զգացում է demo data-ի վրա։ Կարդա field/RUM Core Web Vitals-ը՝ LCP < 2.5s (ամենամեծ chart-ը LCP element է՞, և prioritize-վա՞ծ է), INP < 200ms (filter-ի interaction-ները block են անո՞ւմ main thread-ը — կտրիր երկար task-ը), CLS < 0.1 (ուշ-load-վող widget-ները շեղո՞ւմ են layout-ը — ռեզերվ արա նրանց տեղը)։ Budget արա սրանք CI-ում. code-split արա ծանր chart library-ն. virtualize արա table-ը։ Հետո verify rendered, հետո ship։

**Ինչու է անցնում gate-ը.** Այն բացահայտ մերժում է երեք կեղծ ազդանշանը — green build, անցնող test, demo-data հղկում — և ամեն մեկը փոխարինում է verified-in-the-running-UI gate-ով, որ այս domain-ը պահանջում է։ Այն հարցնում է՝ dashboard-ն ընդհանրապես ճիշտ surface է՞ (research/job հարցը)՝ format-ը չընդունելով, հետո անվանում է ճշգրիտ բացակայող state-երը ամեն մեկի ճիշտ բուժմամբ (skeleton loading-ի, virtualization too-much-data-ի համար)։ Կարևորը՝ այն հրաժարվում է accessibility-ն done անվանելուց automated scan-ից և թվարկում է կոնկրետ ձեռքի pass-երը՝ keyboard, screen-reader, թեստավորված contrast state-երին — որ իրական conformance-ն են, color-only status-ը flag-ված։ Եվ այն «արագ տեսք ունի»-ն վերածում է երեք Core Web Vitals-ի՝ ինչն է ամեն մեկը շարժում, չափված field data-ով ու gated CI-ում, ուստի performance-ը թիվ է hotspot-ով, ոչ զգացում։
