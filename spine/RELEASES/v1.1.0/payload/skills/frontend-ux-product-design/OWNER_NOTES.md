# Frontend, UX, and Product Design owner notes

## English

### Needs human review when

This skill designs and builds interfaces; it must route to a human owner — not assert or ship on its own authority — when a surface makes a legal/conformance claim, shapes consent, can manipulate the user, or governs irreversible or high-stakes user actions. Escalate and require explicit sign-off when:

- **An accessibility / WCAG conformance claim is going public.** "WCAG 2.2 AA compliant" or an accessibility statement is a legal-adjacent assertion. The manual passes (keyboard, screen-reader, tested contrast on states) must be run, and a human owner — ideally with an accessibility specialist — signs off; never let an automated scan stand in for the claim.
- **Consent, privacy, and data-handling UI.** Cookie banners, marketing/data-sharing opt-ins, age gates, and permission requests carry regulatory weight (consumer-protection, privacy law). Design opt-in as an explicit action with no pre-checked boxes and no dark patterns; route the final copy and the consent flow to legal/compliance (`legal-compliance-contracts`) before shipping.
- **Anything that looks like a dark pattern.** Confirm-shaming, roach-motel cancellation, forced continuity, hidden costs, disguised ads, false urgency. Refuse to build it; if there is business pressure, escalate to an owner with the trust cost and the regulatory exposure stated, and offer the honest alternative.
- **Irreversible or high-stakes user actions.** Delete-account, bulk-delete, payment confirmation, irreversible data export. The microcopy, the confirmation pattern (name the consequence and object), and the recovery/undo path must be reviewed by an owner; do not ship a destructive flow with a vague button or no recovery.
- **Regulated-domain copy and disclosures.** Financial, medical, or legal interfaces where wording is regulated. The interaction design is yours; the regulated wording and required disclosures route to the relevant specialist and an owner.
- **Cutting the unhappy-path states under deadline pressure.** Dropping empty/error/permission states to ship faster is a scope decision with user-facing risk; it requires an explicit, owner-approved cut with the risk named, never a quiet omission.

The default posture for all of the above: produce the design, the evidence, the verified-rendered passes, and the honest alternative; then stop and route to the owner. Do not publish the claim, the consent flow, or the dark pattern on your own authority.

### Owned future-improvement items

- **✓ DELIVERED (gazan 2026-07-02)** — Add a third worked example for a **multi-step form / wizard** (inline forgiving validation, preserve-input-on-error, progress and Goal-Gradient), since forms are the highest-friction surface and deserve their own end-to-end example.
- Add a **microcopy-and-localization pattern** that treats text as an interaction and accessibility surface (what a screen reader announces) and plans for text expansion, coordinating with `communication-writing-negotiation` and `language-mastery`.
- Add a **container-query / fluid-scaling responsive recipe** (component-level responsiveness with `clamp` and container queries) so responsive behavior inside the structure is copy-ready, while page-level responsive priority stays with `ui-page-structure-design`.
- Add a **design-token governance worked example** (lint rule + CI contrast check + visual-regression) to make "conformance is enforceable, not aspirational" concrete end-to-end.
- Add a **dataviz pattern** (Tufte data-ink, chart-by-question, the lie factor / honest axes) for the data-display half of product design, kept distinct from page-level IA.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նախագծում և կառուցում է interface-ներ. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե պնդի կամ ship անի սեփական լիազորությամբ — երբ surface-ը legal/conformance claim է անում, consent է ձևավորում, կարող է user-ին մանիպուլյացիա անել, կամ կառավարում է անդառնալի կամ high-stakes user action։ Escalate արա և պահանջիր հստակ sign-off, երբ․

- **Accessibility / WCAG conformance claim-ը հրապարակային է դառնում։** «WCAG 2.2 AA compliant»-ը կամ accessibility statement-ը legal-հարակից պնդում է։ Ձեռքի pass-երը (keyboard, screen-reader, թեստավորված contrast state-երին) պետք է գործարկվեն, և մարդ-owner-ը — իդեալում accessibility specialist-ով — sign-off անի. երբեք automated scan-ը չթողնես claim-ի փոխարեն կանգնի։
- **Consent, privacy և data-handling UI։** Cookie banner, marketing/data-sharing opt-in, age gate և permission request-ը կարգավորիչ կշիռ ունեն (consumer-protection, privacy law)։ Նախագծիր opt-in-ը որպես հստակ action՝ առանց pre-checked box-ի ու dark pattern-ի. final copy-ն ու consent flow-ը ուղղորդիր legal/compliance-ին (`legal-compliance-contracts`) նախքան ship-ը։
- **Ամեն ինչ, որ dark pattern է թվում։** Confirm-shaming, roach-motel cancellation, forced continuity, թաքնված cost, disguised ad, false urgency։ Հրաժարվիր կառուցելուց. եթե business ճնշում կա, escalate արա owner-ին՝ trust-ի cost-ը ու կարգավորիչ ռիսկը նշված, և առաջարկիր ազնիվ այլընտրանքը։
- **Անդառնալի կամ high-stakes user action-ներ։** Delete-account, bulk-delete, payment confirmation, անդառնալի data export։ Microcopy-ն, confirmation pattern-ը (consequence-ը ու object-ը անվանիր), և recovery/undo path-ը պետք է owner-ը ստուգի. մի՛ ship արա destructive flow vague button-ով կամ առանց recovery-ի։
- **Regulated-domain copy և disclosure։** Financial, medical կամ legal interface, որտեղ wording-ը կարգավորվում է։ Interaction design-ը քոնն է. regulated wording-ը և պահանջվող disclosure-ները ուղղորդվում են համապատասխան specialist-ին ու owner-ին։
- **Unhappy-path state-երը deadline-ի ճնշման տակ կտրելը։** Empty/error/permission state-երը արագ ship-ի համար բաց թողնելը scope որոշում է user-facing ռիսկով. պահանջում է հստակ, owner-հաստատված cut՝ ռիսկը անվանված, երբեք լուռ բացթողում։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր design-ը, evidence-ը, verified-rendered pass-երը և ազնիվ այլընտրանքը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Claim-ը, consent flow-ը կամ dark pattern-ը մի՛ հրապարակիր սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու երրորդ worked example **multi-step form / wizard**-ի համար (inline ներողամիտ validation, preserve-input-on-error, progress ու Goal-Gradient), քանի որ form-ը ամենաբարձր-friction surface-ն է և արժանի է իր ծայրից-ծայր օրինակին։
- Ավելացրու **microcopy-և-localization pattern**, որ text-ը համարում է interaction և accessibility surface (ինչ է screen reader-ը հայտարարում) և պլանավորում text expansion-ը՝ համակարգելով `communication-writing-negotiation`-ի ու `language-mastery`-ի հետ։
- Ավելացրու **container-query / fluid-scaling responsive recipe** (component-level responsiveness՝ `clamp`-ով ու container query-ով), որ structure-ի *ներսի* responsive վարքը copy-ready լինի, մինչ էջի մակարդակի responsive priority-ն մնում է `ui-page-structure-design`-ի մոտ։
- Ավելացրու **design-token governance worked example** (lint rule + CI contrast check + visual-regression), որ «conformance-ը enforceable է, ոչ aspirational»-ը կոնկրետ լինի ծայրից ծայր։
- Ավելացրու **dataviz pattern** (Tufte data-ink, chart-ը-ըստ-հարցի, lie factor / ազնիվ axis) product design-ի data-display կեսի համար, պահված տարբեր էջի մակարդակի IA-ից։
