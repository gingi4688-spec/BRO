# Finance and Unit Economics patterns

## English

These are canonical finance and unit-economics moves. Each is a mechanism for one of the domain's artifacts (unit-economics bridge, cohort-margin table, payback/LTV model, 3-statement forecast, valuation, cap table). Choose the move that changes the next decision, not the nicest label.

### 1. Unit-economics bridge

- **Trigger:** Revenue or ARR looks good but it is unclear whether the unit actually makes money.
- **Mechanism:** Bridge revenue → gross profit → contribution margin → CAC payback → LTV. Classify each cost as fixed, variable, or step-function; state the margin base (over price); compute payback in months and LTV on contribution margin. Surface cash timing separately from accrual.
- **Do not use when:** The question is a pure accounting close or audited-statement preparation — route to a controller/accountant.
- **Failure repair:** If contribution margin is negative, pause scale and fix price, variable cost, or segment before optimizing acquisition.

### 2. Paid-vs-blended CAC split

- **Trigger:** Someone wants to spend more on acquisition and is pointing at a single "CAC" or a strong blended LTV:CAC.
- **Mechanism:** Split spend into channels. Compute **paid** CAC (paid spend ÷ paid customers) separately from **blended** CAC (all spend ÷ all customers including free organic). Answer the marginal-spend decision with paid-channel economics; check whether paid CAC rises as spend scales.
- **Do not use when:** Acquisition is essentially one paid channel with no organic — then paid and blended converge and the split adds nothing.
- **Failure repair:** If the case rests on blended CAC, recompute LTV:paid-CAC; a scale decision justified by organic-diluted CAC is a fiction.

### 3. Cohort skew check

- **Trigger:** A blended LTV, payback, or LTV:CAC looks strong.
- **Mechanism:** Split by acquisition month, channel, and segment; compare mature vs young cohorts on retention, payback, churn, and expansion before any ratio drives a decision. A blended average can hide that recent paid cohorts decay faster.
- **Do not use when:** All cohorts are genuinely mature and homogeneous and the channel mix is stable.
- **Failure repair:** If recent paid cohorts are worse, the blended ratio is a lagging comfort blanket — decide on the marginal cohort, not the average.

### 4. Sensitivity flip table

- **Trigger:** A model has many assumptions and the recommendation feels fragile.
- **Mechanism:** Vary the 3–5 drivers most likely to flip the decision; move correlated drivers together (price↔conversion, enterprise mix↔sales cycle). Mark the threshold at which the recommendation changes and name it in one line ("scales only while paid CAC < $1,950").
- **Do not use when:** A hard constraint already fixes the decision — do not decorate a settled call with scenarios.
- **Failure repair:** If every scenario supports the same answer, the ranges are probably dishonest or the drivers are moved in isolation — re-link them and widen the ranges.

### 5. EBITDA → FCF bridge

- **Trigger:** Someone claims the business funds itself because EBITDA is positive, or presents EBITDA as the cash generated.
- **Mechanism:** Bridge EBITDA → unlevered free cash flow: subtract cash taxes, capex, and the change in working capital (and interest for levered FCF). Show the gap explicitly; reconcile to the cash-flow statement and the balance-sheet cash so the three statements tie.
- **Do not use when:** The business is genuinely asset-light with negligible capex and working capital and the question is purely about operating profitability — then EBITDA ≈ operating cash and the bridge is short, but still state it.
- **Failure repair:** If "EBITDA-positive so cash is fine" is the claim, build the bridge; a capex- or working-capital-heavy business can be EBITDA-positive and cash-negative.

### 6. Valuation method-fit + EV→equity bridge

- **Trigger:** A valuation or a fundraise needs a defensible number, or a single multiple is being quoted as the answer.
- **Mechanism:** Pick the method that fits the stage: comparable multiples (EV = metric × comp multiple) for a benchmarked view, a DCF (PV of unlevered FCF + terminal value) where cash flows are forecastable. Always bridge EV → equity via net debt, disclose the terminal-value share of a DCF, and treat comp multiples as verify-before-use facts. For a raise, layer the cap-table effect: post = pre + raise, investor % = raise ÷ post, price per share, founder dilution, and any pre-money pool shuffle.
- **Do not use when:** Cash flows are unforecastable (very early stage) — a DCF is false precision; lean on multiples and a scenario range, and say so.
- **Failure repair:** If EV is reported as equity value, add the net-debt bridge; if a DCF is 80%+ terminal value, disclose it and stress the growth/discount assumptions; if a multiple was invented, mark it verify-before-use.

## Հայերեն

Սրանք canonical finance և unit-economics move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (unit-economics bridge, cohort-margin table, payback/LTV model, 3-statement forecast, valuation, cap table)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Unit-economics bridge

- **Երբ է պետք․** Revenue-ն կամ ARR-ը լավ է երևում, բայց պարզ չէ՝ unit-ն իրականում փող է աշխատում, թե ոչ։
- **Մեխանիզմը․** Bridge արա revenue → gross profit → contribution margin → CAC payback → LTV։ Ամեն cost դասիր fixed, variable կամ step-function. նշիր margin base-ը (գնի վրա). payback-ը հաշվիր ամիսներով, LTV-ն՝ contribution margin-ի վրա։ Cash timing-ը առանձին երևացրու accrual-ից։
- **Երբ չօգտագործել․** Երբ հարցը pure accounting close է կամ audited-statement պատրաստում — ուղղորդիր controller/accountant-ին։
- **Ուղղում․** Եթե contribution margin-ը բացասական է, scale-ը pause արա և շտկիր price, variable cost կամ segment՝ նախքան acquisition-ը optimize անելը։

### 2. Paid-ընդդեմ-blended CAC split

