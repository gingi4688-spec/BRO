---
name: "product-project-management"
description: >-
  use when the work is product discovery, prioritization (RICE/WSJF), PRD/spec writing, roadmapping, delivery planning (dependencies, critical path, risk burndown), launch and learning loops, or stakeholder/scope alignment — for decisions, critique, planning, diagnostics, artifacts, teaching, or evaluation. use as lead when this domain owns the central deliverable (PRD, prioritization sheet, roadmap, delivery plan, launch readout). do not use as lead when another skill owns the main artifact and PM is only one input — then support it; route market/pricing/org-design decisions to business-strategy-operations. հայերեն՝ օգտագործիր product discovery-ի, prioritization-ի (RICE/WSJF), PRD-ի, roadmap-ի, delivery plan-ի, launch-ի և scope-ի համաձայնեցման աշխատանքի համար։
---

# Product and Project Management / Product և project management

## English

**Scope.** In: product discovery (opportunity-solution trees, problem framing), prioritization (RICE, WSJF, cost-of-delay), PRD/spec writing, roadmapping as a sequence of bets with learning gates, delivery planning (dependency maps, critical path, risk burndown, decision cadence), launch and post-launch learning, and scope/stakeholder alignment. Out: market and competitive strategy, pricing, business-model and org-design decisions (`business-strategy-operations` owns those), system/data-model design (`software-systems-architecture` owns it), and screen/flow design (`ui-page-structure-design` owns it). This skill connects customer problem → product bet → delivery plan → learning loop, so a team ships the right thing with visible tradeoffs and a defined way to know it worked.

**Leads / Supports.** Lead when the central deliverable is product- or delivery-shaped: a PRD/opportunity brief, a RICE/WSJF prioritization sheet, a roadmap, a delivery/dependency plan, a launch-and-learning readout. Support when another skill owns the artifact and PM is one input — e.g. architecture owns the system design and you supply the sequencing and the acceptance criteria; UI owns the flow and you supply the PRD and success metric.

