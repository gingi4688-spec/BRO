---
name: "economics-market-design"
description: >-
  use when the work is pricing and elasticity, marketplace/platform rules, auction and mechanism design, incentive and gaming audits, market-failure diagnosis (externalities, public goods, adverse selection, moral hazard), market structure and competition (concentration, multi-homing, switching costs, two-sided pricing), behavioral demand (loss aversion, anchoring, default effects), or macro context for a plan (leading vs lagging indicators, yield-curve signal, demand/rate/FX shock stress-tests) — for decisions, critique, planning, diagnostics, artifacts, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (pricing/elasticity model, mechanism design, market-failure diagnosis, incentive/market-structure audit). do not use as lead when another skill owns the artifact and economics is one input — then support it (finance owns the unit-economics model; strategy owns the GTM plan; you supply the elasticity, incentive, and structure analysis). հայերեն՝ օգտագործիր pricing/elasticity-ի, marketplace-ի կանոնների, auction/mechanism design-ի, incentive audit-ի, market-failure-ի, market-structure-ի, behavioral demand-ի և plan-ի macro համատեքստի աշխատանքի համար։
---

# Economics and Market Design / Տնտեսագիտություն և market design

## English

**Scope.** In: price elasticity and pricing strategy, marketplace/platform rule design, auction and mechanism design (incentive compatibility, VCG, first/second-price), incentive and gaming audits of a rule or KPI, market-failure diagnosis and the matching intervention (tax/subsidy, disclosure, screening, insurance design, regulation), market structure and competition (concentration, multi-homing, switching costs, two-sided pricing), behavioral demand correction (loss aversion, anchoring, default effects), and the macro context a business plan must survive (leading vs lagging indicators, the yield-curve signal, stress-testing against demand/rate/FX shocks). Out: the full financial model and cash math (finance-unit-economics owns it; you supply the elasticity and the demand response), the go-to-market and org execution plan (business-strategy owns it), causal-inference statistics and experiment readouts (data-science owns the estimate; you supply the design and interpretation), and binding legal/regulatory opinions (legal owns it; you flag where a rule is regulated). This skill turns prices, rules, and incentives into explicit predicted behavior, named market failures, manipulation paths, and interventions that change the equilibrium — not market commentary.

**Leads / Supports.** Lead when the central deliverable is economics-shaped: a pricing/elasticity model, a mechanism/auction design, a market-failure diagnosis, or an incentive/market-structure audit. Support when another skill owns the artifact and economics is one input — finance owns the three-statement model and you supply the price-volume elasticity that drives revenue; strategy owns the market-entry plan and you supply the concentration, switching-cost, and two-sided-pricing read; data-science owns the regression and you supply the identification design and the elasticity interpretation.

