# Product and Project Management worked examples

## English

### Example A — PRD (problem-first, instrumented, DoD)

**Prompt.** Only 38% of new teams activate. The CEO says "build a guided onboarding wizard." Write the PRD.

**Senior answer.**

- **Problem & users.** New team admins reach a low-activation cliff: 38% of teams perform the first value action within 7 days. Users are admins setting up a workspace for the first time; the wizard is a candidate solution, not the problem — so the PRD owns the *activation outcome*, and the wizard is one bet against it.
- **Outcome.** Increase 7-day team activation from 38% → 45% within one quarter (the success metric, not "a wizard exists").
- **Non-goals.** Not redesigning the whole settings area; not changing billing/seat logic; not building per-role onboarding variants in v1. Naming non-goals is what keeps the build from sprawling.
- **Requirements.** Admin can (1) create a pre-filled sample project, (2) edit it, (3) invite a teammate, (4) dismiss the wizard and re-open it. The wizard is skippable and resumable.
- **Constraints.** Ships behind a feature flag to a 10% cohort first; must not increase signup→first-action latency for users who skip it.
- **Success metrics + instrumentation.** Primary: 7-day activation rate (event: first value action fired). Guardrail: time-to-first-action must not regress for the skip cohort. Secondary: invite-sent rate, sample-project-created rate. Each is an instrumented event, dated and owned, read in the running product — not a self-reported "done."
- **Rollout.** Flag → 10% cohort → read activation delta vs control for two weeks → proceed/iterate/kill.
- **Risks.** Wizard adds friction for power users (mitigate: skippable); sample data confuses admins (mitigate: clearly labeled, deletable).
- **Acceptance criteria (Definition of Done).** In the running product: admin creates, edits, invites, and deletes the sample project; the activation event fires and appears in the analytics pipeline; the skip path does not regress the guardrail. The item is **not done on "merged" or "demoed"** — it is done when these are observed working with real instrumentation reading.

**Why this passes.** It refuses the CEO's solution-first framing and re-roots the PRD in the *problem and the activation outcome* (38% → 45%), so the wizard is one bet, not the goal. It names explicit non-goals, which is the line that stops scope creep. Every success criterion is an **instrumented metric** (activation rate, time-to-first-action, invite rate) with an event behind it — no adjective like "easy onboarding." It carries a guardrail (skip-path latency must not regress), so a win on activation cannot quietly hurt power users. And the acceptance criteria are written as **verified-in-the-running-system** checks ("the activation event fires and appears in the pipeline"), not as a closed ticket — the Definition of Done is observable behavior, not a merge.

### Example B — RICE / WSJF prioritization with sensitivity

**Prompt.** We have three onboarding bets and one quarter. Which do we do, and prove it?

**Senior answer.** RICE = `(Reach × Impact × Confidence) / Effort`. Reach = teams affected per quarter; Impact on a 0.25–3 scale; Confidence as an evidence weight (0–1); Effort in person-weeks.

| Bet | Reach | Impact | Confidence | Effort | RICE |
|---|---|---|---|---|---|
| Invite template | 5,000 | 1 | 0.8 | 2 | (5000×1×0.8)/2 = **2,000** |
| Sample project | 4,000 | 2 | 0.6 | 4 | (4000×2×0.6)/4 = **1,200** |
| Guided setup | 3,000 | 3 | 0.5 | 8 | (3000×3×0.5)/8 = **562.5** |

Base rank: **invite template → sample project → guided setup.** But the score is a decision aid, not a verdict, so run a **sensitivity check** on the two soft inputs:
- *Confidence on sample project is a hunch.* Drop it from 0.6 → 0.3 (we have no usage data, only intuition): sample project = (4000×2×0.3)/4 = **600**.
- *The team re-estimates guided setup at 4 person-weeks, not 8* (they can reuse a component): guided setup = (3000×3×0.5)/4 = **1,125**.
- Under that honest re-estimate, **guided setup (1,125) now outranks sample project (600)** — the rank flips. So sample project is *not* a robust #2; its position depends entirely on a confidence number we cannot defend.

**Decision.** Ship invite template first (robust top, cheapest, highest confidence). Before committing to sample vs guided, run a one-week experiment to earn the confidence number on sample project, and get the delivery team's real estimate on guided setup. WSJF would be the better tool only if these were a delivery *queue* with a cost-of-delay clock; here they are uncertain product bets, so RICE with a sensitivity check fits.

