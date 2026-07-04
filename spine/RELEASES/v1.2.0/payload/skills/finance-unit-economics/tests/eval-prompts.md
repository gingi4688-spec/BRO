# Finance and Unit Economics eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Contribution margin & markup base.** "We sell at a 50% markup on a $200 cost — what's our margin?" — Pass only if it distinguishes markup (over cost) from margin (over price): price $300, margin = 100/300 = 33%, not 50%; fail if it reports 50% as the margin.
2. **CAC payback & LTV.** "ARPA $400, 80% gross margin, $60 variable cost, CAC $2,400, 3% monthly churn — is this healthy?" — Pass only if CM = $260, payback = 9.2 months from `CAC ÷ CM`, LTV on contribution margin (≈ $8,667 from `CM ÷ churn`), LTV:CAC ≈ 3.6, **and** the when-not caveats (pre-PMF, cohort skew, expansion) appear.
3. **Paid vs blended CAC.** "Our LTV:CAC is 3.6 on blended CAC, and 60% of signups are organic — should we scale paid?" — Pass only if it isolates **paid** CAC, recomputes payback/LTV:CAC on it, and bases the scale decision on paid-channel economics, not the blend; fail if it scales on the blended ratio.
4. **`1/churn` LTV trap.** "LTV is just revenue ÷ churn, right?" — Pass only if it rejects `1/churn` on revenue: uses contribution margin, caps the horizon, applies a survival curve where cohorts differ, and discounts long lifetimes; fail if it endorses revenue ÷ churn.
5. **EBITDA vs FCF.** "We're EBITDA-positive, so we fund our own growth — agree?" — Pass only if it builds the EBITDA → FCF bridge (cash taxes, capex, ΔWC), shows the gap, and declines to equate EBITDA with cash; fail if it agrees without the bridge.
6. **Revenue recognition / cash timing.** "A customer prepaid $1,200 for a year — that's $1,200 revenue this month, right?" — Pass only if it recognizes $100/month over 12 months, books an $1,100 deferred-revenue liability, and separates cash-in from revenue-earned; fail if it books $1,200 of revenue now.
7. **Bottom-up vs top-down.** "Our forecast: we'll take 1% of a $10B market = $100M." — Pass only if it rejects the top-down share as a model, requires a bottom-up driver chain (units × price × conversion × capacity), and keeps the market size as a sanity ceiling only.
8. **3-statement tie.** "Build a one-period 3-statement model and confirm it ties." — Pass only if net income flows to retained earnings, the cash-flow statement reconciles net income to the closing balance-sheet cash, assets = liabilities + equity holds, and the arithmetic is internally consistent.
9. **Valuation + dilution.** "Value our SaaS (ARR, comps, FCF given) and show our dilution on a $4M raise at $16M pre." — Pass only if it names the method(s), bridges **EV → equity via net debt**, discloses the **terminal-value share** of any DCF, and shows dilution (investor 20%, price/share, founder 80%, pool-shuffle effect) on a fully-diluted base.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same numbers, same mechanism, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English (EBITDA, DCF, ARR, WACC, CAC) are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for "the typical EV/ARR multiple" or "a normal SaaS churn rate" as a fact. — Pass only if it refuses to assert a number, marks it verify-before-use, or gives a formula/placeholder instead of inventing a benchmark.
- **No thin framework-name answer.** Ask "just tell me the unit-economics best practices." — Pass only if it expands into mechanism, formula, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Contribution margin & markup base.** «Վաճառում ենք $200 cost-ի վրա 50% markup-ով — margin-ը ո՞րն է»։ — Անցնում է միայն, եթե տարբերակում է markup-ը (cost-ի վրա) margin-ից (գնի վրա)․ price $300, margin = 100/300 = 33%, ոչ 50%. fail՝ եթե 50%-ը հաղորդում է որպես margin։
2. **CAC payback & LTV.** «ARPA $400, 80% gross margin, $60 variable cost, CAC $2,400, 3% monthly churn — առո՞ղջ է»։ — Անցնում է միայն, եթե CM = $260, payback = 9.2 ամիս `CAC ÷ CM`-ից, LTV contribution margin-ի վրա (≈ $8,667 `CM ÷ churn`-ից), LTV:CAC ≈ 3.6, **և** when-not caveat-երը (pre-PMF, cohort skew, expansion) կան։
3. **Paid ընդդեմ blended CAC.** «Մեր LTV:CAC-ը 3.6 է blended CAC-ով, և signup-ների 60%-ը organic է — paid-ը scale անե՞նք»։ — Անցնում է միայն, եթե առանձնացնում է **paid** CAC-ը, վերահաշվում payback/LTV:CAC-ը նրա վրա, և scale որոշումը հիմնում paid-channel economics-ի վրա, ոչ blend-ի. fail՝ եթե scale է անում blended ratio-ի վրա։
4. **`1/churn` LTV trap.** «LTV-ն պարզապես revenue ÷ churn է, չէ՞»։ — Անցնում է միայն, եթե մերժում է `1/churn`-ը revenue-ի վրա․ օգտագործում է contribution margin, սահմանափակում horizon-ը, կիրառում survival curve cohort-ների տարբերության դեպքում, և երկար lifetime-ները discount է անում. fail՝ եթե հաստատում է revenue ÷ churn-ը։
5. **EBITDA ընդդեմ FCF.** «EBITDA-positive ենք, ուրեմն ինքներս ենք ֆինանսավորում մեր growth-ը — համաձա՞յն ես»։ — Անցնում է միայն, եթե կառուցում է EBITDA → FCF bridge-ը (cash taxes, capex, ΔWC), ցույց տալիս gap-ը, և հրաժարվում EBITDA-ն cash-ի հետ հավասարեցնելուց. fail՝ եթե համաձայնում է առանց bridge-ի։
6. **Revenue recognition / cash timing.** «Customer-ը prepay արեց $1,200 մեկ տարվա համար — դա $1,200 revenue է այս ամիս, չէ՞»։ — Անցնում է միայն, եթե ճանաչում է $100/ամիս 12 ամսում, գրանցում $1,100 deferred-revenue պարտավորություն, և բաժանում cash-in-ը revenue-earned-ից. fail՝ եթե $1,200 revenue գրանցում հիմա։
7. **Bottom-up ընդդեմ top-down.** «Մեր forecast-ը՝ $10B market-ի 1%-ը = $100M»։ — Անցնում է միայն, եթե մերժում է top-down share-ը որպես model, պահանջում bottom-up driver chain (units × price × conversion × capacity), և market size-ը պահում միայն որպես sanity ceiling։
8. **3-statement tie.** «Կառուցիր մեկ-period 3-statement model և հաստատիր, որ կապվում է»։ — Անցնում է միայն, եթե net income-ը գնում է retained earnings, cash-flow statement-ը հաշտեցնում է net income-ը փակվող balance-sheet cash-ի հետ, assets = liabilities + equity պահվում է, և arithmetic-ը ներքին հետևողական է։
9. **Valuation + dilution.** «Գնահատիր մեր SaaS-ը (ARR, comps, FCF տրված) և ցույց տուր dilution-ը $4M raise-ի դեպքում $16M pre-ով»։ — Անցնում է միայն, եթե անվանում է method(ներ)ը, bridge է անում **EV → equity net debt-ով**, բացահայտում ցանկացած DCF-ի **terminal-value share**-ը, և ցույց տալիս dilution-ը (investor 20%, price/share, founder 80%, pool-shuffle effect) fully-diluted base-ի վրա։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն թվերը, նույն mechanism-ը, նույն artifact-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները (EBITDA, DCF, ARR, WACC, CAC) նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու «տիպիկ EV/ARR multiple-ը» կամ «նորմալ SaaS churn rate-ը» որպես fact։ — Անցնում է միայն, եթե հրաժարվում է թիվ պնդելուց, նշում verify-before-use, կամ տալիս formula/placeholder՝ benchmark հորինելու փոխարեն։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա unit-economics best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, formula կամ worked micro-example, ոչ label-ների ցուցակ։
