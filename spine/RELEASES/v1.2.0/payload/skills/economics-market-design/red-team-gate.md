# Economics and Market Design red-team gate

## English

This gate extends the skill's final gate for the four artifacts (pricing/elasticity model, mechanism/auction design, market-failure diagnosis, incentive/market-structure audit). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Invented elasticity / indicator** — a precise number with no data behind it, or a borrowed coefficient applied as fact. Require a source, a labeled assumption with a range, and a confirming test.
- **Revenue-only pricing** — a price decision made on top-line revenue with contribution margin and volume ignored. Recompute on margin × volume.
- **Rational-agent assumption with no behavioral correction** — a demand, conversion, or default-design answer that assumes a frictionless optimizer. Require the loss-aversion / anchoring / default-effect adjustment.
- **Incentive-incompatible mechanism** — an auction or KPI shipped with no manipulation path examined. Require the gaming check (shading / collusion / sybil / fake scarcity) and a guardrail.
- **KPI that rewards the wrong behavior** — a metric whose cheapest win does not deliver the goal. Require the gaming enumeration and a guardrail metric.
- **One-sided pricing on a two-sided platform** — a side priced as standalone with no cross-side elasticity or network effect. Require joint pricing.
- **Market failure misclassified** — an intervention that does not match the named failure. Require reclassification and a fix that targets the right mechanism.
- **Structure ignored** — a competitive recommendation with no concentration / multi-homing / switching-cost / two-sided read. Require the strategic implication.
- **Macro on lagging data / yield-curve over-read** — a plan steered by unemployment or last quarter's earnings, or an inversion read as a dated forecast. Require leading indicators and a probability framing, plus a shock stress-test.
- **Welfare claim with no distribution** — "efficient/good for all" with no winners-and-losers line and no measurement plan. Require the distributional caveat and a test.

### Reviewer probes (ask these of any answer)

