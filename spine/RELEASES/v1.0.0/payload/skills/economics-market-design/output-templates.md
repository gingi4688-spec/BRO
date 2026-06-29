# Economics and Market Design output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every number traceable to a formula or a labeled assumption. Do not invent elasticities, prices, growth rates, or indicators.

### Template 1 — Pricing / elasticity memo

- **Decision to unblock:** (the exact price/fee move and the question it answers)
- **Segment(s):** (elasticity is local — name the segment this applies to)
- **Elasticity:** `%ΔQ / %ΔP` = ___ — measured (source) or assumed (label + range + why)
- **Objective function:** contribution margin × volume (not revenue alone); show before vs after
- **Behavioral correction:** which bias is in play (loss aversion / anchoring / default effect) and how it adjusts the prediction
- **Second-order effects:** liquidity, cross-side network effect, retention, multi-homing exposure
- **Options & tradeoffs:** (e.g. hold / partial move / full move) with the margin × volume for each
- **Test before rollout:** segment canary / holdout, guardrail metric, abort threshold
- **Recommendation:** the move, conditioned on the test
- **Owner / coordination:** committed rate decided with the finance owner (do not fix unilaterally)
- **Acceptance:** elasticity computed or labeled · decided on margin not revenue · behavioral + structure read · test named

### Template 2 — Mechanism / auction design spec

- **Allocation goal:** what is being allocated and the efficiency/revenue objective
- **Participants, information, payment:** who bids, what they know, how they pay
- **Rule:** first-price / second-price (Vickrey) / VCG / matching — and **why** (single vs multi-unit; efficiency vs simplicity)
- **Incentive-compatibility argument:** is truthful behavior dominant? show the shade-up/shade-down logic
- **Manipulation paths checked:** shading · collusion · sybils · fake scarcity · phantom-bid trust — and the guard for each
- **Reserve price & constraints:** opportunity-cost floor, identity verification, regulated boundaries (route to legal)
- **Revenue/efficiency note:** especially for VCG — flag low/non-monotone revenue and complexity
- **Acceptance:** truthful behavior is dominant or the shading is bounded · manipulation paths guarded · reserve set · regulated lines flagged

### Template 3 — Incentive / KPI audit

- **Rule under audit:** the KPI, payout, ranking, or commission scheme
- **What it rewards at the margin:** the literal behavior the metric pays for (not the intended goal)
- **Cheapest gaming paths:** enumerate the specific manipulations (e.g. churn-and-resell, cherry-picking, split-to-multiply) and the mechanism by which each beats honest work
- **Behavioral amplifier:** where loss aversion / anchoring / default effect makes the gaming worse than the rational prediction
- **Does gaming pay more than the real work?** yes/no, with the comparison
- **Redesign:** guardrail metric · cap the gameable lever · reward the hard work · pre-launch baseline (shadow period)
- **Goal–metric alignment check:** do the goal and the metric now move together?
- **Acceptance:** gaming paths enumerated · behavioral correction applied · guardrail added · safe to ship only when goal and metric move together

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն թիվ պահիր հետագծելի formula-ի կամ label-ված assumption-ի։ Մի՛ հորինիր elasticity, price, growth rate կամ indicator։

### Template 1 — Pricing / elasticity memo

- **Unblock անելի որոշումը․** (ճշգրիտ price/fee move-ը և հարցը, որին պատասխանում է)
- **Segment(ներ)․** (elasticity-ն local է — անվանի՛ր segment-ը, որին վերաբերում է)
- **Elasticity․** `%ΔQ / %ΔP` = ___ — չափված (source) կամ ենթադրված (label + range + ինչու)
- **Objective function․** contribution margin × volume (ոչ revenue alone). ցույց տուր առաջ ընդդեմ հետո
- **Behavioral ուղղում․** որ bias-ն է խաղում (loss aversion / anchoring / default effect) և ինչպես է ուղղում կանխատեսումը
- **Second-order effect-ներ․** liquidity, cross-side network effect, retention, multi-homing exposure
- **Option-ներ & tradeoff-ներ․** (օր.՝ hold / մասնակի move / լրիվ move) ամեն մեկի margin × volume-ով
- **Test մինչ rollout-ը․** segment canary / holdout, guardrail metric, abort threshold
- **Recommendation․** move-ը, պայմանավորված test-ով
- **Owner / համակարգում․** committed rate-ը որոշված finance-ի տիրոջ հետ (միակողմանի մի՛ ֆիքսիր)
- **Acceptance․** elasticity-ն հաշված կամ label-ված · որոշված margin-ով, ոչ revenue · behavioral + structure ընթերցում · test անվանված

### Template 2 — Mechanism / auction design spec

- **Allocation goal․** ինչ է allocate-վում և efficiency/revenue objective-ը
- **Participant-ներ, information, payment․** ով է bid անում, ինչ գիտի, ինչպես է վճարում
- **Rule․** first-price / second-price (Vickrey) / VCG / matching — և **ինչու** (single ընդդեմ multi-unit. efficiency ընդդեմ simplicity)
- **Incentive-compatibility փաստարկ․** truthful վարքը dominant է՞. ցույց տուր shade-up/shade-down տրամաբանությունը
- **Ստուգված manipulation path-եր․** shading · collusion · sybil · fake scarcity · phantom-bid trust — և guard-ը ամեն մեկի համար
- **Reserve price & constraint-ներ․** opportunity-cost floor, identity verification, regulated սահմաններ (ուղղորդիր legal)
- **Revenue/efficiency note․** հատկապես VCG-ի համար — flag արա ցածր/non-monotone revenue-ն և complexity-ն
- **Acceptance․** truthful վարքը dominant է կամ shading-ը bounded · manipulation path-երը guarded · reserve սահմանված · regulated գծերը flag-ված

### Template 3 — Incentive / KPI audit

- **Audit-վող rule․** KPI-ն, payout-ը, ranking-ը կամ commission scheme-ը
- **Ինչ է reward անում marginal-ում․** այն բառացի վարքը, որի համար metric-ը վճարում է (ոչ ի նկատի առած նպատակը)
- **Ամենաէժան gaming path-եր․** թվարկիր կոնկրետ manipulation-ները (օր.՝ churn-and-resell, cherry-picking, split-to-multiply) և mechanism-ը, թե ինչպես է ամեն մեկը հաղթում ազնիվ աշխատանքին
- **Behavioral amplifier․** որտեղ loss aversion / anchoring / default effect-ը gaming-ը ավելի վատ է դարձնում, քան rational կանխատեսումը
- **Gaming-ը ավելի՞ է վճարում, քան իրական աշխատանքը․** այո/ոչ, համեմատությամբ
- **Redesign․** guardrail metric · cap արա gameable lever-ը · reward արա դժվար աշխատանքը · pre-launch baseline (shadow period)
- **Goal–metric alignment ստուգում․** նպատակն ու metric-ը հիմա միասի՞ն են շարժվում
- **Acceptance․** gaming path-երը թվարկված · behavioral ուղղում կիրառված · guardrail ավելացված · ապահով է ship անել միայն, երբ նպատակն ու metric-ը միասին են շարժվում
