# Sales, Revenue, and Growth patterns

## English

These are canonical Sales, Revenue, and Growth moves. Each is a mechanism for one of the domain's artifacts (ICP definition, funnel/forecast model, deal review, pricing/packaging memo, growth-loop map). Choose the move that changes the next decision, not the nicest label.

### 1. ICP definition

- **Trigger:** Win rate is low, churn is high, or the team "sells to everyone."
- **Mechanism:** Write the Ideal Customer Profile as firmographics (size, industry, geography, tech stack) + the specific pain removed + the trigger that makes them buy now + the disqualifiers that mark a bad fit. Validate it against won and churned accounts: best customers should fit, churned ones should fail it. The ICP then sets lead qualification, price tolerance, motion, and expected retention.
- **Do not use when:** A single product line genuinely serves one tight segment already and the data confirms fit — refine, do not re-derive.
- **Failure repair:** If the ICP is "everyone," narrow it before touching the funnel; an unqualified ICP makes every downstream conversion number meaningless.

### 2. Funnel bottleneck math

- **Trigger:** A growth or pipeline target is missed, or an alert is firing on lead count.
- **Mechanism:** Compute each stage's volume and conversion (`leads × stage conversion × win rate × ACV`), segmented by channel and cohort. Sensitivity-test each stage: what does one point of improvement here add to revenue? Separate acquisition, activation, retention, and expansion, then direct effort to the stage with the most revenue leverage.
- **Do not use when:** Revenue data is not segmented enough to act — fix the instrumentation first.
- **Failure repair:** If all effort goes to top-of-funnel while close rate or qualification is the bottleneck, redirect to the binding stage; adding leads scales the leak.

### 3. MEDDICC deal desk

- **Trigger:** A large deal is forecast optimistically, or pipeline is full of "happy" deals that slip.
- **Mechanism:** Score each MEDDICC field on evidence, not rep confidence: Metrics, Economic buyer, Decision criteria, Decision process, Identified pain, Champion, Competition. A missing economic buyer or decision process downgrades the forecast. Multi-thread beyond the champion so the deal survives one person leaving.
- **Do not use when:** The purchase is low-ACV self-serve with no committee — the qualification is the product experience, not a deal desk.
- **Failure repair:** If the champion cannot access the economic buyer, the deal is fragile; downgrade it and make finding the economic buyer the next step, not a higher number.

### 4. Value-based pricing and packaging

- **Trigger:** Price is cost-plus or copied from a competitor, tiers are random, or expansion is flat.
- **Mechanism:** Anchor price to willingness-to-pay and a value metric that scales with delivered value (seats / usage / outcome). Fence tiers by the value each unlocks, not by holding random features hostage. Build an expansion path into the packaging. Guard usage pricing against bill shock with caps or alerts. Reconcile margin/LTV/CAC with finance before committing the number.
- **Do not use when:** The economics (margin, LTV/CAC) are unresolved — get the finance reconciliation first; a price without the margin check is a guess.
- **Failure repair:** If the price is cost-plus, reset to WTP and a value metric; if usage-based with no cap, add bill-shock protection before launch.

### 5. Discount-policy guard

- **Trigger:** Deals close at month-end below the floor, or discounts are given the moment a buyer hesitates.
- **Mechanism:** Make every discount a trade — term length, prepayment, a reference/case study, reduced scope, or a faster close. Set a floor; below it, route to the deal owner with the margin impact stated. Track the realized average discount as a leading indicator that the reference price is drifting.
- **Do not use when:** A strategic, named-exception deal warrants a one-off concession approved by the owner — document it, do not let it set the policy.
- **Failure repair:** If discounting is reflexive, replace it with the trade list and the floor; reflexive cuts train buyers to wait and reset the reference price for everyone.

### 6. Growth-loop map

- **Trigger:** A tactic is called a "loop," or growth stops the moment spend stops.
- **Mechanism:** Map input → action → output → reinvestment, then add the saturation ceiling and the abuse guard. The test is reinvestment: output must feed back as new qualified input. For a referral: moment of delight, incentive (sender + recipient), recipient value, conversion step, abuse control.
- **Do not use when:** The motion is genuinely one-off paid acquisition — size it as a campaign by spend, do not dress it as a loop.
- **Failure repair:** If output does not create new qualified input, it is a campaign, not a loop; relabel it and size it by spend rather than claiming compounding.

## Հայերեն

Սրանք canonical Sales, Revenue, and Growth move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (ICP-ի սահմանում, funnel/forecast model, deal review, pricing/packaging memo, growth-loop map)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. ICP-ի սահմանում

- **Երբ է պետք․** Win rate-ը ցածր է, churn-ը բարձր, կամ թիմը «բոլորին է վաճառում»։
- **Մեխանիզմը․** Գրիր Ideal Customer Profile-ը որպես firmographic (չափ, industry, geography, tech stack) + այն կոնկրետ pain-ը, որ հանվում է + trigger-ը, որ ստիպում է հիմա գնել + disqualifier-ները, որ նշում են վատ fit։ Validate արա այն won և churned account-ների դեմ․ լավագույն հաճախորդները պետք է fit լինեն, churned-ները՝ fail։ ICP-ն հետո սահմանում է lead qualification-ը, գնի հանդուրժողականությունը, motion-ը և սպասվող retention-ը։
- **Երբ չօգտագործել․** Երբ մեկ product line-ն արդեն իսկապես սպասարկում է մեկ նեղ segment, և data-ն հաստատում է fit-ը — refine արա, մի՛ վերաբխեցրու։
- **Ուղղում․** Եթե ICP-ն «բոլորն» է, նեղացրու այն funnel-ին դիպչելուց առաջ. unqualified ICP-ն ամեն հետագա conversion թիվը անիմաստ է դարձնում։