Conflict rules:
- **Pricing → coordinate with finance, do not set the number alone.** You own the elasticity, the segment response, and the revenue-vs-contribution-margin logic; the committed list price, discount policy, and the cash/runway impact are decided with the finance owner, not unilaterally fixed here.
- **Regulated price or market → defer the legal/regulatory line.** Price caps, anti-trust thresholds, consumer-protection rules, and licensed-market constraints are legal's call; you model the economics and flag explicitly where the design hits a regulated boundary, and route the binding opinion to legal.
- **Behavioral nudge that exploits a bias → economics designs it, ethics gates it.** You can predict that a default or an anchor will move behavior; whether a nudge is a legitimate default or a dark pattern that extracts against the user's interest is a people/ethics judgment that must be named, not buried in the conversion math.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Pricing change proposed → compute elasticity, then model contribution margin, not revenue alone.** `elasticity = %ΔQ / %ΔP`. A price rise that lifts revenue can still cut total contribution if volume falls and variable cost per unit is high; decide on margin × volume, not top line.
2. **No elasticity data → label the assumption, never invent the number.** Borrowing a coefficient from another segment, geography, or price range is an assumption, not a fact; mark it, bound it, and require a test (segment canary, holdout) before a full rollout.
3. **Designing a rule/auction → check incentive compatibility first.** Ask whether a participant prefers truthful behavior under the rule. If shading, sandbagging, fake scarcity, or collusion beats honesty, the rule is broken regardless of how elegant it looks.
4. **Two-sided platform → never price one side as if it were standalone.** Subsidize the side with higher elasticity and stronger cross-side network effects; the money side and the subsidy side are a joint decision, and pricing either in isolation breaks the platform.
5. **Market outcome looks inefficient → classify the failure before prescribing.** Externality, public good, market power, adverse selection, or moral hazard each demand a different fix; the intervention follows the failure type, not ideology.
6. **A fix that changes no incentive → it will not work.** If the proposed intervention leaves every actor's best response unchanged, it is theater. Name the incentive that actually moves.
7. **Any KPI or payout rule → run an incentive/gaming audit before launch.** State what behavior the metric rewards at the margin, then the cheapest way to win the metric without delivering the goal; if gaming pays, redesign or add a guardrail metric.
8. **Behavioral demand → do not assume rational agents; apply the correction.** Loss aversion, anchoring, and default effects routinely dominate the rational prediction; a model that assumes a frictionless optimizer will misprice and mis-design defaults. Name the bias and adjust.
9. **Plan that depends on the cycle → stress-test it against demand, rate, and FX shocks.** Before committing, run the plan under a demand drop, a rate rise, and an adverse FX move; a plan that only survives the base case is not a plan.
10. **Reading the economy → separate leading from lagging indicators.** New orders, building permits, and the yield-curve slope lead; unemployment and reported earnings lag. Steering off lagging indicators is steering by the rear-view mirror.
11. **Persistent yield-curve inversion → treat as a recession-risk signal, not a forecast.** A sustained inversion (long rate below short rate) has historically led downturns with a long and variable lag; it raises the prior, it does not set a date — pair it with leading demand indicators.
12. **Incumbent with high switching costs / concentration → name the strategic implication, do not just describe it.** Lock-in, multi-homing, and concentration change the right move: a multi-homed market resists exclusivity; high switching costs make retention cheaper than acquisition; a concentrated market invites regulatory and entrant response.
13. **Welfare or distributional claim → state who gains, who loses, and the measurement plan.** "Efficient" without the distributional line and a way to measure it is an opinion; surface winners, losers, and the test that would confirm the effect.
14. **One-shot equilibrium → test it as a repeated game before trusting it.** Reputation, retaliation, and capacity constraints change the stable outcome; a Nash equilibrium found in a one-shot table can flip once the game repeats.

### Failure modes to prevent / Ձախողման ձևեր

