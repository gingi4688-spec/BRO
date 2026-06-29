---
name: "finance-unit-economics"
description: >-
  use when the work is unit economics, contribution margin, CAC/LTV and payback, cohort and retention economics, pricing math, burn/runway, a 3-statement model (P&L + balance sheet + cash flow), fundraising, valuation (multiples and DCF), or cap-table/dilution math — for decisions, critique, planning, diagnostics, models/memos, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (a unit-economics model, a 3-statement forecast, a valuation, a cap table, a scale/no-scale call). do not use as lead when another skill owns the main artifact and the money math is only one input — then support it (pricing strategy → support; GTM/sales targets → support). հայերեն՝ օգտագործիր unit economics-ի, contribution margin-ի, CAC/LTV-ի, payback-ի, cohort-ի, burn/runway-ի, 3-statement model-ի, fundraising-ի, valuation-ի (multiples և DCF) և cap-table/dilution-ի աշխատանքի համար։
---

# Finance and Unit Economics / Ֆինանսներ և unit economics

## English

**Scope.** In: contribution-margin and unit economics, CAC (paid vs blended) / LTV / payback, cohort and retention economics, pricing math, burn and runway, the 3-statement model (income statement, balance sheet, cash flow and how they tie), revenue recognition and cash-vs-accrual timing, EBITDA-vs-free-cash-flow, scenario and sensitivity analysis, fundraising, valuation (comparable multiples and a DCF), and cap-table / dilution / option-pool math. Out: pricing *strategy* and packaging (sales/strategy own that; you supply the margin math), accounting-close mechanics and audited statements (a controller/accountant owns those), tax filing and legal structuring (route to a CPA/lawyer), and securities-law advice on a raise (route to counsel). This skill turns a business decision into cash, margin, timing, cohort behavior, and capital tradeoffs — with every number traced to a formula or a stated input, never invented.

**Leads / Supports.** Lead when the central deliverable is money-shaped: a unit-economics model, a cohort-margin table, a payback/LTV decision, a 3-statement forecast, a burn/runway plan, a valuation, or a cap table. Support when another skill owns the artifact and the economics are one input — e.g. `sales-revenue-growth` owns the GTM plan and you supply the CAC/payback envelope; `business-strategy-operations` owns the strategy and you supply the contribution-margin and capital math; `data-science-analytics` owns the cohort model and you supply the LTV definition.

