# Economics and Market Design owner notes

## English

### Needs human review when

This skill models prices, rules, and incentives; it produces analysis, not binding decisions or legal opinions. Route to the right human owner — do not decide or ship on your own authority — when:

- **Regulated pricing or market conduct** — price caps, anti-trust / competition-law thresholds, anything resembling price coordination or collusion with a competitor, consumer-protection rules, or a licensed/regulated market. Model the economics, flag the regulated boundary explicitly, and route the binding opinion to legal. Never design explicit price coordination.
- **Behavioral designs that may extract against the user** — defaults, anchors, loss frames, drip pricing, hard-to-cancel flows. Whether a nudge is a legitimate default or a dark pattern is a people/ethics and legal judgment; name it and route it, do not bury it in the conversion math.
- **Irreversible, high-stakes money commitments** — the committed list price, a discount or rebate policy, reserve/auction parameters that move large revenue, a market-entry or exit, large reserved-capacity or hedging commitments. Surface the elasticity, the margin × volume, and the stress-test; the committed number is decided with the finance/budget owner (see the pricing conflict rule in `SKILL.md`).
- **Mechanism launched at scale with real money** — an auction, marketplace rule, or payout scheme going live. Require the incentive-compatibility argument and the manipulation guardrails before launch; route the go/no-go to the owner with the gaming risk explicit.
- **Macro-driven workforce or capital decisions** — layoffs, hiring freezes, large capex timed to a recession call. The yield-curve/leading-indicator read is a probability signal, not a dated forecast; the human decision must own the uncertainty, and people-org/legal own the workforce action itself.
- **Distributional / welfare claims that affect real people** — a policy or pricing change presented as "good for everyone." Surface winners, losers, and the measurement plan; the decision to accept the distributional harm belongs to the accountable owner, not the model.

The default posture for all of the above: produce the analysis, the assumptions, the labeled numbers, and the stress-test; then stop and route to the owner (legal for regulated/competition, people/ethics for behavioral extraction and workforce, finance for committed money). Do not assert a regulated, ethical, or irreversible decision on your own authority.

### Owned future-improvement items

- **✓ DELIVERED (gazan 2026-07-02)** — Add a fourth worked example for a **market-failure diagnosis with intervention design** (e.g. adverse selection in an insurance/lending product → screening + pooling), to make the failure→fix mapping concrete end-to-end alongside the pricing/mechanism/incentive examples.
- Add a **matching-market pattern** (two-sided matching, stability, the deferred-acceptance idea) for allocation problems where price is not the clearing mechanism (labor, school/residency-style matching).
- Add a copy-ready **macro stress-test worksheet** with the three shock scenarios (demand/rate/FX), the elasticity slot, and the break-point/trigger fields, so the stress-test is a fill-in artifact rather than described.
- Add a short **behavioral-bias catalog** mapping each bias (loss aversion, anchoring, default effect, plus present bias and social proof) to where it changes a demand or pricing prediction, so the correction is systematic rather than ad hoc.
- Cross-link the regulated-boundary handoff explicitly to the legal skill and the behavioral-extraction handoff to the people/ethics skill, so the routing in `OWNER_NOTES.md` resolves to a named destination.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը model է անում price-եր, rule-եր և incentive-ներ. այն արտադրում է վերլուծություն, ոչ պարտադիր որոշումներ կամ իրավական կարծիքներ։ Ուղղորդիր ճիշտ մարդ-տիրոջը — մի՛ որոշիր կամ ship արա սեփական լիազորությամբ — երբ․