### 2. Funnel-ի bottleneck math

- **Երբ է պետք․** Growth կամ pipeline target-ը missed է, կամ alert-ը lead count-ի վրա է կրակում։
- **Մեխանիզմը․** Հաշվիր ամեն stage-ի volume և conversion (`leads × stage conversion × win rate × ACV`), segment արված channel-ով ու cohort-ով։ Sensitivity-test արա ամեն stage․ ի՞նչ է ավելացնում revenue-ին այստեղ մեկ point բարելավումը։ Առանձնացրու acquisition, activation, retention և expansion, հետո ուղղիր effort-ը այն stage, որ ամենաշատ revenue leverage ունի։
- **Երբ չօգտագործել․** Երբ revenue data-ն բավարար segment արված չէ action անելու համար — նախ ուղղիր instrumentation-ը։
- **Ուղղում․** Եթե ամբողջ effort-ը top-of-funnel է, մինչ close rate-ը կամ qualification-ն է bottleneck-ը, redirect արա binding stage-ին. lead ավելացնելը scale է անում արտահոսքը։

### 3. MEDDICC deal desk

- **Երբ է պետք․** Մեծ deal-ը optimistic forecast է, կամ pipeline-ը լի է «happy» deal-երով, որ սահում են։
- **Մեխանիզմը․** Score արա ամեն MEDDICC field evidence-ով, ոչ rep confidence-ով․ Metrics, Economic buyer, Decision criteria, Decision process, Identified pain, Champion, Competition։ Բացակայող economic buyer-ը կամ decision process-ը downgrade է անում forecast-ը։ Multi-thread արա champion-ից այն կողմ, որ deal-ը գոյատևի մեկի հեռանալուց հետո։
- **Երբ չօգտագործել․** Երբ գնումը low-ACV self-serve է՝ առանց committee-ի — qualification-ը product-ի փորձն է, ոչ deal desk։
- **Ուղղում․** Եթե champion-ը economic buyer-ին access չունի, deal-ը fragile է. downgrade արա այն և economic buyer-ին գտնելը դարձրու հաջորդ քայլ, ոչ ավելի բարձր թիվ։

### 4. Value-based pricing և packaging

- **Երբ է պետք․** Գինը cost-plus է կամ մրցակցից պատճենված, tier-երը random են, կամ expansion-ը հարթ է։
- **Մեխանիզմը․** Գինը anchor արա willingness-to-pay-ին և value metric-ին, որ scale է անում delivered value-ի հետ (seat / usage / outcome)։ Fence արա tier-երը այն value-ով, որ ամենը unlock է անում, ոչ random feature-ներ պատանդ վերցնելով։ Packaging-ի մեջ կառուցիր expansion path։ Usage pricing-ը պաշտպանիր bill shock-ից cap-ով կամ alert-ով։ Հաշտեցրու margin/LTV/CAC-ը finance-ի հետ նախքան թիվը commit անելը։
- **Երբ չօգտագործել․** Երբ economics-ը (margin, LTV/CAC) անհայտ է — նախ ստացիր finance-ի reconciliation-ը. գին՝ առանց margin ստուգման, գուշակություն է։
- **Ուղղում․** Եթե գինը cost-plus է, reset արա WTP-ի և value metric-ի. եթե usage-based է առանց cap-ի, ավելացրու bill-shock պաշտպանություն launch-ից առաջ։

### 5. Discount-policy guard

- **Երբ է պետք․** Deal-երը փակվում են ամսվա վերջին floor-ից ցածր, կամ discount-ները տրվում են գնորդի վարանելու պահին։
- **Մեխանիզմը․** Ամեն discount դարձրու trade — term-ի երկարություն, prepayment, reference/case study, կրճատված scope կամ ավելի արագ close։ Դիր floor. դրանից ցածր ուղղորդիր deal owner-ին՝ margin impact-ը նշված։ Հետևիր realized average discount-ին որպես leading indicator, որ reference price-ը սահում է։
- **Երբ չօգտագործել․** Երբ strategic, անվանված-բացառություն deal-ը արժանի է owner-ի հաստատած one-off զիջման — փաստաթղթավորիր այն, թույլ մի՛ տուր, որ դառնա policy։
- **Ուղղում․** Եթե discounting-ը reflexive է, փոխարինիր trade ցուցակով և floor-ով. reflexive կտրումները գնորդներին սովորեցնում են սպասել և reference price-ը reset են անում բոլորի համար։

### 6. Growth-loop map

- **Երբ է պետք․** Tactic-ը կոչվում է «loop», կամ աճը կանգ է առնում spend-ի կանգնելու պահին։
- **Մեխանիզմը․** Քարտեզիր input → action → output → reinvestment, հետո ավելացրու saturation առաստաղը և abuse guard-ը։ Test-ը reinvestment-ն է․ output-ը պետք է հետ սնվի որպես նոր qualified input։ Referral-ի համար․ moment of delight, incentive (sender + recipient), recipient value, conversion step, abuse control։
- **Երբ չօգտագործել․** Երբ motion-ն իսկապես one-off paid acquisition է — չափիր այն որպես campaign spend-ով, loop-ի հագուստ մի՛ տուր։
- **Ուղղում․** Եթե output-ը նոր qualified input չի ստեղծում, դա campaign է, ոչ loop. relabel արա այն և չափիր spend-ով, ոչ թե compounding պնդիր։