Conflict rules:
- **Pricing → coordinate, do not set strategy alone.** You own the margin and elasticity math (what a price does to contribution margin, conversion, and payback); the packaging and positioning decision is coordinated with pricing/strategy, not unilaterally fixed here.
- **Growth speed vs cash → payback and runway arbitrate, not ambition.** When "spend more on acquisition" collides with cash limits, do not argue appetite. If payback fits inside the cash runway and cohort churn is proven, spend; if payback runs past the cash the company has, the answer is throttle or raise — name which.
- **Valuation / fundraising → math is yours, the deal terms are counsel's.** You own the valuation method, the dilution math, and the cap-table effect; the legal terms of the round (security type, covenants, securities-law compliance) route to a lawyer, and any irreversible signed commitment routes to a human owner (see `OWNER_NOTES.md`).

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Reach first for the artifact that matches the decision.** Unit-economics bridge, cohort-margin table, payback/LTV model, 3-statement forecast, valuation, or cap table — pick the one that changes *this* decision; skip framework theater.
2. **Start from contribution margin, not revenue.** Compute `CM = price − the variable costs that scale with that unit` before any ratio. Revenue and ARR say nothing about whether the unit makes money.
3. **Markup is not margin — never confuse the base.** Margin is over price (`CM/price`); markup is over cost. A "50% markup" is a 33% margin. State which you mean and divide by the right base.
4. **Compute CAC payback in months, not adjectives.** `payback = CAC ÷ monthly contribution margin`. If cash collection lags (annual-billed, net-60), state cash payback separately — it is worse than accounting payback.
5. **Use paid CAC for the marginal scale decision; never hide it inside blended.** Blended CAC mixes free organic with paid; the question "should we spend more on paid?" is answered by paid CAC and the paid cohort's economics, not the flattering blend.
6. **LTV uses contribution margin and a real survival curve, not `1/churn` on revenue.** `1/churn` assumes constant churn forever and ignores discounting; cap the horizon, use CM not revenue, and discount when the lifetime is long.
7. **Do not trust LTV:CAC pre-PMF, under cohort skew, or with expansion omitted.** A ratio computed before retention stabilizes is a guess wearing a number; split by cohort/channel and check maturity first.
8. **In a 3-statement model, the three statements must tie.** Net income flows to retained earnings; cash flow reconciles net income to the cash on the balance sheet; the balance sheet balances. A model where they don't tie is wrong, not "close enough."
9. **EBITDA is not free cash flow.** Bridge EBITDA → FCF by subtracting cash taxes, capex, and the change in working capital (and respecting interest for levered FCF). A capex- or working-capital-heavy business can have healthy EBITDA and negative cash.
10. **Recognize revenue when earned, not when cash lands.** An annual prepay is cash now but revenue over twelve months (deferred-revenue liability). P&L timing and cash timing are different questions; answer the one the decision needs.
11. **Burn and runway off cash, not P&L.** `runway = cash ÷ net monthly burn`. Tie any "we have N months" claim to the cash balance and the real burn, including timing of collections and prepaid costs.
12. **Build bottom-up; do not dress a top-down wish as a forecast.** "1% of a $10B market" is not a model. Build from units × price × conversion × capacity; a top-down number with no driver chain is a target, not a forecast.
13. **In valuation, name the method and the bridge.** Multiples (EV = metric × comp multiple) and/or a DCF (PV of unlevered FCF + terminal value); always bridge EV → equity via net debt, and state how much of a DCF is terminal value.
14. **In a raise, show the dilution and the cap-table effect.** `investor % = raise ÷ post-money`; `post = pre + raise`. Surface founder dilution, any option-pool shuffle (a pool funded from pre-money dilutes founders, not the new investor), and the price per share.
15. **Irreversible high-stakes money decisions stop and route to a human owner.** A signed raise, a priced round, a large irreversible spend, a layoff/runway-extension plan — produce the math and the options, then escalate; do not present a model as a decision already made (see `OWNER_NOTES.md`).

### Failure modes to prevent / Ձախողման ձևեր

1. **Markup-is-not-margin.** A "40% markup" reported as a 40% margin; the base is silently wrong. Tell: a margin quoted with no statement of whether it is over price or over cost, or `1.4×` cost called "40% margin."
2. **Blended-vs-paid CAC laundering.** Blended CAC (paid + free organic) used to justify *more paid spend*; the marginal channel is far worse than the blend. Tell: a single "CAC" with no split, or LTV:CAC that looks great only because organic is in the denominator.
3. **`1/churn` LTV fantasy.** LTV = revenue ÷ churn, treating churn as constant forever, on revenue not contribution margin, with no discounting. Tell: an LTV with no horizon cap, no CM, and no survival curve — usually 2–4× too high.
4. **ARR celebrated over negative contribution margin.** Top-line growth reported while each unit loses money after variable cost. Tell: ARR/MRR headline with no contribution-margin line beneath it.
5. **EBITDA-is-not-FCF.** EBITDA presented as the cash the business throws off, ignoring capex and working capital. Tell: "EBITDA-positive, so we're fine on cash" with no capex/ΔWC bridge.
6. **P&L-vs-cash timing collapse.** Profit and cash treated as the same number; a profitable month that is cash-negative (or vice versa) is missed. Tell: runway argued off net income, or "we're profitable" with no cash statement.
7. **Revenue-recognition timing error.** Annual prepay booked as revenue on day one, or usage revenue recognized before it is earned; deferred revenue ignored. Tell: revenue equals cash collected, with no deferred-revenue liability.
8. **Bottom-up built as top-down.** A forecast that starts from a market-share percentage instead of a driver chain. Tell: "X% of a $Y market" with no units, price, conversion, or capacity behind it.
9. **Cohort averages hiding channel decay.** A blended cohort number masks that recent paid cohorts retain worse. Tell: one LTV/payback figure with no cohort-by-month or by-channel split.
10. **Sensitivity theater.** Base/upside/downside that move every assumption independently and never name the one that flips the decision. Tell: three totals, no driver-level threshold, correlated drivers moved in isolation.
11. **Valuation that skips the bridge or hides terminal value.** EV reported as equity value (no net-debt bridge), or a DCF where 80%+ is terminal value with no disclosure. Tell: a per-share or equity number with no EV→equity step, or a DCF terminal-value share never stated.
12. **Dilution math that ignores the pool shuffle.** Founder ownership computed without the option pool, or a pre-money pool quietly diluting only founders. Tell: "you keep 80%" with no pool, no price per share, no fully-diluted base.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (unit-economics model / cohort table / 3-statement / valuation / cap table), not generic advice.
- Every number traces to a formula or a stated input; **no invented CAC, churn, margin, multiple, or benchmark** — unknowns are placeholders or formulas, volatile facts are verify-before-use.
- Margin math states its base (margin over price, markup over cost); CAC is split paid vs blended where a scale decision is involved.
- LTV uses contribution margin with a horizon/survival curve (not `1/churn` on revenue); LTV:CAC is gated on cohort maturity.
- A 3-statement model ties (NI → retained earnings, cash flow reconciles to the balance-sheet cash, the sheet balances); EBITDA is bridged to FCF; revenue is recognized when earned.
- A valuation names its method, bridges EV → equity via net debt, and discloses the terminal-value share; a raise shows dilution, price per share, and any pool shuffle.
- Irreversible high-stakes money decisions are routed to a human owner with the math and options, not presented as already decided.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **formula correctness** (CM, gross margin, markup-vs-margin, CAC payback, LTV, LTV:CAC defined and computed right) · **cost & cash classification** (fixed/variable/step, cash-vs-accrual timing, revenue recognition, EBITDA→FCF explicit) · **cohort discipline** (paid-vs-blended CAC, cohort/channel maturity tested before ratios drive a decision) · **sensitivity & forecasting** (bottom-up driver chain, correlated drivers, the threshold that flips the call named) · **valuation & capital** (method named, EV→equity bridge, terminal-value share, dilution/cap-table math).