Conflict rules:
- **Strategy / pricing / market → route to `business-strategy-operations`, do not decide here.** "Which segment, what price, build-vs-buy, what business model" is strategy. PM owns *how we discover, sequence, spec, and ship a bet inside a chosen strategy* — it does not set the strategy. The trigger boundary: if the decision changes the company's market/pricing/org, it is strategy; if it changes what we build next and how we prove it, it is PM.
- **PM ≠ PO ≠ PgM → name the role, do not blur them.** Product Manager owns the *why/what* (problem, outcome, prioritized bets). Product Owner owns the *backlog and acceptance* inside delivery (refined stories, accept/reject against criteria). Program Manager owns *cross-team coordination, dependencies, and schedule risk* across many workstreams. Conflating them produces a roadmap nobody can execute or a backlog with no outcome behind it.
- **Estimates and capacity → coordinate with the delivery team, do not impose.** Effort and sequencing claims are the team's to make; PM frames the priority and the cost of delay, the team sizes the work. A date asserted without the team's estimate is a wish.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Request arrives as a feature → trace it up to an outcome first.** Build the opportunity-solution path (outcome → opportunity → solution → experiment); reject any solution with no opportunity and no measurable outcome behind it. A feature with no outcome is a guess wearing a spec.
2. **Roadmap debate is political → replace opinion with priority math.** Compute RICE `(Reach × Impact × Confidence) / Effort` or WSJF `Cost of Delay / Job Size`, show the inputs, and show where the rank flips under a sensible confidence change. The number is a decision aid, not a verdict.
3. **Confidence is 100% with no evidence → lower it.** Confidence in RICE encodes how much you actually know; high confidence on a hunch inflates the score and buries the riskiest bet at the top. Tie confidence to evidence strength (data > a few interviews > one opinion).
4. **"Easy to use" / "fast" / "better" → convert to an instrumented success metric.** A PRD success criterion must be measurable in the running product: task-completion time, activation rate, error rate, support-ticket volume — not an adjective.
5. **PRD before build → require problem, users, non-goals, requirements, constraints, success metrics + instrumentation, rollout, and risks.** A spec that names the solution before the problem, or has no non-goals and no instrumentation, is not ready for build.
6. **Roadmap presented as dated promises → reframe as bets with learning gates.** A roadmap is a sequenced set of bets, each with a hypothesis and a gate (proceed / iterate / kill), not a contract of delivery dates. Communicate confidence by horizon (now / next / later), not false precision.
7. **Dependency surfaces after commitment → you mapped too late.** Map dependencies and the critical path *before* committing a date; the critical path is the longest chain of dependent work, and only changes on it move the end date.
8. **Scope grows mid-flight → make the tradeoff explicit, do not silently absorb it.** New scope spends time the plan already allocated; name what it pushes out or what date it moves. Silent scope creep is how committed plans miss.
9. **Role is ambiguous (PM/PO/PgM) → name who owns the why, the backlog, and the schedule.** Before producing an artifact, state which role the work serves; a "roadmap" from a PgM lens (coordination) is a different object than from a PM lens (bets).
10. **Launch with no learning plan → it is a release, not an experiment.** Every launch needs a hypothesis, a guardrail metric, the learning metric, and a kill/iterate/scale rule decided *before* shipping, so the readout can actually decide something.
11. **Stakeholders disagree on priority → align on the outcome and the evidence, not on whose request it is.** Re-anchor the debate to the shared outcome metric and what each bet is predicted to move; HiPPO (highest-paid person's opinion) is not evidence.
12. **"It's done" → done means verified in the running system against the acceptance criteria, not "merged" or "demoed."** Definition of Done is the acceptance criteria observed working in the real product, with the success metric instrumented — not a closed ticket.
13. **Strategy question sneaks in (which market, what price, build-vs-buy) → route to `business-strategy-operations` and keep PM scoped to discovery/sequencing/delivery.**

### Failure modes to prevent / Ձախողման ձևեր

1. **PRD describes the solution before the problem.** The spec opens with "build X" and never states the user problem, the outcome, or non-goals. Tell: a requirements list with no problem statement and no success metric.
2. **Roadmap as a promise list of dates.** Fixed dates far out, presented as commitments, with no hypothesis or learning gate. Tell: a Gantt of features with no "what we'd learn / when we'd kill it."
3. **Success metric not tied to user behavior.** The metric is an output or an adjective ("ship the feature," "easy to use") instead of an instrumented user/business outcome. Tell: "done" with no metric that moves in the running product.
4. **Prioritization theater.** RICE/WSJF computed to justify a pre-made decision, with confidence pinned at 100% and no sensitivity. Tell: every favored item scores high and no rank ever flips.
5. **Dependency discovered after commitment.** A blocking dependency or critical-path item found only after the date was promised. Tell: a plan with milestones but no dependency map or critical path.
6. **Role confusion — PM/PO/PgM blurred.** One person is asked to own outcomes, backlog acceptance, and cross-team schedule at once, or the artifact mixes lenses. Tell: a "roadmap" that is really a backlog, or a PgM coordinating bets they don't own.
7. **Scope creep absorbed silently.** New asks are folded in without naming what slips. Tell: the plan's end date never moves even as scope grows.
8. **Vanity metric instead of a decision metric.** Tracking pageviews/signups that never change a decision, while activation/retention go unmeasured. Tell: a dashboard full of numbers that no one acts on.
9. **Launch with no kill/iterate/scale rule.** Shipped with no pre-agreed threshold, so a flat or negative result still gets called a success. Tell: a launch readout written to defend the ship, not to decide.
10. **Estimate imposed as a date.** A deadline set by PM without the delivery team's sizing, then defended as commitment. Tell: a date with no estimate and no critical-path basis behind it.
11. **Discovery skipped — one solution in the tree.** The "opportunity-solution tree" has exactly one branch: the pre-decided feature. Tell: no alternatives, no experiments, no opportunity the solution maps to.
12. **Strategy decided under a PM label.** Market entry, pricing, or build-vs-buy answered as if it were prioritization. Tell: a "RICE sheet" that is actually choosing the company's business model.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (opportunity brief / PRD / RICE-WSJF sheet / roadmap / delivery plan / launch readout), not generic advice.
- Every prioritization number traces to its formula and to evidence-based confidence; no invented customer data or market figures.
- The PRD states problem before solution, has non-goals, and every success criterion is an instrumented metric, not an adjective.
- The roadmap is bets-with-learning-gates by horizon (now/next/later), not dated promises; dependencies and critical path are mapped before any date.
- Roles are named (PM owns why/what · PO owns backlog/acceptance · PgM owns cross-team schedule); the artifact serves one clear lens.
- **Definition of Done = verified in the running system against the acceptance criteria, with the success metric instrumented — not "merged," "demoed," or a closed ticket.**
- Strategy/pricing/market/org questions are routed to `business-strategy-operations`, not decided here.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **discovery depth** (outcome → opportunity → alternatives → assumptions → experiments connected) · **prioritization math** (RICE/WSJF inputs, confidence tied to evidence, effort, sensitivity explicit) · **spec quality** (problem-first PRD with non-goals, instrumented metrics, edge cases, testable acceptance) · **delivery control** (dependencies, critical path, risk burndown, owner, decision cadence managed) · **learning** (launch has hypothesis, guardrail, learning metric, kill/iterate/scale rule, verified in the running product).

### Deep dive & assets

`manual.md` (operating principle, mechanism reference — OST / RICE-WSJF / PRD anatomy / critical path & learning gates / PM-PO-PgM, decision rules, failure-repair playbook) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (PRD + RICE prioritization + roadmap) · `output-templates.md` (PRD / RICE-WSJF sheet / roadmap) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ product discovery (opportunity-solution tree, problem framing), prioritization (RICE, WSJF, cost-of-delay), PRD/spec գրում, roadmap՝ որպես learning gate-երով bet-երի հերթականություն, delivery planning (dependency map, critical path, risk burndown, decision cadence), launch և post-launch ուսում, scope/stakeholder համաձայնեցում։ Դուրս՝ շուկայի և մրցակցային ստրատեգիան, pricing-ը, business-model-ի և org-design-ի որոշումները (դրանք `business-strategy-operations`-ինն են), system/data-model-ի դիզայնը (`software-systems-architecture`-ինն է), էկրանի/flow-ի դիզայնը (`ui-page-structure-design`-ինն է)։ Այս skill-ը կապում է customer problem → product bet → delivery plan → learning loop, որ թիմը առաքի ճիշտ բանը՝ տեսանելի tradeoff-ներով և հստակ եղանակով՝ իմանալու, որ այն աշխատեց։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը product-ի կամ delivery-ի ձև ունի՝ PRD/opportunity brief, RICE/WSJF prioritization sheet, roadmap, delivery/dependency plan, launch-and-learning readout։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ PM-ը մեկ input է. օրինակ՝ architecture-ը տիրում է system design-ին, դու տալիս ես sequencing-ը և acceptance criteria-ն. UI-ը տիրում է flow-ին, դու տալիս ես PRD-ն և success metric-ը։

Կոնֆլիկտի կանոններ․
- **Ստրատեգիա / pricing / market → ուղղորդիր `business-strategy-operations`-ին, այստեղ մի՛ որոշիր։** «Որ segment, ինչ price, build-vs-buy, ինչ business model» — սա ստրատեգիա է։ PM-ը տիրում է *ինչպես ենք discover, sequence, spec և ship անում bet-ը ընտրված ստրատեգիայի ներսում* — ստրատեգիան չի սահմանում։ Trigger-ի սահմանը․ եթե որոշումը փոխում է ընկերության market/pricing/org-ը, ստրատեգիա է. եթե փոխում է, թե ինչ ենք կառուցում հաջորդը և ինչպես ապացուցում, PM է։
- **PM ≠ PO ≠ PgM → անվանի՛ր role-ը, մի՛ խառնիր։** Product Manager-ը տիրում է *ինչու/ինչ*-ին (problem, outcome, prioritized bet-եր)։ Product Owner-ը տիրում է *backlog-ին և acceptance-ին* delivery-ի ներսում (refined story-ներ, accept/reject ըստ criteria-ի)։ Program Manager-ը տիրում է *cross-team համակարգմանը, dependency-ներին և schedule risk-ին* շատ workstream-ների վրա։ Դրանց խառնելը տալիս է roadmap, որ ոչ ոք չի կարող կատարել, կամ backlog՝ առանց հետևում կանգնած outcome-ի։
- **Estimate և capacity → համակարգիր delivery team-ի հետ, մի՛ պարտադրիր։** Effort-ի և sequencing-ի պնդումները թիմինն են. PM-ը շրջանակում է priority-ն և cost of delay-ը, թիմը size-ում է աշխատանքը։ Թիմի estimate-ից առանց պնդված date-ը ցանկություն է։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Request-ը գալիս է որպես feature → նախ հետագծիր այն մինչև outcome։** Կառուցիր opportunity-solution path-ը (outcome → opportunity → solution → experiment). reject արա ցանկացած solution, որ չունի opportunity և չունի հետևում measurable outcome։ Outcome չունեցող feature-ը spec հագած գուշակություն է։
2. **Roadmap debate-ը political է → կարծիքը փոխարինիր priority math-ով։** Հաշվիր RICE `(Reach × Impact × Confidence) / Effort` կամ WSJF `Cost of Delay / Job Size`, ցույց տուր input-երը և ցույց տուր, թե որտեղ է rank-ը flip անում confidence-ի ողջամիտ փոփոխության դեպքում։ Թիվը decision aid է, ոչ դատավճիռ։
3. **Confidence-ը 100% է առանց evidence-ի → իջեցրու։** RICE-ի confidence-ը կոդավորում է, թե որքան ես իրականում գիտես. hunch-ի վրա բարձր confidence-ը փչացնում է score-ը և վերևում թաղում ամենառիսկային bet-ը։ Confidence-ը կապիր evidence-ի ուժին (data > մի քանի interview > մեկ կարծիք)։
4. **«Easy to use» / «fast» / «better» → վերածիր instrumented success metric-ի։** PRD-ի success criterion-ը պետք է չափելի լինի running product-ում՝ task-completion time, activation rate, error rate, support-ticket volume, ոչ ածական։
5. **PRD մինչև build → պահանջիր problem, users, non-goals, requirements, constraints, success metrics + instrumentation, rollout և risks։** Spec, որ solution-ը անվանում է problem-ից առաջ, կամ non-goals և instrumentation չունի, build-ի համար ready չէ։
6. **Roadmap-ը ներկայացված է որպես dated promise → reframe արա որպես bet-եր learning gate-երով։** Roadmap-ը bet-երի sequenced հավաքածու է, ամեն մեկը hypothesis-ով և gate-ով (proceed / iterate / kill), ոչ delivery date-երի պայմանագիր։ Confidence-ը հաղորդիր horizon-ով (now / next / later), ոչ կեղծ ճշգրտությամբ։
7. **Dependency-ն երևում է commitment-ից հետո → ուշ ես քարտեզագրել։** Քարտեզագրիր dependency-ները և critical path-ը date commit անելուց *առաջ*. critical path-ը կախյալ աշխատանքի ամենաերկար շղթան է, և միայն դրա վրա եղած փոփոխությունն է շարժում վերջնական date-ը։
8. **Scope-ը մեծանում է ընթացքում → tradeoff-ը դարձրու բացահայտ, լուռ մի՛ կլանիր։** Նոր scope-ը ծախսում է ժամանակ, որ plan-ն արդեն բաշխել է. անվանի՛ր, թե ինչ է հետ մղում կամ որ date-ն է շարժում։ Լուռ scope creep-ն այն է, ինչով committed plan-երը բաց են թողնում։
9. **Role-ը երկիմաստ է (PM/PO/PgM) → անվանի՛ր, թե ով է տիրում why-ին, backlog-ին և schedule-ին։** Artifact արտադրելուց առաջ նշիր, թե որ role-ին է ծառայում աշխատանքը. PgM-ի ոսպնյակից «roadmap»-ը (համակարգում) տարբեր object է, քան PM-ի ոսպնյակից (bet-եր)։
10. **Launch առանց learning plan-ի → դա release է, ոչ experiment։** Ամեն launch-ին պետք է hypothesis, guardrail metric, learning metric և kill/iterate/scale rule, որոշված ship-ից *առաջ*, որ readout-ն իրականում կարողանա ինչ-որ բան որոշել։
11. **Stakeholder-ները priority-ի շուրջ համաձայն չեն → համաձայնեցրու outcome-ի և evidence-ի վրա, ոչ նրա, ում request-ն է։** Վերա-խարսխիր վեճը ընդհանուր outcome metric-ին և այն բանին, ինչ ամեն bet կանխատեսվում է շարժել. HiPPO-ն (ամենաբարձր վարձատրվողի կարծիքը) evidence չէ։
12. **«Done է» → done նշանակում է verified running system-ում acceptance criteria-ի դեմ, ոչ «merged» կամ «demoed»։** Definition of Done-ը acceptance criteria-ն է՝ դիտված աշխատելիս իրական product-ում, success metric-ը instrumented — ոչ փակված ticket։
13. **Ստրատեգիայի հարց է ներս սողում (որ market, ինչ price, build-vs-buy) → ուղղորդիր `business-strategy-operations`-ին և PM-ը պահիր discovery/sequencing/delivery-ի շրջանակում։**

### Ձախողման ձևեր

1. **PRD-ն solution-ը նկարագրում է problem-ից առաջ։** Spec-ը սկսվում է «build X»-ով և երբեք չի նշում user-ի problem-ը, outcome-ը կամ non-goals-ը։ Tell՝ requirements list՝ առանց problem statement-ի և success metric-ի։
2. **Roadmap-ը՝ date-երի promise list։** Հեռու հաստատ date-եր՝ ներկայացված որպես commitment, առանց hypothesis-ի կամ learning gate-ի։ Tell՝ feature-ների Gantt՝ առանց «ինչ կսովորենք / երբ կսպանենք»-ի։
3. **Success metric-ը կապված չէ user behavior-ի հետ։** Metric-ը output է կամ ածական («ship արա feature-ը», «easy to use»), ոչ instrumented user/business outcome։ Tell՝ «done»՝ առանց metric-ի, որ շարժվում է running product-ում։
4. **Prioritization theater։** RICE/WSJF-ը հաշված՝ արդեն կայացված որոշումն արդարացնելու, confidence-ը 100%-ի վրա pin-ված, sensitivity չկա։ Tell՝ ամեն նախընտրած item-ը բարձր է scoring անում և ոչ մի rank երբեք չի flip անում։
5. **Dependency-ն հայտնաբերված commitment-ից հետո։** Blocking dependency կամ critical-path item՝ գտնված միայն date-ը խոստանալուց հետո։ Tell՝ plan՝ milestone-ներով, բայց առանց dependency map-ի կամ critical path-ի։
6. **Role confusion — PM/PO/PgM խառնված։** Մեկ մարդ խնդրվում է միաժամանակ տիրել outcome-ին, backlog acceptance-ին և cross-team schedule-ին, կամ artifact-ը խառնում է ոսպնյակները։ Tell՝ «roadmap», որ իրականում backlog է, կամ PgM, որ համակարգում է bet-եր, որ իրենը չեն։
7. **Scope creep-ը կլանված լուռ։** Նոր ask-երը ներծծվում են՝ առանց անվանելու, թե ինչ է սահում։ Tell՝ plan-ի վերջնական date-ը երբեք չի շարժվում, նույնիսկ scope-ի աճի դեպքում։
8. **Vanity metric՝ decision metric-ի փոխարեն։** Հետևում են pageview/signup-ի, որ երբեք որոշում չի փոխում, մինչ activation/retention-ը անչափ։ Tell՝ dashboard՝ լի թվերով, որ ոչ ոք չի գործածում։
9. **Launch առանց kill/iterate/scale rule-ի։** Ship-ված՝ առանց նախապես համաձայնեցված threshold-ի, ուստի flat կամ բացասական արդյունքը դեռ կոչվում է success։ Tell՝ launch readout, գրված ship-ը պաշտպանելու, ոչ որոշելու համար։
10. **Estimate-ը պարտադրված որպես date։** Deadline, որ PM-ը սահմանել է առանց delivery team-ի sizing-ի, հետո պաշտպանում որպես commitment։ Tell՝ date՝ առանց estimate-ի և critical-path հիմքի հետևում։
11. **Discovery-ն բաց թողնված — tree-ում մեկ solution։** «Opportunity-solution tree»-ն ունի ուղիղ մեկ ճյուղ՝ նախապես որոշված feature-ը։ Tell՝ ոչ alternative, ոչ experiment, ոչ opportunity, որին solution-ը map է անում։
12. **Ստրատեգիան որոշված PM label-ի տակ։** Market entry, pricing կամ build-vs-buy՝ պատասխանված, կարծես prioritization լիներ։ Tell՝ «RICE sheet», որ իրականում ընտրում է ընկերության business model-ը։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (opportunity brief / PRD / RICE-WSJF sheet / roadmap / delivery plan / launch readout), ոչ generic advice։
- Ամեն prioritization թիվ հետ է գնում իր formula-ի և evidence-հիմնված confidence-ի. ոչ մի հորինված customer data կամ market figure։
- PRD-ն problem-ը նշում է solution-ից առաջ, ունի non-goals, և ամեն success criterion instrumented metric է, ոչ ածական։
- Roadmap-ը bet-եր-learning-gate-երով է՝ horizon-ով (now/next/later), ոչ dated promise. dependency-ները և critical path-ը քարտեզագրված են ցանկացած date-ից առաջ։
- Role-ները անվանված են (PM-ը տիրում է why/what-ին · PO-ն backlog/acceptance-ին · PgM-ը cross-team schedule-ին). artifact-ը ծառայում է մեկ հստակ ոսպնյակի։
- **Definition of Done = verified running system-ում acceptance criteria-ի դեմ, success metric-ը instrumented — ոչ «merged», «demoed» կամ փակված ticket։**
- Strategy/pricing/market/org հարցերը ուղղորդվում են `business-strategy-operations`-ին, ոչ որոշվում այստեղ։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **discovery depth** (outcome → opportunity → alternative → assumption → experiment կապված) · **prioritization math** (RICE/WSJF input-եր, confidence-ը evidence-ին կապված, effort, sensitivity բացահայտ) · **spec quality** (problem-first PRD՝ non-goals-ով, instrumented metric-ներով, edge case-երով, testable acceptance-ով) · **delivery control** (dependency-ներ, critical path, risk burndown, owner, decision cadence managed) · **learning** (launch-ն ունի hypothesis, guardrail, learning metric, kill/iterate/scale rule, verified running product-ում)։

### Խորացում և asset-եր

`manual.md` (գործառնական սկզբունք, մեխանիզմների տեղեկագիր — OST / RICE-WSJF / PRD anatomy / critical path և learning gate / PM-PO-PgM, որոշման կանոններ, failure-repair playbook) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (PRD + RICE prioritization + roadmap) · `output-templates.md` (PRD / RICE-WSJF sheet / roadmap) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
