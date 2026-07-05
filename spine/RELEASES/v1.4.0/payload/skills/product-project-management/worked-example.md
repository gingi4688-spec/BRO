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

### Example D — delivery plan, critical path, and launch readout

**Prompt.** The invite-template and guided-setup bets are approved. Engineering asks "when does onboarding v1 ship?" Leadership wants a date. Build the delivery plan and show how you would read out the launch.

**Senior answer.** A date is an *output* of a dependency network and a risk buffer, not a wish. Lay out tasks, dependencies, and estimates, find the **critical path** (the longest dependency chain — it sets the floor date; everything off it has slack), then commit a date with an explicit buffer and a re-baseline rule.

| # | Task | Depends on | Est (working days) |
|---|---|---|---|
| A | Analytics instrumentation (activation event) | — | 5 |
| B | Invite-template UI | A | 4 |
| C | Sample-project generator | A | 6 |
| D | Guided-setup flow | C | 5 |
| E | Feature-flag + 10% cohort wiring | B, D | 2 |
| F | QA + verify-in-running (each state, each role) | E | 3 |

Critical path = **A → C → D → E → F = 5+6+5+2+3 = 21 working days** (~4.5 weeks). B (invite UI) is *off* the critical path: A→B→E = 5+4+2 = 11, so B carries **21 − 11 = 10 days of slack** — it will not move the date unless it slips more than 10 days. So the lever to pull the date *in* is the C→D chain (new build), not B.

Commit: "onboarding v1 to the 10% cohort in **5 weeks** — 21 critical-path days + ~15% buffer placed on the two riskiest tasks (C and D are new-build and carry the most estimate uncertainty)." State the **re-baseline rule up front**: if a critical-path task slips such that the chain exceeds the buffer, the date moves and leadership hears it at the gate review — the date is re-derived, not defended.

*When a dependency slips:* instrumentation (A) lands 3 days late. A is on the critical path and feeds everything, so the whole chain shifts +3 → floor = 24 days; B's 10-day float absorbs A's push so B still is not the constraint. Re-baseline, communicate, and — because A blocks *measurement*, not just build — flag that no activation bet can be **read** until A is live, so slipping A delays the learning too, not only the ship.

*Launch readout (learning gate, 2 weeks after the 10% cohort)* — hypothesis → guardrail → result → decision. Hypothesis: onboarding v1 lifts 7-day activation ≥3 pts (38% → 41%+). Guardrail: skip-cohort time-to-first-action must not regress. Result (to be **measured**, not asserted): activation 38% → 42% (+4 pts, CI excludes 0), guardrail flat. Decision by the pre-set gate: +4 pts ≥ the +2 pt scale threshold → **scale to 100%**; had it been < 0 → kill; between → iterate copy. The decision was bound to the threshold *before* the number arrived, so the readout decides rather than rationalizes.

**Why this passes.** The date is **derived from the critical path** (A→C→D→E→F = 21 d), not asserted, and the answer proves B is off it with a computed 10-day slack — so it targets the right lever (C→D) to compress. It commits a date *with a named buffer tied to the two riskiest tasks* and a **re-baseline rule stated up front**, so a slip re-derives the date instead of triggering a defense. It works a concrete dependency slip (A +3) and notes A blocks *measurement* as well as build. The launch readout is a real learning loop — hypothesis, guardrail, result, and a decision **bound to a pre-set threshold** — which is exactly the Delivery-control and Learning dimensions the rubric scores and the earlier examples did not show end to end.

### Example E — WSJF for a delivery queue

**Prompt.** A platform team has a backlog of ready-to-build items and limited capacity, and must sequence them to minimize cost of delay. RICE is the wrong tool here (these are not uncertain product bets — they are a defined delivery queue). Do the WSJF.

**Senior answer.** WSJF (Weighted Shortest Job First) is the right tool for a **delivery queue with cost-of-delay economics** (SAFe): sequence to maximize value delivered per unit of time by doing the highest **Cost of Delay ÷ Job Size** first. Unlike RICE (uncertain bets weighted by confidence), WSJF assumes the items are defined and asks "what is the economic penalty of *not* doing this now, per unit of effort."