**Why this passes.** Every number traces to the formula and is shown, not asserted — the reader can recompute all three RICE scores. Confidence is treated as an **evidence weight, not a constant**: the answer explicitly flags that sample project's 0.6 is a hunch and shows that dropping it to a defensible 0.3 collapses the bet. The **sensitivity check produces a real rank flip** (guided overtakes sample under an honest re-estimate), which is exactly how prioritization theater is avoided — the "winner" is tested, not assumed. It also picks the right tool on purpose (RICE for uncertain bets, WSJF for a cost-of-delay queue) and converts the soft inputs into the next action (run an experiment to earn confidence, get the team's estimate), rather than pretending the spreadsheet is the decision.

### Example C — Roadmap as bets with learning gates

**Prompt.** Leadership wants "a 12-month roadmap with dates." Activation is the priority. Give them the roadmap.

**Senior answer.** A 12-month dated promise list would be false precision and the wrong artifact. Reframe as bets by horizon, each with a hypothesis and a proceed/iterate/kill gate, against the activation outcome (38% → 45%, then 45% → 55%).

- **Now (committed, detailed).** *Invite template* — hypothesis: removing invite friction lifts team activation ≥3pts. Gate: if 10% cohort shows ≥2pt lift in two weeks → scale; <0 → kill; between → iterate copy. Dependencies mapped; on the critical path because analytics instrumentation must land first.
- **Next (planned, not dated to the day).** *Sample project* and *guided setup* — sequenced by the experiment in Example B: whichever earns its confidence first proceeds. Hypothesis per bet stated; gate is the activation delta vs control.
- **Later (directional).** *Role-based onboarding* and *re-engagement nudges* — pointed at the 45%→55% outcome, deliberately cheap to change. No dates; these are bets we may not make.

Each horizon also carries the **dependency note** (instrumentation precedes any activation bet — it is on the critical path) and the **decision cadence** (read cohort results biweekly at the gate review). Confidence is communicated by horizon, not by inventing day-level dates 9 months out.

**Why this passes.** It refuses the dated-promise-list framing and delivers a **bets-with-learning-gates** roadmap by horizon, which is the correct artifact — "now" is committed, "later" is directional and cheap to change. Every bet carries a **hypothesis and an explicit proceed/iterate/kill gate** tied to the activation outcome, so the roadmap can actually decide something at each review instead of just defending dates. It names the **critical-path dependency** (instrumentation must land before any activation bet can be measured) rather than discovering it after committing, and it sets a **decision cadence** (biweekly gate reviews). It also links to the prioritization (Example B) instead of asserting an order, so the sequence is earned, not declared.

## Հայերեն

### Օրինակ A — PRD (problem-first, instrumented, DoD)

**Prompt.** Նոր team-երի միայն 38%-ն է activate անում։ CEO-ն ասում է «build արա guided onboarding wizard»։ Գրիր PRD-ն։

**Senior պատասխան.**

- **Problem & users.** Նոր team admin-ները հասնում են low-activation cliff-ի․ team-երի 38%-ն է կատարում առաջին value action-ը 7 օրվա ընթացքում։ User-ները admin-ներ են, որ առաջին անգամ են workspace setup անում. wizard-ը candidate solution է, ոչ problem-ը — ուստի PRD-ն տիրում է *activation outcome*-ին, և wizard-ը մեկ bet է դրա դեմ։
- **Outcome.** Բարձրացնել 7-օրյա team activation-ը 38% → 45% մեկ եռամսյակում (success metric-ը, ոչ «wizard գոյություն ունի»)։
- **Non-goals.** Չ-redesign անել ողջ settings area-ն. չփոխել billing/seat logic-ը. v1-ում չկառուցել per-role onboarding variant-ներ։ Non-goals-ը անվանելն այն է, ինչ build-ը պահում է չտարածվելուց։
- **Requirements.** Admin-ը կարող է (1) ստեղծել pre-filled sample project, (2) edit անել, (3) invite անել teammate, (4) dismiss անել wizard-ը և կրկին բացել։ Wizard-ը skippable և resumable է։
- **Constraints.** Ship-վում է feature flag-ի հետևից նախ 10% cohort-ին. չպետք է մեծացնի signup→first-action latency-ն այն user-ների համար, որ skip են անում։
- **Success metrics + instrumentation.** Primary՝ 7-օրյա activation rate (event՝ first value action կրակած)։ Guardrail՝ time-to-first-action չպետք է regress անի skip cohort-ի համար։ Secondary՝ invite-sent rate, sample-project-created rate։ Ամեն մեկը instrumented event է, dated և owned, կարդացված running product-ում — ոչ self-reported «done»։
- **Rollout.** Flag → 10% cohort → կարդա activation delta-ն control-ի դեմ երկու շաբաթ → proceed/iterate/kill։
- **Risks.** Wizard-ը friction է ավելացնում power user-ի համար (mitigate՝ skippable). sample data-ն շփոթում է admin-ին (mitigate՝ հստակ label-ված, deletable)։
- **Acceptance criteria (Definition of Done).** Running product-ում․ admin-ը ստեղծում, edit, invite և delete է անում sample project-ը. activation event-ը կրակում է և երևում analytics pipeline-ում. skip path-ը չի regress անում guardrail-ը։ Item-ը **done չէ «merged»-ի կամ «demoed»-ի վրա** — done է, երբ սրանք դիտվում են աշխատելիս՝ իրական instrumentation-ը կարդալիս։

