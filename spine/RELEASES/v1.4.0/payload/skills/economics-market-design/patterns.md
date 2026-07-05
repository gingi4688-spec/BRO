# Economics and Market Design patterns

## English

These are canonical economics and market-design moves. Each is a mechanism for one of the domain's four artifacts (pricing/elasticity model, mechanism/auction design, market-failure diagnosis, incentive/market-structure audit). Choose the move that changes the next decision, not the nicest label.

### 1. Elasticity price bridge

- **Trigger:** A pricing change is proposed, or a price is set on intuition.
- **Mechanism:** Compute elasticity from the observed or assumed quantity response (`%ΔQ / %ΔP`), then compare **contribution margin × volume** before and after, not revenue alone. Split by segment, because elasticity is local. Pair the recommendation with the test that would confirm the response (segment canary, holdout).
- **Do not use when:** The price is regulated or contractually fixed — there is no quantity-response decision to make; route the constraint to legal instead.
- **Failure repair:** If the elasticity is borrowed from another segment, geography, or price range, mark it as an assumption, bound it, and require a test before a full rollout.

### 2. Market-failure map

- **Trigger:** A market outcome looks inefficient or "unfair" and an intervention is being considered.
- **Mechanism:** Classify the failure — externality, public good, market power, adverse selection, or moral hazard — then choose the intervention that targets *that* mechanism (corrective tax/subsidy, provision, competition policy, screening/signaling, monitoring/skin-in-the-game). The fix follows the failure, not ideology.
- **Do not use when:** The problem is a firm-level execution mistake (a bad process, a bug, a staffing gap) rather than a market failure — that is an operations problem, not a mechanism problem.
- **Failure repair:** If the proposed fix changes no actor's incentive, it will not work; name the incentive that must move, or discard the intervention.

### 3. Auction / mechanism incentive test

- **Trigger:** An allocation rule, auction, or marketplace-matching rule is being designed or debated.
- **Mechanism:** Write the participant's incentives, information, and payment rule, then search for the cheapest manipulation: shading, sandbagging, fake scarcity, collusion, sybils. Ask whether truthful behavior is dominant (second-price/VCG) or whether the rule forces shading (first-price). If manipulation beats honesty, redesign the payment or scoring before launch.
- **Do not use when:** Allocation is manual, rare, and relationship-based — a full mechanism is over-engineering for a one-off human decision.
- **Failure repair:** If the rule rewards fake scarcity or a sybil attack, change the payment/scoring rule or add an identity/guardrail constraint before launch.

### 4. Incentive / KPI gaming audit

- **Trigger:** A KPI, payout rule, ranking, or commission scheme is proposed as a way to drive behavior.
- **Mechanism:** State exactly what the metric rewards *at the margin*, then find the cheapest way to win it without delivering the underlying goal (spam to lift a ranking, churn-and-resell to lift bookings, quality erosion to lift volume). If gaming pays more than the real work, add a guardrail metric, cap the gameable lever, or change what is measured. Treat the rule as adversarial input — participants optimize the metric, not your intent.
- **Do not use when:** The metric is purely diagnostic and carries no reward or consequence — there is no incentive to game.
- **Failure repair:** If the audit finds a profitable gaming path, do not ship the bare metric; pair it with a guardrail or redesign the reward so the goal and the metric move together.

### 5. Two-sided platform pricing

- **Trigger:** A platform with two interdependent sides (buyers/sellers, riders/drivers, readers/advertisers) is setting or revising price on either side.
- **Mechanism:** Price the sides **jointly**. Identify the more elastic / more network-valuable side and subsidize it; monetize the side that single-homes and captures the cross-side value. Model the cross-side network effect: a thinner subsidy side reduces value to the money side, so check the network does not collapse at the proposed split. Watch multi-homing and switching costs — they decide how much pricing power each side actually has.
- **Do not use when:** The business is genuinely one-sided (a normal seller of a good to end customers) — there is no second side to subsidize, so standalone pricing is correct.
- **Failure repair:** If one side was priced as standalone, re-derive the price with cross-side elasticity and network effects, and identify which side is being starved.

### 6. Macro shock stress-test

