# Sales, Revenue, and Growth worked examples

## English

### Example A — ICP definition

**Prompt.** Our win rate is 14% and 30% of new customers churn in the first year. The team says we sell to "any company that needs scheduling software." Fix this.

**Senior answer.** The symptom — low win rate and high first-year churn at once — is the classic signature of a missing ICP, not a sales-skill problem. "Any company that needs scheduling" is not an ICP; it is the absence of one, and it is importing bad-fit customers who are hard to close and quick to leave. Rebuild the ICP as something falsifiable:

- **Firmographics:** field-service businesses, 20–200 employees, with mobile technicians, in regions where same-day dispatch matters (not single-location shops, not enterprises with an existing FSM suite).
- **Specific pain:** double-booked technicians and missed appointment windows causing refunds and churn — a pain they already track and feel weekly.
- **Trigger:** they just lost a major account to a missed window, or they crossed ~20 technicians where a spreadsheet breaks.
- **Disqualifiers:** single-technician businesses (no scheduling conflict to solve), and enterprises locked into an FSM platform (displacement, not adoption).

Validate the ICP against the existing book: pull the 20 highest-LTV customers and the 20 who churned, and check whether the won-and-retained accounts fit the profile and the churned ones fail it. The expected finding is that churned accounts were mostly disqualifiers we sold to anyway. Then re-qualify the pipeline against the ICP, and expect win rate to rise (fewer bad-fit deals contaminating it) and first-year churn to fall (the new cohort actually has the pain). Next verification step: measure win rate and 90-day retention on ICP-qualified versus non-ICP leads over the next two quarters.

**Why this passes.** It reads low-win-rate-plus-high-churn as one signal (a missing ICP) instead of treating them as two unrelated problems, and it refuses the "sell to everyone" framing as the root cause. The ICP it writes is falsifiable — you can look at an account and say in or out — with the disqualifiers made explicit, which is the part teams skip. It validates against won and churned accounts rather than asserting the profile, and it ends with a measurable verification (win rate and retention on ICP-qualified vs not), so the fix can be proven, not just claimed.

### Example B — funnel diagnostic

**Prompt.** Pipeline target is $1M this year. Our current model is 5,000 MQLs, 12% MQL→SQL, 30% SQL→opportunity, 25% win, $18k ACV. Marketing wants budget to raise MQLs 20%. Is that the right move?

**Senior answer.** Build the funnel stage by stage first: 5,000 MQL × 12% = 600 SQL × 30% = 180 opportunities × 25% win = 45 wins × $18k ACV = **$810k bookings** — short of the $1M target by $190k. Now sensitivity-test each lever against the same effort, instead of accepting the lead-volume ask:

- **+20% MQLs** (the proposed move): 6,000 × 12% × 30% × 25% × $18k = **$972k**. Still under target, and it costs 20% more top-of-funnel spend.
- **MQL→SQL from 12% to 16%** (better qualification/nurture, same lead volume): 5,000 × 16% × 30% × 25% × $18k = **$1.08M**. Over target, with zero extra leads.
- **Win rate from 25% to 29%** (deal coaching, same volume): 180 × 29% × $18k = **$939.6k**.

The binding stage is qualification (MQL→SQL), not lead volume: four points there beats a 20% lead increase and clears the target outright. The recommendation is to invest in qualification/nurture before buying more MQLs, because more leads on the current conversion just scales the leak — and to confirm the new SQLs retain (a higher SQL rate that imports bad-fit leads would lift bookings and then bleed them back through churn). Assumption to label: the 12%/30%/25% rates are the user's current numbers, not benchmarks; segment them by channel before trusting the blend. Next verification step: split the funnel by channel and re-run the sensitivity per channel.

**Why this passes.** The forecast is computed and shown ($810k from the stage chain), not asserted, and the gap to target is stated. It sensitivity-tests each lever against the same effort, so the recommendation falls out of the arithmetic — four points of qualification ($1.08M) beats 20% more leads ($972k) — rather than from taste. It catches the trap of scaling a mid-funnel leak with more top-of-funnel volume, and it adds the retention guard (a higher SQL rate must not import bad-fit leads), which a pure conversion-math answer would miss. It labels the rates as the user's own numbers, not invented benchmarks, and routes to per-channel segmentation as the next step.

### Example C — pricing / packaging

**Prompt.** We charge a flat $99/month for everyone. Big customers and tiny customers pay the same, expansion revenue is flat, and a competitor just launched at $79. Should we drop to $79?

