---
name: "sales-revenue-growth"
description: >-
  use when the work is revenue: ICP and segmentation, funnel/pipeline conversion and forecasting, sales motion (self-serve / inside / field) and deal qualification (MEDDICC/SPICED), pricing and packaging, discounting, retention/churn, expansion and net revenue retention, or growth loops — for decisions, critique, planning, diagnostics, artifacts (funnel model / deal review / pricing memo / growth-loop map), teaching, or evaluation. use as lead when this domain owns the central decision or deliverable. do not use as lead when another skill owns the main artifact and revenue is only one input — then support it; pricing economics and LTV/CAC route to finance, channel/positioning route to marketing. հայերեն՝ օգտագործիր եկամտի աշխատանքի համար՝ ICP, funnel-ի conversion և forecast, sales motion և deal qualification, pricing/packaging, retention և expansion, growth loop։
---

# Sales, Revenue, and Growth / Վաճառք, եկամուտ և աճ

## English

**Scope.** In: ICP and segmentation, funnel/pipeline conversion and forecasting, sales motion selection (self-serve / inside / field), deal qualification (MEDDICC/SPICED), pricing and packaging, discounting discipline, retention and churn, expansion and net revenue retention (NRR), and growth loops. Out: brand/positioning and channel creative (marketing owns those), the unit-economics ledger and LTV/CAC/payback math as a finance artifact (finance owns the model; this skill supplies the revenue inputs), and product roadmap sequencing (product owns it). This skill turns revenue from a hope into an auditable system: a named buyer, a stage-by-stage funnel, a motion matched to deal size, a price tied to a value metric, and a retention/expansion loop — not a pile of disconnected tactics.

**Leads / Supports.** Lead when the central deliverable is revenue-shaped: an ICP definition, a funnel/forecast model, a MEDDICC deal review, a pricing/packaging memo, a discount policy, an NRR/expansion plan, or a growth-loop map. Support when another skill owns the artifact and revenue is one input — e.g. product owns the roadmap and you supply the willingness-to-pay and packaging signal; marketing owns the campaign and you supply the ICP and the funnel conversion targets it must hit.