**Ինչու է անցնում gate-ը.** Այն մերժում է CEO-ի solution-first framing-ը և PRD-ն վերա-խարսխում *problem-ի և activation outcome-ի* վրա (38% → 45%), ուստի wizard-ը մեկ bet է, ոչ նպատակը։ Այն անվանում է բացահայտ non-goals, որը scope creep-ը կանգնեցնող գիծն է։ Ամեն success criterion **instrumented metric** է (activation rate, time-to-first-action, invite rate)՝ event-ով հետևում — ոչ ածական, ինչպիսին «easy onboarding»-ն է։ Այն կրում է guardrail (skip-path latency-ն չպետք է regress անի), ուստի activation-ի հաղթանակը չի կարող լուռ վնասել power user-ին։ Եվ acceptance criteria-ն գրված է որպես **verified-in-the-running-system** ստուգում («activation event-ը կրակում է և երևում pipeline-ում»), ոչ որպես փակված ticket — Definition of Done-ը դիտվող վարք է, ոչ merge։

### Օրինակ B — RICE / WSJF prioritization՝ sensitivity-ով

**Prompt.** Ունենք երեք onboarding bet և մեկ եռամսյակ։ Որո՞նք ենք անում, և ապացուցի՛ր։

**Senior պատասխան.** RICE = `(Reach × Impact × Confidence) / Effort`. Reach = եռամսյակում ազդված team-եր. Impact՝ 0.25–3 scale-ով. Confidence՝ evidence կշիռ (0–1). Effort՝ person-week-ով։

| Bet | Reach | Impact | Confidence | Effort | RICE |
|---|---|---|---|---|---|
| Invite template | 5,000 | 1 | 0.8 | 2 | (5000×1×0.8)/2 = **2,000** |
| Sample project | 4,000 | 2 | 0.6 | 4 | (4000×2×0.6)/4 = **1,200** |
| Guided setup | 3,000 | 3 | 0.5 | 8 | (3000×3×0.5)/8 = **562.5** |

Base rank՝ **invite template → sample project → guided setup։** Բայց score-ը decision aid է, ոչ դատավճիռ, ուստի արա **sensitivity check** երկու փափուկ input-ի վրա․
- *Sample project-ի confidence-ը hunch է։* Իջեցրու 0.6 → 0.3 (usage data չունենք, միայն ինտուիցիա)․ sample project = (4000×2×0.3)/4 = **600**։
- *Թիմը guided setup-ը վերագնահատում է 4 person-week, ոչ 8* (կարող են component reuse անել)․ guided setup = (3000×3×0.5)/4 = **1,125**։
- Այդ ազնիվ վերագնահատման տակ **guided setup-ը (1,125) հիմա գերազանցում է sample project-ին (600)** — rank-ը flip է անում։ Ուստի sample project-ը robust #2 *չէ*. նրա դիրքն ամբողջովին կախված է confidence թվից, որ չենք կարող պաշտպանել։

**Որոշում.** Ship արա invite template-ը առաջինը (robust top, ամենաէժան, ամենաբարձր confidence)։ Նախքան sample-ի դեմ guided-ին commit անելը, արա մեկ շաբաթ experiment՝ sample project-ի confidence թիվը վաստակելու, և ստացիր delivery team-ի իրական estimate-ը guided setup-ի վրա։ WSJF-ը ավելի լավ գործիք կլիներ միայն, եթե սրանք delivery *queue* լինեին cost-of-delay ժամացույցով. այստեղ դրանք uncertain product bet-եր են, ուստի RICE-ը sensitivity check-ով սազում է։