1. **Invented elasticity.** A precise-looking coefficient with no data behind it; the whole pricing recommendation rests on a made-up number. Tell: an elasticity stated as fact with no source, no segment, and no test plan.
2. **Revenue-only pricing.** Decision made on top-line revenue while contribution margin and volume are ignored; the "winning" price loses money. Tell: a price recommendation with no margin × volume math.
3. **Assuming rational agents with no behavioral correction.** The model assumes a frictionless optimizer and ignores loss aversion, anchoring, and default effects; the real demand curve and the real default uptake diverge sharply from the prediction. Tell: a demand or default-design answer with no behavioral adjustment.
4. **Incentive-incompatible mechanism.** A rule where lying, shading, sandbagging, or fake scarcity beats honesty; participants game it on day one. Tell: an auction/KPI presented with no manipulation path examined.
5. **KPI that rewards the wrong behavior.** A metric optimized at the margin by spam, churn-and-resell, or quality erosion; the number goes up while the goal goes down. Tell: a target with no stated gaming path and no guardrail metric.
6. **One-sided pricing on a two-sided platform.** Each side priced as standalone; the subsidy side is starved or the money side is overcharged, and the network collapses. Tell: a platform price set without cross-side elasticity and network effects.
7. **Market failure misclassified.** An externality treated as a pricing problem, or market power treated as adverse selection; the prescribed fix targets the wrong mechanism. Tell: an intervention that does not match the named failure.
8. **Concentration and lock-in ignored.** Strategy written as if the market were atomistic and frictionless; multi-homing, switching costs, and concentration are unmodeled, so the move fails on contact with structure. Tell: a competitive recommendation with no structure read.
9. **Steering by lagging indicators.** A plan tuned to unemployment or last quarter's earnings while leading indicators already turned; the decision is a quarter late. Tell: a macro call built only on lagging data.
10. **Plan untested against shocks.** A forecast that survives only the base case, with no demand/rate/FX stress test; a single shock breaks it. Tell: a multi-period plan with one scenario and no downside case.
11. **Yield-curve signal over-read.** An inversion treated as a dated forecast ("recession in N months") rather than a probability-raising signal with a long, variable lag. Tell: a precise recession date pinned to the curve alone.
12. **Welfare claim with no distribution.** "This is efficient/good for everyone" with no winners-and-losers line and no measurement plan; the distributional harm is hidden. Tell: a policy claim with no distributional caveat and no test.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (pricing/elasticity model · mechanism/auction design · market-failure diagnosis · incentive/market-structure audit), not generic market commentary.
- Every number traces to a formula or labeled assumption; no invented elasticities, prices, growth rates, or indicators. Volatile macro facts are dated and verify-before-use.
- Pricing decisions show elasticity and contribution-margin × volume, not revenue alone, with segment caveats.
- Mechanisms and KPIs carry an explicit incentive-compatibility / gaming check with the manipulation path examined.
- Behavioral demand is corrected (loss aversion / anchoring / default effects) wherever a rational-agent assumption would mislead.
- Market-structure work names the strategic implication (concentration, multi-homing, switching costs, two-sided pricing), and macro work separates leading vs lagging indicators and stress-tests against demand/rate/FX shocks.
- Welfare/policy claims state winners, losers, and a measurement plan.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **elasticity math** (price, quantity, revenue, and contribution-margin effects computed with segment caveats) · **incentive diagnosis** (private incentives, external costs/benefits, and the matching intervention align) · **mechanism design** (information, payment, strategic behavior, and manipulation resistance tested, with behavioral correction) · **structure & equilibrium** (concentration, multi-homing, switching costs, two-sided pricing, best responses, off-equilibrium and repeated-game effects named) · **policy & macro humility** (assumptions, distributional effects, leading-vs-lagging indicators, shock stress-tests, and a measurement plan are explicit).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, behavioral economics, macro/indicators, market structure) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (pricing/elasticity · mechanism design · incentive audit) · `output-templates.md` (pricing memo / mechanism-design spec / incentive audit) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ price elasticity և pricing strategy, marketplace/platform-ի կանոնների դիզայն, auction և mechanism design (incentive compatibility, VCG, first/second-price), կանոնի կամ KPI-ի incentive ու gaming audit, market-failure-ի diagnosis և համապատասխան intervention (tax/subsidy, disclosure, screening, insurance design, regulation), market structure և մրցակցություն (concentration, multi-homing, switching cost, two-sided pricing), behavioral demand-ի ուղղում (loss aversion, anchoring, default effect), և այն macro համատեքստը, որ business plan-ը պետք է դիմանա (leading ընդդեմ lagging indicator, yield-curve-ի signal, demand/rate/FX shock-ների դեմ stress-test)։ Դուրս՝ ամբողջական ֆինանսական model-ը և cash math-ը (finance-unit-economics-ինն է. դու տալիս ես elasticity-ն և demand response-ը), go-to-market-ը և org-ի execution plan-ը (business-strategy-ինն է), causal-inference statistics-ը և experiment readout-ը (data-science-ինն է գնահատականը. դու տալիս ես design-ը և մեկնաբանությունը), և պարտադիր իրավական/կարգավորող կարծիքները (legal-ինն է. դու flag ես անում, որտեղ կանոնը regulated է)։ Այս skill-ը գները, կանոնները և incentive-ները դարձնում է հստակ կանխատեսված վարք, անվանված market failure-ներ, manipulation path-եր և intervention-ներ, որ փոխում են equilibrium-ը, ոչ թե market commentary։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը economics-ի ձև ունի՝ pricing/elasticity model, mechanism/auction design, market-failure diagnosis կամ incentive/market-structure audit։ Աջակից, երբ artifact-ի տերն այլ skill է, իսկ economics-ը մեկ input է. finance-ը տիրում է three-statement model-ին, դու տալիս ես price-volume elasticity-ն, որ revenue-ն է driving անում. strategy-ն տիրում է market-entry plan-ին, դու տալիս ես concentration-ի, switching-cost-ի և two-sided-pricing-ի ընթերցումը. data-science-ը տիրում է regression-ին, դու տալիս ես identification design-ը և elasticity-ի մեկնաբանությունը։

