# Finance and Unit Economics red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (unit-economics model, cohort table, payback/LTV model, 3-statement forecast, valuation, cap table). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Markup reported as margin** — a figure quoted with no base, or a markup-over-cost called a margin-over-price. Restate over the correct base.
- **Blended CAC justifying more paid spend** — a single "CAC" or a strong blended LTV:CAC used for a marginal-spend decision. Split paid vs blended; decide on paid-channel economics.
- **`1/churn` LTV on revenue** — LTV with no horizon cap, on revenue not contribution margin, with no survival curve or discounting. Rebuild on CM with a capped horizon.
- **ARR over negative contribution margin** — top-line growth celebrated with no contribution-margin line beneath it. Require the CM line; if negative, pause scale.
- **EBITDA presented as cash** — "EBITDA-positive so cash is fine" with no bridge. Require the EBITDA → FCF bridge (cash taxes, capex, ΔWC).
- **Profit-vs-cash collapse** — runway or solvency argued off net income; revenue recognized on cash receipt with no deferred revenue. Separate accrual, cash, and recognition.
- **Top-down forecast** — a forecast built from a market-share percentage with no driver chain. Require bottom-up units × price × conversion × capacity.
- **3-statement that does not tie** — net income not flowing to retained earnings, cash flow not reconciling to balance-sheet cash, or the sheet not balancing. Require the tie.
- **Valuation without the bridge or terminal-value disclosure** — EV reported as equity value, or a DCF dominated by terminal value with no disclosure. Require EV → equity via net debt and the terminal-value share.
- **Dilution math ignoring the pool shuffle** — founder ownership with no option pool, or a pre-money pool quietly diluting only founders. Require fully-diluted math and price per share.
- **Invented inputs** — a CAC, churn, margin, multiple, WACC, or benchmark asserted with no source. Use a placeholder/formula or mark verify-before-use.

### Reviewer probes (ask these of any answer)