Conflict rules:
- **Pricing economics and LTV/CAC → coordinate with finance, do not decide the model alone.** You own willingness-to-pay, the value metric, packaging, fences, and the discount policy. The margin math, the LTV-on-gross-margin computation, the CAC payback period, and any number that lands in the P&L or a board model are a finance artifact: supply the revenue inputs and the price logic, and reconcile the economics with `finance-unit-economics` before a price or a CAC target is committed.
- **Demand generation and positioning → defer to marketing.** You own the ICP, the funnel conversion targets, and the sales motion. The channel mix, the brand narrative, and the creative are marketing's; hand them the ICP and the stage targets, do not redesign the campaign here.
- **Roadmap and packaging-by-feature → coordinate with product.** You own which value the price fences and what the buyer will pay for; product owns whether and when the feature exists. A packaging fence that promises a feature product has not committed is a forecast risk — name it, do not assume it.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **No named ICP → stop and define it first.** Before funnel, pricing, or motion, name who the best-fit buyer is by firmographic + pain + trigger + the disqualifiers. Selling to "everyone" is the root cause of low win rate and high churn; a wide funnel on a vague ICP just imports the wrong customers faster.
2. **Forecast stated as one blended number → rebuild it stage-by-stage.** Model `leads × stage conversion × win rate × ACV`, segmented by channel and cohort. A blended guess hides which stage is the bottleneck; the stage with the lowest conversion-to-revenue leverage is where the work goes.
3. **"More leads" proposed for a bottleneck below the top → reject it and fix the binding stage.** If win rate or qualification is the constraint, adding lead volume scales the leak. Sensitivity-test each stage; pour effort into the stage that moves revenue most per point of improvement.
4. **Deal forecast resting on a champion alone → not forecastable.** Require MEDDICC hard signals: Metrics, Economic buyer, Decision criteria, Decision process, Identified pain, Champion, Competition. No economic buyer or no decision process → downgrade the deal regardless of how much the champion loves it.
5. **Motion must match deal size and buying process.** Low-ACV high-volume → self-serve / product-led; mid-ACV → inside sales; high-ACV with a committee → field sales with multi-threading. A field-sales motion on a self-serve price point burns margin; a self-serve motion on a six-figure committee deal loses it.
6. **Demo requested before discovery → run discovery first.** Pitching before you know the pain, the metric, and the economic buyer sells features into a vacuum. Qualify the pain and the impact, then demo to it.
7. **Price set from cost or from a competitor's number → reset to value.** Price tracks willingness-to-pay and a value metric that scales with the value the customer receives (seats, usage, outcomes), not cost-plus and not a reflexive match. Cost-plus leaves money on the table or prices above value; both are wrong.
8. **Value metric must scale with delivered value, and watch bill shock.** Seat pricing fits per-user value; usage pricing fits consumption value but can create bill shock and churn; tiering must fence by value, not hold random features hostage. Pick the metric the buyer already uses to describe their own success.
9. **Discount requested → make it earn something and protect the floor.** A discount is a trade, not a reflex: trade it for term length, prepayment, a case study, or scope. Reflexive discounting trains the buyer to wait and resets the reference price down for everyone; route any below-floor discount to the deal owner with the margin impact stated.
10. **LTV computed on revenue → recompute on gross margin.** LTV must use gross margin, not top-line revenue; revenue-based LTV overstates customer value and corrupts every CAC and payback decision built on it. Coordinate the number with finance.
11. **"Add an invite button" called a growth loop → it is not one until the loop closes.** A loop needs input → action → output → reinvestment → and a saturation/abuse guard. If the output does not feed back as qualified input, it is a campaign, not a loop. A referral needs a moment of delight, an incentive, recipient value, conversion, and abuse control.
12. **Scaling spend before product-market fit → freeze the scale, prove retention first.** Pouring acquisition budget onto weak retention scales a leaky bucket. Require evidence of retention/PMF (cohort retention flattening, organic pull, NRR ≥ 100% in the target segment) before stepping up acquisition.
13. **Churn and expansion ignored → revenue quality is unknown.** Bookings without retention, NRR, and net-new-vs-expansion split is a vanity number. Report revenue segmented by cohort, channel, margin, churn, and payback, and separate logo churn from revenue churn.
14. **Any conversion rate / CAC / benchmark asserted without a source → label it.** Do not invent conversion benchmarks, CAC figures, or "industry average" rates. Use the user's own segmented data, a labeled assumption, or a formula with a placeholder; mark volatile market claims verify-before-use.

### Failure modes to prevent / Ձախողման ձևեր