**Cost of Delay (CoD) = User/Business Value + Time Criticality + Risk-Reduction / Opportunity-Enablement.** Score each on a relative scale (Fibonacci 1–13 is common); Job Size is relative effort. WSJF = CoD ÷ Job Size, scored *relatively* across the set, not in absolute units.

| Item | Value | Time-crit | Risk/Opp | CoD (sum) | Job Size | WSJF = CoD/Size |
|---|---|---|---|---|---|---|
| A: SSO (blocking 2 enterprise deals) | 8 | 13 | 5 | 26 | 5 | **5.2** |
| B: Big analytics rebuild | 13 | 3 | 8 | 24 | 21 | **1.14** |
| C: Compliance fix (audit deadline) | 5 | 13 | 13 | 31 | 3 | **10.3** |
| D: Nice-to-have UI polish | 3 | 2 | 1 | 6 | 3 | **2.0** |

Sequence by descending WSJF: **C (10.3) → A (5.2) → D (2.0) → B (1.14).**

Read it: **C first** — not because its raw value is highest (it is low, 5) but because it is small (Size 3) and its Time-Criticality + Risk are maxed (a compliance deadline), so the cost of delaying it *per unit of effort* is huge. **B last** despite the highest raw *value* (13) — it is a 21-point job, so its cost of delay per unit of effort is the worst; a big, valuable-but-not-urgent item correctly waits. That inversion (high-value B goes last) is exactly the insight WSJF gives that a value-only ranking misses: **a small urgent item beats a big valuable one when capacity is the constraint.**

Caveats: WSJF is a *relative* prioritizer for a defined queue — if items are still uncertain bets, use RICE (Example B); re-score when Time-Criticality changes (a passing deadline changes C). The numbers are relative team estimates to calibrate, not facts.

**Why this passes.** It picks WSJF for its actual use case — a **defined delivery queue with cost-of-delay economics**, explicitly distinguished from RICE's uncertain-bet case — and computes it correctly: **CoD = Value + Time-Criticality + Risk/Opportunity, ÷ Job Size**, scored relatively. The table produces the **counter-intuitive-but-correct** result (small urgent compliance item first at WSJF 10.3; big high-*value* analytics rebuild last at 1.14) — exactly the economic insight WSJF exists to surface: shortest weighted job first beats value-only ranking under a capacity constraint. It flags the relative-scoring and re-score-on-deadline caveats and marks the numbers as team-calibrated estimates, closing the WSJF gap the earlier RICE example named but never worked.

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

### Օրինակ D — delivery plan, critical path և launch readout

**Prompt.** Invite-template և guided-setup bet-երը հաստատված են։ Engineering-ը հարցնում է «ե՞րբ է ship լինում onboarding v1-ը»։ Leadership-ը date է ուզում։ Կառուցիր delivery plan-ը և ցույց տուր, թե ինչպես կկարդաս launch-ի readout-ը։

**Senior պատասխան.** Date-ը dependency network-ի ու risk buffer-ի *output* է, ոչ ցանկություն։ Դասավորիր task-երը, dependency-ները և estimate-ները, գտիր **critical path**-ը (ամենաերկար dependency շղթան — այն սահմանում է floor date-ը. դրանից դուրս ամեն ինչ slack ունի), հետո commit արա date՝ բացահայտ buffer-ով և re-baseline կանոնով։

| # | Task | Կախված է | Est (աշխ. օր) |
|---|---|---|---|
| A | Analytics instrumentation (activation event) | — | 5 |
| B | Invite-template UI | A | 4 |
| C | Sample-project generator | A | 6 |
| D | Guided-setup flow | C | 5 |
| E | Feature-flag + 10% cohort wiring | B, D | 2 |
| F | QA + verify-in-running (ամեն state, ամեն role) | E | 3 |