- Show the contribution margin: `price − unit-scaling variable cost` = ? If the answer leads with revenue or ARR and never computes CM, the unit is unproven.
- Is this CAC paid or blended, and which one is driving the scale decision? If a "spend more" case rests on blended CAC, recompute on paid CAC.
- Is LTV built on contribution margin with a horizon cap and a survival curve, or is it `1/churn` on revenue? What does discounting do to it?
- Is LTV:CAC computed on a mature, cohort-split base, or on a blended pre-PMF average? Where is the cohort-by-month / by-channel split?
- For an "EBITDA-positive, we self-fund" claim: where is the EBITDA → FCF bridge, and what is the gap from capex and working capital?
- Is runway argued off cash or off net income? Is revenue recognized when earned, with deferred revenue carried for prepays?
- Is the forecast a bottom-up driver chain, or a percentage of a big market? What units, price, conversion, and capacity sit behind it?
- Does the 3-statement model actually tie — NI → retained earnings, cash flow → balance-sheet cash, assets = liabilities + equity?
- For a valuation: is the method named and fit to the stage? Is EV bridged to equity via net debt? What share of a DCF is terminal value?
- For a raise: is dilution shown on the fully-diluted base with price per share, and does the option-pool shuffle dilute founders or the investor?
- Did the answer invent any CAC, churn, margin, multiple, WACC, or benchmark — and is the Armenian equal-depth and punctuation-clean?
- Is an irreversible high-stakes money step (signed raise, priced round, large irreversible spend) being presented as decided, or routed to a human owner with math and options?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (unit-economics model, cohort table, payback/LTV model, 3-statement forecast, valuation, cap table)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Markup հաղորդված որպես margin** — թիվ նշված առանց base-ի, կամ markup-over-cost կոչված margin-over-price։ Վերաշարադրիր ճիշտ base-ի վրա։
- **Blended CAC, որ արդարացնում է ավելի շատ paid ծախս** — մեկ «CAC» կամ ուժեղ blended LTV:CAC՝ օգտագործված marginal-spend որոշման համար։ Split արա paid ընդդեմ blended. որոշիր paid-channel economics-ով։
- **`1/churn` LTV revenue-ի վրա** — LTV առանց horizon cap-ի, revenue-ի վրա, ոչ contribution margin-ի, առանց survival curve-ի կամ discounting-ի։ Վերակառուցիր CM-ի վրա capped horizon-ով։
- **ARR բացասական contribution margin-ի վրա** — top-line աճ տոնված առանց ներքևում contribution-margin տողի։ Պահանջիր CM տողը. եթե բացասական է, scale-ը pause արա։
- **EBITDA ներկայացված որպես cash** — «EBITDA-positive ենք, ուրեմն cash-ով լավ ենք»՝ առանց bridge-ի։ Պահանջիր EBITDA → FCF bridge-ը (cash taxes, capex, ΔWC)։
- **Profit-ընդդեմ-cash փլուզում** — runway-ն կամ solvency-ն վիճարկված net income-ով. revenue ճանաչված cash receipt-ի վրա առանց deferred revenue-ի։ Բաժանիր accrual, cash և recognition։
- **Top-down forecast** — forecast կառուցված market-share տոկոսից առանց driver chain-ի։ Պահանջիր bottom-up units × price × conversion × capacity։
- **3-statement, որ չի կապվում** — net income-ը չի գնում retained earnings, cash flow-ն չի հաշտվում balance-sheet cash-ի հետ, կամ sheet-ը չի հավասարակշռվում։ Պահանջիր tie-ը։
- **Valuation առանց bridge-ի կամ terminal-value բացահայտման** — EV հաղորդված որպես equity value, կամ DCF գերակշռված terminal value-ով առանց բացահայտման։ Պահանջիր EV → equity net debt-ով և terminal-value share-ը։
- **Dilution math, որ անտեսում է pool shuffle-ը** — founder ownership առանց option pool-ի, կամ pre-money pool, որ լուռ նոսրացնում է միայն founder-ներին։ Պահանջիր fully-diluted math և price per share։
- **Հորինված input-ներ** — CAC, churn, margin, multiple, WACC կամ benchmark պնդված առանց աղբյուրի։ Օգտագործիր placeholder/formula կամ նշիր verify-before-use։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ցույց տուր contribution margin-ը․ `price − unit-scaling variable cost` = ? Եթե պատասխանը սկսում է revenue-ից կամ ARR-ից և երբեք CM չի հաշվում, unit-ը ապացուցված չէ։
- Այս CAC-ը paid է, թե blended, և որն է driving scale որոշումը։ Եթե «ավելի ծախսենք» case-ը հենվում է blended CAC-ի վրա, վերահաշվիր paid CAC-ով։
- LTV-ն կառուցված է contribution margin-ի վրա horizon cap-ով և survival curve-ով, թե `1/churn` է revenue-ի վրա։ Discounting-ն ինչ է անում նրան։
- LTV:CAC-ը հաշված է mature, cohort-split base-ի վրա, թե blended pre-PMF average-ի։ Որտեղ է cohort-by-month / by-channel split-ը։
- «EBITDA-positive ենք, ինքնաֆինանսավորվում ենք» պնդման համար․ որտեղ է EBITDA → FCF bridge-ը, և ինչ է gap-ը capex-ից և working capital-ից։
- Runway-ն վիճարկված է cash-ից, թե net income-ից։ Revenue-ն ճանաչվա՞ծ է, երբ վաստակվել է, deferred revenue-ով prepay-ների համար։
- Forecast-ը bottom-up driver chain է, թե մեծ market-ի տոկոս։ Ինչ units, price, conversion և capacity են նստած նրա տակ։
- 3-statement model-ն իրականում կապվո՞ւմ է — NI → retained earnings, cash flow → balance-sheet cash, assets = liabilities + equity։
- Valuation-ի համար․ method-ն անվանվա՞ծ է և fit է stage-ին։ EV-ն bridge-ված է՞ equity-ի net debt-ով։ DCF-ի որ share-ն է terminal value։
- Round-ի համար․ dilution-ը ցույց տրվա՞ծ է fully-diluted base-ի վրա price per share-ով, և option-pool shuffle-ը նոսրացնում է founder-ներին, թե investor-ին։
- Պատասխանը հորինե՞ց որևէ CAC, churn, margin, multiple, WACC կամ benchmark — և հայերենը equal-depth ու punctuation-clean է՞։
- Անդառնալի, բարձր-ռիսկ փողային քայլը (ստորագրված raise, priced round, մեծ անդառնալի ծախս) ներկայացվա՞ծ է որպես որոշված, թե ուղղորդված մարդ-տիրոջը math-ով և option-ներով։