1. **Motion-model mismatch.** Running field sales on a self-serve price point (or self-serve on a committee deal). Tell: a high-touch sales team on a $50/mo product, or a six-figure enterprise deal with no multi-threading and no field rep — CAC payback that never closes.
2. **Demo-before-discovery.** Jumping to a product demo before the pain, the metric, and the economic buyer are known. Tell: a feature tour with no qualified pain, no quantified impact, and no buyer named — the deal stalls "to think about it."
3. **Single-threading.** The whole deal rides on one champion with no economic-buyer access and no second relationship. Tell: a forecast at "commit" where only one contact has ever replied; champion leaves and the deal vanishes.
4. **Cost-plus (or competitor-match) pricing.** Price set by adding a margin to cost, or by reflexively matching a competitor, instead of value and willingness-to-pay. Tell: a price with no value metric and no WTP evidence, justified by "it covers our costs."
5. **LTV on revenue, not gross margin.** Lifetime value computed on top-line revenue, inflating customer value and every CAC/payback decision downstream. Tell: an LTV number with no gross-margin line; an "LTV/CAC of 5x" that collapses once margin is applied.
6. **Reflexive discounting.** Cutting price the moment a buyer hesitates, with nothing traded back. Tell: discounts given without term/prepay/scope in return, deals consistently closing at month-end below floor, the reference price drifting down.
7. **Scaling before PMF.** Adding acquisition spend onto weak retention. Tell: rising CAC, flat or falling cohort retention, NRR below 100%, churn eating most of net-new — pouring water into a leaky bucket.
8. **Vanity funnel — more leads on a vague ICP.** Top-of-funnel volume celebrated while win rate and retention rot. Tell: lead count up, qualified pipeline and close rate flat or down, churn rising; "everyone" is the ICP.
9. **Pipeline stage definitions drift.** Stages mean different things to different reps, so the forecast is noise. Tell: "qualified" with no exit criteria; two reps' "50% deals" are not comparable.
10. **Growth tactic mislabeled a loop.** A one-off paid campaign or an invite button called a self-reinforcing loop. Tell: output that does not reinvest as new qualified input; spend stops, growth stops.
11. **Expansion mistaken for new revenue (or vice versa).** Reporting one blended growth number that hides whether it came from new logos or from existing accounts. Tell: no net-new-vs-expansion split, no NRR, churn hidden inside a gross-bookings headline.
12. **Invented benchmarks.** Quoting a conversion rate, CAC, or "industry standard" with no source. Tell: a confident "typical SaaS converts at X%" with no citation and no segmentation.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (ICP definition / funnel model / deal review / pricing memo / NRR-expansion plan / growth-loop map), not generic advice.
- Every funnel number is stage-by-stage and segmented; the arithmetic is shown and correct; no invented conversion/CAC benchmarks.
- Deals are forecast on MEDDICC hard signals (economic buyer + decision process present), not champion enthusiasm.
- Pricing ties to a value metric and willingness-to-pay; LTV is on gross margin; the economics are reconciled with finance before commitment.
- Discounts are traded for something and routed to the owner below the floor; the motion matches deal size and buying process.
- Revenue quality is reported with retention, churn, NRR, and a net-new-vs-expansion split; scaling is gated on retention/PMF evidence.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **funnel math** (stage volumes, conversions, ACV, win rate, margin, capacity, cohort quality calculated) · **deal qualification** (MEDDICC/SPICED fields evidence-backed and forecast-changing) · **pricing logic** (WTP, value metric, margin, expansion, bill-shock risk drive packaging) · **growth loop** (input, action, output, reinvestment, saturation, abuse control explicit) · **revenue quality** (segmented by cohort, channel, margin, churn, payback; NRR and net-new-vs-expansion split).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, ICP/funnel/MEDDICC/pricing/NRR/growth-loop, finance routing) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (ICP + funnel diagnostic + pricing + deal review) · `output-templates.md` (funnel/forecast model / deal review / pricing memo) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ ICP և segmentation, funnel/pipeline-ի conversion և forecast, sales motion-ի ընտրություն (self-serve / inside / field), deal qualification (MEDDICC/SPICED), pricing և packaging, discount-ի կարգապահություն, retention և churn, expansion և net revenue retention (NRR), growth loop-եր։ Դուրս՝ brand/positioning-ը և channel creative-ը (marketing-ինն են), unit-economics-ի մատյանը և LTV/CAC/payback math-ը՝ որպես finance artifact (model-ը finance-ինն է. այս skill-ը տալիս է revenue input-ները), և product roadmap-ի հերթականությունը (product-ինն է)։ Այս skill-ը եկամուտը հույսից դարձնում է auditable համակարգ՝ անվանված գնորդ, stage-by-stage funnel, deal-ի չափին համապատասխան motion, value metric-ին կապված գին և retention/expansion loop, ոչ թե իրարից կտրված tactic-ների կույտ։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը եկամտի ձև ունի՝ ICP-ի սահմանում, funnel/forecast model, MEDDICC deal review, pricing/packaging memo, discount policy, NRR/expansion plan կամ growth-loop map։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ եկամուտը մեկ input է. օրինակ՝ product-ը տիրում է roadmap-ին, դու տալիս ես willingness-to-pay-ի և packaging-ի signal-ը. marketing-ը տիրում է campaign-ին, դու տալիս ես ICP-ն և funnel-ի conversion target-ները, որ նա պետք է հատի։