**Senior answer.** Dropping to $79 is a reflexive competitor-match that fixes nothing — the real problem is that a flat fee has no value metric, so the price does not scale with the value delivered and there is no expansion path. Reset to value-based packaging:

- **Pick a value metric that scales with the value the customer receives.** If the product's value grows with active seats, price per seat; if it grows with volume processed, price per unit of usage. Choose the metric the customer already uses to describe their own success, so the bill tracks the value they feel.
- **Tier by value, not by random features.** Good/Better/Best fenced by the value each unlocks (e.g. usage limits, advanced controls a larger buyer needs), so a small customer pays less and a large one pays more for more value — which is the expansion path the flat fee was missing.
- **Guard usage pricing against bill shock.** If usage-based, add spend caps or alerts so a customer is never surprised by the bill; an unpredictable bill churns even a happy user.
- **Handle the competitor as positioning, not price.** A $79 competitor is a reason to articulate the value gap, not to reset your reference price down for the whole base; reflexive discounting trains the market to wait.

Before committing any number, reconcile the economics with finance: gross margin per tier, LTV on gross margin (not revenue), and CAC payback. That reconciliation owns the margin; this memo owns the price logic and the value metric. Assumption to label: that value scales with seats or usage is a hypothesis — validate it with willingness-to-pay interviews or a pricing test on a segment before a full rollout. Next verification step: run the new packaging on one segment and measure expansion (NRR) against the flat-fee cohort.

**Why this passes.** It refuses the reflexive competitor-match and names the actual defect — a flat fee with no value metric and therefore no expansion path. The fix is value-based: a metric that scales with delivered value, tiers fenced by value rather than hostage features, and an explicit bill-shock guard for usage pricing. It routes the economics (margin, LTV on gross margin, CAC payback) to finance and keeps the price logic here, which is the correct split. It labels the value-scaling claim as a hypothesis to test, not a fact, and ends with a measurable rollout (NRR on the new packaging vs the flat-fee cohort).

### Example D — MEDDICC deal review

**Prompt.** A rep has a $120k deal at "commit" for this quarter. The buyer loves the demo and the champion is excited. Should we forecast it as commit?

**Senior answer.** Enthusiasm is not a forecast signal; score the deal on MEDDICC hard signals before trusting "commit":

- **Metrics:** is the value quantified (e.g. hours saved, revenue recovered), or is it "they love it"? A loved demo with no quantified metric has no business case to defend internally.
- **Economic buyer:** has the champion introduced the person who can actually approve $120k of spend? If the rep has never spoken to the economic buyer, this is the single biggest risk.
- **Decision criteria / process:** what are the buyer's stated criteria, and what is the path to signature (legal, security review, procurement, budget cycle)? An unknown decision process means an unknown close date.
- **Identified pain + champion + competition:** is the pain urgent and tied to a critical event, does the champion have real influence and access, and is the competitive alternative (including "do nothing") understood?

The likely verdict: with a strong demo and champion but no confirmed economic buyer and no mapped decision process, this is **not a commit** — it is best-case at most, and the next step is not a higher forecast but getting the champion to introduce the economic buyer and mapping the procurement path. Single-threading on one excited champion is the failure mode here: if the champion leaves or loses influence, the deal evaporates, so build a second relationship. Next verification step: re-score MEDDICC after the economic-buyer meeting and a written decision timeline; only then consider commit.

**Why this passes.** It separates the buyer's enthusiasm from the deal's forecastability and scores the named MEDDICC fields on evidence rather than rep confidence. It isolates the two binding gaps — no economic buyer and no decision process — and refuses to call the deal commit until they close, downgrading to best-case with a concrete next step (the economic-buyer introduction) instead of a number. It names single-threading as the live risk and prescribes multi-threading, and it ends with a re-score gate after the missing evidence is gathered, so the forecast is earned, not asserted.

## Հայերեն

### Օրինակ A — ICP-ի սահմանում

**Prompt.** Մեր win rate-ը 14% է, և նոր հաճախորդների 30%-ը churn է անում առաջին տարում։ Թիմն ասում է, որ վաճառում ենք «ցանկացած ընկերության, որին scheduling software է պետք»։ Ուղղի՛ր սա։

**Senior պատասխան.** Symptom-ը — ցածր win rate և բարձր առաջին-տարվա churn միաժամանակ — բացակայող ICP-ի դասական ստորագրությունն է, ոչ sales-skill-ի խնդիր։ «Ցանկացած ընկերություն, որին scheduling է պետք» ICP չէ. դա ICP-ի բացակայությունն է, և այն ներմուծում է bad-fit հաճախորդներ, որոնց դժվար է close անել և արագ հեռանում են։ Վերակառուցիր ICP-ն որպես falsifiable բան․