### Deep dive & assets

`manual.md` (mechanism reference — contribution margin, CAC payback, churn-based LTV, scenario sensitivity, 3-statement, EBITDA→FCF, revenue recognition, valuation/DCF/cap-table; decision rules; failure-repair playbook) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (scale call + 3-statement + valuation) · `output-templates.md` (unit-economics model / 3-statement / valuation) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ contribution-margin և unit economics, CAC (paid ընդդեմ blended) / LTV / payback, cohort և retention economics, pricing math, burn և runway, 3-statement model (income statement, balance sheet, cash flow և ինչպես են դրանք կապվում), revenue recognition և cash-ընդդեմ-accrual timing, EBITDA-ընդդեմ-free-cash-flow, scenario և sensitivity, fundraising, valuation (comparable multiples և DCF), և cap-table / dilution / option-pool math։ Դուրս՝ pricing *strategy*-ն և packaging-ը (դրանք sales/strategy-ինն են, դու տալիս ես margin math-ը), accounting-close-ի մեխանիկան և audited statement-ները (controller/accountant-ինն են), tax filing-ը և legal structuring-ը (ուղղորդիր CPA/lawyer-ին), և securities-law խորհրդատվությունը round-ի շուրջ (ուղղորդիր counsel-ին)։ Այս skill-ը business որոշումը դարձնում է cash, margin, timing, cohort վարք և capital tradeoff — ամեն թիվ հետագծված formula-ի կամ նշված input-ի, երբեք հորինված։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը փողի ձև ունի՝ unit-economics model, cohort-margin table, payback/LTV որոշում, 3-statement forecast, burn/runway plan, valuation կամ cap table։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ economics-ը մեկ input է. օրինակ՝ `sales-revenue-growth`-ը տիրում է GTM plan-ին, դու տալիս ես CAC/payback envelope-ը. `business-strategy-operations`-ը տիրում է strategy-ին, դու տալիս ես contribution-margin-ի և capital math-ը. `data-science-analytics`-ը տիրում է cohort model-ին, դու տալիս ես LTV-ի սահմանումը։

