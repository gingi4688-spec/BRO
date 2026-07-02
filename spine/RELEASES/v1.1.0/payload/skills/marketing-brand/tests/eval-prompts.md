# Marketing and Brand eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Positioning brief.** "Write a positioning brief for a B2B workflow tool." — Pass only if it produces the **five Dunford components** (competitive alternatives, unique attributes, value, target-market characteristics, category), names a real alternative the buyer actually weighs, attaches a proof per claim, and keeps "why now" out of the positioning.
2. **"Why now" trap.** "Our positioning is: now that AI is everywhere, you need us." — Pass only if it flags that "why now" is a sales-narrative element, not a positioning component, and rebuilds the position on the five components.
3. **Channel economics.** "Is this paid channel worth scaling?" — Pass only if it models the full funnel to contribution margin, computes CAC, and decides on **LTV:CAC and payback by cohort**, not on CTR/impressions; fail if it judges on clicks or omits LTV.
4. **Demand-gen plan.** "Build a demand-gen plan for a $12k-ACV product." — Pass only if it uses a **funnel-stage × intent matrix** (TOFU/MOFU/BOFU × intent, incl. SEO/answer-engine), maps lifecycle/email with sequences, and matches the motion (broad demand / PLG, not ABM) to the ACV.
5. **Message testing.** "Pick our winning headline." — Pass only if it tests **comprehension before preference** (can buyers repeat the promise/proof?) and refuses to scale spend on a liked-but-misread message.
6. **Attribution model.** "This channel drives the most conversions — double its budget." — Pass only if it names the model class (likely last-touch) and its blind spot, and requires an **incrementality** baseline before scaling, distinguishing demand-creation from demand-harvesting.
7. **MMM vs MTA vs incrementality.** "How should we measure marketing across channels with cookie loss?" — Pass only if it distinguishes multi-touch (degrades under privacy loss), MMM (top-down, allocation, privacy-robust), and incrementality (causal truth), and triangulates rather than picking one as truth.
8. **Brand architecture.** "We acquired a company — keep its name or fold it in?" — Pass only if it decides by **buyer overlap and trust transfer** (plus portfolio clarity and migration risk), not by which name sounds better.
9. **ABM vs broad demand.** "We sell six-figure deals to 200 named accounts — what's the GTM?" — Pass only if it chooses **ABM** (1:1/1:few, account engagement and pipeline-per-account), and would not run a long-tail broad-paid motion on this deal profile.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same five components, same funnel math, same model classes), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for "the average CAC for SaaS" or "the typical conversion rate". — Pass only if it refuses to invent the number and gives a funnel formula or a verify-before-use placeholder with a source requirement.
- **No thin framework-name answer.** Ask "just give me the marketing best practices." — Pass only if it expands into a mechanism (the five components, funnel math, comprehension-before-preference, a model taxonomy), not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Positioning brief.** «Գրիր positioning brief B2B workflow tool-ի համար»։ — Անցնում է միայն, եթե արտադրում է **Dunford-ի հինգ բաղադրիչը** (competitive alternatives, unique attributes, value, target-market characteristics, category), անվանում է իրական alternative, որ buyer-ն իրականում կշռում է, կցում proof ամեն claim-ին և «why now»-ը positioning-ից դուրս է պահում։
2. **«Why now» trap.** «Մեր positioning-ը՝ հիմա, երբ AI-ն ամենուր է, մեզ պետք ունես»։ — Անցնում է միայն, եթե flag է անում, որ «why now»-ը sales-narrative element է, ոչ positioning-ի բաղադրիչ, և դիրքը վերակառուցում հինգ բաղադրիչի վրա։
3. **Channel economics.** «Արժե՞ այս paid channel-ը scale անել»։ — Անցնում է միայն, եթե model է անում full funnel-ը մինչև contribution margin, հաշվում CAC-ը և որոշում **LTV:CAC-ով և payback-ով ըստ cohort-ի**, ոչ CTR/impression-ով. fail՝ եթե click-ով է դատում կամ LTV-ն բաց է թողնում։
4. **Demand-gen plan.** «Կառուցիր demand-gen plan $12k-ACV product-ի համար»։ — Անցնում է միայն, եթե օգտագործում է **funnel-stage × intent matrix** (TOFU/MOFU/BOFU × intent, ներառյալ SEO/answer-engine), map է անում lifecycle/email-ը sequence-ներով և համապատասխանեցնում motion-ը (broad demand / PLG, ոչ ABM) ACV-ին։
5. **Message testing.** «Ընտրիր մեր winning headline-ը»։ — Անցնում է միայն, եթե test է անում **comprehension-ը preference-ից առաջ** (կարո՞ղ է buyer-ը կրկնել promise/proof-ը) և հրաժարվում է spend scale անելուց հավանված-բայց-misread message-ի վրա։
6. **Attribution model.** «Այս channel-ը ամենաշատ conversion է բերում — կրկնապատկիր budget-ը»։ — Անցնում է միայն, եթե անվանում է model-ի դասը (հավանաբար last-touch) և նրա կույր կետը, և պահանջում **incrementality** baseline scale-ից առաջ՝ տարբերելով demand-creation-ը demand-harvesting-ից։
7. **MMM ընդդեմ MTA ընդդեմ incrementality.** «Ոնց չափենք marketing-ը channel-ների միջև cookie-ի կորստով»։ — Անցնում է միայն, եթե տարբերում է multi-touch-ը (վատանում privacy-ի կորստի տակ), MMM-ը (top-down, allocation, privacy-robust) և incrementality-ն (causal ճշմարտություն), և triangulate է անում՝ ոչ մեկը որպես ճշմարտություն ընտրելու փոխարեն։
8. **Brand architecture.** «Ընկերություն ձեռք բերեցինք — պահե՞նք name-ը, թե միացնենք»։ — Անցնում է միայն, եթե որոշում է **buyer overlap-ով և trust transfer-ով** (plus portfolio clarity և migration risk), ոչ նրանով, թե որ name-ն է ավելի լավ հնչում։
9. **ABM ընդդեմ broad demand.** «Վեցանիշ deal ենք վաճառում 200 named account-ի — ինչ է GTM-ը»։ — Անցնում է միայն, եթե ընտրում է **ABM** (1:1/1:few, account engagement և pipeline-per-account) և չէր վարի long-tail broad-paid motion այս deal profile-ի վրա։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն հինգ բաղադրիչը, նույն funnel math-ը, նույն model դասերը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու «SaaS-ի միջին CAC-ը» կամ «տիպիկ conversion rate-ը»։ — Անցնում է միայն, եթե հրաժարվում է թիվը հորինելուց և տալիս funnel formula կամ verify-before-use placeholder՝ source-ի պահանջով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես տուր marketing-ի best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism (հինգ բաղադրիչ, funnel math, comprehension-preference-ից-առաջ, model-ի taxonomy), ոչ label-ների ցուցակ։
