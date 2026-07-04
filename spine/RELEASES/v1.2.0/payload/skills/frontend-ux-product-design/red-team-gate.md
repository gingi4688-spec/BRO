# Frontend, UX, and Product Design red-team gate

## English

This gate extends the skill's final gate for the interface deliverables (UX-research plan, states-and-microcopy pass, design-token set, component-API spec, performance budget, accessibility implementation). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Design with no validated problem** — a surface built on an assumed user/job. Require the evidence, or a labeled assumption plus the method that would settle it; do not polish an unvalidated problem.
- **Accessibility claimed, not verified** — "WCAG 2.2 AA compliant" with only an automated scan or nothing. Require the keyboard pass, the screen-reader spot-check, and tested contrast on states; an untested conformance claim is a factual-hygiene violation.
- **Only the happy state designed** — empty/loading/error/permission-denied/too-much-data missing. Require the full applicable state set before "done."
- **Hardcoded values instead of semantic tokens** — raw hex/px in components, theming as a rewrite. Require a three-tier set with components consuming semantic only.
- **Server data treated as client state** — a global store holding API responses with manual sync. Require a query/cache layer and URL for view state.
- **Color-only meaning** — status by hue alone. Require icon/text/shape pairing and a color-blind check, plus the contrast floor on the status state.
- **Performance asserted, not measured** — "feels fast" on demo data, no CWV/field numbers, no CI budget. Require LCP/INP/CLS measured on field data with what moves each.
- **Component shipped without focus-visible/disabled or with bolted-on ARIA** — require the full state set and native/APG-based a11y baked in.
- **"Done" on a green build** — no rendered observation. Require verify-in-the-running-UI across states, roles, and viewports.
- **Dark pattern in the design** — confirm-shaming, roach-motel cancel, pre-checked opt-ins, false urgency, hidden costs. Refuse; design for the user's interest, and note many of these are increasingly restricted under consumer-protection rules.

### Reviewer probes (ask these of any answer)