Կոնֆլիկտի կանոններ․
- **Pricing-ի economics-ը և LTV/CAC-ը → համակարգիր finance-ի հետ, model-ը մենակ մի՛ որոշիր։** Դու տիրում ես willingness-to-pay-ին, value metric-ին, packaging-ին, fence-երին և discount policy-ին։ Margin math-ը, LTV-ն gross margin-ի վրա հաշվելը, CAC payback period-ը և ամեն թիվ, որ ընկնում է P&L-ի կամ board model-ի մեջ, finance artifact են․ տուր revenue input-ները և գնի տրամաբանությունը, և economics-ը հաշտեցրու `finance-unit-economics`-ի հետ, նախքան գին կամ CAC target commit անելը։
- **Demand generation-ը և positioning-ը → զիջիր marketing-ին։** Դու տիրում ես ICP-ին, funnel-ի conversion target-ներին և sales motion-ին։ Channel mix-ը, brand narrative-ը և creative-ը marketing-ինն են. հանձնիր նրանց ICP-ն և stage target-ները, campaign-ը այստեղ մի՛ վերանախագծիր։
- **Roadmap-ը և feature-ով packaging-ը → համակարգիր product-ի հետ։** Դու տիրում ես այն value-ին, որ գինը fence է անում, և այն, ինչի համար գնորդը կվճարի. product-ը տիրում է, թե արդյո՞ք և երբ feature-ը գոյություն ունի։ Packaging fence, որ խոստանում է feature, որ product-ը commit չի արել, forecast risk է. անվանի՛ր այն, մի՛ ենթադրիր։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Անվանված ICP չկա → կանգնի՛ր և նախ սահմանի՛ր այն։** Funnel-ից, pricing-ից կամ motion-ից առաջ անվանիր, թե ով է best-fit գնորդը՝ firmographic + pain + trigger + disqualifier-ներով։ «Բոլորին» վաճառելը ցածր win rate-ի և բարձր churn-ի արմատային պատճառն է. լայն funnel-ը vague ICP-ի վրա պարզապես սխալ հաճախորդներին ավելի արագ է ներմուծում։
2. **Forecast-ը ասված է մեկ blended թվով → վերակառուցի՛ր stage-by-stage։** Model արա `leads × stage conversion × win rate × ACV`՝ channel-ով և cohort-ով segment արված։ Blended գուշակությունը թաքցնում է, թե որ stage-ն է bottleneck-ը. աշխատանքը գնում է այն stage, որի՝ revenue-ին conversion leverage-ը ամենացածրն է։
3. **«Ավելի շատ lead» է առաջարկվում top-ից ներքև bottleneck-ի համար → մերժի՛ր և ուղղի՛ր binding stage-ը։** Եթե win rate-ը կամ qualification-ն է սահմանափակումը, lead volume ավելացնելը scale է անում արտահոսքը։ Sensitivity-test արա ամեն stage. effort-ը լցրու այն stage, որ revenue-ն ամենաշատ է շարժում մեկ point բարելավման դիմաց։
4. **Deal forecast, որ հենվում է միայն champion-ի վրա → forecastable չէ։** Պահանջիր MEDDICC hard signal-ներ՝ Metrics, Economic buyer, Decision criteria, Decision process, Identified pain, Champion, Competition։ Economic buyer կամ decision process չկա → downgrade արա deal-ը, անկախ նրանից՝ որքան է champion-ը սիրում product-ը։
5. **Motion-ը պետք է համապատասխանի deal-ի չափին և գնման գործընթացին։** Low-ACV high-volume → self-serve / product-led. mid-ACV → inside sales. high-ACV committee-ով → field sales՝ multi-threading-ով։ Field-sales motion self-serve գնի վրա margin է այրում. self-serve motion վեցանիշ committee deal-ի վրա կորցնում է այն։
6. **Demo է խնդրվում discovery-ից առաջ → նախ արա discovery։** Pitch անելը նախքան pain-ը, metric-ը և economic buyer-ը իմանալը feature է վաճառում դատարկության մեջ։ Qualify արա pain-ը և impact-ը, հետո demo արա դրան։
7. **Գինը դրված է cost-ից կամ մրցակցի թվից → reset արա value-ի։** Գինը հետևում է willingness-to-pay-ին և value metric-ին, որ scale է անում հաճախորդի ստացած value-ի հետ (seat, usage, outcome), ոչ cost-plus և ոչ reflexive match։ Cost-plus-ը կամ փող է թողնում սեղանին, կամ value-ից բարձր է գնում. երկուսն էլ սխալ են։
8. **Value metric-ը պետք է scale անի delivered value-ի հետ, և հետևի՛ր bill shock-ին։** Seat pricing-ը հարմար է per-user value-ի. usage pricing-ը՝ consumption value-ի, բայց կարող է bill shock և churn ստեղծել. tiering-ը պետք է fence անի value-ով, ոչ random feature-ներ պատանդ վերցնի։ Ընտրիր այն metric-ը, որ գնորդն արդեն օգտագործում է իր success-ը նկարագրելու համար։
9. **Discount է խնդրվում → թող ինչ-որ բան վաստակի և պաշտպանի՛ր floor-ը։** Discount-ը trade է, ոչ reflex. փոխանակիր այն term-ի երկարության, prepayment-ի, case study-ի կամ scope-ի հետ։ Reflexive discounting-ը գնորդին սովորեցնում է սպասել և reference price-ը ներքև է իջեցնում բոլորի համար. ցանկացած floor-ից ցածր discount ուղղորդիր deal owner-ին՝ margin impact-ը նշված։
10. **LTV-ն հաշվված է revenue-ի վրա → վերահաշվիր gross margin-ի վրա։** LTV-ն պետք է օգտագործի gross margin, ոչ top-line revenue. revenue-based LTV-ն ուռճացնում է հաճախորդի value-ն և corrupt է անում դրա վրա կառուցված ամեն CAC և payback որոշում։ Թիվը համակարգիր finance-ի հետ։
11. **«Ավելացրու invite button» կոչվում է growth loop → դա loop չէ, քանի դեռ loop-ը չի փակվում։** Loop-ին պետք է input → action → output → reinvestment → և saturation/abuse guard։ Եթե output-ը հետ չի սնվում որպես qualified input, դա campaign է, ոչ loop։ Referral-ին պետք է moment of delight, incentive, recipient value, conversion և abuse control։
12. **Spend-ը scale անել product-market fit-ից առաջ → սառեցրու scale-ը, նախ ապացուցիր retention-ը։** Acquisition budget-ը թույլ retention-ի վրա լցնելը scale է անում ծակ դույլը։ Պահանջիր retention/PMF-ի evidence (cohort retention-ը հարթվում է, organic pull, NRR ≥ 100% target segment-ում) նախքան acquisition-ը բարձրացնելը։
13. **Churn-ը և expansion-ը անտեսված → revenue quality-ն անհայտ է։** Bookings առանց retention-ի, NRR-ի և net-new-ընդդեմ-expansion split-ի vanity թիվ է։ Report արա revenue-ն segment արված cohort-ով, channel-ով, margin-ով, churn-ով և payback-ով, և բաժանիր logo churn-ը revenue churn-ից։
14. **Ցանկացած conversion rate / CAC / benchmark պնդված առանց աղբյուրի → label արա այն։** Մի՛ հորինիր conversion benchmark, CAC թիվ կամ «industry average» rate։ Օգտագործիր user-ի սեփական segment արված data-ն, label արված assumption կամ placeholder-ով formula. volatile market claim-ները նշիր verify-before-use։