**Ինչու է անցնում gate-ը.** Ամեն թիվ հետագծվում է formula-ին և ցույց է տրված, ոչ պնդված — ընթերցողը կարող է վերահաշվել երեք RICE score-ն էլ։ Confidence-ը վերաբերվում է որպես **evidence կշիռ, ոչ constant**․ պատասխանը բացահայտ flag է անում, որ sample project-ի 0.6-ը hunch է, և ցույց է տալիս, որ այն 0.3 պաշտպանելի թվի իջեցնելը փլուզում է bet-ը։ **Sensitivity check-ը արտադրում է իրական rank flip** (guided-ը գերազանցում է sample-ին ազնիվ վերագնահատման տակ), որը հենց prioritization theater-ից խուսափելու եղանակն է — «հաղթողը» test-ված է, ոչ ենթադրված։ Այն նաև գիտակցորեն ընտրում է ճիշտ գործիքը (RICE՝ uncertain bet-երի, WSJF՝ cost-of-delay queue-ի համար) և փափուկ input-ները վերածում է հաջորդ action-ի (experiment՝ confidence վաստակելու, թիմի estimate ստանալու), ոչ թե ձևացնում, թե spreadsheet-ը որոշումն է։

### Օրինակ C — Roadmap՝ որպես learning gate-երով bet-եր

**Prompt.** Leadership-ը ուզում է «12-ամսյա roadmap date-երով»։ Activation-ն առաջնահերթ է։ Տուր նրանց roadmap-ը։

**Senior պատասխան.** 12-ամսյա dated promise list-ը false precision կլիներ և սխալ artifact։ Reframe արա որպես bet-եր horizon-ով, ամեն մեկը hypothesis-ով և proceed/iterate/kill gate-ով, activation outcome-ի դեմ (38% → 45%, հետո 45% → 55%)։

- **Now (committed, detailed).** *Invite template* — hypothesis՝ invite friction-ը հեռացնելը բարձրացնում է team activation-ը ≥3 կետ։ Gate՝ եթե 10% cohort-ը ցույց է տալիս ≥2 կետ lift երկու շաբաթում → scale. <0 → kill. միջև → iterate copy։ Dependency-ները քարտեզագրված. critical path-ի վրա է, որովհետև analytics instrumentation-ը պետք է առաջինը land անի։
- **Next (planned, ոչ օրը-օրին dated).** *Sample project* և *guided setup* — sequenced ըստ Օրինակ B-ի experiment-ի․ որն առաջինը վաստակում է իր confidence-ը, proceed է անում։ Ամեն bet-ի hypothesis-ը նշված. gate-ը activation delta-ն է control-ի դեմ։
- **Later (directional).** *Role-based onboarding* և *re-engagement nudge-եր* — ուղղված 45%→55% outcome-ին, գիտակցորեն էժան փոխվող։ Date չկա. սրանք bet-եր են, որ գուցե չանենք։

Ամեն horizon նաև կրում է **dependency note**-ը (instrumentation-ը նախորդում է ցանկացած activation bet-ին — այն critical path-ի վրա է) և **decision cadence**-ը (կարդա cohort արդյունքները երկշաբաթը մեկ gate review-ին)։ Confidence-ը հաղորդվում է horizon-ով, ոչ 9 ամիս առաջ օրը-օրին date հորինելով։

**Ինչու է անցնում gate-ը.** Այն մերժում է dated-promise-list framing-ը և մատուցում **bets-with-learning-gates** roadmap horizon-ով, որը ճիշտ artifact-ն է — «now»-ը committed է, «later»-ը directional և էժան փոխվող։ Ամեն bet կրում է **hypothesis և բացահայտ proceed/iterate/kill gate**՝ կապված activation outcome-ին, ուստի roadmap-ը կարող է իրականում ինչ-որ բան որոշել ամեն review-ին, ոչ պարզապես date-եր պաշտպանել։ Այն անվանում է **critical-path dependency**-ն (instrumentation-ը պետք է land անի մինչև ցանկացած activation bet չափվելը), ոչ թե հայտնաբերում commit անելուց հետո, և սահմանում է **decision cadence** (երկշաբաթյա gate review)։ Այն նաև կապվում է prioritization-ին (Օրինակ B), ոչ թե պնդում հերթականություն, ուստի sequence-ը վաստակած է, ոչ հայտարարված։