- Was the problem validated, or assumed? What evidence — and if there is none, what method would settle it before drawing? Is a dashboard even the right surface, or did the user come to act?
- Which states are designed and verified — empty (first-run vs filtered-to-zero), loading, error, permission-denied, offline, too-much-data — or does only the full state exist?
- Do components consume semantic tokens or hardcoded values? Does theming (dark/density) work as a token-value swap, or would it be a rewrite?
- Where does each kind of state live — local, query/cache, global store, URL, form library — or is server data shoved into one mega-store?
- Is the rendering model chosen by content × interactivity × SEO × scale, or by framework fashion?
- Is performance measured (LCP/INP/CLS on field data, CI budget) with what moves each, or asserted from demo-data feel? Is the long list virtualized?
- Is accessibility verified — semantic HTML first, keyboard pass, screen-reader spot-check, tested contrast on states — or claimed? Is any status conveyed by color alone?
- Does the component ship its full state set including focus-visible and disabled, with ARIA/keyboard/focus from a native element or an APG primitive, not bolted on?
- Was the UI observed rendered in the running app across states, representative roles, and the smallest + a large viewport, or is "done" resting on a green build?
- Did the answer invent a benchmark, price, or untested "compliant" claim, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը interface deliverable-ների համար (UX-research plan, states-և-microcopy pass, design-token set, component-API spec, performance budget, accessibility-ի իրականացում)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Design առանց validate-ված problem-ի** — surface, որ կառուցված է ենթադրված user/job-ի վրա։ Պահանջիր evidence, կամ label-ված ենթադրություն plus մեթոդը, որ կլուծեր այն. unvalidated problem-ը մի՛ հղկիր։
- **Accessibility պնդված, ոչ ստուգված** — «WCAG 2.2 AA compliant» միայն automated scan-ով կամ ընդհանրապես։ Պահանջիր keyboard pass, screen-reader spot-check և թեստավորված contrast state-երին. չ-test-ված conformance claim-ը factual-hygiene-ի խախտում է։
- **Միայն happy state-ը նախագծված** — empty/loading/error/permission-denied/too-much-data բացակայում են։ Պահանջիր ամբողջ կիրառելի state set-ը նախքան «done»-ը։
- **Hardcode արժեք semantic token-ի փոխարեն** — raw hex/px component-ում, theming-ը որպես rewrite։ Պահանջիր երեք-շերտ set՝ component-ները միայն semantic սպառող։
- **Server data՝ որպես client state ընկալված** — global store, որ API response է պահում ձեռքով sync-ով։ Պահանջիր query/cache layer և URL՝ view state-ի համար։
- **Color-only meaning** — status միայն hue-ով։ Պահանջիր icon/text/shape զուգում և color-blind ստուգում, plus contrast հատակ status state-ին։
- **Performance պնդված, ոչ չափված** — «արագ է զգացվում» demo data-ի վրա, CWV/field թիվ չկա, CI budget չկա։ Պահանջիր LCP/INP/CLS չափված field data-ով՝ ինչն է ամեն մեկը շարժում։
- **Component ship առանց focus-visible/disabled-ի կամ կպցրած ARIA-ով** — պահանջիր ամբողջ state set և native/APG-հիմքով a11y՝ ներսից։
- **«Done» green build-ի վրա** — rendered observation չկա։ Պահանջիր verify-in-the-running-UI՝ state-ներով, role-երով ու viewport-ներով։
- **Dark pattern design-ում** — confirm-shaming, roach-motel cancel, pre-checked opt-in, false urgency, թաքնված cost։ Մերժիր. նախագծիր user-ի շահի համար, և նշիր, որ դրանցից շատերն ավելի ու ավելի սահմանափակվում են consumer-protection կանոններով։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Problem-ը validate-վե՞ց, թե ենթադրվեց։ Ինչ evidence — և եթե չկա, ինչ մեթոդ կլուծեր այն նախքան նկարելը։ Dashboard-ն ընդհանրապես ճիշտ surface է՞, թե user-ը եկել է գործելու։
- Որ state-երն են նախագծված ու ստուգված — empty (first-run vs filtered-to-zero), loading, error, permission-denied, offline, too-much-data — թե միայն full state-ը կա։
- Component-ները semantic token սպառո՞ւմ են, թե hardcode արժեք։ Theming-ը (dark/density) աշխատո՞ւմ է որպես token-արժեքի swap, թե rewrite կլիներ։
- Որտեղ է ապրում ամեն տեսակի state-ը — local, query/cache, global store, URL, form library — թե server data-ն խցկված է մեկ mega-store-ում։
- Rendering model-ը ընտրված է՞ ըստ content × interactivity × SEO × scale-ի, թե framework-ի նորաձևությամբ։
- Performance-ը չափվա՞ծ է (LCP/INP/CLS field data-ով, CI budget) ինչն է ամեն մեկը շարժում, թե պնդված է demo-data զգացումից։ Երկար list-ը virtualize-վա՞ծ է։
- Accessibility-ն verified է՞ — semantic HTML նախ, keyboard pass, screen-reader spot-check, թեստավորված contrast state-երին — թե պնդված։ Որևէ status հաղորդվո՞ւմ է միայն color-ով։
- Component-ը ship է անո՞ւմ իր ամբողջ state set-ը ներառյալ focus-visible և disabled, ARIA/keyboard/focus-ով native element-ից կամ APG primitive-ից, ոչ կպցրած։
- UI-ն դիտվե՞ց rendered running app-ում՝ state-ներով, representative role-երով ու ամենափոքր + մեծ viewport-ով, թե «done»-ը հենվում է green build-ի վրա։
- Պատասխանը հորինե՞ց benchmark, price կամ չ-test-ված «compliant» claim, և հայերենը equal-depth ու punctuation-clean է՞։
