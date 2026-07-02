# Data Science and Analytics patterns

## English

These are canonical data science and analytics moves. Each is a mechanism for one of the domain's artifacts (analysis plan, experiment readout, metric diagnostic, causal caveat memo, classifier threshold sheet). Choose the move that changes the next decision, not the nicest label.

### 1. Metric autopsy

- **Trigger:** A KPI moved and the team wants a causal story for it.
- **Mechanism:** Before any attribution, inspect definition, instrumentation, population mix, seasonality, missingness, and the denominator. Then separate descriptive movement (the number changed) from causal attribution (our change moved it); only the latter needs an identification strategy (experiment, DiD, matched comparison). State which of the two you are answering.
- **Do not use when:** The metric is a one-off counter with no decision attached — there is nothing to repair or attribute.
- **Failure repair:** If the denominator or definition changed, stop the causal story and repair the metric first; a denominator shift dressed as a behavior change is the most common false narrative.

### 2. Experiment design card

- **Trigger:** A test is proposed but the sample size, MDE, guardrails, or stopping rule are vague.
- **Mechanism:** Write the estimand, the unit of randomization, the primary metric, the guardrail metrics, α, power, the MDE, the duration/required N, the peeking rule, and the decision rule. Include the worked detectable effect: "with this N and α, we can detect at least X; smaller true effects will read as inconclusive." Pre-register it so the readout cannot be reverse-engineered to a winner.
- **Do not use when:** The work is pure data-quality debugging or a descriptive pull with no comparison — there is no treatment to design around.
- **Failure repair:** If no one can name the useful effect size, do not run the test yet; an experiment with no MDE produces a null nobody can interpret.

### 3. Multivariate test with multiple-testing correction

- **Trigger:** More than one change is tested at once, or several metrics/arms are compared, and a "winner" is wanted.
- **Mechanism:** Decide whether the factors may interact. If so, use a full-factorial MVT with an interaction term and power the interaction (which needs far more N than the main effects); if N cannot support it, report main effects only and disclaim interactions. Treat the arms/metrics as a family and correct: FWER via Holm (preferred over plain Bonferroni) when any false positive is costly, or FDR via Benjamini–Hochberg when a controlled fraction of false discoveries is acceptable. Report raw and corrected significance side by side.
- **Do not use when:** There is a single variant on a single pre-registered primary metric — there is no family to correct, and a correction would only cost power.
- **Failure repair:** If a "winner" was picked from an uncorrected family or an MVT was read as independent A/B tests, define the family, apply the correction, and re-test the winner before any claim.

### 4. Sequential / peeking-safe readout