- **Firmographic․** field-service բիզնեսներ, 20–200 աշխատակից, mobile technician-ներով, այն տարածաշրջաններում, որտեղ same-day dispatch-ը կարևոր է (ոչ single-location խանութներ, ոչ enterprise-ներ արդեն գոյություն ունեցող FSM suite-ով)։
- **Կոնկրետ pain․** double-booked technician-ներ և բաց թողնված appointment window-ներ, որ refund և churn են առաջացնում — pain, որ նրանք արդեն հետևում և շաբաթական զգում են։
- **Trigger․** նրանք հենց նոր կորցրին մեծ account՝ բաց թողնված window-ի պատճառով, կամ անցան ~20 technician-ը, որտեղ spreadsheet-ը կոտրվում է։
- **Disqualifier-ներ․** single-technician բիզնեսներ (լուծելու scheduling conflict չկա) և enterprise-ներ, որ կողպված են FSM platform-ում (displacement, ոչ adoption)։

Validate արա ICP-ն եղած book-ի դեմ․ հանիր 20 ամենաբարձր-LTV հաճախորդին և 20-ը, որ churn արեցին, և ստուգիր՝ won-and-retained account-ները fit են profile-ին, իսկ churned-ները fail են անո՞ւմ։ Սպասվող finding-ն այն է, որ churned account-ները հիմնականում disqualifier-ներ էին, որոնց միևնույն է վաճառեցինք։ Հետո վերա-qualify արա pipeline-ը ICP-ի դեմ, և սպասիր, որ win rate-ը բարձրանա (ավելի քիչ bad-fit deal, որ աղտոտում է այն) և առաջին-տարվա churn-ը ընկնի (նոր cohort-ն իրականում ունի pain-ը)։ Հաջորդ verification step․ չափիր win rate-ը և 90-օրյա retention-ը ICP-qualified ընդդեմ non-ICP lead-երի վրա հաջորդ երկու եռամսյակում։

**Ինչու է անցնում gate-ը.** Այն ցածր-win-rate-գումարած-բարձր-churn-ը կարդում է որպես մեկ signal (բացակայող ICP), ոչ թե երկու անկապ խնդիր, և մերժում է «բոլորին վաճառել» framing-ը որպես արմատային պատճառ։ Գրած ICP-ն falsifiable է — կարող ես account նայել և ասել՝ ներսում, թե դուրս — disqualifier-ները բացահայտ դարձված, ինչը այն մասն է, որ թիմերը բաց են թողնում։ Այն validate է անում won և churned account-ների դեմ, ոչ թե պնդում profile-ը, և ավարտվում է չափելի verification-ով (win rate և retention ICP-qualified ընդդեմ ոչ), ուստի fix-ը կարելի է ապացուցել, ոչ միայն պնդել։

### Օրինակ B — funnel-ի ախտորոշում

**Prompt.** Pipeline target-ը այս տարի $1M է։ Մեր current model-ը՝ 5,000 MQL, 12% MQL→SQL, 30% SQL→opportunity, 25% win, $18k ACV։ Marketing-ը budget է ուզում MQL-ները 20% բարձրացնելու համար։ Դա ճի՞շտ քայլ է։

**Senior պատասխան.** Նախ կառուցիր funnel-ը stage-by-stage․ 5,000 MQL × 12% = 600 SQL × 30% = 180 opportunity × 25% win = 45 win × $18k ACV = **$810k bookings** — target-ից պակաս $190k-ով։ Հիմա sensitivity-test արա ամեն լծակ նույն effort-ի դեմ, lead-volume ask-ը ընդունելու փոխարեն․

- **+20% MQL** (առաջարկվող քայլը)․ 6,000 × 12% × 30% × 25% × $18k = **$972k**։ Դեռ target-ից ցածր, և արժե 20% ավելի top-of-funnel spend։
- **MQL→SQL 12%-ից 16%** (ավելի լավ qualification/nurture, նույն lead volume)․ 5,000 × 16% × 30% × 25% × $18k = **$1.08M**։ Target-ից վեր, զրո ավելի lead-ով։
- **Win rate 25%-ից 29%** (deal coaching, նույն volume)․ 180 × 29% × $18k = **$939.6k**։

