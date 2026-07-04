# Sales, Revenue, and Growth eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **ICP definition.** "Win rate is low and churn is high; we sell to anyone who'll buy." — Pass only if it reads low-win-rate + high-churn as a missing-ICP signal, writes a falsifiable ICP (firmographics + pain + trigger + **disqualifiers**), and validates it against won/churned accounts — not a generic "define your ICP."
2. **Funnel diagnostic.** "We're short of target; marketing wants budget for 20% more leads." — Pass only if it builds the funnel stage by stage with the arithmetic shown, sensitivity-tests each lever against the same effort, identifies the **binding stage**, and redirects effort there instead of accepting "more leads" when the bottleneck is below the top.
3. **MEDDICC qualification.** "A $120k deal is at commit; the buyer loves the demo." — Pass only if it scores MEDDICC on evidence, flags **no economic buyer / no decision process** as the binding gap, downgrades from commit, names single-threading risk, and gives a next step (not a higher number). Fail if enthusiasm is treated as a forecast signal.
4. **Pricing / discount.** "A competitor launched cheaper; should we drop our flat price to match, and discount to close deals faster?" — Pass only if it refuses the reflexive competitor-match, resets to a **value metric** and WTP, makes any discount a **trade with a defended floor**, and routes margin/LTV to finance. Fail if it just matches the competitor or discounts on reflex.
5. **NRR / expansion.** "We grew revenue 30% this year — are we healthy?" — Pass only if it decomposes the number into **net-new vs expansion**, asks for **NRR** and cohort retention, separates **logo churn from revenue churn**, and refuses to call a blended number healthy without the split.
6. **Sales motion.** "We sell a $40/month product with a 6-person field sales team and our CAC won't pay back. Why?" — Pass only if it names the **motion-model mismatch** (field sales on a self-serve price), prescribes self-serve / product-led for that price point, and ties the fix to CAC payback. Fail if it just says "sell harder."
7. **Growth loop.** "We added an invite button — is that a growth loop?" — Pass only if it tests the **reinvestment step** (output → new qualified input), requires saturation and abuse guards, and calls it a campaign if the loop does not close — not "yes, referrals are a loop."
8. **LTV on margin.** "Our LTV/CAC is 5x, so we should scale spend." — Pass only if it checks whether **LTV is on gross margin or revenue**, recomputes on gross margin if needed, and gates scaling on retention/PMF evidence before endorsing more spend.
9. **No invented benchmarks.** "What conversion rate should our funnel hit?" — Pass only if it refuses to invent an "industry average," asks for the user's segmented data, or gives a formula/placeholder and marks any market claim verify-before-use.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same numbers, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No thin framework-name answer.** Ask "just give me the SaaS growth playbook." — Pass only if it expands into mechanism, formula, or a worked micro-example, not a list of labels.
- **Finance routing.** Ask "what's our LTV and CAC payback?" — Pass only if it supplies the revenue/price inputs and routes the margin/payback computation to `finance-unit-economics`, not inventing the economics here.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **ICP-ի սահմանում.** «Win rate-ը ցածր է, churn-ը՝ բարձր. վաճառում ենք յուրաքանչյուրին, ով կգնի»։ — Անցնում է միայն, եթե ցածր-win-rate + բարձր-churn-ը կարդում է որպես missing-ICP signal, գրում է falsifiable ICP (firmographic + pain + trigger + **disqualifier**) և validate է անում won/churned account-ների դեմ — ոչ generic «սահմանիր ICP-դ»։
2. **Funnel-ի ախտորոշում.** «Target-ից պակաս ենք. marketing-ը budget է ուզում 20% ավելի lead-ի համար»։ — Անցնում է միայն, եթե funnel-ը կառուցում է stage-by-stage՝ arithmetic-ը ցույց տրված, sensitivity-test է անում ամեն լծակ նույն effort-ի դեմ, նշում է **binding stage**-ը և effort-ը ուղղում այնտեղ, «ավելի շատ lead» ընդունելու փոխարեն, երբ bottleneck-ը top-ից ներքև է։
3. **MEDDICC qualification.** «$120k deal-ը commit-ին է. գնորդը սիրում է demo-ն»։ — Անցնում է միայն, եթե MEDDICC-ը score է անում evidence-ով, flag է անում **ոչ economic buyer / ոչ decision process**-ը որպես binding gap, downgrade է անում commit-ից, անվանում single-threading ռիսկը և տալիս հաջորդ քայլ (ոչ ավելի բարձր թիվ)։ Fail՝ եթե ոգևորությունը forecast signal է համարվում։
4. **Pricing / discount.** «Մրցակիցը ավելի էժան launch արեց. match անե՞նք մեր flat գինը, և discount անե՞նք deal-երն ավելի արագ փակելու համար»։ — Անցնում է միայն, եթե մերժում է reflexive competitor-match-ը, reset է անում **value metric**-ի և WTP-ի, ամեն discount դարձնում է **trade՝ պաշտպանված floor-ով** և margin/LTV-ն ուղղորդում finance-ին։ Fail՝ եթե ուղղակի match է անում մրցակցին կամ reflex-ով discount է անում։
5. **NRR / expansion.** «Այս տարի revenue-ն 30% աճեց — առո՞ղջ ենք»։ — Անցնում է միայն, եթե decompose է անում թիվը **net-new ընդդեմ expansion**-ի, պահանջում է **NRR** և cohort retention, բաժանում է **logo churn-ը revenue churn-ից** և հրաժարվում blended թիվը առողջ կոչելուց առանց split-ի։
6. **Sales motion.** «Վաճառում ենք $40/ամիս product 6-հոգանոց field sales team-ով, և CAC-ը չի payback անում։ Ինչու՞»։ — Անցնում է միայն, եթե անվանում է **motion-model mismatch**-ը (field sales self-serve գնի վրա), նշանակում self-serve / product-led այդ գնի կետի համար և fix-ը կապում CAC payback-ին։ Fail՝ եթե ուղղակի ասում է «ավելի ուժեղ վաճառիր»։
7. **Growth loop.** «Ավելացրինք invite button — դա growth loop է՞»։ — Անցնում է միայն, եթե test է անում **reinvestment step**-ը (output → նոր qualified input), պահանջում saturation և abuse guard, և կոչում campaign, եթե loop-ը չի փակվում — ոչ «այո, referral-ները loop են»։
8. **LTV margin-ի վրա.** «Մեր LTV/CAC-ը 5x է, ուստի պետք է scale անենք spend-ը»։ — Անցնում է միայն, եթե ստուգում է՝ **LTV-ն gross margin-ի՞, թե revenue-ի վրա է**, վերահաշվում gross margin-ի վրա անհրաժեշտության դեպքում, և gate է անում scaling-ը retention/PMF evidence-ի վրա ավելի spend հաստատելուց առաջ։
9. **Ոչ հորինված benchmark.** «Ինչ conversion rate պետք է հատի մեր funnel-ը»։ — Անցնում է միայն, եթե հրաժարվում է «industry average» հորինելուց, պահանջում user-ի segment արված data-ն, կամ տալիս formula/placeholder և market claim-ը նշում verify-before-use։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն թվերը, նույն artifact-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ բարակ framework-name պատասխան.** Հարցրու «ուղղակի տուր SaaS growth playbook-ը»։ — Անցնում է միայն, եթե դառնում է mechanism, formula կամ worked micro-example, ոչ label-ների ցուցակ։
- **Finance routing.** Հարցրու «ինչ է մեր LTV-ն և CAC payback-ը»։ — Անցնում է միայն, եթե տալիս է revenue/price input-ները և margin/payback հաշվարկը ուղղորդում `finance-unit-economics`-ին, ոչ թե economics-ը այստեղ հորինում։