### Ձախողման ձևեր

1. **Motion-model mismatch։** Field sales self-serve գնի վրա (կամ self-serve committee deal-ի վրա)։ Tell՝ high-touch sales team $50/ամիս product-ի վրա, կամ վեցանիշ enterprise deal՝ առանց multi-threading-ի և field rep-ի — CAC payback, որ երբեք չի փակվում։
2. **Demo-before-discovery։** Անցում product demo-ի նախքան pain-ը, metric-ը և economic buyer-ը հայտնի լինելը։ Tell՝ feature tour՝ առանց qualified pain-ի, quantified impact-ի և անվանված գնորդի — deal-ը կանգ է առնում «մտածելու համար»։
3. **Single-threading։** Ամբողջ deal-ը հենվում է մեկ champion-ի վրա՝ առանց economic-buyer access-ի և երկրորդ հարաբերության։ Tell՝ forecast «commit»-ին, որտեղ միայն մեկ contact է երբևէ պատասխանել. champion-ը հեռանում է, deal-ն անհետանում է։
4. **Cost-plus (կամ competitor-match) pricing։** Գին՝ դրված cost-ի վրա margin ավելացնելով, կամ reflexive մրցակից match անելով, value-ի և willingness-to-pay-ի փոխարեն։ Tell՝ գին՝ առանց value metric-ի և WTP evidence-ի, արդարացված «ծածկում է մեր ծախսերը»-ով։
5. **LTV revenue-ի վրա, ոչ gross margin-ի։** Lifetime value հաշված top-line revenue-ի վրա՝ ուռճացնելով հաճախորդի value-ն և դրա հետևից ամեն CAC/payback որոշում։ Tell՝ LTV թիվ՝ առանց gross-margin տողի. «LTV/CAC 5x», որ փլվում է, երբ margin-ը կիրառվում է։
6. **Reflexive discounting։** Գին կտրել գնորդի վարանելու պահին՝ ոչինչ չփոխանակելով։ Tell՝ discount-ներ՝ տրված առանց term/prepay/scope-ի դիմաց, deal-եր, որ հետևողականորեն փակվում են ամսվա վերջին floor-ից ցածր, reference price-ը սահում է ներքև։
7. **Scaling before PMF։** Acquisition spend ավելացնել թույլ retention-ի վրա։ Tell՝ աճող CAC, հարթ կամ ընկնող cohort retention, NRR 100%-ից ցածր, churn, որ ուտում է net-new-ի մեծ մասը — ջուր լցնել ծակ դույլը։
8. **Vanity funnel — ավելի շատ lead vague ICP-ի վրա։** Top-of-funnel volume-ը տոնվում է, մինչ win rate-ը և retention-ը փտում են։ Tell՝ lead count-ը վեր, qualified pipeline-ը և close rate-ը հարթ կամ ներքև, churn-ը աճում է. «բոլորն» է ICP-ն։
9. **Pipeline stage-ի սահմանումները սահում են։** Stage-երը տարբեր ռեփերի համար տարբեր բան են նշանակում, ուստի forecast-ը աղմուկ է։ Tell՝ «qualified»՝ առանց exit criteria-ի. երկու rep-ի «50% deal»-երը համեմատելի չեն։
10. **Growth tactic-ը սխալ պիտակված loop։** One-off paid campaign կամ invite button կոչվում է self-reinforcing loop։ Tell՝ output, որ չի reinvest լինում որպես նոր qualified input. spend-ը կանգ է առնում, աճը՝ կանգ։
11. **Expansion-ը շփոթված new revenue-ի հետ (կամ հակառակը)։** Մեկ blended աճի թիվ, որ թաքցնում է՝ այն եկավ նոր logo-ների՞ց, թե եղած account-ներից։ Tell՝ ոչ net-new-ընդդեմ-expansion split, ոչ NRR, churn թաքնված gross-bookings վերնագրի մեջ։
12. **Հորինված benchmark-ներ։** Conversion rate, CAC կամ «industry standard» մեջբերել առանց աղբյուրի։ Tell՝ վստահ «տիպիկ SaaS-ը convert է անում X%-ով»՝ առանց citation-ի և segmentation-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (ICP-ի սահմանում / funnel model / deal review / pricing memo / NRR-expansion plan / growth-loop map), ոչ generic advice։
- Funnel-ի ամեն թիվ stage-by-stage է և segment արված. arithmetic-ը ցույց է տրված և ճիշտ է. ոչ մի հորինված conversion/CAC benchmark։
- Deal-երը forecast են MEDDICC hard signal-ներով (economic buyer + decision process կա), ոչ champion-ի ոգևորությամբ։
- Pricing-ը կապվում է value metric-ին և willingness-to-pay-ին. LTV-ն gross margin-ի վրա է. economics-ը հաշտեցված է finance-ի հետ նախքան commitment-ը։
- Discount-ները փոխանակվում են ինչ-որ բանի դիմաց և floor-ից ցածր ուղղորդվում owner-ին. motion-ը համապատասխանում է deal-ի չափին և գնման գործընթացին։
- Revenue quality-ն report-ված է retention-ով, churn-ով, NRR-ով և net-new-ընդդեմ-expansion split-ով. scale-ը gated է retention/PMF evidence-ի վրա։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **funnel math** (stage volume, conversion, ACV, win rate, margin, capacity, cohort quality հաշված) · **deal qualification** (MEDDICC/SPICED field-երը evidence-backed և forecast-changing) · **pricing logic** (WTP, value metric, margin, expansion, bill-shock risk-ը որոշում են packaging-ը) · **growth loop** (input, action, output, reinvestment, saturation, abuse control բացահայտ) · **revenue quality** (segment արված cohort, channel, margin, churn, payback-ով. NRR և net-new-ընդդեմ-expansion split)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, ICP/funnel/MEDDICC/pricing/NRR/growth-loop, finance routing) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (ICP + funnel diagnostic + pricing + deal review) · `output-templates.md` (funnel/forecast model / deal review / pricing memo) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