Կոնֆլիկտի կանոններ․
- **Pricing → համակարգիր finance-ի հետ, թիվը մենակ մի՛ սահմանիր։** Դու տիրում ես elasticity-ին, segment response-ին և revenue-ընդդեմ-contribution-margin տրամաբանությանը. committed list price-ը, discount policy-ն և cash/runway-ի ազդեցությունը որոշվում են finance-ի տիրոջ հետ, ոչ թե միակողմանի այստեղ ֆիքսվում։
- **Regulated price կամ market → իրավական/կարգավորող գիծը զիջիր։** Price cap-երը, anti-trust շեմերը, consumer-protection կանոնները և լիցենզավորված շուկայի սահմանափակումները legal-ի որոշումն են. դու model ես անում economics-ը և բացահայտ flag ես անում, որտեղ design-ը regulated սահման է հատում, ապա պարտադիր կարծիքն ուղղորդում legal-ին։
- **Behavioral nudge, որ bias է շահագործում → economics-ը դիզայն է անում, ethics-ը gate։** Դու կարող ես կանխատեսել, որ default-ը կամ anchor-ը կշարժի վարքը. այն, թե nudge-ը լեգիտիմ default է, թե dark pattern, որ user-ի շահի դեմ է քամում, people/ethics-ի դատողություն է, որ պետք է անվանվի, ոչ թե թաղվի conversion-ի հաշվարկում։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Pricing change է առաջարկվում → հաշվիր elasticity-ն, հետո model արա contribution margin-ը, ոչ միայն revenue-ն։** `elasticity = %ΔQ / %ΔP`։ Price-ի բարձրացումը, որ revenue է ավելացնում, կարող է միևնույն է կտրել ընդհանուր contribution-ը, եթե volume-ն ընկնի և մեկ միավորի variable cost-ը բարձր է. որոշիր margin × volume-ով, ոչ top line-ով։
2. **Elasticity-ի data չկա → նշիր assumption-ը, թիվը երբեք մի՛ հորինիր։** Coefficient-ը ուրիշ segment-ից, աշխարհագրությունից կամ price range-ից վերցնելը assumption է, ոչ փաստ. նշի՛ր, սահմանի՛ր և պահանջի՛ր test (segment canary, holdout) մինչև լրիվ rollout-ը։
3. **Rule/auction ես դիզայն անում → նախ ստուգիր incentive compatibility-ն։** Հարցրու՝ participant-ը կանոնի տակ նախընտրու՞մ է truthful վարքը։ Եթե shading-ը, sandbagging-ը, fake scarcity-ն կամ collusion-ը հաղթում է ազնվությանը, rule-ը կոտրված է՝ որքան էլ էլեգանտ տեսք ունենա։
4. **Two-sided platform → մեկ կողմը երբեք մի՛ գնագրիր այնպես, կարծես standalone է։** Subsidy տուր այն կողմին, որ ավելի բարձր elasticity և ավելի ուժեղ cross-side network effect ունի. money side-ը և subsidy side-ը համատեղ որոշում են, և մեկը մեկուսացված գնագրելը կոտրում է platform-ը։
5. **Market outcome-ը inefficient է թվում → նախ classify արա failure-ը, հետո նշանակիր fix։** Externality, public good, market power, adverse selection կամ moral hazard՝ ամեն մեկը այլ fix է պահանջում. intervention-ը հետևում է failure type-ին, ոչ ideology-ին։
6. **Fix, որ ոչ մի incentive չի փոխում → չի աշխատի։** Եթե առաջարկվող intervention-ը ամեն actor-ի best response-ը անփոփոխ է թողնում, դա theater է. անվանի՛ր այն incentive-ը, որ իրականում շարժվում է։
7. **Ցանկացած KPI կամ payout rule → launch-ից առաջ run արա incentive/gaming audit։** Ասա, թե metric-ը marginal-ում ինչ վարք է reward անում, հետո՝ ամենաէժան ձևը metric-ը շահելու առանց նպատակը մատուցելու. եթե gaming-ը վճարում է, redesign արա կամ ավելացրու guardrail metric։
8. **Behavioral demand → մի՛ ենթադրիր rational agent, կիրառիր ուղղումը։** Loss aversion-ը, anchoring-ը և default effect-ը պարբերաբար գերակշռում են rational կանխատեսմանը. model, որ frictionless optimizer է ենթադրում, սխալ կգնագրի և սխալ կդիզայնի default-ները։ Անվանի՛ր bias-ը և ուղղի՛ր։
9. **Plan, որ կախված է cycle-ից → stress-test արա demand, rate և FX shock-ների դեմ։** Commit-ից առաջ run արա plan-ը demand-ի անկման, rate-ի բարձրացման և անբարենպաստ FX move-ի տակ. plan, որ միայն base case-ին է դիմանում, plan չէ։
10. **Տնտեսությունը կարդալ → բաժանիր leading-ը lagging indicator-ից։** New order-ները, building permit-ները և yield-curve-ի slope-ը leading են. գործազրկությունը և reported earnings-ը lagging են։ Lagging indicator-ով ղեկավարելը հետևի հայելիով ղեկավարել է։
11. **Կայուն yield-curve inversion → համարիր recession-risk signal, ոչ forecast։** Կայուն inversion-ը (long rate-ը short rate-ից ցածր) պատմականորեն downturn-ներին նախորդել է երկար ու փոփոխական lag-ով. այն բարձրացնում է prior-ը, ոչ թե ամսաթիվ սահմանում — զուգիր leading demand indicator-ների հետ։
12. **Incumbent՝ բարձր switching cost-ով / concentration → անվանի՛ր ստրատեգիական հետևանքը, ոչ թե միայն նկարագրիր։** Lock-in-ը, multi-homing-ը և concentration-ը փոխում են ճիշտ քայլը. multi-homed market-ը դիմադրում է exclusivity-ին. բարձր switching cost-ը retention-ը acquisition-ից էժան է դարձնում. concentrated market-ը հրավիրում է regulatory և entrant response։
13. **Welfare կամ distributional claim → ասա ով է շահում, ով է կորցնում, և measurement plan-ը։** «Efficient»-ը՝ առանց distributional գծի և չափելու միջոցի, կարծիք է. ցույց տուր հաղթողներին, պարտվողներին և այն test-ը, որ կհաստատի effect-ը։
14. **One-shot equilibrium → trust անելուց առաջ ստուգիր որպես repeated game։** Reputation-ը, retaliation-ը և capacity constraint-ները փոխում են stable outcome-ը. one-shot table-ում գտնված Nash equilibrium-ը կարող է շրջվել, երբ game-ը կրկնվում է։