- **Երբ է պետք․** Ինչ-որ մեկը ուզում է ավելի շատ ծախսել acquisition-ի վրա և ցույց է տալիս մեկ «CAC» կամ ուժեղ blended LTV:CAC։
- **Մեխանիզմը․** Split արա spend-ը channel-ներով։ Հաշվիր **paid** CAC-ը (paid spend ÷ paid customer) առանձին **blended** CAC-ից (ամբողջ spend ÷ բոլոր customer ներառյալ free organic)։ Marginal-spend որոշումը պատասխանիր paid-channel economics-ով. ստուգիր՝ paid CAC-ը բարձրանո՞ւմ է, երբ spend-ը scale է անում։
- **Երբ չօգտագործել․** Երբ acquisition-ը ըստ էության մեկ paid channel է առանց organic-ի — այդ դեպքում paid-ն ու blended-ը համընկնում են, և split-ը ոչինչ չի ավելացնում։
- **Ուղղում․** Եթե case-ը հենվում է blended CAC-ի վրա, վերահաշվիր LTV:paid-CAC. organic-ով նոսրացված CAC-ով արդարացված scale որոշումը fiction է։

### 3. Cohort skew check

- **Երբ է պետք․** Blended LTV-ն, payback-ը կամ LTV:CAC-ը ուժեղ է երևում։
- **Մեխանիզմը․** Split արա acquisition month-ով, channel-ով և segment-ով. համեմատիր mature ընդդեմ young cohort-ների՝ retention, payback, churn և expansion-ով, նախքան ratio-ն որոշում տանի։ Blended average-ը կարող է թաքցնել, որ recent paid cohort-ները ավելի արագ են decay անում։
- **Երբ չօգտագործել․** Երբ բոլոր cohort-ները իսկապես mature և homogeneous են, և channel mix-ը կայուն է։
- **Ուղղում․** Եթե recent paid cohort-ները վատն են, blended ratio-ն ուշացած comfort է — որոշիր marginal cohort-ով, ոչ average-ով։

### 4. Sensitivity flip table

- **Երբ է պետք․** Model-ը շատ assumption ունի, և recommendation-ը փխրուն է զգացվում։
- **Մեխանիզմը․** Փոխիր այն 3–5 driver-ը, որ ամենահավանականն են flip անելու որոշումը. correlated driver-ները շարժիր միասին (price↔conversion, enterprise mix↔sales cycle)։ Նշիր threshold-ը, որտեղ recommendation-ը փոխվում է, և անվանի՛ր մեկ տողով («scale է անում միայն, քանի դեռ paid CAC < $1,950»)։
- **Երբ չօգտագործել․** Երբ hard constraint-ն արդեն fix է անում որոշումը — settled call-ը scenario-ներով մի՛ զարդարիր։
- **Ուղղում․** Եթե ամեն scenario նույն answer-ն է տալիս, range-երը հավանաբար անազնիվ են կամ driver-ները շարժված են մեկուսի — վերակապիր և լայնացրու range-երը։

### 5. EBITDA → FCF bridge

- **Երբ է պետք․** Ինչ-որ մեկը պնդում է, որ բիզնեսը ինքնաֆինանսավորվում է, քանի որ EBITDA-ն positive է, կամ EBITDA-ն ներկայացնում որպես գեներացված cash։
- **Մեխանիզմը․** Bridge արա EBITDA → unlevered free cash flow․ հանիր cash taxes, capex և working capital-ի փոփոխությունը (և interest levered FCF-ի համար)։ Ցույց տուր gap-ը բացահայտ. հաշտեցրու cash-flow statement-ի և balance-sheet cash-ի հետ, որ երեք statement-ները կապվեն։
- **Երբ չօգտագործել․** Երբ բիզնեսը իսկապես asset-light է՝ չնչին capex-ով և working capital-ով, և հարցը զուտ operating profitability-ի մասին է — այդ դեպքում EBITDA ≈ operating cash, և bridge-ը կարճ է, բայց միևնույն է նշիր այն։
- **Ուղղում․** Եթե «EBITDA-positive ենք, ուրեմն cash-ով լավ ենք»-ն է պնդումը, կառուցիր bridge-ը. capex- կամ working-capital-ծանր բիզնեսը կարող է լինել EBITDA-positive և cash-negative։

### 6. Valuation method-fit + EV→equity bridge

- **Երբ է պետք․** Valuation-ին կամ fundraise-ին պետք է պաշտպանելի թիվ, կամ մեկ multiple է հաղորդվում որպես պատասխան։
- **Մեխանիզմը․** Ընտրիր method-ը, որ համապատասխանում է stage-ին․ comparable multiples (EV = metric × comp multiple)՝ benchmarked տեսքի համար, DCF (PV of unlevered FCF + terminal value)՝ որտեղ cash flow-ները forecast-ելի են։ Միշտ bridge արա EV → equity net debt-ով, բացահայտիր DCF-ի terminal-value share-ը, և comp multiple-ները համարիր verify-before-use fact։ Round-ի համար ավելացրու cap-table effect-ը․ post = pre + raise, investor % = raise ÷ post, price per share, founder dilution և ցանկացած pre-money pool shuffle։
- **Երբ չօգտագործել․** Երբ cash flow-ները forecast-ելի չեն (շատ վաղ stage) — DCF-ը false precision է. հենվիր multiples-ի և scenario range-ի վրա, և ասա դա։
- **Ուղղում․** Եթե EV-ն հաղորդված է որպես equity value, ավելացրու net-debt bridge-ը. եթե DCF-ը 80%+ terminal value է, բացահայտիր և stress արա growth/discount assumption-ները. եթե multiple հորինված է, նշիր verify-before-use։