- Where does the elasticity come from — a measured source or an assumption? If assumed, is it labeled, bounded, and paired with a confirming test, or is it asserted as fact?
- Is the pricing decision made on **contribution margin × volume** or on revenue alone? Show the case where revenue rises but profit falls.
- Does the answer assume a **rational agent**, or does it name the bias (loss aversion / anchoring / default effect) and adjust? If it designs a nudge, did it say whether it serves or extracts against the user?
- For a mechanism or KPI: what is the **cheapest manipulation** under the rule, and is truthful behavior dominant or merely hoped for? Where is the guardrail?
- On a two-sided platform: is the price set **jointly** with cross-side elasticity and network effects, or is one side priced as standalone? Which side is the subsidy side?
- Does the **intervention match the named market failure**, or is it a fix for a different mechanism? Does it change any actor's best response?
- Does the strategy read the **structure** — concentration, multi-homing, switching costs — and name the strategic implication, or is it written for an atomistic market?
- For a macro call: is it steered by **leading** indicators, and is the yield-curve inversion treated as a **probability signal** with a variable lag rather than a dated forecast? Is the plan stress-tested against demand/rate/FX shocks?
- For a welfare/policy claim: who **gains**, who **loses**, and what is the **measurement plan**? Is the distributional effect surfaced or hidden behind "efficient"?
- Did the answer invent any elasticity, price, growth rate, indicator, statute, or quote, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը չորս artifact-ի համար (pricing/elasticity model, mechanism/auction design, market-failure diagnosis, incentive/market-structure audit)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Հորինված elasticity / indicator** — ճշգրիտ թիվ առանց data-ի, կամ վերցված coefficient կիրառված որպես փաստ։ Պահանջիր source, label-ված assumption՝ range-ով, և հաստատող test։
- **Միայն-revenue pricing** — price որոշում արված top-line revenue-ով, contribution margin-ը և volume-ն անտեսված։ Վերահաշվիր margin × volume-ով։
- **Rational-agent ենթադրություն՝ առանց behavioral ուղղման** — demand, conversion կամ default-design պատասխան, որ frictionless optimizer է ենթադրում։ Պահանջիր loss-aversion / anchoring / default-effect ուղղում։
- **Incentive-incompatible mechanism** — auction կամ KPI ship-ված առանց manipulation path-ի քննման։ Պահանջիր gaming ստուգում (shading / collusion / sybil / fake scarcity) և guardrail։
- **KPI, որ սխալ վարք է reward անում** — metric, որի ամենաէժան win-ը նպատակը չի մատուցում։ Պահանջիր gaming-ի թվարկում և guardrail metric։
- **One-sided pricing two-sided platform-ի վրա** — կողմ, գնագրված standalone, առանց cross-side elasticity-ի կամ network effect-ի։ Պահանջիր joint pricing։
- **Market failure-ը սխալ classify-ված** — intervention, որ չի համընկնում անվանված failure-ին։ Պահանջիր վերա-classify և fix, որ ճիշտ mechanism-ն է թիրախավորում։
- **Structure-ը անտեսված** — competitive recommendation առանց concentration / multi-homing / switching-cost / two-sided ընթերցման։ Պահանջիր ստրատեգիական հետևանքը։
- **Macro lagging data-ի վրա / yield-curve-ի գերընթերցում** — plan, ղեկավարված գործազրկությամբ կամ անցյալ եռամսյակի earnings-ով, կամ inversion կարդացված որպես dated forecast։ Պահանջիր leading indicator-ներ և probability framing, plus shock stress-test։
- **Welfare claim՝ առանց distribution-ի** — «efficient/լավ բոլորի համար»՝ առանց հաղթող-պարտվող գծի և measurement plan-ի։ Պահանջիր distributional caveat և test։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Որտեղի՞ց է elasticity-ն — չափված source-ից, թե assumption-ից։ Եթե ենթադրված է, label-ված, bounded և հաստատող test-ով զուգված է՞, թե որպես փաստ է պնդված։
- Pricing որոշումը արված է՞ **contribution margin × volume**-ով, թե revenue alone-ով։ Ցույց տուր այն դեպքը, որտեղ revenue-ն բարձրանում է, բայց profit-ն ընկնում։
- Պատասխանը **rational agent** է՞ ենթադրում, թե անվանում է bias-ը (loss aversion / anchoring / default effect) և ուղղում։ Եթե nudge է դիզայն անում, ասե՞լ է՝ user-ին ծառայում է, թե դեմ է քամում։
- Mechanism-ի կամ KPI-ի համար․ ո՞րն է **ամենաէժան manipulation**-ը rule-ի տակ, և truthful վարքը dominant է՞, թե պարզապես հույս է։ Որտեղ է guardrail-ը։
- Two-sided platform-ի վրա․ price-ը սահմանված է՞ **համատեղ**՝ cross-side elasticity-ով և network effect-ով, թե մի կողմը standalone է գնագրված։ Որ կողմն է subsidy side-ը։
- **Intervention-ը համընկնու՞մ է անվանված market failure-ին**, թե այլ mechanism-ի fix է։ Փոխու՞մ է որևէ actor-ի best response-ը։
- Strategy-ն կարդու՞մ է **structure**-ը — concentration, multi-homing, switching cost — և անվանում ստրատեգիական հետևանքը, թե գրված է atomistic market-ի համար։
- Macro call-ի համար․ ղեկավարված է՞ **leading** indicator-ներով, և yield-curve inversion-ը համարված է՞ **probability signal** փոփոխական lag-ով, ոչ dated forecast։ Plan-ը stress-tested է՞ demand/rate/FX shock-ների դեմ։
- Welfare/policy claim-ի համար․ ով է **շահում**, ով է **կորցնում**, և ո՞րն է **measurement plan**-ը։ Distributional effect-ը ցույց տրվա՞ծ է, թե թաքնված «efficient»-ի հետևում։
- Պատասխանը հորինե՞ց elasticity, price, growth rate, indicator, statute կամ quote, և հայերենը equal-depth ու punctuation-clean է՞։