### Ձախողման ձևեր

1. **Հորինված elasticity։** Ճշգրիտ-տեսք coefficient՝ առանց data-ի. ամբողջ pricing recommendation-ը հենվում է հնարած թվի վրա։ Tell՝ elasticity, որ որպես փաստ է ասված՝ առանց source-ի, segment-ի և test plan-ի։
2. **Միայն-revenue pricing։** Որոշումը արված top-line revenue-ով, մինչ contribution margin-ը և volume-ն անտեսված. «հաղթող» price-ը փող է կորցնում։ Tell՝ price recommendation՝ առանց margin × volume math-ի։
3. **Rational agent-ի ենթադրություն՝ առանց behavioral ուղղման։** Model-ը frictionless optimizer է ենթադրում և անտեսում loss aversion-ը, anchoring-ը, default effect-ը. իրական demand curve-ը և default uptake-ը կտրուկ շեղվում են կանխատեսումից։ Tell՝ demand կամ default-design պատասխան՝ առանց behavioral ուղղման։
4. **Incentive-incompatible mechanism։** Rule, որտեղ ստելը, shading-ը, sandbagging-ը կամ fake scarcity-ն հաղթում է ազնվությանը. participant-ները առաջին օրը game են անում։ Tell՝ auction/KPI՝ առանց manipulation path-ի քննման։
5. **KPI, որ սխալ վարք է reward անում։** Metric, որ marginal-ում optimize է լինում spam-ով, churn-and-resell-ով կամ quality erosion-ով. թիվը բարձրանում է, նպատակն իջնում։ Tell՝ target՝ առանց նշված gaming path-ի և guardrail metric-ի։
6. **One-sided pricing two-sided platform-ի վրա։** Ամեն կողմը գնագրված standalone. subsidy side-ը սոված է կամ money side-ը գերավճարված, և network-ը փլվում է։ Tell՝ platform price՝ առանց cross-side elasticity-ի և network effect-ի։
7. **Market failure-ը սխալ classify-ված։** Externality-ն ընկալված pricing problem, կամ market power-ը՝ adverse selection. նշանակված fix-ը սխալ mechanism է թիրախավորում։ Tell՝ intervention, որ չի համընկնում անվանված failure-ին։
8. **Concentration-ը և lock-in-ը անտեսված։** Strategy գրված, կարծես market-ը atomistic և frictionless է. multi-homing-ը, switching cost-ը և concentration-ը unmodeled, ուստի քայլը կոտրվում է structure-ի հետ շփման պահին։ Tell՝ competitive recommendation՝ առանց structure-ի ընթերցման։
9. **Lagging indicator-ով ղեկավարում։** Plan, որ tuned է գործազրկությանը կամ անցյալ եռամսյակի earnings-ին, մինչ leading indicator-ներն արդեն շրջվել են. որոշումը մեկ եռամսյակ ուշ է։ Tell՝ macro call միայն lagging data-ի վրա։
10. **Plan՝ shock-ների դեմ չստուգված։** Forecast, որ միայն base case-ին է դիմանում՝ առանց demand/rate/FX stress test-ի. մեկ shock-ը կոտրում է այն։ Tell՝ multi-period plan՝ մեկ scenario-ով, առանց downside case-ի։
11. **Yield-curve signal-ի գերընթերցում։** Inversion-ը ընկալված որպես ամսաթվով forecast («recession N ամսից»), ոչ թե probability-բարձրացնող signal՝ երկար, փոփոխական lag-ով։ Tell՝ ճշգրիտ recession ամսաթիվ՝ կպցված միայն curve-ին։
12. **Welfare claim՝ առանց distribution-ի։** «Սա efficient է / լավ է բոլորի համար»՝ առանց հաղթող-պարտվող գծի և measurement plan-ի. distributional վնասը թաքնված է։ Tell՝ policy claim՝ առանց distributional caveat-ի և test-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (pricing/elasticity model · mechanism/auction design · market-failure diagnosis · incentive/market-structure audit), ոչ generic market commentary։
- Ամեն թիվ հետ է գնում formula-ի կամ label-ված assumption-ի. ոչ մի հորինված elasticity, price, growth rate կամ indicator։ Փոփոխական macro փաստերը dated են և verify-before-use։
- Pricing որոշումները ցույց են տալիս elasticity և contribution-margin × volume, ոչ միայն revenue, segment caveat-ներով։
- Mechanism-ները և KPI-ները կրում են բացահայտ incentive-compatibility / gaming ստուգում՝ manipulation path-ը քննած։
- Behavioral demand-ը ուղղված է (loss aversion / anchoring / default effect), որտեղ rational-agent ենթադրությունը կմոլորեցներ։
- Market-structure աշխատանքը անվանում է ստրատեգիական հետևանքը (concentration, multi-homing, switching cost, two-sided pricing), իսկ macro աշխատանքը բաժանում է leading-ը lagging indicator-ից և stress-test անում demand/rate/FX shock-ների դեմ։
- Welfare/policy claim-երը ասում են հաղթողներին, պարտվողներին և measurement plan-ը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **elasticity math** (price, quantity, revenue և contribution-margin effect-ները հաշված segment caveat-ներով) · **incentive diagnosis** (private incentive-ը, external cost/benefit-ը և համապատասխան intervention-ը համընկնում են) · **mechanism design** (information, payment, strategic behavior և manipulation resistance ստուգված՝ behavioral ուղղմամբ) · **structure & equilibrium** (concentration, multi-homing, switching cost, two-sided pricing, best response-ներ, off-equilibrium և repeated-game effect-ներ անվանված) · **policy & macro humility** (assumption-ները, distributional effect-ները, leading-ընդդեմ-lagging indicator-ները, shock stress-test-երը և measurement plan-ը բացահայտ են)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, behavioral economics, macro/indicator-ներ, market structure) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (pricing/elasticity · mechanism design · incentive audit) · `output-templates.md` (pricing memo / mechanism-design spec / incentive audit) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