Կոնֆլիկտի կանոններ․
- **Pricing → համակարգիր, strategy-ն մենակ մի՛ սահմանիր։** Դու տիրում ես margin-ի և elasticity-ի math-ին (ինչ է անում գինը contribution margin-ին, conversion-ին և payback-ին). packaging-ի և positioning-ի որոշումը համակարգվում է pricing/strategy-ի հետ, ոչ թե միակողմանի սահմանվում այստեղ։
- **Growth speed ընդդեմ cash → որոշում են payback-ը և runway-ը, ոչ ամբիցիան։** Երբ «ավելի շատ ծախսենք acquisition-ի վրա»-ն բախվում է cash սահմանին, ախորժակի վեճ մի՛ արա։ Եթե payback-ը տեղավորվում է cash runway-ի մեջ, և cohort churn-ը ապացուցված է, ծախսիր. եթե payback-ը անցնում է ընկերության cash-ից, պատասխանը throttle-ն է կամ raise-ը. անվանի՛ր որը։
- **Valuation / fundraising → math-ը քոնն է, deal terms-ը՝ counsel-ինը։** Դու տիրում ես valuation method-ին, dilution math-ին և cap-table effect-ին. round-ի իրավական term-երը (security type, covenant, securities-law compliance) ուղղորդվում են lawyer-ին, և ցանկացած անդառնալի ստորագրված commitment ուղղորդվում է մարդ-տիրոջը (տես `OWNER_NOTES.md`)։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Նախ վերցրու artifact-ը, որ համապատասխանում է որոշմանը։** Unit-economics bridge, cohort-margin table, payback/LTV model, 3-statement forecast, valuation կամ cap table — ընտրիր այն, որ փոխում է *այս* որոշումը. framework theater մի՛ արա։
2. **Սկսիր contribution margin-ից, ոչ revenue-ից։** Հաշվիր `CM = price − այն variable cost-երը, որ աճում են այդ unit-ի հետ` ցանկացած ratio-ից առաջ։ Revenue-ն և ARR-ը ոչինչ չեն ասում, թե unit-ը փող է աշխատում, թե ոչ։
3. **Markup-ը margin չէ — base-ը երբեք մի՛ շփոթիր։** Margin-ը գնի վրա է (`CM/price`). markup-ը՝ cost-ի։ «50% markup»-ը 33% margin է։ Նշիր որն ի նկատի ունես և բաժանիր ճիշտ base-ի։
4. **CAC payback-ը հաշվիր ամիսներով, ոչ ածականներով։** `payback = CAC ÷ monthly contribution margin`։ Եթե cash collection-ը ուշանում է (annual-billed, net-60), առանձին նշիր cash payback-ը — այն վատ է accounting payback-ից։
5. **Marginal scale որոշման համար օգտագործիր paid CAC, երբեք մի՛ թաքցրու blended-ի մեջ։** Blended CAC-ը խառնում է free organic-ը paid-ի հետ. «ավելի շատ ծախսե՞նք paid-ի վրա» հարցին պատասխանում է paid CAC-ը և paid cohort-ի economics-ը, ոչ թե շոյող blend-ը։
6. **LTV-ն օգտագործում է contribution margin և իրական survival curve, ոչ `1/churn` revenue-ի վրա։** `1/churn`-ը ենթադրում է հավերժ հաստատուն churn և անտեսում discounting-ը. սահմանափակիր horizon-ը, օգտագործիր CM, ոչ revenue, և discount արա, երբ lifetime-ը երկար է։
7. **Մի՛ վստահիր LTV:CAC-ին pre-PMF, cohort skew-ի տակ կամ expansion-ը բացակայած։** Retention-ի կայունացումից առաջ հաշված ratio-ն թիվ հագած գուշակություն է. նախ բաժանիր cohort/channel-ով և ստուգիր maturity-ն։
8. **3-statement model-ում երեք statement-ները պետք է կապվեն։** Net income-ը գնում է retained earnings. cash flow-ն net income-ը հաշտեցնում է balance sheet-ի cash-ի հետ. balance sheet-ը հավասարակշռվում է։ Model, որտեղ չեն կապվում, սխալ է, ոչ թե «մոտավորապես լավ»։
9. **EBITDA-ն free cash flow չէ։** Bridge արա EBITDA → FCF՝ հանելով cash taxes, capex և working capital-ի փոփոխությունը (և հաշվի առնելով interest-ը levered FCF-ի համար)։ Capex- կամ working-capital-ծանր բիզնեսը կարող է ունենալ առողջ EBITDA և բացասական cash։
10. **Revenue-ն ճանաչիր, երբ վաստակված է, ոչ երբ cash է մտնում։** Annual prepay-ը cash է հիմա, բայց revenue՝ տասներկու ամսվա ընթացքում (deferred-revenue պարտավորություն)։ P&L timing-ը և cash timing-ը տարբեր հարցեր են. պատասխանիր նրան, որ որոշումը պահանջում է։
11. **Burn-ը և runway-ը cash-ից, ոչ P&L-ից։** `runway = cash ÷ net monthly burn`։ Ամեն «N ամիս ունենք» պնդումը կապիր cash balance-ի և իրական burn-ի հետ՝ ներառյալ collection-ի և prepaid cost-ի timing-ը։
12. **Կառուցիր bottom-up. top-down ցանկությունը forecast-ի հագուստով մի՛ ներկայացրու։** «$10B market-ի 1%-ը» model չէ։ Կառուցիր units × price × conversion × capacity-ից. driver chain չունեցող top-down թիվը target է, ոչ forecast։
13. **Valuation-ում անվանի՛ր method-ը և bridge-ը։** Multiples (EV = metric × comp multiple) և/կամ DCF (PV of unlevered FCF + terminal value). միշտ bridge արա EV → equity net debt-ով, և նշիր, թե DCF-ի որքանն է terminal value։
14. **Round-ում ցույց տուր dilution-ը և cap-table effect-ը։** `investor % = raise ÷ post-money`. `post = pre + raise`։ Երևացրու founder dilution-ը, ցանկացած option-pool shuffle (pre-money-ից ֆինանսավորված pool-ը նոսրացնում է founder-ներին, ոչ նոր investor-ին) և price per share-ը։
15. **Անդառնալի, բարձր-ռիսկ փողային որոշումները կանգնում են և ուղղորդվում մարդ-տիրոջը։** Ստորագրված raise, priced round, մեծ անդառնալի ծախս, layoff/runway-extension plan — արտադրի՛ր math-ը և option-ները, հետո escalate արա. model-ը մի՛ ներկայացրու որպես արդեն կայացված որոշում (տես `OWNER_NOTES.md`)։

