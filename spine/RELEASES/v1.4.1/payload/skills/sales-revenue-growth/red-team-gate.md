# Sales, Revenue, and Growth red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (ICP definition, funnel/forecast model, deal review, pricing/packaging memo, growth-loop map). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Invented benchmark** — a conversion rate, CAC, or "industry average" asserted with no source. Replace with the user's segmented data, a labeled assumption, or a formula with a placeholder.
- **Blended forecast** — a single growth/pipeline number with no stage-by-stage math and no segmentation. Rebuild stage by stage and segment by channel/cohort.
- **"More leads" for a mid-funnel bottleneck** — adding lead volume when win rate or qualification is the binding stage. Sensitivity-test and redirect to the binding stage.
- **Forecast on a champion alone** — a deal at commit with no economic buyer and no decision process. Downgrade until the hard signals close.
- **Cost-plus or competitor-match pricing** — a price set from cost or a competitor's number, with no value metric or WTP. Reset to value-based.
- **LTV on revenue** — lifetime value computed on top-line, not gross margin. Recompute on gross margin and reconcile with finance.
- **Reflexive discount** — price cut with nothing traded back, or a below-floor discount with no owner sign-off. Make it a trade; route below-floor to the owner.
- **Scaling before PMF** — acquisition spend added onto weak retention. Gate on cohort-retention/NRR evidence first.
- **Tactic mislabeled a loop** — a one-off campaign or invite button called self-reinforcing. Require the reinvestment step to close.
- **Bookings without revenue quality** — a headline growth number with no retention, churn, NRR, or net-new-vs-expansion split.

### Reviewer probes (ask these of any answer)

- Is there a named, falsifiable ICP (firmographics + pain + trigger + disqualifiers), or is the implied answer "everyone"? Was it validated against won and churned accounts?
- Is the funnel computed stage by stage with the arithmetic shown and segmented, and which stage is the binding constraint by sensitivity test — not by assertion?
- Does the deal forecast rest on MEDDICC hard signals (economic buyer + decision process present), or on champion enthusiasm? Is it multi-threaded?
- Does the price tie to a value metric that scales with delivered value, or is it cost-plus / a competitor copy? If usage-based, is bill shock guarded?
- Is LTV on gross margin, and were the economics (margin, LTV/CAC, payback) reconciled with `finance-unit-economics` before any number was committed?
- Is every discount a trade with a defended floor, and are below-floor asks routed to the deal owner with the margin impact?
- Is scaling gated on retention/PMF evidence (cohort retention, NRR ≥ 100% in segment), or is spend being poured onto a leaky bucket?
- Is the claimed loop's reinvestment step real (output → new qualified input), with saturation and abuse guards, or is it a campaign in disguise?
- Is revenue reported with retention, churn, NRR, and a net-new-vs-expansion split, with logo churn separated from revenue churn?
- Did the answer invent any conversion rate, CAC, price, or benchmark, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (ICP-ի սահմանում, funnel/forecast model, deal review, pricing/packaging memo, growth-loop map)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Հորինված benchmark** — conversion rate, CAC կամ «industry average» պնդված առանց աղբյուրի։ Փոխարինիր user-ի segment արված data-ով, label արված assumption-ով կամ placeholder-ով formula-ով։
- **Blended forecast** — մեկ growth/pipeline թիվ՝ առանց stage-by-stage math-ի և segmentation-ի։ Վերակառուցիր stage-by-stage և segment արա channel/cohort-ով։
- **«Ավելի շատ lead» mid-funnel bottleneck-ի համար** — lead volume ավելացնել, երբ win rate-ը կամ qualification-ն է binding stage-ը։ Sensitivity-test արա և redirect արա binding stage-ին։
- **Forecast միայն champion-ի վրա** — deal commit-ին՝ առանց economic buyer-ի և decision process-ի։ Downgrade արա, մինչև hard signal-ները փակվեն։
- **Cost-plus կամ competitor-match pricing** — գին՝ դրված cost-ից կամ մրցակցի թվից, առանց value metric-ի կամ WTP-ի։ Reset արա value-based-ի։
- **LTV revenue-ի վրա** — lifetime value հաշված top-line-ի, ոչ gross margin-ի վրա։ Վերահաշվիր gross margin-ի վրա և հաշտեցրու finance-ի հետ։
- **Reflexive discount** — գին կտրած՝ ոչինչ փոխանակած, կամ floor-ից ցածր discount՝ առանց owner-ի sign-off-ի։ Դարձրու trade. floor-ից ցածրը ուղղորդիր owner-ին։
- **Scaling before PMF** — acquisition spend ավելացրած թույլ retention-ի վրա։ Gate արա cohort-retention/NRR evidence-ի վրա նախ։
- **Tactic-ը սխալ պիտակված loop** — one-off campaign կամ invite button կոչվում է self-reinforcing։ Պահանջիր, որ reinvestment step-ը փակվի։
- **Bookings առանց revenue quality-ի** — headline աճի թիվ՝ առանց retention-ի, churn-ի, NRR-ի կամ net-new-ընդդեմ-expansion split-ի։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Կա՞ անվանված, falsifiable ICP (firmographic + pain + trigger + disqualifier), թե ենթադրվող պատասխանը «բոլորն» է։ Validate արվա՞ծ է won և churned account-ների դեմ։
- Funnel-ը հաշվա՞ծ է stage-by-stage՝ arithmetic-ը ցույց տրված և segment արված, և որ stage-ն է binding constraint-ը sensitivity test-ով — ոչ պնդմամբ։
- Deal forecast-ը հենվու՞մ է MEDDICC hard signal-ների վրա (economic buyer + decision process կա), թե champion-ի ոգևորության։ Multi-threaded է՞։
- Գինը կապվու՞մ է value metric-ին, որ scale է անում delivered value-ի հետ, թե cost-plus / մրցակից-պատճեն է։ Եթե usage-based է, bill shock-ը guard արվա՞ծ է։
- LTV-ն gross margin-ի՞ վրա է, և economics-ը (margin, LTV/CAC, payback) հաշտեցվա՞ծ է `finance-unit-economics`-ի հետ նախքան որևէ թիվ commit անելը։
- Ամեն discount trade է՞՝ պաշտպանված floor-ով, և floor-ից ցածր ask-երը ուղղորդվա՞ծ են deal owner-ին՝ margin impact-ով։
- Scaling-ը gated է՞ retention/PMF evidence-ի վրա (cohort retention, NRR ≥ 100% segment-ում), թե spend-ը լցվում է ծակ դույլի վրա։
- Պնդված loop-ի reinvestment step-ը իրակա՞ն է (output → նոր qualified input)՝ saturation և abuse guard-ով, թե campaign է քողարկված։
- Revenue-ն report-վա՞ծ է retention-ով, churn-ով, NRR-ով և net-new-ընդդեմ-expansion split-ով՝ logo churn-ը բաժանված revenue churn-ից։
- Պատասխանը հորինե՞ց conversion rate, CAC, price կամ benchmark, և հայերենը equal-depth ու punctuation-clean է՞։