Binding stage-ը qualification-ն է (MQL→SQL), ոչ lead volume-ը․ այնտեղ չորս point-ը հաղթում է 20% lead-ի ավելացմանը և ուղիղ մաքրում target-ը։ Recommendation-ը՝ ներդրիր qualification/nurture-ում նախքան ավելի շատ MQL գնելը, որովհետև ավելի շատ lead ընթացիկ conversion-ի վրա ուղղակի scale է անում արտահոսքը — և հաստատիր, որ նոր SQL-ները retain են անում (ավելի բարձր SQL rate, որ bad-fit lead է ներմուծում, կբարձրացնի bookings-ը, հետո հետ կարտահոսի churn-ով)։ Label անելու assumption․ 12%/30%/25% rate-երը user-ի ընթացիկ թվերն են, ոչ benchmark. segment արա channel-ով նախքան blend-ին վստահելը։ Հաջորդ verification step․ բաժանիր funnel-ը channel-ով և վերագործարկիր sensitivity-ն ըստ channel-ի։

**Ինչու է անցնում gate-ը.** Forecast-ը հաշված ու ցույց տրված է ($810k՝ stage շղթայից), ոչ պնդված, և target-ի gap-ը նշված է։ Այն sensitivity-test է անում ամեն լծակ նույն effort-ի դեմ, ուստի recommendation-ը բխում է arithmetic-ից — qualification-ի չորս point-ը ($1.08M) հաղթում է 20% ավելի lead-ին ($972k) — ոչ ճաշակից։ Այն բռնում է mid-funnel արտահոսքը ավելի շատ top-of-funnel volume-ով scale անելու trap-ը, և ավելացնում retention guard-ը (ավելի բարձր SQL rate-ը չպետք է bad-fit lead ներմուծի), որ զուտ conversion-math պատասխանը բաց կթողներ։ Այն label է անում rate-երը որպես user-ի սեփական թվեր, ոչ հորինված benchmark, և ուղղորդում per-channel segmentation-ին որպես հաջորդ քայլ։

### Օրինակ C — pricing / packaging

**Prompt.** Մենք գանձում ենք flat $99/ամիս բոլորից։ Մեծ և փոքր հաճախորդները նույնն են վճարում, expansion revenue-ն հարթ է, և մրցակիցը հենց նոր launch արեց $79-ով։ Իջնե՞նք $79-ի։

**Senior պատասխան.** $79-ի իջնելը reflexive competitor-match է, որ ոչինչ չի ուղղում — իրական խնդիրն այն է, որ flat fee-ն value metric չունի, ուստի գինը չի scale անում delivered value-ի հետ, և expansion path չկա։ Reset արա value-based packaging-ի․

- **Ընտրիր value metric, որ scale է անում հաճախորդի ստացած value-ի հետ։** Եթե product-ի value-ն աճում է active seat-երով, գին դիր per seat. եթե աճում է մշակված volume-ով, գին դիր per unit usage։ Ընտրիր այն metric-ը, որ հաճախորդն արդեն օգտագործում է իր success-ը նկարագրելու համար, որ bill-ը հետևի այն value-ին, որ նա զգում է։
- **Tier արա value-ով, ոչ random feature-ով։** Good/Better/Best fenced այն value-ով, որ ամենը unlock է անում (օր.՝ usage limit-ներ, advanced control-ներ, որ ավելի մեծ գնորդին պետք են), որ փոքր հաճախորդը քիչ վճարի, մեծը՝ ավելի շատ ավելի շատ value-ի համար — ինչը հենց այն expansion path-ն է, որ flat fee-ին պակասում էր։
- **Usage pricing-ը պաշտպանիր bill shock-ից։** Եթե usage-based է, ավելացրու spend cap կամ alert, որ հաճախորդը bill-ից երբեք չզարմանա. անկանխատեսելի bill-ը churn է անում նույնիսկ գոհ user-ին։
- **Մրցակցին վերաբերվիր որպես positioning, ոչ գին։** $79 մրցակիցը value gap-ն արտահայտելու պատճառ է, ոչ քո reference price-ը ողջ base-ի համար ներքև reset անելու. reflexive discounting-ը շուկային սովորեցնում է սպասել։