Critical path = **A → C → D → E → F = 5+6+5+2+3 = 21 աշխատանքային օր** (~4.5 շաբաթ)։ B (invite UI) critical path-ից *դուրս* է․ A→B→E = 5+4+2 = 11, ուստի B-ն կրում է **21 − 11 = 10 օր slack** — չի շարժի date-ը, քանի դեռ չի slip անում 10 օրից ավելի։ Ուստի date-ը *ներս* քաշելու lever-ը C→D շղթան է (new build), ոչ B-ն։

Commit՝ «onboarding v1 10% cohort-ին **5 շաբաթում** — 21 critical-path օր + ~15% buffer դրված երկու ամենառիսկային task-ի վրա (C և D new-build են և կրում են estimate-ի ամենաշատ անորոշությունը)»։ Ասա **re-baseline կանոնը նախապես**․ եթե critical-path task-ը slip է անում այնպես, որ շղթան գերազանցի buffer-ը, date-ը շարժվում է, և leadership-ը լսում է gate review-ին — date-ը վերա-բխեցվում է, ոչ պաշտպանվում։

*Երբ dependency-ն slip է անում․* instrumentation-ը (A) land է անում 3 օր ուշ։ A-ն critical path-ի վրա է և սնում է ամեն ինչ, ուստի ողջ շղթան շարժվում է +3 → floor = 24 օր. B-ի 10-օրյա float-ը կլանում է A-ի հրումը, ուստի B-ն դեռ constraint-ը չէ։ Re-baseline արա, հաղորդիր, և — քանի որ A-ն block է անում *չափումը*, ոչ միայն build-ը — flag արա, որ ոչ մի activation bet չի կարող **կարդացվել**, մինչև A-ն live չլինի, ուստի A-ի slip-ը հետաձգում է նաև learning-ը, ոչ միայն ship-ը։

*Launch readout (learning gate, 10% cohort-ից 2 շաբաթ հետո)* — hypothesis → guardrail → result → decision։ Hypothesis՝ onboarding v1-ը բարձրացնում է 7-օրյա activation-ը ≥3 կետ (38% → 41%+)։ Guardrail՝ skip-cohort-ի time-to-first-action-ը չպետք է regress անի։ Result (պետք է **չափվի**, ոչ պնդվի)՝ activation 38% → 42% (+4 կետ, CI-ն բացառում է 0), guardrail հարթ։ Որոշում ըստ pre-set gate-ի՝ +4 կետ ≥ +2 կետ scale threshold → **scale 100%**. եթե լիներ < 0 → kill. միջև → iterate copy։ Որոշումը կապված էր threshold-ին *նախքան* թիվը գար, ուստի readout-ը որոշում է, ոչ rationalize անում։

**Ինչու է անցնում gate-ը.** Date-ը **բխեցված է critical path-ից** (A→C→D→E→F = 21 օր), ոչ պնդված, և պատասխանը ապացուցում է, որ B-ն դրանից դուրս է՝ հաշված 10-օրյա slack-ով, ուստի թիրախավորում է ճիշտ lever-ը (C→D) սեղմելու։ Այն commit է անում date *երկու ամենառիսկային task-ին կապված buffer-ով* և **re-baseline կանոն նախապես ասված**, ուստի slip-ը վերա-բխեցնում է date-ը, ոչ թե պաշտպանություն հրահրում։ Այն worked է անում կոնկրետ dependency slip (A +3) և նշում, որ A-ն block է անում *չափումը* build-ի հետ մեկտեղ։ Launch readout-ը իրական learning loop է — hypothesis, guardrail, result և decision **կապված pre-set threshold-ին** — հենց Delivery-control ու Learning dimension-ները, որ rubric-ը գնահատում է, իսկ նախորդ example-ները ցույց չէին տալիս ծայրից ծայր։

### Օրինակ E — WSJF delivery queue-ի համար

**Prompt.** Platform team-ը ունի ready-to-build item-ների backlog և սահմանափակ capacity, և պիտի sequence անի դրանք՝ cost of delay-ը minimize անելու։ RICE-ը այստեղ սխալ գործիք է (սրանք uncertain product bet չեն — defined delivery queue են)։ Արա WSJF-ը։