- **Trigger:** A multi-period plan, forecast, or large commitment depends on the economic cycle continuing as assumed.
- **Mechanism:** Read the cycle off **leading** indicators (new orders, building permits, yield-curve slope, jobless claims), not lagging ones (unemployment, last quarter's earnings); treat a sustained yield-curve inversion as a recession-probability signal, not a date. Then run the plan under three shocks — a demand drop (volume −X%, elasticity stated), a rate rise (cost of capital and debt service climb), and an adverse FX move — and report the break point and the trigger to pivot for each.
- **Do not use when:** The decision is small, fully reversible, and short-horizon — a heavy macro stress-test is over-engineering for a one-week, no-commitment move.
- **Failure repair:** If the plan was tested only on the base case, add the three shock scenarios and state the specific condition under which the plan breaks and what you watch to see it coming.

## Հայերեն

Սրանք canonical economics և market-design move-եր են։ Ամեն մեկը mechanism է ոլորտի չորս artifact-ից մեկի համար (pricing/elasticity model, mechanism/auction design, market-failure diagnosis, incentive/market-structure audit)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Elasticity price bridge

- **Երբ է պետք․** Pricing change է առաջարկվում, կամ price-ը սահմանվում է intuition-ով։
- **Մեխանիզմը․** Հաշվիր elasticity-ն observed կամ assumed quantity response-ից (`%ΔQ / %ΔP`), հետո համեմատիր **contribution margin × volume**-ը առաջ և հետո, ոչ միայն revenue։ Բաժանիր segment-ով, որովհետև elasticity-ն local է։ Recommendation-ը զուգիր այն test-ի հետ, որ կհաստատի response-ը (segment canary, holdout)։
- **Երբ չօգտագործել․** Երբ price-ը regulated կամ contractually fixed է — quantity-response որոշում չկա. constraint-ը ուղղորդիր legal-ին։
- **Ուղղում․** Եթե elasticity-ն վերցված է ուրիշ segment-ից, աշխարհագրությունից կամ price range-ից, նշիր որպես assumption, սահմանիր և պահանջիր test մինչև լրիվ rollout-ը։

### 2. Market-failure map

- **Երբ է պետք․** Market outcome-ը inefficient կամ «անարդար» է թվում, և intervention է դիտարկվում։
- **Մեխանիզմը․** Classify արա failure-ը — externality, public good, market power, adverse selection կամ moral hazard — հետո ընտրիր այն intervention-ը, որ թիրախավորում է *այդ* mechanism-ը (corrective tax/subsidy, provision, competition policy, screening/signaling, monitoring/skin-in-the-game)։ Fix-ը հետևում է failure-ին, ոչ ideology-ին։
- **Երբ չօգտագործել․** Երբ խնդիրը firm-level execution mistake է (վատ process, bug, staffing gap), ոչ market failure — դա operations խնդիր է, ոչ mechanism խնդիր։
- **Ուղղում․** Եթե առաջարկվող fix-ը ոչ մի actor-ի incentive չի փոխում, չի աշխատի. անվանի՛ր այն incentive-ը, որ պետք է շարժվի, կամ դեն գցիր intervention-ը։

### 3. Auction / mechanism incentive test

- **Երբ է պետք․** Allocation rule, auction կամ marketplace-matching rule է դիզայնվում կամ քննարկվում։
- **Մեխանիզմը․** Գրիր participant-ի incentive-ները, information-ը և payment rule-ը, հետո փնտրիր ամենաէժան manipulation-ը՝ shading, sandbagging, fake scarcity, collusion, sybil։ Հարցրու՝ truthful վարքը dominant է (second-price/VCG), թե rule-ը shading է պարտադրում (first-price)։ Եթե manipulation-ը հաղթում է ազնվությանը, redesign արա payment-ը կամ scoring-ը launch-ից առաջ։
- **Երբ չօգտագործել․** Երբ allocation-ը manual, rare և relationship-based է — ամբողջական mechanism-ը over-engineering է one-off մարդկային որոշման համար։
- **Ուղղում․** Եթե rule-ը fake scarcity կամ sybil attack է reward անում, փոխիր payment/scoring rule-ը կամ ավելացրու identity/guardrail constraint launch-ից առաջ։

### 4. Incentive / KPI gaming audit

- **Երբ է պետք․** KPI, payout rule, ranking կամ commission scheme է առաջարկվում որպես վարք շարժելու միջոց։
- **Մեխանիզմը․** Ասա հստակ, թե metric-ը *marginal-ում* ինչ է reward անում, հետո գտիր ամենաէժան ձևը՝ շահելու առանց հիմքում ընկած նպատակը մատուցելու (spam ranking բարձրացնելու, churn-and-resell booking բարձրացնելու, quality erosion volume բարձրացնելու)։ Եթե gaming-ը ավելի է վճարում, քան իրական աշխատանքը, ավելացրու guardrail metric, cap արա gameable lever-ը, կամ փոխիր չափվողը։ Rule-ը համարիր adversarial input — participant-ները optimize են անում metric-ը, ոչ քո intent-ը։
- **Երբ չօգտագործել․** Երբ metric-ը զուտ diagnostic է և reward կամ consequence չի կրում — game անելու incentive չկա։
- **Ուղղում․** Եթե audit-ը profitable gaming path է գտնում, մի՛ ship արա մերկ metric-ը. զուգիր guardrail-ով կամ redesign արա reward-ը, որ նպատակն ու metric-ը միասին շարժվեն։

### 5. Two-sided platform pricing

- **Երբ է պետք․** Platform՝ երկու փոխկախված կողմով (buyer/seller, rider/driver, reader/advertiser), price է սահմանում կամ վերանայում որևէ կողմի վրա։
- **Մեխանիզմը․** Կողմերը գնագրիր **համատեղ**։ Գտիր ավելի elastic / ավելի network-արժեքավոր կողմը և subsidy տուր այն. monetize արա այն կողմը, որ single-home է անում և captures է cross-side value-ն։ Model արա cross-side network effect-ը․ ավելի բարակ subsidy side-ը value է իջեցնում money side-ին, ուստի ստուգիր, որ network-ը չի փլվում առաջարկվող split-ի դեպքում։ Հետևիր multi-homing-ին և switching cost-ին — դրանք որոշում են, թե իրականում որքան pricing power ունի ամեն կողմ։
- **Երբ չօգտագործել․** Երբ business-ը իսկապես one-sided է (good-ի սովորական seller end customer-ին) — երկրորդ կողմ չկա subsidy անելու, ուստի standalone pricing-ը ճիշտ է։
- **Ուղղում․** Եթե մի կողմը գնագրվել է standalone, վերածնիր price-ը cross-side elasticity-ով և network effect-ով, և գտիր, թե որ կողմն է սովամահ լինում։

### 6. Macro shock stress-test

- **Երբ է պետք․** Multi-period plan, forecast կամ մեծ commitment կախված է տնտեսական cycle-ի՝ ենթադրվածի պես շարունակվելուց։
- **Մեխանիզմը․** Կարդա cycle-ը **leading** indicator-ներով (new order, building permit, yield-curve slope, jobless claim), ոչ lagging-ով (unemployment, անցյալ եռամսյակի earnings). կայուն yield-curve inversion-ը համարիր recession-probability signal, ոչ ամսաթիվ։ Հետո run արա plan-ը երեք shock-ի տակ — demand drop (volume −X%, elasticity-ն նշված), rate rise (cost of capital-ը և debt service-ը բարձրանում), և անբարենպաստ FX move — և ամեն մեկի համար զեկուցիր break point-ը և pivot-ի trigger-ը։
- **Երբ չօգտագործել․** Երբ որոշումը փոքր է, լրիվ հետշրջելի և կարճ-հորիզոն — ծանր macro stress-test-ը over-engineering է մեկ շաբաթյա, no-commitment move-ի համար։
- **Ուղղում․** Եթե plan-ը ստուգվել է միայն base case-ին, ավելացրու երեք shock scenario-ները և ասա այն կոնկրետ պայմանը, որի տակ plan-ը կոտրվում է, և ինչ ես հետևում՝ գալը տեսնելու։