- **Trigger:** Someone wants to look at the experiment before the planned end, or has already stopped it the moment p dipped below 0.05.
- **Mechanism:** Declare the looking strategy before launch. For planned interim looks, use alpha-spending (O'Brien–Fleming to preserve power with conservative early stops, or Pocock for easier early stops at a power cost) or a group-sequential design with the implied boundaries. For continuous monitoring, use always-valid p-values / confidence sequences and stop only when the always-valid interval excludes zero. Re-evaluate any early call against the corrected boundary, not the nominal 0.05.
- **Do not use when:** The test is a true fixed-horizon design that was looked at exactly once at the planned N — no sequential correction is needed.
- **Failure repair:** If the test was stopped on a naive dipping p with no spending plan, treat the result as p-hacked: re-evaluate against a sequential boundary or re-run with a pre-agreed plan.

### 5. Causal / observational diagnosis

- **Trigger:** A causal claim is wanted from data that was not randomized (a launch correlated with a metric, a cohort that "performs better").
- **Mechanism:** Name the estimand and the plausible confounders and selection effects first. Then test whether a defensible identification strategy exists: DiD (with a checked parallel-trends assumption), matching/regression adjustment on measured confounders, an instrumental variable, or a natural experiment. Check segments for Simpson's paradox before trusting any aggregate. If no strategy is defensible, downgrade the claim to descriptive/predictive and say so plainly.
- **Do not use when:** The data is from a clean randomized experiment — randomization already licenses the causal claim; reach for the experiment readout instead.
- **Failure repair:** If correlation is being sold as causation with no identification strategy, list the confounders, state which estimand is actually supported, and label the claim descriptive until a strategy is in place.

### 6. Classifier threshold sheet

- **Trigger:** A model looks good on a global metric (AUC) but its actions in production are poor, or no operating threshold has been chosen.
- **Mechanism:** List the base rate, the PR-curve operating point, the chosen threshold, the expected false positives and false negatives at that threshold, and the cost of each error type. Choose the threshold that minimizes expected cost or meets a capacity limit, then check calibration (do predicted 0.7 events occur ~70% of the time). Under class imbalance, judge by PR and the operating point, not by global AUC.
- **Do not use when:** The output is a pure ranking with no action threshold (a recommendation order with no cut-off) — there is no threshold economics to optimize.
- **Failure repair:** If AUC is high but precision at the deployed threshold is low, fix the threshold, the data, or the calibration — not the slide; a strong global metric does not make bad actions good.

## Հայերեն

Սրանք canonical data science և analytics move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (analysis plan, experiment readout, metric diagnostic, causal caveat memo, classifier threshold sheet)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Metric autopsy

- **Երբ է պետք․** KPI շարժվել է, և թիմը causal պատմություն է ուզում դրա համար։
- **Մեխանիզմը․** Ցանկացած attribution-ից առաջ ստուգիր definition, instrumentation, population mix, seasonality, missingness և denominator։ Հետո առանձնացրու descriptive movement-ը (թիվը փոխվեց) causal attribution-ից (մեր փոփոխությունը այն շարժեց). միայն երկրորդին է պետք identification strategy (experiment, DiD, matched comparison)։ Ասա՛ որ երկուսից որին ես պատասխանում։
- **Երբ չօգտագործել․** Երբ metric-ը մեկանգամյա counter է՝ առանց կցված որոշման — շտկելու կամ վերագրելու բան չկա։
- **Ուղղում․** Եթե denominator-ը կամ definition-ը փոխվել է, կանգնեցրու causal story-ն և նախ շտկիր metric-ը. denominator-ի shift-ը՝ որպես behavior change ներկայացված, ամենահաճախ կեղծ պատմությունն է։

### 2. Experiment design card

- **Երբ է պետք․** Test է առաջարկվում, բայց sample size-ը, MDE-ն, guardrail-ները կամ stopping rule-ը մշուշոտ են։
- **Մեխանիզմը․** Գրիր estimand-ը, randomization-ի unit-ը, primary metric-ը, guardrail metric-ները, α-ն, power-ը, MDE-ն, duration-ը/պահանջվող N-ը, peeking rule-ը և decision rule-ը։ Ներառիր detectable effect-ի հաշվարկ․ «այս N-ով և α-ով տեսնում ենք առնվազն X. ավելի փոքր true effect-ը կկարդացվի inconclusive»։ Pre-register արա, որ readout-ը հնարավոր չլինի winner-ի reverse-engineer անել։
- **Երբ չօգտագործել․** Երբ աշխատանքը մաքուր data-quality debugging է կամ descriptive pull՝ առանց համեմատության — design անելու treatment չկա։
- **Ուղղում․** Եթե ոչ ոք չի անվանում օգտակար effect size-ը, test-ը դեռ մի՛ սկսիր. առանց MDE-ի փորձը տալիս է null, որ ոչ ոք չի կարող մեկնաբանել։

### 3. Multivariate test՝ multiple-testing correction-ով

- **Երբ է պետք․** Միաժամանակ մեկից ավելի փոփոխություն է test-վում, կամ մի քանի metric/arm է համեմատվում, և «winner» են ուզում։
- **Մեխանիզմը․** Որոշիր՝ factor-ները կարո՞ղ են interact անել։ Եթե այո, օգտագործիր full-factorial MVT՝ interaction term-ով և power արա interaction-ը (որին պետք է main effect-ից շատ ավելի N). եթե N-ը չի դիմանում, ներկայացրու միայն main effect և հրաժարվիր interaction-ից։ Arm-երը/metric-ները համարիր family և correct արա․ FWER՝ Holm-ով (նախընտրելի պարզ Bonferroni-ից), երբ ցանկացած false positive թանկ է, կամ FDR՝ Benjamini–Hochberg-ով, երբ false discovery-ների վերահսկվող մասը ընդունելի է։ Ներկայացրու raw և corrected significance-ը կողք կողքի։
- **Երբ չօգտագործել․** Երբ մեկ variant է՝ մեկ pre-registered primary metric-ի վրա — correct անելու family չկա, և correction-ը միայն power կծախսի։
- **Ուղղում․** Եթե «winner»-ը ընտրվել է uncorrected family-ից կամ MVT-ն կարդացվել է որպես անկախ A/B test-եր, սահմանիր family-ն, կիրառիր correction-ը և winner-ը վերա-test արա ցանկացած claim-ից առաջ։

### 4. Sequential / peeking-ապահով readout

- **Երբ է պետք․** Որևէ մեկը ուզում է փորձին նայել նախքան պլանավորված վերջը, կամ արդեն կանգնեցրել է այն այն պահին, երբ p-ն ընկավ 0.05-ից ներքև։
- **Մեխանիզմը․** Նայելու ստրատեգիան հայտարարիր մինչ launch-ը։ Պլանավորված interim look-երի համար օգտագործիր alpha-spending (O'Brien–Fleming՝ power պահելու conservative early stop-ով, կամ Pocock՝ հեշտ early stop-ի համար power-ի cost-ով) կամ group-sequential design՝ բխող boundary-ներով։ Շարունակական monitoring-ի համար օգտագործիր always-valid p-value / confidence sequence և կանգնիր միայն, երբ always-valid interval-ը բացառում է զրոն։ Ցանկացած early call վերագնահատիր corrected boundary-ի դեմ, ոչ անվանական 0.05-ի։
- **Երբ չօգտագործել․** Երբ test-ը իսկական fixed-horizon design է, որին նայել են ճիշտ մեկ անգամ պլանավորված N-ին — sequential correction պետք չէ։
- **Ուղղում․** Եթե test-ը կանգնեցվել է naive ընկնող p-ի վրա՝ առանց spending plan-ի, արդյունքը համարիր p-hacked․ վերագնահատիր sequential boundary-ի դեմ կամ վերա-run արա նախապես համաձայնեցված plan-ով։

### 5. Պատճառային / observational ախտորոշում

- **Երբ է պետք․** Causal claim են ուզում data-ից, որ randomize չի եղել (launch, որ correlate է metric-ի հետ, cohort, որ «ավելի լավ է performs անում»)։
- **Մեխանիզմը․** Նախ անվանի՛ր estimand-ը և հավանական confounder-ներն ու selection effect-ները։ Հետո ստուգիր՝ պաշտպանելի identification strategy կա՞․ DiD (ստուգված parallel-trends assumption-ով), matching/regression adjustment՝ չափված confounder-ների վրա, instrumental variable կամ natural experiment։ Ստուգիր segment-ները Simpson-ի paradox-ի համար aggregate-ին վստահելուց առաջ։ Եթե ոչ մի strategy պաշտպանելի չէ, իջեցրու claim-ը descriptive/predictive-ի և ասա դա բացահայտ։
- **Երբ չօգտագործել․** Երբ data-ն մաքուր randomized experiment-ից է — randomization-ն արդեն լիցենզավորում է causal claim-ը. վերցրու experiment readout-ը փոխարենը։
- **Ուղղում․** Եթե correlation-ը causation է վաճառվում առանց identification strategy-ի, թվարկիր confounder-ները, ասա որ estimand-ն է իրականում աջակցված, և label արա claim-ը descriptive, մինչ strategy չլինի։

### 6. Classifier threshold sheet

- **Երբ է պետք․** Model-ը լավ է global metric-ով (AUC), բայց production-ում նրա action-ները վատ են, կամ operating threshold դեռ չի ընտրվել։
- **Մեխանիզմը․** Գրիր base rate-ը, PR-curve-ի operating point-ը, ընտրված threshold-ը, այդ threshold-ին սպասվող false positive-ները և false negative-ները, և ամեն error-ի տեսակի cost-ը։ Ընտրիր threshold-ը, որ նվազեցնում է expected cost-ը կամ պահում է capacity limit-ը, հետո ստուգիր calibration-ը (0.7-ով predicted event-երը ~70% դեպքո՞ւմ են լինում)։ Class imbalance-ի տակ դատիր PR-ով և operating point-ով, ոչ global AUC-ով։
- **Երբ չօգտագործել․** Երբ output-ը մաքուր ranking է՝ առանց action threshold-ի (recommendation order առանց cut-off-ի) — optimize անելու threshold economics չկա։
- **Ուղղում․** Եթե AUC-ն բարձր է, բայց deployed threshold-ի precision-ը ցածր է, շտկիր threshold-ը, data-ն կամ calibration-ը — ոչ slide-ը. ուժեղ global metric-ը վատ action-ները լավ չի դարձնում։