**Senior պատասխան.** WSJF (Weighted Shortest Job First) ճիշտ գործիքն է **cost-of-delay economics-ով delivery queue-ի** համար (SAFe)․ sequence արա՝ maximize անելով մեկ միավոր ժամանակում delivered value-ն, անելով ամենաբարձր **Cost of Delay ÷ Job Size**-ը նախ։ Ի տարբերություն RICE-ի (uncertain bet, confidence-ով weighted), WSJF-ը ենթադրում է item-ները defined են և հարցնում «ո՞րն է *չանելու* economic penalty-ն հիմա, մեկ միավոր effort-ի»։

**Cost of Delay (CoD) = User/Business Value + Time Criticality + Risk-Reduction / Opportunity-Enablement.** Score արա ամեն մեկը relative scale-ով (Fibonacci 1–13 սովորական է). Job Size-ը relative effort է։ WSJF = CoD ÷ Job Size, scored *relatively* set-ի վրա, ոչ absolute միավորով։

| Item | Value | Time-crit | Risk/Opp | CoD (sum) | Job Size | WSJF = CoD/Size |
|---|---|---|---|---|---|---|
| A: SSO (block է անում 2 enterprise deal) | 8 | 13 | 5 | 26 | 5 | **5.2** |
| B: Մեծ analytics rebuild | 13 | 3 | 8 | 24 | 21 | **1.14** |
| C: Compliance fix (audit deadline) | 5 | 13 | 13 | 31 | 3 | **10.3** |
| D: Nice-to-have UI polish | 3 | 2 | 1 | 6 | 3 | **2.0** |

Sequence ըստ նվազող WSJF-ի՝ **C (10.3) → A (5.2) → D (2.0) → B (1.14).**

Կարդա․ **C նախ** — ոչ որովհետև իր raw value-ն ամենաբարձրն է (ցածր է, 5), այլ որովհետև փոքր է (Size 3) և իր Time-Criticality + Risk maxed են (compliance deadline), ուստի այն հետաձգելու cost-ը *մեկ միավոր effort-ի* հսկայական է։ **B վերջին** չնայած ամենաբարձր raw *value*-ին (13) — 21-point job է, ուստի իր cost of delay-ը մեկ միավոր effort-ի ամենավատն է. մեծ, արժեքավոր-բայց-ոչ-urgent item-ը ճիշտ սպասում է։ Այդ inversion-ը (high-value B-ն վերջին) հենց այն insight-ն է, որ WSJF-ը տալիս է, իսկ value-only ranking-ը բաց է թողնում․ **փոքր urgent item-ը հաղթում է մեծ արժեքավորին, երբ capacity-ն constraint-ն է։**

Caveat-ներ․ WSJF-ը *relative* prioritizer է defined queue-ի. եթե item-ները դեռ uncertain bet են, օգտագործիր RICE (Օրինակ B). re-score արա, երբ Time-Criticality-ն փոխվում է (անցնող deadline-ը փոխում է C-ն)։ Թվերը relative team estimate են՝ calibrate անելու, ոչ փաստ։

**Ինչու է անցնում gate-ը.** Այն ընտրում է WSJF-ը իր իրական use case-ի համար — **defined delivery queue cost-of-delay economics-ով**, բացահայտ տարբերված RICE-ի uncertain-bet դեպքից — և հաշվում ճիշտ․ **CoD = Value + Time-Criticality + Risk/Opportunity, ÷ Job Size**, scored relatively։ Table-ը արտադրում է **counter-intuitive-բայց-ճիշտ** result (փոքր urgent compliance item նախ WSJF 10.3-ով. մեծ high-*value* analytics rebuild վերջին 1.14-ով) — հենց economic insight-ը, որի համար WSJF-ը գոյություն ունի․ shortest weighted job first-ը հաղթում է value-only ranking-ին capacity constraint-ի տակ։ Այն flag է անում relative-scoring-ի ու re-score-on-deadline caveat-ները և թվերը նշում team-calibrated estimate, փակելով WSJF gap-ը, որ նախորդ RICE example-ը անվանեց, բայց երբեք worked չարեց։
