# Data Science and Analytics worked examples

## English

### Example A — experiment readout (A/B with peeking and multiplicity)

**Prompt.** A checkout A/B test has 12,000 users per arm. Control conversion is 10.0%; treatment is 10.8%. The PM looked at the dashboard daily and wants to ship because "it crossed p<0.05 on day 3." The business only cares about a lift of ≥1.0 percentage point. There are also four secondary metrics being watched. Write the readout.

**Senior answer.** The observed lift is 10.8% − 10.0% = **0.8 percentage points**. The large-sample standard error of the difference is `sqrt(0.10·0.90/12000 + 0.108·0.892/12000) ≈ 0.00394`, so the 95% CI on the lift is `0.008 ± 1.96·0.00394 = [0.0003, 0.0157]`, i.e. **[+0.03, +1.57] points**. Read this as coverage: a procedure built this way captures the true lift in ~95% of repeated samples — it is *not* a 95% probability that the true lift lies in this one interval. The interval barely clears zero, so the effect is statistically distinguishable from zero but its lower bound (+0.03 pts) sits far below the **1.0-point decision threshold**; the data does not yet license a ship on the business criterion.

Two integrity problems gate this readout. (1) **Peeking.** "It crossed p<0.05 on day 3" from daily dashboard looks is optional stopping — with repeated looks at fixed α=0.05 the real false-positive rate is well above 5%, so that crossing is not a valid stop. It needed a pre-declared sequential plan (alpha-spending — O'Brien–Fleming or Pocock — or an always-valid p-value); absent that, re-evaluate only at the planned N. (2) **Multiplicity.** With the primary plus four secondaries, that is a family of metrics; a "significant" secondary must be corrected (Holm for FWER, or Benjamini–Hochberg for FDR) and the family stated, or it is a false winner.

Decision: **do not ship on this readout.** The point estimate is promising but the CI's lower bound is below the 1.0-point threshold and the significance is contaminated by peeking. Run to the pre-registered N with a valid stopping rule; if the lift holds with a lower CI bound above 1.0 point and guardrails clean, ship — otherwise it is *inconclusive at the powered MDE*, not "no effect."

**Why this passes.** Every number is derived, not asserted: 0.8 pts from the two rates, SE 0.00394 from the binomial-difference formula, and the CI [+0.03, +1.57] from `estimate ± 1.96·SE` — all shown. The CI is stated as **coverage of the procedure**, explicitly refusing the "95% probability about this interval" misreading. It separates statistical significance (barely clears zero) from the **business decision threshold** (1.0 point), so a significant-but-too-small effect is correctly a non-ship. It catches the two failure modes the prompt baited — **peeking** (names optional stopping and the valid sequential fixes) and **multiplicity** (names the family and Holm/BH) — and refuses to call an underpowered/contaminated result either a win or "no effect," landing on "run to N, then decide," which is the honest move.

### Example B — causal / observational diagnosis (difference-in-differences with a confounder check)

**Prompt.** A company launched a loyalty program in Region A but not Region B. Monthly revenue per user in Region A rose from $100 to $118 after launch; in Region B it rose from $100 to $110 over the same period. Leadership wants to credit the program with **+$18 per user**. Is that right? What is the defensible causal estimate?

**Senior answer.** The claim "+$18" is the **before→after change in the treated region only**, which conflates the program with everything else that moved revenue that period (seasonality, a price change, macro demand). Region B is a control that absorbed those common shocks: it rose **+$10** with no program. The **difference-in-differences (DiD)** estimate nets the common trend out:

`DiD = (A_after − A_before) − (B_after − B_before) = (118 − 100) − (110 − 100) = 18 − 10 = +$8 per user.`

So the defensible causal effect is **about +$8 per user**, not +$18 — the naive figure over-credits the program by more than 2×. This estimate rests on the **parallel-trends assumption**: absent the program, Region A would have moved like Region B. That must be checked, not assumed — compare the two regions' pre-launch revenue trends over several prior periods; if they were already diverging before launch, DiD is biased and the +$8 is not trustworthy. Two more checks before reporting: (a) **composition / Simpson's paradox** — did Region A's user mix shift (e.g. an influx of high-spend users) at launch? A mix shift can manufacture the gap with no behavioral effect, so break revenue out by segment. (b) **selection** — was Region A chosen *because* it was already trending up? That biases DiD upward. 

Reported claim: *"Descriptive: A rose +$18, B rose +$10. Causal (DiD, conditional on parallel pre-trends and stable mix): the loyalty program lifted revenue per user by roughly +$8 — to be confirmed against pre-trend and segment checks."* The uncertainty band on +$8 comes from the variance of both regions' changes; with only the four point figures given, the interval is not computable here — flag it as needed input rather than inventing one.

**Why this passes.** It refuses the naive single-region before/after and shows the **DiD arithmetic explicitly** (`(118−100) − (110−100) = +$8`), so the 2× over-credit is visible, not asserted. It states the **identification assumption (parallel trends)** and makes it a *check on pre-launch trends*, not a hope. It adds the two confounds this design is most vulnerable to — a **mix shift (Simpson's-paradox)** and **selection** of the treated region — and says how each would bias the estimate. Crucially, it separates the **descriptive** facts (+$18, +$10) from the **causal** estimate (+$8) and labels the causal number as conditional, and it **does not invent a confidence interval** from the four numbers given — it names the missing input instead. That is the honest causal answer: a defensible point estimate, its assumption made checkable, and its uncertainty flagged rather than fabricated.

### Example C — multivariate test (2×2 factorial) and the interaction term

**Prompt.** A team ran a 2×2 test — new **headline** (on/off) × new **CTA button** (on/off) — on conversion, and wants to "ship both, since both looked positive." Read the result and check whether the two effects are independent.

**Senior answer.** A 2×2 factorial gives four cells; the reason to run it (rather than two separate A/Bs) is to estimate the **interaction** — whether headline + CTA together do more or less than the sum of their parts. Read the main effects *and* the interaction, or you are assuming they add.

Cell conversion rates (n = 10,000 per cell):

| | CTA off | CTA on |
|---|---|---|
| Headline off | 4.0% | 5.0% |
| Headline on | 5.2% | 5.6% |

- **Main effect of Headline** (averaged over CTA) = (5.4 − 4.5) = **+0.9 pts**.
- **Main effect of CTA** (averaged over Headline) = (5.3 − 4.6) = **+0.7 pts**.
- **Interaction** = (both-on − headline-only) − (CTA-only − baseline) = (5.6 − 5.2) − (5.0 − 4.0) = 0.4 − 1.0 = **−0.6 pts** → **sub-additive**: CTA adds +1.0 pt on the old headline but only +0.4 pt on the new one. So "ship both and expect +1.6 independent gains" is wrong; the both-on cell is +1.6 over *baseline* (5.6% vs 4.0%), not two bankable-separately effects that sum.

**The power caveat (the trap).** An interaction is a *difference of differences*, so its variance is roughly the sum of the four cells' variances and its standard error is larger than a main effect's — detecting an interaction of a given size needs **~4× the sample** a main effect of that size needs. Here SE(interaction) ≈ `sqrt(4 × p(1−p)/n)` with p ≈ 0.05, n = 10,000 ≈ **0.44 pts**, so the −0.6 pt interaction has a 95% CI ≈ **−0.6 ± 0.85 = [−1.45, +0.25]** — it **includes zero**. So the *direction* (sub-additive) is a real warning, but the study is **underpowered to confirm the interaction**: report it as "suggestive of sub-additivity, not significant — the design was powered for main effects, not the interaction." Decision: ship the larger, robust main effect (Headline), do **not** bank the CTA gain as fully additive on top, and if the interaction matters commercially, run a follow-up powered for it.

**Why this passes.** It uses the factorial for its actual purpose — estimating the **interaction, computed explicitly** (`(5.6−5.2) − (5.0−4.0) = −0.6`), not assuming the effects add — and reads the sub-additivity correctly (the both-on cell is +1.6 over baseline, not +1.6 of independent gains). Critically it carries the **interaction-power caveat**: the interaction's SE is larger (a difference of differences needs ~4× the n), it computes the CI ([−1.45, +0.25]) which **includes zero**, and it refuses to over-claim ("suggestive, underpowered, powered for main effects"). The decision follows the evidence (ship the robust main effect, don't bank the gain as additive, power a follow-up) — exactly the interaction-and-power discipline the rubric tests and the earlier examples never showed with numbers.

## Հայերեն

### Օրինակ A — experiment readout (A/B՝ peeking-ով և multiplicity-ով)

**Prompt.** Checkout A/B test-ն ունի 12,000 user յուրաքանչյուր arm-ում։ Control conversion-ը 10.0% է, treatment-ը՝ 10.8%։ PM-ը ամեն օր նայել է dashboard-ին և ուզում է ship անել, որովհետև «3-րդ օրը հատեց p<0.05»։ Բիզնեսին հետաքրքրում է միայն ≥1.0 percentage-point lift։ Նաև չորս secondary metric են դիտվում։ Գրիր readout-ը։

**Senior պատասխան.** Observed lift-ը 10.8% − 10.0% = **0.8 percentage point**։ Տարբերության large-sample standard error-ը `sqrt(0.10·0.90/12000 + 0.108·0.892/12000) ≈ 0.00394` է, ուստի 95% CI-ն lift-ի վրա՝ `0.008 ± 1.96·0.00394 = [0.0003, 0.0157]`, այսինքն **[+0.03, +1.57] point**։ Կարդա սա որպես coverage․ այսպես կառուցված procedure-ը captures է true lift-ը repeated sample-ների ~95%-ում — դա *չէ* 95% հավանականություն, որ true lift-ը այս մեկ interval-ում է։ Interval-ը հազիվ է անցնում զրոն, ուստի effect-ը statistically զրոյից տարբերելի է, բայց նրա lower bound-ը (+0.03 pt) շատ ցածր է **1.0-point decision threshold**-ից. data-ն դեռ չի լիցենզավորում ship բիզնես չափանիշով։

Երկու integrity խնդիր gate է անում այս readout-ը։ (1) **Peeking.** «3-րդ օրը հատեց p<0.05» ամենօրյա dashboard look-երից optional stopping է — fixed α=0.05-ով կրկնվող look-երի դեպքում իրական false-positive rate-ը 5%-ից շատ վեր է, ուստի այդ հատումը վավեր stop չէ։ Պետք էր նախ-հայտարարված sequential plan (alpha-spending — O'Brien–Fleming կամ Pocock — կամ always-valid p-value). դրա բացակայության դեպքում վերագնահատիր միայն պլանավորված N-ին։ (2) **Multiplicity.** Primary plus չորս secondary՝ դա metric-ների family է. «significant» secondary-ն պետք է correct-վի (Holm՝ FWER, կամ Benjamini–Hochberg՝ FDR) և family-ն նշվի, այլապես այն false winner է։

Որոշում․ **այս readout-ով ship մի՛ արա։** Point estimate-ը հետաքրքիր է, բայց CI-ի lower bound-ը 1.0-point threshold-ից ցածր է, և significance-ը աղտոտված է peeking-ով։ Run արա pre-registered N-ին վավեր stopping rule-ով. եթե lift-ը պահվում է lower CI bound-ով 1.0 point-ից վեր և guardrail-ները մաքուր են, ship արա — այլապես այն *inconclusive է powered MDE-ին*, ոչ «no effect»։

**Ինչու է անցնում gate-ը.** Ամեն թիվ բխեցված է, ոչ պնդված․ 0.8 pt երկու rate-ից, SE 0.00394 binomial-difference formula-ից, և CI [+0.03, +1.57] `estimate ± 1.96·SE`-ից — բոլորը ցույց տրված։ CI-ն ներկայացված է որպես **procedure-ի coverage**՝ բացահայտ մերժելով «այս interval-ի մասին 95% հավանականություն» սխալ ընթերցումը։ Այն բաժանում է statistical significance-ը (հազիվ անցնում զրոն) **բիզնես decision threshold-ից** (1.0 point), ուստի significant-բայց-շատ-փոքր effect-ը ճիշտ կերպով non-ship է։ Այն բռնում է երկու failure mode-ը, որ prompt-ը խայծ էր արել — **peeking** (անվանում է optional stopping-ը և վավեր sequential fix-երը) և **multiplicity** (անվանում է family-ն և Holm/BH-ն) — և հրաժարվում է underpowered/աղտոտված արդյունքը կա՛մ win, կա՛մ «no effect» կոչելուց, վայրէջք կատարելով «run արա N-ին, հետո որոշիր»-ի վրա, որ ազնիվ քայլն է։

### Օրինակ B — պատճառային / observational ախտորոշում (difference-in-differences՝ confounder ստուգմամբ)

**Prompt.** Ընկերությունը loyalty program գործարկեց Region A-ում, բայց ոչ Region B-ում։ Region A-ում monthly revenue per user գործարկումից հետո բարձրացավ $100-ից $118. Region B-ում նույն ժամանակ բարձրացավ $100-ից $110։ Ղեկավարությունը ուզում է program-ին վերագրել **+$18 per user**։ Ճի՞շտ է։ Ո՞րն է պաշտպանելի causal estimate-ը։

**Senior պատասխան.** «+$18» claim-ը **միայն treated region-ի before→after փոփոխությունն է**, որ խառնում է program-ը այդ ժամանակ revenue-ն շարժած ամեն ինչի հետ (seasonality, price change, macro demand)։ Region B-ն control է, որ կլանեց այդ common shock-երը․ այն բարձրացավ **+$10**՝ առանց program-ի։ **Difference-in-differences (DiD)** estimate-ը common trend-ը հանում է․

`DiD = (A_after − A_before) − (B_after − B_before) = (118 − 100) − (110 − 100) = 18 − 10 = +$8 per user.`

Ուստի պաշտպանելի causal effect-ը **մոտ +$8 per user** է, ոչ +$18 — naive թիվը program-ին over-credit է անում 2×-ից ավելի։ Այս estimate-ը հենվում է **parallel-trends assumption**-ի վրա․ առանց program-ի Region A-ն կշարժվեր Region B-ի պես։ Դա պետք է ստուգվի, ոչ ենթադրվի — համեմատիր երկու region-ի pre-launch revenue trend-ները մի քանի նախորդ period-ի վրա. եթե դրանք արդեն diverge էին անում մինչ launch-ը, DiD-ն biased է, և +$8-ը վստահելի չէ։ ԵՒս երկու ստուգում մինչ ներկայացնելը․ (ա) **composition / Simpson-ի paradox** — Region A-ի user mix-ը shift արե՞ց (օր.՝ high-spend user-ների ներհոսք) launch-ին։ Mix shift-ը կարող է gap-ը ֆաբրիկացնել առանց behavioral effect-ի, ուստի revenue-ն բաժանիր segment-ով։ (բ) **selection** — Region A-ն ընտրվե՞ց, *որովհետև* արդեն վեր էր trending անում։ Դա DiD-ը վերև է biased անում։

Ներկայացված claim․ *«Descriptive․ A-ն բարձրացավ +$18, B-ն՝ +$10։ Causal (DiD, պայմանով՝ parallel pre-trend և կայուն mix)․ loyalty program-ը revenue per user-ը բարձրացրեց մոտ +$8 — հաստատվելու pre-trend և segment ստուգումների դեմ»։* +$8-ի uncertainty band-ը գալիս է երկու region-ի change-երի variance-ից. տրված միայն չորս point թվով interval-ը այստեղ հաշվելի չէ — flag արա այն որպես անհրաժեշտ input, ոչ թե հորինիր։

**Ինչու է անցնում gate-ը.** Այն մերժում է naive single-region before/after-ը և ցույց է տալիս **DiD arithmetic-ը բացահայտ** (`(118−100) − (110−100) = +$8`), ուստի 2× over-credit-ը տեսանելի է, ոչ պնդված։ Այն նշում է **identification assumption-ը (parallel trends)** և դարձնում է այն *pre-launch trend-ի ստուգում*, ոչ հույս։ Այն ավելացնում է երկու confound, որոնց դեմ այս design-ն ամենախոցելին է — **mix shift (Simpson-ի paradox)** և treated region-ի **selection** — և ասում, թե ամեն մեկը ինչպես կ-bias աներ estimate-ը։ Կարևորը՝ այն բաժանում է **descriptive** փաստերը (+$18, +$10) **causal** estimate-ից (+$8) և label է անում causal թիվը որպես conditional, և **չի հորինում confidence interval** տրված չորս թվից — փոխարենը անվանում է բացակայող input-ը։ Դա ազնիվ causal պատասխանն է․ պաշտպանելի point estimate, իր assumption-ը ստուգելի դարձված, և uncertainty-ն flag արված, ոչ ֆաբրիկացված։

### Օրինակ C — multivariate test (2×2 factorial) և interaction term-ը

**Prompt.** Թիմը գործարկեց 2×2 test — նոր **headline** (on/off) × նոր **CTA button** (on/off) — conversion-ի վրա, և ուզում է «ship արել երկուսն էլ, քանի որ երկուսն էլ դրական երևացին»։ Կարդա արդյունքը և ստուգիր՝ երկու effect-ը independent են։

**Senior պատասխան.** 2×2 factorial-ը տալիս է չորս cell. այն գործարկելու պատճառը (երկու առանձին A/B-ի փոխարեն) **interaction**-ը estimate անելն է — արդյոք headline + CTA միասին անում են ավելի կամ պակաս, քան իրենց մասերի գումարը։ Կարդա main effect-ները *և* interaction-ը, այլապես ենթադրում ես, որ դրանք գումարվում են։

Cell-ի conversion rate-եր (n = 10,000 ամեն cell)․

| | CTA off | CTA on |
|---|---|---|
| Headline off | 4.0% | 5.0% |
| Headline on | 5.2% | 5.6% |

- **Headline-ի main effect** (CTA-ով միջինացված) = (5.4 − 4.5) = **+0.9 կետ**։
- **CTA-ի main effect** (Headline-ով միջինացված) = (5.3 − 4.6) = **+0.7 կետ**։
- **Interaction** = (both-on − headline-only) − (CTA-only − baseline) = (5.6 − 5.2) − (5.0 − 4.0) = 0.4 − 1.0 = **−0.6 կետ** → **sub-additive**․ CTA-ն ավելացնում է +1.0 կետ հին headline-ի վրա, բայց միայն +0.4 կետ նոր-ի վրա։ Ուստի «ship երկուսն էլ և սպասիր +1.6 independent gain» սխալ է. both-on cell-ը +1.6 է *baseline*-ից վեր (5.6% ընդդեմ 4.0%), ոչ երկու առանձին-bank-վող effect, որ գումարվում են։

**Power caveat-ը (թակարդը).** Interaction-ը *difference of differences* է, ուստի իր variance-ը մոտավորապես չորս cell-ի variance-ների գումարն է, և իր standard error-ը ավելի մեծ է, քան main effect-ինը — տրված չափի interaction հայտնաբերելը պահանջում է **~4× այն sample**-ը, որ նույն չափի main effect-ը պահանջում է։ Այստեղ SE(interaction) ≈ `sqrt(4 × p(1−p)/n)` p ≈ 0.05, n = 10,000-ով ≈ **0.44 կետ**, ուստի −0.6 կետ interaction-ը ունի 95% CI ≈ **−0.6 ± 0.85 = [−1.45, +0.25]** — այն **ներառում է զրո**։ Ուստի *ուղղությունը* (sub-additive) իրական զգուշացում է, բայց study-ն **underpowered է interaction-ը հաստատելու**․ report արա որպես «suggestive of sub-additivity, ոչ significant — design-ը powered էր main effect-ների, ոչ interaction-ի համար»։ Որոշում․ ship արա ավելի մեծ, robust main effect-ը (Headline), **մի՛** bank արա CTA gain-ը որպես լրիվ additive վերևից, և եթե interaction-ը commercially կարևոր է, գործարկիր follow-up՝ դրա համար powered։

**Ինչու է անցնում gate-ը.** Այն օգտագործում է factorial-ը իր իրական նպատակով — **interaction-ը estimate անել, հաշված բացահայտ** (`(5.6−5.2) − (5.0−4.0) = −0.6`), ոչ ենթադրել, որ effect-ները գումարվում են — և ճիշտ է կարդում sub-additivity-ն (both-on cell-ը +1.6 է baseline-ից, ոչ +1.6 independent gain)։ Կարևորը՝ այն կրում է **interaction-power caveat**-ը․ interaction-ի SE-ն ավելի մեծ է (difference of differences-ը պահանջում է ~4× n), հաշվում է CI-ն ([−1.45, +0.25]), որ **ներառում է զրո**, և հրաժարվում է over-claim-ից («suggestive, underpowered, powered for main effects»)։ Որոշումը հետևում է evidence-ին (ship robust main effect-ը, մի՛ bank արա gain-ը որպես additive, power արա follow-up) — հենց interaction-and-power discipline-ը, որ rubric-ը test է անում, իսկ նախորդ example-ները երբեք չէին ցույց տալիս թվերով։