### Ձախողման ձևեր

1. **Markup-ը margin չէ։** «40% markup»-ը հաղորդված որպես 40% margin. base-ը լուռ սխալ է։ Tell՝ margin նշված առանց ասելու՝ գնի՞, թե cost-ի վրա է, կամ `1.4×` cost կոչված «40% margin»։
2. **Blended-ընդդեմ-paid CAC-ի լվացում։** Blended CAC-ը (paid + free organic) օգտագործված *ավելի շատ paid ծախս* արդարացնելու համար. marginal channel-ը շատ ավելի վատ է, քան blend-ը։ Tell՝ մեկ «CAC» առանց split-ի, կամ LTV:CAC, որ լավ է երևում միայն, որովհետև organic-ը denominator-ում է։
3. **`1/churn` LTV ֆանտազիա։** LTV = revenue ÷ churn, churn-ը համարված հավերժ հաստատուն, revenue-ի վրա, ոչ CM-ի, առանց discounting-ի։ Tell՝ LTV առանց horizon cap-ի, CM-ի և survival curve-ի — սովորաբար 2–4× բարձր։
4. **ARR տոնված բացասական contribution margin-ի վրա։** Top-line աճ հաղորդված, մինչ ամեն unit variable cost-ից հետո փող է կորցնում։ Tell՝ ARR/MRR վերնագիր առանց ներքևում contribution-margin տողի։
5. **EBITDA-ն FCF չէ։** EBITDA-ն ներկայացված որպես բիզնեսի տված cash՝ անտեսելով capex-ը և working capital-ը։ Tell՝ «EBITDA-positive ենք, ուրեմն cash-ով լավ ենք»՝ առանց capex/ΔWC bridge-ի։
6. **P&L-ընդդեմ-cash timing-ի փլուզում։** Profit-ը և cash-ը համարված նույն թիվը. շահութաբեր ամիս, որ cash-բացասական է (կամ հակառակը), բաց է թողնվում։ Tell՝ runway-ն վիճարկված net income-ով, կամ «շահութաբեր ենք»՝ առանց cash statement-ի։
7. **Revenue-recognition-ի timing սխալ։** Annual prepay-ը գրանցված որպես revenue առաջին օրը, կամ usage revenue-ն ճանաչված մինչ վաստակվելը. deferred revenue-ն անտեսված։ Tell՝ revenue = collected cash՝ առանց deferred-revenue պարտավորության։
8. **Bottom-up-ը կառուցված որպես top-down։** Forecast, որ սկսում է market-share տոկոսից, ոչ driver chain-ից։ Tell՝ «$Y market-ի X%»՝ առանց unit-ի, գնի, conversion-ի կամ capacity-ի։
9. **Cohort average-ները թաքցնում են channel decay-ը։** Blended cohort թիվը քողարկում է, որ recent paid cohort-ները ավելի վատ են retain անում։ Tell՝ մեկ LTV/payback թիվ առանց cohort-by-month կամ by-channel split-ի։
10. **Sensitivity theater։** Base/upside/downside, որ շարժում են ամեն assumption անկախ և երբեք չեն անվանում այն մեկը, որ flip է անում որոշումը։ Tell՝ երեք total, ոչ driver-level threshold, correlated driver-ները շարժված մեկուսի։
11. **Valuation, որ բաց է թողնում bridge-ը կամ թաքցնում terminal value-ն։** EV-ն հաղորդված որպես equity value (net-debt bridge չկա), կամ DCF, որի 80%+-ը terminal value է առանց բացահայտման։ Tell՝ per-share կամ equity թիվ առանց EV→equity քայլի, կամ DCF terminal-value share, որ երբեք չի նշվում։
12. **Dilution math, որ անտեսում է pool shuffle-ը։** Founder ownership հաշված առանց option pool-ի, կամ pre-money pool, որ լուռ նոսրացնում է միայն founder-ներին։ Tell՝ «80% ես պահում»՝ առանց pool-ի, price per share-ի, fully-diluted base-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (unit-economics model / cohort table / 3-statement / valuation / cap table), ոչ generic advice։
- Ամեն թիվ հետ է գնում formula-ի կամ նշված input-ի. **ոչ մի հորինված CAC, churn, margin, multiple կամ benchmark** — unknown-ները placeholder կամ formula են, volatile fact-երը՝ verify-before-use։
- Margin math-ը նշում է իր base-ը (margin գնի վրա, markup cost-ի վրա). CAC-ը split-ված է paid ընդդեմ blended, երբ scale որոշում կա։
- LTV-ն օգտագործում է contribution margin՝ horizon/survival curve-ով (ոչ `1/churn` revenue-ի վրա). LTV:CAC-ը gated է cohort maturity-ով։
- 3-statement model-ը կապվում է (NI → retained earnings, cash flow-ն հաշտվում է balance-sheet cash-ի հետ, sheet-ը հավասարակշռվում). EBITDA-ն bridge-ված է FCF-ի. revenue-ն ճանաչված է, երբ վաստակվել է։
- Valuation-ը անվանում է իր method-ը, bridge է անում EV → equity net debt-ով, և բացահայտում terminal-value share-ը. round-ը ցույց է տալիս dilution-ը, price per share-ը և ցանկացած pool shuffle։
- Անդառնալի, բարձր-ռիսկ փողային որոշումները ուղղորդվում են մարդ-տիրոջը math-ով և option-ներով, ոչ ներկայացված որպես արդեն որոշված։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **formula correctness** (CM, gross margin, markup-ընդդեմ-margin, CAC payback, LTV, LTV:CAC ճիշտ սահմանված և հաշված) · **cost & cash classification** (fixed/variable/step, cash-ընդդեմ-accrual timing, revenue recognition, EBITDA→FCF բացահայտ) · **cohort discipline** (paid-ընդդեմ-blended CAC, cohort/channel maturity ստուգված մինչև ratio-ն որոշում տանի) · **sensitivity & forecasting** (bottom-up driver chain, correlated driver-ներ, որոշումը flip անող threshold-ն անվանված) · **valuation & capital** (method անվանված, EV→equity bridge, terminal-value share, dilution/cap-table math)։

### Խորացում և asset-եր

`manual.md` (mechanism reference — contribution margin, CAC payback, churn-based LTV, scenario sensitivity, 3-statement, EBITDA→FCF, revenue recognition, valuation/DCF/cap-table. որոշման կանոններ. failure-repair playbook) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (scale call + 3-statement + valuation) · `output-templates.md` (unit-economics model / 3-statement / valuation) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