- **Regulated pricing կամ market conduct** — price cap, anti-trust / competition-law շեմ, ամեն ինչ, որ նման է մրցակցի հետ price coordination-ի կամ collusion-ի, consumer-protection կանոն, կամ լիցենզավորված/regulated market։ Model արա economics-ը, բացահայտ flag արա regulated սահմանը, և ուղղորդիր պարտադիր կարծիքը legal-ին։ Երբեք մի՛ դիզայնիր բացահայտ price coordination։
- **Behavioral design-ներ, որ կարող են user-ի դեմ քամել** — default-ներ, anchor-ներ, loss frame-եր, drip pricing, դժվար-cancel-վող flow-եր։ Այն, թե nudge-ը լեգիտիմ default է, թե dark pattern, people/ethics-ի և legal-ի դատողություն է. անվանի՛ր և ուղղորդի՛ր, մի՛ թաղիր conversion-ի հաշվարկում։
- **Անդառնալի, high-stakes money commitment-ներ** — committed list price-ը, discount կամ rebate policy-ն, reserve/auction parameter-ները, որ մեծ revenue են շարժում, market-entry կամ exit, մեծ reserved-capacity կամ hedging commitment-ներ։ Ցույց տուր elasticity-ն, margin × volume-ը և stress-test-ը. committed թիվը որոշվում է finance/budget-ի տիրոջ հետ (տես pricing-ի կոնֆլիկտի կանոնը `SKILL.md`-ում)։
- **Mechanism, որ scale-ով, իրական փողով է launch-վում** — auction, marketplace rule կամ payout scheme, որ live է գնում։ Պահանջիր incentive-compatibility փաստարկը և manipulation guardrail-ները launch-ից առաջ. ուղղորդիր go/no-go-ը owner-ին՝ gaming risk-ը բացահայտ։
- **Macro-driven workforce կամ capital որոշումներ** — layoff-ներ, hiring freeze, մեծ capex՝ ժամանակ դրված recession call-ին։ Yield-curve/leading-indicator ընթերցումը probability signal է, ոչ dated forecast. մարդկային որոշումը պետք է տիրի անորոշությանը, և people-org/legal-ը տիրում են հենց workforce action-ին։
- **Distributional / welfare claim-ներ, որ իրական մարդկանց են ազդում** — policy կամ pricing change, ներկայացված որպես «լավ բոլորի համար»։ Ցույց տուր հաղթողներին, պարտվողներին և measurement plan-ը. distributional վնասն ընդունելու որոշումը պատասխանատու տիրոջն է, ոչ model-ին։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր վերլուծությունը, assumption-ները, label-ված թվերը և stress-test-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին (legal՝ regulated/competition-ի, people/ethics՝ behavioral extraction-ի և workforce-ի, finance՝ committed փողի համար)։ Regulated, ethical կամ անդառնալի որոշում մի՛ պնդիր սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու չորրորդ worked example **market-failure diagnosis-ի՝ intervention design-ով** (օր.՝ adverse selection insurance/lending product-ում → screening + pooling), որ failure→fix map-ը կոնկրետ լինի ծայրից ծայր՝ pricing/mechanism/incentive օրինակների կողքին։
- Ավելացրու **matching-market pattern** (two-sided matching, stability, deferred-acceptance գաղափարը) allocation խնդիրների համար, որտեղ price-ը clearing mechanism չէ (labor, school/residency-style matching)։
- Ավելացրու copy-ready **macro stress-test worksheet** երեք shock scenario-ով (demand/rate/FX), elasticity slot-ով և break-point/trigger field-երով, որ stress-test-ը fill-in artifact լինի, ոչ նկարագրված։
- Ավելացրու կարճ **behavioral-bias catalog**, որ ամեն bias-ը (loss aversion, anchoring, default effect, plus present bias, social proof) map անի այնտեղ, որտեղ այն փոխում է demand կամ pricing կանխատեսում, որ ուղղումը systematic լինի, ոչ ad hoc։
- Cross-link արա regulated-boundary handoff-ը բացահայտ legal skill-ին և behavioral-extraction handoff-ը people/ethics skill-ին, որ `OWNER_NOTES.md`-ի routing-ը անվանված destination-ի հանգուցալուծվի։