Որևէ թիվ commit անելուց առաջ հաշտեցրու economics-ը finance-ի հետ․ gross margin ըստ tier-ի, LTV gross margin-ի վրա (ոչ revenue), և CAC payback։ Այդ reconciliation-ը տիրում է margin-ին. այս memo-ն տիրում է գնի տրամաբանությանը և value metric-ին։ Label անելու assumption․ որ value-ն scale է անում seat-ով կամ usage-ով, հիպոթեզ է — validate արա այն willingness-to-pay հարցազրույցներով կամ segment-ի վրա pricing test-ով նախքան լրիվ rollout-ը։ Հաջորդ verification step․ գործարկիր նոր packaging-ը մեկ segment-ի վրա և չափիր expansion-ը (NRR) flat-fee cohort-ի դեմ։

**Ինչու է անցնում gate-ը.** Այն մերժում է reflexive competitor-match-ը և անվանում իրական defect-ը — flat fee՝ առանց value metric-ի, ուստի առանց expansion path-ի։ Fix-ը value-based է․ metric, որ scale է անում delivered value-ի հետ, tier-եր fenced value-ով, ոչ պատանդ feature-ով, և բացահայտ bill-shock guard usage pricing-ի համար։ Այն economics-ը (margin, LTV gross margin-ի վրա, CAC payback) ուղղորդում է finance-ին և գնի տրամաբանությունը պահում այստեղ, ինչը ճիշտ բաժանումն է։ Այն label է անում value-scaling պնդումը որպես test անելու հիպոթեզ, ոչ փաստ, և ավարտվում չափելի rollout-ով (NRR՝ նոր packaging-ի ընդդեմ flat-fee cohort-ի)։

### Օրինակ D — MEDDICC deal review

**Prompt.** Rep-ն ունի $120k deal «commit»-ին այս եռամսյակի համար։ Գնորդը սիրում է demo-ն, և champion-ը ոգևորված է։ Forecast անե՞նք այն որպես commit։

**Senior պատասխան.** Ոգևորությունը forecast signal չէ. score արա deal-ը MEDDICC hard signal-ներով նախքան «commit»-ին վստահելը․

- **Metrics․** value-ն քանակացվա՞ծ է (օր.՝ խնայված ժամեր, վերականգնված revenue), թե «սիրում են»։ Սիրված demo՝ առանց քանակացված metric-ի, ներքին պաշտպանելու business case չունի։
- **Economic buyer․** champion-ը ներկայացրե՞լ է այն մարդուն, ով իրականում կարող է approve անել $120k spend։ Եթե rep-ը երբեք չի խոսել economic buyer-ի հետ, սա ամենամեծ ռիսկն է։
- **Decision criteria / process․** որո՞նք են գնորդի նշված criteria-ները, և ո՞րն է ստորագրության path-ը (legal, security review, procurement, budget cycle)։ Անհայտ decision process-ը նշանակում է անհայտ close date։
- **Identified pain + champion + competition․** pain-ը urgent է և կապված critical event-ի՞, champion-ն իրական influence և access ունի՞, և մրցակցային այլընտրանքը (ներառյալ «ոչինչ չանել») հասկացվա՞ծ է։

Հավանական վճիռը․ ուժեղ demo-ով և champion-ով, բայց առանց հաստատված economic buyer-ի և քարտեզված decision process-ի, սա **commit չէ** — առավելագույնը best-case է, և հաջորդ քայլը ոչ թե ավելի բարձր forecast է, այլ champion-ին ստիպելը ներկայացնել economic buyer-ին և procurement path-ը քարտեզելը։ Single-threading մեկ ոգևորված champion-ի վրա այստեղ failure mode-ն է․ եթե champion-ը հեռանա կամ influence կորցնի, deal-ը գոլորշիանում է, ուստի կառուցիր երկրորդ հարաբերություն։ Հաջորդ verification step․ վերա-score արա MEDDICC-ը economic-buyer-ի հանդիպումից և գրավոր decision timeline-ից հետո. միայն այդ ժամանակ դիտարկիր commit։

**Ինչու է անցնում gate-ը.** Այն բաժանում է գնորդի ոգևորությունը deal-ի forecastability-ից և score է անում անվանված MEDDICC field-երը evidence-ով, ոչ rep confidence-ով։ Այն առանձնացնում է երկու binding gap-ը — ոչ economic buyer, ոչ decision process — և հրաժարվում deal-ը commit կոչելուց, մինչև դրանք փակվեն, downgrade անելով best-case-ի՝ կոնկրետ հաջորդ քայլով (economic-buyer-ի ներկայացում), ոչ թվով։ Այն single-threading-ը անվանում է որպես կենդանի ռիսկ և նշանակում multi-threading, և ավարտվում re-score gate-ով՝ բացակայող evidence-ը հավաքելուց հետո, ուստի forecast-ը վաստակված է, ոչ պնդված։
