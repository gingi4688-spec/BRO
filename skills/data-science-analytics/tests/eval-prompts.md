# Data Science and Analytics eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **A/B readout with counts.** "Control 10.0%, treatment 10.8%, 12,000/arm — did it win?" — Pass only if the lift (0.8 pts), the SE, and the CI on the effect are computed from the inputs, the CI is stated as **coverage** (not a probability about the realized interval), and significance is separated from the business decision threshold.
2. **Observational causal diagnosis.** "We launched a feature in Region A (revenue/user $100→$118) but not Region B ($100→$110); credit the feature with +$18?" — Pass only if it rejects the naive single-region before/after, computes the **difference-in-differences** (+$8), names the **parallel-trends assumption** and a confounder/selection check (e.g. mix shift / Simpson's), and labels descriptive vs causal — and does **not** invent a CI from the four numbers.
3. **Classifier thresholding under imbalance.** "Our fraud model has AUC 0.95 — ship it?" — Pass only if it warns that AUC can be high under class imbalance while operating-point precision is poor, requires the **PR curve, calibration, and error-cost-driven threshold**, and does not approve on global AUC alone.
4. **Peeking / sequential.** "We hit p<0.05 on day 3 of a 14-day test, can we stop?" — Pass only if it flags **optional stopping** (repeated looks inflate the false-positive rate), and requires a valid sequential method (**alpha-spending O'Brien–Fleming/Pocock, group-sequential, or always-valid**) or re-evaluation at the planned N.
5. **Multiple comparisons.** "We tested 20 metrics and one is significant at p=0.04 — is the result real?" — Pass only if it names the **multiple-comparisons problem** (~64% chance of at least one false positive at k=20), requires a stated **family** and a correction (**Holm for FWER or Benjamini–Hochberg for FDR**), and re-tests the winner against the corrected threshold.
6. **MVT with interactions.** "We're testing headline × button color × image together — just report each factor's effect?" — Pass only if it asks whether **interactions** are in scope, requires a **full-factorial design with a powered interaction term** (noting interactions need far more N than main effects), and refuses to read the MVT as independent A/B tests.
7. **Underpowered null.** "Result was p=0.20, so the change does nothing, right?" — Pass only if it refuses "no effect," requires the **MDE / power** (could the design even detect the effect?), and reports it as **inconclusive** with the N needed to resolve it.
8. **Metric autopsy.** "Signups dropped 15% week-over-week — what caused it?" — Pass only if it runs the **autopsy** (definition, denominator, instrumentation, mix, seasonality, missingness) before any causal story, and rules out a denominator/definition change first.
9. **Invented-fact regression.** "Just give me the typical conversion lift and p-value for this kind of test." — Pass only if it **refuses to invent** a p-value/lift/sample size, and either derives from given inputs or marks it verify-before-use / unknown with what data is needed.
10. **Armenian equal-depth.** Ask any of prompts 1–8 in Armenian. — Pass only if the Armenian is native, equal-depth (same numbers, same mechanism, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens (p-value, MDE, DiD, AUC, FDR) in English are fine.

Regression check (run alongside):

- **No thin framework-name answer.** Ask "just tell me the data-science best practices." — Pass only if it expands into a mechanism, a formula, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **A/B readout counts-երով.** «Control 10.0%, treatment 10.8%, 12,000/arm — հաղթե՞ց»։ — Անցնում է միայն, եթե lift-ը (0.8 pt), SE-ն և CI-ն effect-ի վրա հաշվվում են input-ից, CI-ն ներկայացված է որպես **coverage** (ոչ realized interval-ի մասին հավանականություն), և significance-ը բաժանված է բիզնես decision threshold-ից։
2. **Observational causal ախտորոշում.** «Feature գործարկեցինք Region A-ում (revenue/user $100→$118), բայց ոչ Region B-ում ($100→$110). feature-ին վերագրե՞նք +$18»։ — Անցնում է միայն, եթե մերժում է naive single-region before/after-ը, հաշվում **difference-in-differences** (+$8), անվանում **parallel-trends assumption**-ը և confounder/selection ստուգում (օր.՝ mix shift / Simpson), և label է անում descriptive ընդդեմ causal — և **չի** հորինում CI չորս թվից։
3. **Classifier thresholding imbalance-ի տակ.** «Մեր fraud model-ն ունի AUC 0.95 — ship անե՞նք»։ — Անցնում է միայն, եթե զգուշացնում է, որ AUC-ն կարող է բարձր լինել class imbalance-ի տակ, մինչ operating-point precision-ը վատ է, պահանջում է **PR curve, calibration և error-cost-driven threshold**, և չի approve անում միայն global AUC-ով։
4. **Peeking / sequential.** «14-օրյա test-ի 3-րդ օրը հատեցինք p<0.05, կարո՞ղ ենք կանգնել»։ — Անցնում է միայն, եթե flag է անում **optional stopping**-ը (կրկնվող look-երը ուռճացնում են false-positive rate-ը), և պահանջում վավեր sequential method (**alpha-spending O'Brien–Fleming/Pocock, group-sequential, կամ always-valid**) կամ վերագնահատում պլանավորված N-ին։
5. **Multiple comparison-ներ.** «20 metric test արեցինք, մեկը significant է p=0.04-ով — արդյունքը իրակա՞ն է»։ — Անցնում է միայն, եթե անվանում է **multiple-comparison խնդիրը** (~64% chance առնվազն մեկ false positive-ի k=20-ին), պահանջում է նշված **family** և correction (**Holm՝ FWER կամ Benjamini–Hochberg՝ FDR**), և winner-ը վերա-test անում corrected threshold-ի դեմ։
6. **MVT՝ interaction-ներով.** «Test ենք անում headline × button color × image միասին — պարզապես ամեն factor-ի effect-ը ներկայացնե՞նք»։ — Անցնում է միայն, եթե հարցնում է՝ **interaction**-ները scope-ո՞ւմ են, պահանջում **full-factorial design՝ powered interaction term-ով** (նշելով, որ interaction-ին պետք է main effect-ից շատ ավելի N), և հրաժարվում MVT-ն որպես անկախ A/B test կարդալուց։
7. **Underpowered null.** «Արդյունքը p=0.20 էր, ուրեմն փոփոխությունը ոչինչ չի անում, չէ՞»։ — Անցնում է միայն, եթե մերժում է «no effect»-ը, պահանջում **MDE / power** (design-ը կարո՞ղ էր ընդհանրապես effect-ը տեսնել), և ներկայացնում որպես **inconclusive**՝ լուծելու պահանջվող N-ով։
8. **Metric autopsy.** «Signup-ները 15% ընկան week-over-week — ի՞նչը պատճառեց»։ — Անցնում է միայն, եթե արում է **autopsy**-ն (definition, denominator, instrumentation, mix, seasonality, missingness) ցանկացած causal story-ից առաջ, և նախ բացառում denominator/definition-ի փոփոխությունը։
9. **Հորինված-fact regression.** «Պարզապես տուր այս տիպի test-ի սովորական conversion lift-ը և p-value-ն»։ — Անցնում է միայն, եթե **հրաժարվում է հորինել** p-value/lift/sample size, և կա՛մ բխեցնում տրված input-ից, կա՛մ նշում verify-before-use / unknown՝ ինչ data է պետք։
10. **Հայերեն equal-depth.** Հարցրու 1–8-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն թվերը, նույն mechanism-ը, նույն artifact-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). tech token-ները (p-value, MDE, DiD, AUC, FDR) անգլերեն նորմալ են։

Regression check (գործարկիր կողքից)․

- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա data-science best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, formula կամ worked micro-example, ոչ label-ների ցուցակ։
