# Skill 04 — Product & Project Management
### Discovery · specs · prioritization · roadmaps · delivery

> **EN:** How to decide what to build, in what order, and ship it so the number moves. This is Bro's product+delivery operating manual — read it before scoping, speccing, prioritizing, roadmapping, or calling anything "done." Sources I draw on: Cagan (*Inspired*/*Empowered*, the empowered product team & product trio), Torres (*Continuous Discovery Habits*, opportunity-solution trees & the weekly touchpoint), Christensen/Ulwick (Jobs-to-be-Done & ODI), Reichheld (retention/NPS), Reinertsen (*Flow*, cost of delay, queueing), Ries (*Lean Startup*, build-measure-learn, MVP), Blank (customer development), Singer/Basecamp (*Shape Up*, appetite & betting), Sutherland/Schwaber (Scrum), Beck (XP), Anderson (Kanban/WIP), Goldratt (Theory of Constraints), Brooks (*Mythical Man-Month*), Doerr (OKRs, *Measure What Matters*), Kim (DORA/*Accelerate*), Wiegers (requirements), Perri (*Escaping the Build Trap*), Bezos/Amazon (working-backwards, PR-FAQ). The bridge from idea to shipped value. **Cross-links, never duplicated:** strategy/bets → Skill 05; UX & interaction of the thing → Skill 03; funnel/conversion/pricing → Skill 06; the analysis lens that runs first → Skill 11; stakeholder persuasion & negotiation → Skill 08; the running-system done-check & release ops → Skills 02/14; experiment statistics/guardrails math → Skill 11.
>
> **HY:** Ոնց որոշել՝ ինչ կառուցել, ինչ հերթով, ու ship անել այնպես, որ թիվը շարժվի։ Սա Bro-ի product+delivery operating manual-ն է — կարդա սա scope անելուց, spec գրելուց, prioritize անելուց, roadmap սարքելուց, կամ որևէ բան «done» անվանելուց առաջ։ Կամուրջը գաղափարից մինչև shipped value։ Աղբյուրներ՝ Cagan (empowered team, product trio), Torres (continuous discovery, opportunity-solution tree, weekly touchpoint), Christensen/Ulwick (JTBD/ODI), Reinertsen (flow, cost of delay), Ries (build-measure-learn, MVP), Blank (customer development), Basecamp (Shape Up), Scrum, XP, Kanban/WIP, Theory of Constraints, Brooks, OKR (Doerr), DORA, Perri (build trap), Amazon working-backwards (PR-FAQ)։ **Cross-link, ոչ կրկնում.** strategy → Skill 05. UX → Skill 03. funnel/pricing → Skill 06. վերլուծությունը որ առաջինը վազում է → Skill 11. stakeholder persuasion → Skill 08. release ops → Skill 02/14։

---

## 0. Ո՞Ր ԴԵՐՈՎ ԵՄ ՆԱՅՈՒՄ (the three product lenses)

Like data has three roles, product work has three altitudes. Wrong altitude = the #1 mistake: jumping to "what feature" before "what outcome / is the problem even real."

| Lens | Horizon | Ի՞նչ ա որոշում | The question it asks |
|---|---|---|---|
| **Discovery (PM as problem-finder)** | weeks / opportunity | *Ի՞նչ խնդիր* արժի լուծել, ո՞ւմ համար, ինչո՞ւ | "Is this problem real, valuable, and ours to solve?" |
| **Strategy (PM as bet-maker)** | quarters / direction | *Ի՞նչ outcome-ների* ենք խաղադրում, ո՞ր հերթով, ինչի՞ց ենք հրաժարվում | "Does this advance the outcome we committed to, more than the alternatives?" |
| **Delivery (PM/lead as shipper)** | days / increment | *Ոնց* ենք ship անում thin, verified, measured | "Is the smallest valuable slice shipped, seen working, and measured?" |

**Rule of use:** start from the outcome (why / for whom / what number), descend to the bet (does this beat the alternatives), land on delivery (ship the thinnest verified slice). Most product waste = building the wrong thing efficiently — solving a problem nobody has, or a real problem that isn't the most valuable one open.

**HY:** Սկսիր outcome-ից (ինչու / ում համար / ո՞ր թիվը), իջիր bet-ի (սա հաղթո՞ւմ է այլընտրանքներին), վայրէջք արա delivery-ի վրա (ship արա ամենաբարակ verify-արած slice-ը)։ Product-ի վատնման մեծ մասը = սխալ բանը արդյունավետ կառուցելը։

### 0.1 Who holds the pen — PM vs PgM vs PO (don't conflate the roles)
The three names are constantly confused; the confusion produces orphaned outcomes and double-managed teams. Define which hat you wear *per piece of work*.

| Role | Owns | Horizon | The question they own | Smell of confusion |
|---|---|---|---|---|
| **Product Manager (PM)** | the *what & why* — outcome, problem, bet, value, the product's success | quarters → live | "Are we building the right thing, and did it move the number?" | a PM who only grooms a backlog = a glorified PO / feature scribe |
| **Product Owner (PO)** | the *backlog & acceptance* inside a delivery team (a Scrum role) — translating the what into ready stories, accepting them | sprint | "Is this increment correctly built and accepted to spec?" | a PO acting *as* the product strategist with no discovery = the build trap |
| **Program/Project Manager (PgM)** | the *how & when across teams* — cross-team plan, dependencies, risk, schedule, comms; **delivery of a defined scope**, not deciding the scope | initiative → launch | "Will this land on time, with the dependencies and risks managed?" | a PgM setting product direction; or a PM drowning in cross-team scheduling instead of discovery |

**Rule:** PM owns *outcome*; PO owns *the increment's correctness*; PgM owns *coordinated on-time delivery of decided scope*. In a small team one person wears all three — name which hat you're wearing for each decision, because the failure modes differ. **The empowered-product-team model (Cagan) collapses the PM+PO split**: the team is given a problem and owns both the what and the build, with a real PM (not a backlog administrator) on it. (Org design of these roles → Skill 05.)

**HY:** PM = *ինչ ու ինչու* (outcome). PO = *increment-ի ճշտությունը* (Scrum-ի դեր). PgM = *որոշված scope-ի համակարգված ժամանակին delivery* (ոչ թե scope-ը որոշելը)։ Փոքր թիմում մեկ մարդ կրում է երեքն էլ — ամեն որոշման համար անվանիր ո՞ր գլխարկն ես կրում, որովհետև ձախողման ձևերը տարբեր են։ Cagan-ի empowered-team մոդելը PM+PO-ն միացնում է՝ թիմին տալիս են *խնդիր*, ոչ թե feature-ների ցուցակ։

---

## 1. PRINCIPLES (govern everything below)

1. **Outcomes over output.** Ship value (a moved metric, a solved problem), not features. "We shipped X" is not success; "X moved the number" is. Output is what you make; outcome is the behavior change it causes; impact is the business result. Always name which one you mean.
2. **Problem before solution.** Fall in love with the problem, not your fix. Validate the problem is real, painful, and worth solving before designing — and before estimating. *(Christensen: people don't buy products, they "hire" them to make progress.)*
3. **Smallest valuable slice.** Ship the thinnest thing that delivers real value AND teaches you something. Then iterate on evidence. A slice that delivers value but teaches nothing is a gamble; one that teaches but delivers no value is a study, not a ship.
4. **Prioritize ruthlessly.** Saying yes to everything is saying no to focus. Most ideas live below the line; protect the line. Strategy is what you say *no* to. *(Reinertsen: an unmanaged backlog is an unmanaged queue, and queues are where value goes to die.)*
5. **Decide with evidence, commit with conviction.** Gather enough signal to be directionally right, then commit — don't analysis-paralyze (perfect info never arrives), don't gamble blind (cheap evidence was available). Reversible decisions: decide fast and move (two-way doors). Irreversible: deliberate hard.
6. **Discovery and delivery run in parallel, continuously.** Not "discover, then build, then never look again." A dual-track team is always learning (discovery) while always shipping (delivery); today's delivery feeds tomorrow's discovery. *(Torres, Cagan.)*
7. **Empowered teams, not feature factories.** Give a team a problem to solve and the latitude to find the solution; don't hand it a backlog of pre-decided features. Output-by-mandate produces motion without progress. *(Cagan: "the best products come from teams given problems, not roadmaps of features.")*
8. **Honesty is a feature.** Status, estimates, and "done" are reported as they truly are. A green status that's actually red, a "done" that isn't verified, an estimate everyone knows is fiction — each is a small lie that compounds into broken trust. **L2: quality > efficiency; never fake a status to look fast.**
9. **Manage the queue, not the people.** Most delay is items *waiting*, not items being *worked*. Lowering WIP and shrinking batch size beats pushing people to work faster — flow is a property of the system, not of effort. *(Reinertsen; Little's Law.)*
10. **Write to think.** The spec, the PR-FAQ, the one-pager are not paperwork — they are the cheapest place to be wrong. If the thinking doesn't survive being written down crisply, it isn't ready to build. *(Amazon working-backwards; Wiegers.)*

---

## 2. DISCOVERY — what & why (problem-finding)

**Goal of discovery:** reduce the four risks *before* expensive build, fast and cheap. Discovery is not a phase — it's a continuous habit running alongside delivery.

### 2.0 Empowered teams, the product trio & dual-track agile
- **Empowered product team (Cagan, *Empowered*):** a cross-functional team handed a **problem to solve and a measurable outcome to hit**, with the autonomy and skill to find the solution — *not* a delivery team handed a prioritized list of features ("feature team"). The distinction is the whole game: feature teams ship a roadmap; empowered teams move an outcome. Leadership's job becomes **coaching + context + guardrails**, not assigning features.
- **The product trio (Torres/Cagan):** discovery is a team sport done by **Product (PM) + Design + Engineering (a tech lead) together** — the three perspectives that own value/viability, usability, and feasibility respectively. Decisions made by the trio, looking at the same evidence, beats a PM deciding alone and handing down. *(The three are the human form of the four risks — §2.1.)*
- **Dual-track agile (Discovery track ∥ Delivery track):** one team, two continuous workstreams running in parallel — a **discovery track** (deciding *what* is worth building, de-risking it) feeding a **delivery track** (building it well). They are not sequential phases ("waterfall in sprints") and not separate teams; the same trio runs both, and the tracks trade evidence continuously. The discovery track's output is *validated, de-risked, ready* backlog items; the delivery track's output is *shipped, measured* increments whose results re-feed discovery.
- **Anti-pattern it kills:** "discovery sprint, then six delivery sprints, then never look again." Discovery never stops while the product lives.

**HY:** Empowered team = թիմին տալիս են *խնդիր ու չափելի outcome*, ոչ թե feature-ների ցուցակ (feature team = roadmap ship է անում. empowered team = outcome է շարժում)։ Product trio = Product + Design + Engineering միասին են discovery անում (չորս ռիսկերի մարդկային ձևը)։ Dual-track agile = մեկ թիմ, երկու զուգահեռ հոսք՝ discovery (ի՞նչ արժե կառուցել, de-risk) → delivery (լավ կառուցել), իրար evidence փոխանցելով անընդհատ — ոչ թե հաջորդական փուլեր։

### 2.1 The four big risks (Cagan) — validate all four before a big commit
- **Value / desirability** — will they want it, enough to switch? (the most common killer)
- **Usability** — can they figure out how to use it? *(the surface of it → Skill 03.)*
- **Feasibility** — can we actually build it, with what we have, in time?
- **Business viability** — does it work for *us* — legal, sales, finance, brand, support, ethics? *(the money side → Skills 05/07.)*
> Rule: the risk you're least sure of is the one to test *first* and *cheapest*. Don't build a quarter to discover a problem a five-user interview would have surfaced.

### 2.2 Jobs to be Done (JTBD)
- What is the user **hiring** this product to do? Frame needs as **jobs**, not feature requests. A job = the progress a person is trying to make in a circumstance, with functional + emotional + social dimensions.
- **Job story format:** *When [situation], I want to [motivation], so I can [expected outcome].* Beats persona-demographic stories because it captures the *circumstance* that triggers the hire.
- **The Switch / forces of progress** (Moesta/Christensen): push of the situation + pull of the new solution vs. habit of the present + anxiety of the new. To win a switch you must increase push+pull AND reduce habit+anxiety — most teams only add pull (features) and lose to inertia.
- **Outcome-Driven Innovation (Ulwick):** measure jobs by *desired outcomes* ("minimize the time it takes to…"), rank by **importance × dissatisfaction** → underserved outcomes = opportunity; overserved = disruption opening.

### 2.3 Opportunity-Solution Tree (Torres)
Desired **outcome** (top) → **opportunities** (unmet needs/pains/desires, in the user's words) → **solution** ideas (multiple per opportunity) → **experiments/assumption tests**. Keeps every solution traceable to an outcome, and forces *comparing* solutions per opportunity instead of marrying the first idea.
- **Continuous interviewing & the weekly touchpoint (Torres' core habit):** the keystone habit of continuous discovery is a **weekly touchpoint with a customer** — small, regular, story-based, automated into the calendar so it survives busy weeks. Cadence beats heroics: a steady weekly drip of real customer contact compounds; a quarterly research "project" goes stale before it ships. Ask for *specific past behavior* ("tell me about the last time you…"), not opinions or predictions about the future (people are terrible forecasters of their own behavior). Synthesize each interview onto the tree.
- **Assumption mapping:** for a candidate solution, list desirability/usability/feasibility/viability assumptions → plot **importance × evidence** → the **leap-of-faith assumptions** (high importance, low evidence) are what you test first, with the cheapest possible experiment. *(See §2.5 for the assumption-test taxonomy.)*

### 2.4 Evidence & experiments (cheapest test that kills the riskiest assumption)
- **Signal sources, triangulated:** customer interviews (the *why*), behavioral/product analytics (the *what they actually do*), support tickets (where it hurts), sales lost-reasons & objections (why they don't buy), session replays, cohort retention curves. Never trust one source — opinions lie, behavior doesn't.
- **Experiment ladder, cheapest-first:** interview → concierge/Wizard-of-Oz (humans behind the curtain) → fake-door / smoke test → prototype (clickable) → painted-door / feature flag to a slice → A/B test → full build. Climb only as far as the decision requires.
- **Leading vs lagging signals:** lagging (revenue, churn) confirm too late; instrument **leading indicators** (activation, first-value time, key-action frequency) that predict the lagging ones.
- **Confidence is earned, not asserted.** A RICE "confidence" of 80% should map to actual evidence (data > prototype test > analogy > opinion). If it's a guess, say "guess" and lower it.

### 2.5 Assumption testing — by risk type (which test for which risk)
The leap-of-faith assumption dictates the test. Match the experiment to the *kind* of risk, or you'll "validate" the wrong thing.
- **Value / desirability assumption** → *will they want it?* Tests: **fake-door / painted-door** (measure click-through on a button for the thing that doesn't exist yet), pre-sales / letter of intent, landing-page smoke test, the "would you pay" with a real price, concierge MVP (deliver the value by hand and see if they keep coming).
- **Usability assumption** → *can they use it?* Tests: **moderated usability test** on a clickable prototype (5 users surfaces ~85% of issues — Nielsen), first-click test, task-completion rate. *(Craft → Skill 03.)*
- **Feasibility assumption** → *can we build it?* Tests: a **technical spike**, a throwaway proof-of-concept, a load/latency probe on the scary integration. *(Engineering → Skill 02.)*
- **Viability assumption** → *does it work for the business?* Tests: a margin/unit-economics model (Skill 07), a legal/compliance read, a sales/channel check, a support-cost estimate. The risk juniors skip and finance discovers later.
> The discipline (Bland/Osterwalder, *Testing Business Ideas*): pick the **riskiest** assumption, run the **cheapest** test that could disprove it, set a **pass/fail threshold *before* running**, and let the result actually change the plan — or it was theater (§8).

**HY:** Թեստը կախված է ռիսկի *տեսակից*. **Value** → fake-door/painted-door, pre-sale, «կվճարե՞ս» իրական գնով, concierge MVP։ **Usability** → prototype-ի վրա moderated test (5 user ≈ 85% խնդիր, Nielsen)։ **Feasibility** → technical spike, proof-of-concept, load probe։ **Viability** → margin մոդել, legal/compliance, support-cost (junior-ները բաց են թողնում)։ Կարգը՝ ամենառիսկային ենթադրությունը → ամենաէժան թեստը → pass/fail շեմը *նախքան* վազեցնելը → թող արդյունքը *իրոք* փոխի պլանը։

### 2.6 North Star & outcome framing
- **North Star Metric:** the single measure that best captures the value customers get (e.g. *weekly active teams completing a workflow*), leading the business result. One per product; everything ladders to it. A good North Star is a **leading** value metric, not a lagging revenue metric (revenue is the *result* of value delivered, not value itself).
- **OKRs (Doerr, *Measure What Matters*):** Objective (qualitative, directional, inspiring) + Key Results (measurable *outcomes*, not tasks). KRs are *results*, not a to-do list. Set ~3 KRs; **commit OKRs** you must hit at 100%, **aspirational/stretch OKRs** you aim ~70% on (and 70% is a *win*, not a miss). **Don't confuse a roadmap (output) with OKRs (outcomes).** Grade and reset on a cadence (usually quarterly); the grading is for learning, not punishment.
- **HEART (Google):** Happiness · Engagement · Adoption · Retention · Task-success — pick the dimensions that matter and define a **Goal → Signal → Metric** for each. Good antidote to vanity metrics; built for *feature/UX* measurement specifically.
- **Pirate metrics (AARRR, McClure):** Acquisition · Activation · Retention · Referral · Revenue — find the leakiest stage first; usually **activation/retention** beats pouring more into acquisition. *(Funnel mechanics & conversion → Skill 06.)*
- **Leading vs lagging, and guardrails:** every primary metric needs a **guardrail/counter-metric** so you don't win locally and lose globally ("increase signups *without* raising 30-day churn"). Name the guardrail in the spec, before the build. *(Full metric stack in §5.)*

---

## 3. SPECS / PRDs / WRITTEN THINKING (the decision-ready brief)

A good spec is a **thinking tool and an alignment contract**, not a ceremony. Tight and decision-ready beats long and exhaustive. The spec is **shared understanding made durable** — its real product is alignment, not the document. It answers, in order:

1. **Problem** — who hurts, how, with *evidence* (data + quotes). If you can't state the problem crisply with evidence, you're not ready to spec.
2. **Goal & success metric** — the *number that proves it worked* (and its current baseline + target). One primary metric; name it. Plus its **guardrail/counter-metric**.
3. **Non-goals** — explicitly out of scope. The most under-used section; it's where scope creep is pre-killed.
4. **Users & scenarios / job stories** — who, in what circumstance, doing what.
5. **Requirements** — must / should / could (MoSCoW), each tied to the problem. Write the *what and why*, leave the *how* to the team where possible.
6. **Acceptance criteria** — testable, observable, ideally Given/When/Then. "Done when X is true," not "done when built."
7. **Risks & open questions** — what could make this wrong; what's still unknown; who decides. (Cross-ref the RAID log — §6.6.)
8. **Rollout & measurement** — flag/cohort/percentage plan, guardrail metrics, how & when we'll read the result, kill/rollback criteria.
9. **Dependencies & sequencing** — what must exist first; who else is on the critical path.

### 3.1 Document types — pick the right vessel
- **One-pager / lightweight PRD** — the default. The problem, the metric, the slice, the risks, on a page or two. If the thinking doesn't fit, it isn't done.
- **Amazon working-backwards — PR-FAQ (the heavier cousin):** write the **internal press release** *and* the **customer + internal FAQ** *first*, as if the product already shipped. If the PR doesn't read as compelling to a customer, don't build it — the doc is a forcing function to find the *value and clarity* before any code. Read narratively in a meeting (Amazon's "silent reading"), no slides. **Working backwards = start from the customer's finished experience and the press release, then derive what to build** — the inverse of "build it then figure out the pitch."
- **RFC (Request for Comments)** — a proposal circulated for critique *before* committing to an approach; the team's mechanism for surfacing disagreement and alternatives early. Cheap to write, cheaper than rework. *(Engineering RFCs overlap design — Skill 02.)*
- **ADR (Architecture Decision Record)** — a short, immutable record of **one decision**: context, the decision, the alternatives considered, and the consequences. Captures *why* (the load-bearing part future-you forgets). Append, never edit; supersede with a new ADR. Use for any one-way-door choice. *(Format & when → Skill 02.)*
- **User stories (the unit of delivery):** *As a [role], I want [capability], so that [benefit].* The story is a **promise for a conversation**, not a complete spec. Hold them to **INVEST** — **I**ndependent, **N**egotiable, **V**aluable, **E**stimable, **S**mall, **T**estable. Each story carries its **acceptance criteria** (Given/When/Then) — the story's done-check. A story with no acceptance criteria is a wish; a story only an engineer can read is a task, not a story.

### 3.2 Heuristics
- **A spec that no engineer questioned was either perfect or unread — usually unread.** Specs are for a conversation; expect and welcome pushback.
- **Write the metric before the feature.** If you can't say what number moves, you don't yet know what you're building.
- **Counter-metric / guardrail every goal.** "Increase signups" without "without raising 30-day churn" invites local gaming.
- **One-pager > epic doc.** If it doesn't fit on a page or two, the thinking isn't done.
- **The "how" is the team's, the "what & why" is the spec's.** Over-specifying the solution disempowers the team and pre-bakes a worse answer (Cagan).

**HY:** Spec = *մտածելու գործիք ու alignment contract*, ոչ ceremony. իրական product-ը alignment-ն է, ոչ թե փաստաթուղթը։ Փաստաթղթի տեսակները՝ **one-pager** (default). **PR-FAQ** (Amazon working-backwards — գրիր press release-ն ու FAQ-ն ՆԱԽ, կարծես արդեն ship-արած. եթե չի համոզում, մի կառուցիր). **RFC** (քննարկման առաջարկ՝ նախքան commit). **ADR** (մեկ որոշման անփոփոխ գրառում՝ context/որոշում/այլընտրանք/հետևանք — append, never edit). **User story** = *As a [role], I want [capability], so that [benefit]*, INVEST + acceptance criteria (Given/When/Then)։ Metric-ը գրիր feature-ից առաջ. ամեն goal-ի՝ guardrail։

---

## 4. PRIORITIZATION (protecting the line)

Frameworks **start** the argument; they don't end it. The number surfaces assumptions and forces comparison — judgment still decides.

| Framework | Formula / shape | When to use | Watch out for |
|---|---|---|---|
| **RICE** | (Reach × Impact × Confidence) ÷ Effort | comparing many candidate features | false precision; honest Confidence is the whole game |
| **ICE** | Impact × Confidence × Ease | fast, lightweight scoring (RICE's lean cousin) | subjective 1–10 scales drift; recalibrate the anchors |
| **WSJF (SAFe/Reinertsen)** | Cost of Delay ÷ Job Size | timing/urgency dominates; sequencing a queue | needs a real CoD estimate, not a guess |
| **Cost of Delay** | $ value lost per week of waiting | making *delay* visible; ROI of speed | classify the CoD profile (see below) |
| **MoSCoW** | Must / Should / Could / Won't | scoping *one* release | "everything is Must" = not done |
| **Kano** | basic / performance / delight | balancing a feature *mix* | delighters decay into basics over time |
| **Value vs Effort 2×2** | quadrant triage (quick-wins / big-bets / fill-ins / money-pits) | fast first-pass triage | "value" must be defined, or it's vibes |
| **Eisenhower 2×2** | urgent×important (do / schedule / delegate / drop) | triaging *your own / the team's* time & interrupts | "urgent" masquerading as "important" — most fires aren't |
| **Opportunity score (ODI)** | importance + (importance − satisfaction) | ranking *needs*, not features | needs survey data to do well |
| **Buy-a-feature / weighted shortest** | stakeholders spend fixed budget | aligning many stakeholders | reveals priorities, not truth |

**RICE vs ICE:** ICE (Impact×Confidence×Ease, each 1–10) is the **fast, gut-level** screen for a long idea list or a growth backlog; RICE adds **Reach** and an explicit **Effort** denominator for a more defensible cross-feature comparison. Use ICE to thin the pile, RICE to rank the survivors.

**Eisenhower (urgent ÷ important):** **Do** (urgent+important) · **Schedule** (important, not urgent — where the leverage lives) · **Delegate** (urgent, not important) · **Delete** (neither). The PM/PgM's daily triage tool for interrupts and meeting requests, not feature selection — its lesson is that the *important-but-not-urgent* quadrant (discovery, strategy, debt) is the one perpetually starved by fake urgency.

**Cost-of-Delay urgency profiles** (Reinertsen — shape matters more than the number):
- **Standard** — value erodes steadily with delay (do in sequence by CD3).
- **Expedite** — huge value, decaying fast (jump the queue).
- **Fixed-date** — value cliff at a deadline (regulatory, event, contract) — sequence so it lands on time, no value before.
- **Intangible** — no urgency now, but ignoring it accrues debt/risk (don't let it starve forever).

**Decision-rules for the line:**
- **Force-rank, don't bucket.** "These ten are P0" is not prioritization. Make the team choose #1 vs #2.
- **WSJF for sequencing, RICE for selection, ICE for triage.** Use CoD/WSJF to *order* a known set; RICE to *pick* from many candidates; ICE to *thin* a long list fast.
- **Effort is a band, not a point.** Estimate in T-shirt sizes / Fibonacci early; precision is fake until scoped.
- **Re-rank on new evidence, not on volume of asking.** The loudest stakeholder is not a new data point.

**HY:** Framework-ները *սկսում* են վեճը, չեն ավարտում։ **ICE** (արագ, gut-level screen) → **RICE** (Reach + բացահայտ Effort, ավելի պաշտպանելի) → **WSJF/CoD** (հայտնի set-ի *հերթականություն*, երբ timing-ն է գերիշխում)։ **MoSCoW** = մեկ release-ի scope. **Kano** = feature-ների խառնուրդ. **Eisenhower** = *քո/թիմի ժամանակի* triage (ոչ feature ընտրություն. դասը՝ *կարևոր-բայց-ոչ-հրատապ* քառորդն է միշտ սոված)։ Force-rank արա #1 vs #2, մի՛ դույլավորիր։

---

## 5. PRODUCT METRICS (the measurement stack)

A metric is a hypothesis about value made visible. Pick few, instrument before you ship, read after.

- **North Star Metric (NSM):** the one leading metric that captures delivered value; everything ladders to it (§2.6).
- **Leading vs lagging:** *leading* indicators (activation, first-value time, key-action frequency) predict and can be acted on *now*; *lagging* (revenue, churn, NPS) confirm too late to steer. Instrument leading; report both. **You steer with leading, you score with lagging.**
- **Guardrail metrics:** the counter-metrics you must *not* harm while moving the primary (latency, error rate, churn, support load, unit margin). Every experiment and goal names its guardrails; a "win" that trips a guardrail is a loss.
- **AARRR (pirate funnel):** Acquisition → Activation → Retention → Referral → Revenue. Fix the leakiest stage first; usually activation/retention.
- **HEART (Google):** Happiness · Engagement · Adoption · Retention · Task-success, each with a **Goal → Signal → Metric**. Best for measuring a specific feature or UX change.
- **Vanity vs actionable:** a metric earns its place only if it's **actionable** (a change in it points to a decision) and **comparable** (a rate/ratio/cohort, not a feel-good cumulative total). Total registered users is vanity; week-4 cohort retention is actionable.
- **Cohort & retention curves:** read behavior by *signup cohort over time*, not blended aggregates — aggregates hide a leaking bucket behind fresh acquisition. A flattening retention curve = product-market fit signal; a curve to zero = no value, no amount of acquisition saves it.
- **Counter-Goodhart:** "when a measure becomes a target, it ceases to be a good measure." Pair every target with a guardrail, watch for gaming, and re-validate that the metric still proxies real value. *(Statistics, significance, sample size, segmentation → Skill 11; funnel/conversion economics → Skill 06.)*

**HY:** Metric = արժեքի վարկած՝ տեսանելի դարձված։ **NSM** (մեկ leading value metric)։ **Leading** (activation, first-value time — հիմա գործելու) vs **lagging** (revenue, churn — ուշ confirm)։ *Leading-ով ղեկ ես տալիս, lagging-ով հաշիվ պահում*։ **Guardrail** = ինչ չպիտի վնասես (latency, churn, margin)։ **AARRR**, **HEART** (Goal→Signal→Metric)։ Vanity vs actionable (rate/cohort, ոչ կուտակային total)։ Goodhart՝ երբ չափիչը target է դառնում, դադարում է լավ չափիչ լինելուց — ամեն target-ի՝ guardrail։

---

## 6. DELIVERY (ship it, verified, measured)

### 6.1 Slicing & flow
- **Slice vertically.** Ship end-to-end thin increments (a real user can do a real thing), not horizontal layers (a finished DB with no UI delivers nothing alone). *(SPIDR: split by Spike, Path, Interface, Data, Rules.)*
- **Manage WIP — finish before starting.** Limit work-in-progress; **flow beats utilization.** A 100%-utilized team has a 100%-full queue and infinite wait times. *(Kanban; Reinertsen queueing theory.)* Stop starting, start finishing.
- **Small batches.** Batch size is the hidden master variable: smaller batches → faster feedback, less risk per release, easier diagnosis, lower cost of delay. Big batches feel efficient and ship pain. *(Reinertsen, *Lean Startup*.)*
- **De-risk early.** Tackle the highest-uncertainty / highest-impact unknowns first (a spike, a prototype, the scary integration). Fail cheap and early, not expensive and late.
- **Theory of Constraints (Goldratt):** find the bottleneck; optimizing anything that isn't the constraint is waste. Speeding up a non-bottleneck just grows the queue in front of the real one. Subordinate everything to the constraint, then elevate it.
- **Little's Law:** lead time = WIP ÷ throughput. Want faster delivery? Lower WIP — it's the lever you control instantly.

### 6.2 Definition of Done (DoD) — non-negotiable
**Done = code + tests + docs + reviewed + deployed + VERIFIED WORKING IN THE RUNNING SYSTEM (seen, not assumed) + measured.** Agree the DoD up front. **"It compiles" / "I built it" / "the PR is merged" is NOT done.** Done is *demonstrated*, not asserted — you (or the user) saw the slice do the real thing in the real running system, and the metric is instrumented to read the result. *(The running-system done-check is the same law Skills 11/02 enforce.)*

### 6.3 Cadence models — pick the fit
- **Scrum** — fixed sprints, backlog, ceremonies (planning/standup/review/retro), roles (PO/Scrum Master/team). Good for steady feature teams needing predictability and rhythm. Risk: ceremony theater, story-point obsession over outcomes, sprint-as-mini-waterfall.
- **Kanban (Anderson)** — continuous flow, **WIP limits**, pull, visualize-the-work, manage-flow, make-policies-explicit. Good for variable/interrupt-heavy work (support, platform, ops). Risk: no rhythm if you don't add review cadences.
- **Extreme Programming (XP, Beck)** — the *engineering* practices that make agile actually work: **TDD, pair programming, continuous integration, refactoring, collective code ownership, small releases, simple design, sustainable pace**. Scrum/Kanban schedule the work; XP is *how the code stays shippable*. A team doing Scrum ceremonies without XP-grade engineering discipline ships slop on a cadence. *(Test discipline → Skill 13; CI → Skill 14.)*
- **Lean (Toyota/Poppendieck) — the philosophy under it all:** eliminate **the seven wastes** (partially-done work, extra features, relearning, handoffs, delays, task-switching, defects), **amplify learning, decide as late as responsibly possible, deliver fast, empower the team, build integrity in, see the whole**. Flow + small batches + pull are Lean applied to software.
- **Shape Up (Basecamp)** — fixed time (6-week cycles), variable scope; **appetite** (how much is this worth?) set *before* design, not an estimate after; work is **shaped** (rough, bounded, de-risked) then **bet** on by leadership; teams get autonomy + a hard appetite; the **hill chart** (uphill = figuring out, downhill = executing) shows real progress, and a strict **circuit breaker** kills anything not done in the cycle (no automatic extensions). Good for small empowered teams shipping meaningful chunks. **Appetite, not estimate** is the key inversion: you decide what a problem is worth, then fit the solution to it.
- **Rule:** the cadence serves flow and outcomes; if a ceremony isn't improving flow, learning, or trust, cut it. **Method is a tool, not an identity** — most healthy teams run a Scrumban hybrid plus XP engineering, tuned to their work.

### 6.4 Estimation & schedule honesty
- **Brooks's Law:** adding people to a late project makes it later (onboarding + communication overhead). The fix is scope, not bodies.
- **Hofstadter's Law:** it always takes longer than you expect, even accounting for Hofstadter's Law. Pad for the unknown-unknowns; communicate ranges.
- **The Cone of Uncertainty:** estimates early in a project can be off by 4×; they tighten only as scope is discovered. Give ranges early, points late.
- **#NoEstimates debate:** for small, sliced work, *counting* throughput of similar-sized items (and measuring cycle time) often beats *estimating* effort per item — the estimate's overhead can exceed its value. The counter-view: estimates fund cross-team coordination and budgeting decisions that throughput-counting alone can't. **Resolution:** estimate when a *decision* needs the number (commit a date, fund a project, sequence across teams); skip it when you're just feeding a flow you could measure instead. Slice small enough that the two converge.
- **Reference-class forecasting (Kahneman/Flyvbjerg):** predict from how long *similar past work* actually took (outside view), not from this project's optimistic plan (inside view). The outside view beats the inside view almost every time.
- **Planning fallacy:** people systematically underestimate their own tasks. Default to the team's historical actuals over its fresh optimism.
- **Estimate ≠ commitment.** An estimate is engineering's honest range; a commitment is a *negotiated* scope+date. Never let a hallway estimate get quoted upstairs as a promise (§8).

### 6.5 The iron triangle, critical path & schedule
- **The iron triangle / project-management triangle:** **scope · time · cost**, bounded by **quality** — you cannot fix all three and hold quality; fix two and the third (or quality) flexes. The honest move when squeezed is almost always **flex scope**, because flexing time breaks commitments, flexing cost adds people (Brooks), and flexing quality is a debt that compounds. *(Fixed-scope + fixed-date + fixed-team is the impossible triangle; something gives — choose scope, deliberately.)*
- **Critical path (CPM):** the longest chain of dependent tasks that sets the *minimum* project duration; **slack/float** is how much a non-critical task can slip without moving the end date. Accelerate by attacking the *critical path only* (Theory of Constraints applied to a schedule) — crashing a task off the path is wasted money. Use Gantt/CPM for genuinely sequential, dependency-heavy delivery (migrations, hard external dates), **not** for exploratory product work (use Now/Next/Later there — §7... see Roadmapping).
- **When to use which:** Now/Next/Later & flow for product discovery-driven work; CPM/Gantt for fixed-scope dependency-chained delivery. Mixing them up — Gantt-charting an unknown, or hand-waving a launch with hard external dependencies — is a classic failure.

### 6.6 Risk management & the RAID log
- **Risk management loop:** **identify → assess (probability × impact) → respond → monitor**, continuously, not once at kickoff. The four responses: **avoid** (change the plan to remove it), **mitigate** (reduce probability or impact), **transfer** (insurance, a vendor SLA, a contract), **accept** (consciously, with a reserve/contingency). Maintain a **risk register**: each risk owned, scored, with a response and a trigger.
- **RAID log — the PgM's instrument** (review on a cadence):
  - **R — Risks:** what *might* go wrong (probability × impact, owner, response).
  - **A — Assumptions:** what we're *taking as true*; if false, the plan breaks (validate the load-bearing ones — mirror of Skill 11).
  - **I — Issues:** what *has* gone wrong and is active now (owner, action, due date).
  - **D — Dependencies:** what we need from *others* (and what others need from us), with dates and owners.
- **Contingency/buffer:** budget reserve for the known-unknowns explicitly (time + money); the unknown-unknowns get a separate management reserve. Padding hidden inside every estimate (Parkinson + student-syndrome) is worse than one honest visible buffer (Goldratt's critical-chain insight).

### 6.7 Status, communication, measuring the result
- **Green / Yellow / Red with the real reason.** Surface blockers *loudly and early*; a problem named on day 2 is a tweak, named at the deadline it's a crisis. A status that hides risk is a lie with a deadline.
- **Watermelon status** (green outside, red inside) is the cardinal delivery sin — kill it by reporting against *verified* DoD, not "% built."
- **Measure the result, then close the loop.** After ship: read the primary metric and guardrails against the spec's target; declare won / lost / inconclusive; **kill, double-down, or iterate** — explicitly. Shipping without reading the result is just expensive activity.
- **DORA metrics (the four keys):** Deployment Frequency · Lead Time for Changes · Change Failure Rate · Time to Restore. The validated measures of delivery *performance* — speed and stability rise together in elite teams; they are not a trade-off. Use to improve the *system*, never to rank individuals. *(Release mechanics → Skill 14.)*
- **Pre-mortem before a risky launch** (Klein): imagine it's failed — why? Surfaces risks that optimism hides. **Blameless post-mortem after** (incidents/misses): fix the system, not the person. *(Both are Skill 11 instruments applied to delivery.)*

**HY:** **DoD** = code + tests + docs + reviewed + deployed + RUNNING SYSTEM-ում verify-արած + measured. «Compile եղավ»/«merge արեցի» ≠ done։ **Cadence**՝ Scrum (ritm/predictability), Kanban (flow/WIP/interrupt-ծանր), **XP** (TDD/pair/CI/refactor — *ինչ է կոդը shippable պահում*. առանց XP-ի engineering discipline-ի Scrum-ը slop է ship անում ritm-ով), **Lean** (7 waste-երը վերացրու), Shape Up (appetite, ոչ estimate)։ **Iron triangle**՝ scope·time·cost, quality-ով սահմանված — սեղմվելիս ճիշտ քայլը *scope-ը flex անելն* է։ **Critical path**՝ կախյալ task-երի ամենաերկար շղթան. արագացրու *միայն critical path-ը*։ **RAID log**՝ Risks/Assumptions/Issues/Dependencies (PgM-ի գործիքը, cadence-ով review)։ **DORA**՝ deploy freq/lead time/change-fail/MTTR — system-ի, ոչ մարդկանց համար։ Watermelon status-ը (դրսից կանաչ, ներսից կարմիր) #1 մեղքն է. report արա verify-արած DoD-ի դեմ։

---

## 7. EXPERIMENTATION & THE LEAN STARTUP (hypothesis-driven delivery)

When the outcome is uncertain (new product, new market, risky bet), you don't *plan* your way to the answer — you *experiment* your way there.

- **Build–Measure–Learn (Ries, *The Lean Startup*):** the loop. Turn a vision into testable **hypotheses**, build the **smallest experiment** that produces data, measure, learn, then **persevere or pivot**. Minimize *total time through the loop* — that, not features shipped, is the startup's real productivity metric.
- **MVP (Minimum Viable Product):** the smallest thing that lets you run **one turn of the loop and learn** — *not* a crappy v1, and not "minimum to ship." It exists to *test a hypothesis*, so it can be a fake-door, a concierge service, or a landing page (no product at all). **MLP (Minimum Lovable Product)** is the corrective when "viable" gets read as "barely tolerable" — ship the smallest thing users actually *love*, in a market where viable-but-bland loses.
- **Validated learning:** the unit of progress is *learning what's true about customers, backed by data* — not opinion, not a roadmap milestone. "We shipped on schedule" is worthless if you shipped the wrong thing.
- **Hypothesis-driven development:** frame each bet as a falsifiable hypothesis with a threshold **before** building — *"We believe [building X] for [these users] will achieve [this measurable outcome]. We'll know we're right when we see [signal] cross [threshold]."* No threshold = no experiment, just a build with a story.
- **A/B & controlled experiments:** randomize users into control vs variant, change one thing, read the primary metric **with its guardrails**, ship only on a real lift. Watch: peeking/early-stopping inflates false positives; under-powered tests "find" noise; novelty effects fade; the **primary metric must move *and* no guardrail trips**. Decide the **sample size, duration, and success threshold up front**. *(Significance, power, sample-size math, segmentation → Skill 11; funnel/conversion experiments → Skill 06.)*
- **Pivot vs persevere:** on a cadence, look the data in the eye — is the engine of growth working? **Persevere** (the hypothesis is validating, optimize), or **pivot** (a structured change of strategy keeping one foot anchored: zoom-in/out, customer-segment, platform, business-model, channel, engine-of-growth pivots). The hard discipline is **killing a loser without flinching** — sunk cost is not a reason (§8, §9).
- **Innovation accounting:** for a new bet, vanity metrics (totals) lie; track the *learning* metrics that show the model improving (cohort conversion, per-cohort retention) so you can tell real progress from motion.

**HY:** Անորոշ outcome-ի դեպքում *փորձարկում ես*, ոչ թե *պլանավորում*։ **Build–Measure–Learn** (Ries)՝ vision → testable hypothesis-ներ → ամենափոքր experiment → measure → learn → **persevere կամ pivot**. minimize արա *loop-ի ընդհանուր ժամանակը*։ **MVP** = ամենափոքրը որ *մեկ loop վազեցնում ու սովորեցնում է* (ոչ թե վատ v1. կարող է fake-door/concierge/landing լինել). **MLP** = ամենափոքրը որ user-ները *սիրում* են։ **Validated learning** = առաջընթացի միավորը՝ data-ով հաստատված սովորածը։ **Hypothesis-driven**՝ «Հավատում ենք [X]-ը [user-երի] համար կբերի [չափելի outcome]. ճիշտ ենք երբ [signal] անցնի [threshold]» — threshold-ը *նախքան* build-ը։ **A/B**՝ randomize, մեկ բան փոխիր, primary metric-ը շարժվի ԵՎ guardrail չընկնի. sample size/duration/threshold-ը նախապես։ **Pivot vs persevere**՝ data-ին նայիր ուղիղ. loser-ին սպանիր առանց երերալու (sunk cost պատճառ չէ)։

---

## 8. STAKEHOLDER MANAGEMENT & INFLUENCE WITHOUT AUTHORITY

A PM/PgM has all the responsibility and almost none of the formal authority — you ship through influence, not command. *(The persuasion/negotiation craft itself → Skill 08; this is its product application.)*

- **Map the stakeholders:** plot by **power × interest** (Mendelow): **manage closely** (high power, high interest — the deciders & sponsors), **keep satisfied** (high power, low interest — don't surprise them), **keep informed** (low power, high interest — your champions & users), **monitor** (low/low). Identify the **economic buyer / sponsor** (the one who can say yes and fund it) and the **blockers** explicitly.
- **RACI for decisions:** name who is **R**esponsible (does it), **A**ccountable (one neck, owns the outcome), **C**onsulted (input before), **I**nformed (told after). Ambiguous accountability is where initiatives die; one **A** per decision, always.
- **Influence levers (Cialdini):** reciprocity, commitment/consistency, social proof, authority, liking, scarcity — used *honestly*, as ways to make a good case land, never to manipulate.
- **The currency of influence is trust, and trust is built on honest status (§1.8) and delivered outcomes.** A PM who over-promises and under-delivers spends a credibility balance that doesn't refill. Under-promise where uncertain; over-deliver where you can.
- **Reframe opinion as hypothesis.** When a powerful stakeholder pushes a pet feature (HiPPO), don't fight the opinion — convert it: *"great — let's define what we'd expect to see, and run the cheapest test."* Data dissolves a HiPPO argument that debate inflames.
- **Bring evidence, not just conviction.** "I think" loses to "here's what 8 of 10 interviews and the funnel data show." Discovery (§2) is also your *influence* engine.
- **Disagree-and-commit:** once a decision is made (even one you argued against), commit fully and visibly. Re-litigating decided calls in public burns the team's speed and your standing. *(Escalate the *right* way, once, with the data — then row.)*
- **Manage up:** give leadership the **outcome + the confidence + the ask** in one line, the detail beneath it; never make a busy sponsor dig for the decision they need to make. Surface bad news *first and early* — they forgive the problem, not the ambush.

**HY:** PM/PgM-ը ողջ պատասխանատվությունն ունի, ֆորմալ իշխանություն՝ գրեթե զրո — ship ես անում *ազդեցությամբ*, ոչ հրամանով։ Քարտեզագրիր stakeholder-ները **power×interest**-ով (Mendelow). գտիր sponsor-ին ու blocker-ներին։ Որոշումներին՝ **RACI** (մեկ **A** ամեն որոշման)։ Ազդեցության արժույթը **վստահությունն է**՝ կառուցված անկեղծ status-ով ու delivered outcome-ով. over-promise/under-deliver = չլիցքավորվող credit։ HiPPO-ի կարծիքը դարձրու վարկած («եկ թեստ վազեցնենք»)՝ data-ն լուծում է այն, ինչ վեճը բորբոքում է։ **Disagree-and-commit**՝ որոշումից հետո լրիվ commit, նույնիսկ եթե դեմ էիր։ Manage up՝ outcome + confidence + ask մեկ տողով, վատ լուրը՝ առաջինը ու շուտ։

---

## 9. ROADMAPPING (direction without lying about dates)

- **Now / Next / Later** — communicate direction without false date precision. Commit *dates* only where genuinely committed (scope + capacity + dependencies known). Default to this.
- **Theme/outcome-based** — organize around outcomes and bets ("reduce time-to-first-value"), not a feature laundry list. A roadmap of features is a backlog with delusions of strategy. **The outcome-based roadmap is the antidote to the feature factory:** it commits to *problems to solve and metrics to move*, leaving the team room to find the best solution (Cagan/Perri).
- **Capacity-honest** — a roadmap that ignores team capacity, dependencies, and the keep-the-lights-on tax (support, bugs, tech debt) is fiction. Budget ~20–30% for the unplanned; it always comes.
- **Confidence-banded** — show certainty visually (committed / planned / exploring). Communicate the *bet*, not a promise.
- **Now/Next/Later beats Gantt** for product work; reserve Gantt/critical-path for genuinely sequential, dependency-heavy delivery (migrations, launches with hard external dates) — see §6.5.
- **Roadmap ≠ release plan ≠ OKRs.** Roadmap = direction; release plan = what ships when; OKRs = the outcomes the roadmap is meant to produce. Keep them distinct or you'll commit dates to outcomes.

**HY:** **Now/Next/Later** = ուղղություն առանց false ամսաթվի (default). ամսաթիվ commit արա միայն երբ scope+capacity+dependency հայտնի են։ **Theme/outcome-based** = կազմակերպիր outcome-ների շուրջ, ոչ feature-ների ցուցակ — սա feature-factory-ի հակաթույնն է (commit արա *խնդիր ու metric*, ոչ լուծում)։ **Capacity-honest**՝ ~20–30% չպլանավորվածի համար։ Roadmap ≠ release plan ≠ OKR — մի՛ խառնիր, թե չէ ամսաթիվ կdeclare-ես outcome-ի վրա։

---

## 10. DECISION RULES (fast)

- **Which hat am I wearing?** PM (outcome/what-why) · PO (the increment's correctness) · PgM (coordinated on-time delivery of decided scope). Name it; the failure modes differ (§0.1).
- **Build it?** Only if it ties to a desired outcome AND beats the current top of the backlog on value/effort (or cost-of-delay). If it serves no outcome, it's noise — cut it.
- **Validate first or build first?** If the riskiest assumption is cheap to test, test it (interview/prototype/fake-door) before building. Build-first only when building *is* the cheapest test. **Match the test to the risk type** (§2.5).
- **How big a first slice?** The smallest that delivers real value AND produces a learning signal. If it teaches nothing, you're gambling; if it delivers nothing, you're only studying.
- **Which prioritization tool?** Thin a long list → ICE. Many candidates to rank defensibly → RICE. Known set to sequence + timing matters → WSJF/CoD. Scoping one release → MoSCoW. Feature mix/quality balance → Kano. Fast triage → value/effort 2×2. Your own time/interrupts → Eisenhower.
- **Which document?** Default → one-pager. Need to nail value+clarity for a launch → PR-FAQ (working-backwards). Propose an approach for critique → RFC. Record a one-way-door decision → ADR. Unit of delivery → user story (INVEST + acceptance criteria).
- **Estimate or count?** Estimate when a *decision* needs the number (commit a date, fund it, sequence across teams). Otherwise slice small and measure cycle time (#NoEstimates).
- **Commit a date?** Only when scope, capacity, and dependencies are known; otherwise give a range or Now/Next/Later. Never a precise date on an outcome you don't yet know how to reach.
- **Cut scope or slip the date?** Protect the outcome and the committed date: cut should/could scope *before* slipping a committed date. **The iron triangle says something flexes — make it scope, deliberately** (§6.5).
- **Add people to go faster?** Almost never mid-flight (Brooks's Law). Reduce scope, lower WIP, or unblock the constraint instead.
- **What do I accelerate to pull in the date?** The **critical path only** — crashing an off-path task is wasted money (§6.5).
- **Persevere or pivot?** Read the engine-of-growth data on a cadence; persevere if it's validating, pivot if it isn't, kill if neither — **sunk cost is not a reason to continue** (money spent is gone whether you continue or not; decide only on future value vs future cost).
- **Stop a project?** When evidence says the problem isn't real, the value won't materialize, or a better bet has emerged. Cutting a loser is a win, not a failure.
- **A HiPPO is pushing a pet feature?** Convert the opinion into a hypothesis and run the cheapest test; let data decide (§8).
- **Is it done?** Only when verified working in the running system and the success metric is instrumented. "Built" / "merged" / "compiles" is not done.
- **Ceremony or cut it?** Keep it only if it measurably improves flow, learning, or trust; otherwise it's theater — cut it.

---

## 11. ANTI-PATTERNS (smell → fix)

- **Feature factory** — shipping output, measuring activity (velocity, # features) not outcomes. *Fix:* tie every item to a metric; review *outcomes*, not just shipped count; empower the team with a problem, not a feature list; outcome-based roadmap.
- **Build trap (Perri)** — measuring success by features shipped, not value delivered; the org is stuck producing output. *Fix:* outcome-based goals + product strategy; ask "what did this *change* for the user/business?"; empowered teams over feature teams.
- **Solution-first** — building the fix before validating the problem. *Fix:* discovery, JTBD, the four risks, an experiment (matched to the risk type) that could kill the idea cheaply.
- **No discovery / discovery theater** — building straight from a backlog with no customer contact; or interviews/research that never change a decision. *Fix:* continuous discovery, the **weekly customer touchpoint**, opportunity-solution tree; every study tied to an assumption that, if wrong, *changes the plan*.
- **Output-over-outcome OKRs** — KRs that are a task list ("ship feature X") not results. *Fix:* KRs are measurable *outcomes*; the feature is how you might hit them, not the KR itself.
- **HiPPO-driven** — Highest-Paid-Person's-Opinion overrides evidence. *Fix:* bring data + user signal; reframe the opinion as a testable hypothesis ("let's run the cheap test").
- **Roadmap as promise list** — dated features that slip and erode trust. *Fix:* Now/Next/Later, theme-based, commit only the committable, confidence bands.
- **Everything is P0** — no real prioritization. *Fix:* force-rank #1 vs #2; protect the line; "if everything is urgent, nothing is."
- **Big-bang release** — months of dark work, one risky launch. *Fix:* thin vertical slices, small batches, flags, phased rollout, ship continuously.
- **Declared-done** — reporting complete on "I built it" / it compiles / PR merged, before it's verified working in the running system. *Fix:* DoD includes a live verification; "done" is demonstrated, not asserted.
- **Watermelon status** — green outside, red inside; risk hidden until the deadline. *Fix:* report against verified DoD; surface blockers loudly and early; honest yellow beats fake green.
- **Vanity metrics** — pageviews/signups that feel good but don't predict value. *Fix:* leading indicators + cohort/retention tied to the North Star; actionable + comparable metrics.
- **No guardrails / Goodhart gaming** — a single target optimized into local harm. *Fix:* pair every goal with a counter-metric; watch for gaming; re-validate the metric proxies real value.
- **MVP-as-excuse** — shipping a broken v1 and calling it "minimum viable." *Fix:* MVP tests a *hypothesis*; if quality matters in the market, ship the **minimum lovable** product.
- **Peeking / under-powered experiments** — stopping an A/B early on a flicker, or running it too small. *Fix:* fix sample size + duration + threshold up front; require the primary to move *and* guardrails to hold (Skill 11).
- **Scope creep by silence** — no explicit non-goals, so everything drifts in. *Fix:* write non-goals; new asks go through re-prioritization, not the side door.
- **Backlog as graveyard** — thousands of stale items nobody triages. *Fix:* ruthless pruning; if it won't make Now/Next, it's a someday note, not a backlog item.
- **Estimate-as-commitment** — a rough estimate quoted upstairs as a promise. *Fix:* communicate ranges + confidence; separate estimate (engineering) from commitment (negotiated scope+date).
- **Iron-triangle denial** — demanding fixed scope + fixed date + fixed team + high quality. *Fix:* name the triangle out loud; flex scope deliberately; quality is not the flex.
- **Gantt-charting the unknown** — a precise dependency chart over exploratory product work. *Fix:* Now/Next/Later + flow for discovery work; reserve CPM/Gantt for sequential, hard-dependency delivery.
- **No RAID / surprise dependencies** — a cross-team dependency discovered at the deadline. *Fix:* maintain the RAID log; review on a cadence; each dependency owned with a date.
- **Mythical man-month** — throwing people at a late project. *Fix:* cut scope, lower WIP, unblock the constraint; protect the existing team's flow.
- **Velocity weaponized** — story points used to rank or pressure people. *Fix:* velocity is a *team planning* tool only; measure delivery with DORA at the system level.
- **Local optimization** — speeding up a non-bottleneck (or a non-critical-path task). *Fix:* Theory of Constraints — find and elevate the real constraint / accelerate the critical path only.
- **Ceremony theater / cargo-cult agile** — running the rituals (standup, points, sprints) with none of the engineering discipline or the empowerment. *Fix:* XP-grade engineering practice + empowered teams; cut any ceremony not improving flow/learning/trust.
- **PM/PO/PgM conflation** — orphaned outcomes or double-managed teams. *Fix:* name the role per work; PM owns outcome, PO owns the increment, PgM owns coordinated delivery (§0.1).
- **Zombie project** — kept alive by sunk cost / nobody empowered to kill it. *Fix:* explicit kill criteria up front; review against evidence; pivot-or-kill on a cadence; cutting a loser is a win.

---

## 12. CANON QUICK-REFERENCE (named correctly)

- **Marty Cagan** — *Inspired* (the empowered product team, the product manager's real job) & *Empowered* (product leadership, coaching, the feature-team→empowered-team shift); the **four product risks** (value/usability/feasibility/viability); **product trio**.
- **Teresa Torres** — *Continuous Discovery Habits*: the **opportunity-solution tree**, the **weekly customer touchpoint** habit, dual-track discovery, assumption testing.
- **Eric Ries** — *The Lean Startup*: **build-measure-learn**, **MVP**, validated learning, innovation accounting, **pivot-or-persevere**. (Steve Blank — customer development, the root it grows from.)
- **John Doerr** — *Measure What Matters*: **OKRs** (objectives + key results, commit vs aspirational), outcomes over outputs. (Andy Grove — the origin at Intel.)
- **Clayton Christensen** — *The Innovator's Dilemma* / *Competing Against Luck*: **Jobs-to-be-Done**, disruption, the milkshake. (Tony Ulwick — **ODI** / opportunity scoring; Bob Moesta — the Switch / forces of progress.)
- **Donald Reinertsen** — *The Principles of Product Development Flow*: **cost of delay**, **WSJF/CD3**, queueing theory, batch size, WIP — the economics of flow.
- **Melissa Perri** — *Escaping the Build Trap*: output→outcome, product strategy, the feature-factory cure.
- **Marty's lineage on delivery:** **Sutherland/Schwaber** (Scrum), **Kent Beck** (XP — TDD, pairing, CI, refactoring), **David Anderson** (Kanban, WIP limits, flow), **Poppendieck** (Lean software — the seven wastes), **Basecamp/Singer** (Shape Up — appetite, shaping, betting, hill chart, circuit breaker).
- **Eliyahu Goldratt** — *The Goal* / *Critical Chain*: **Theory of Constraints**, the bottleneck, critical-chain buffering.
- **Fred Brooks** — *The Mythical Man-Month*: Brooks's Law, "no silver bullet," conceptual integrity.
- **Amazon / Bezos** — **working backwards**, the **PR-FAQ**, the narrative six-pager, two-way vs one-way doors.
- **Karl Wiegers** — *Software Requirements*: requirements discipline, acceptance criteria.
- **Bill Wake** — **INVEST** stories; **Mike Cohn** — user stories, SPIDR splitting, agile estimation.
- **Nicole Forsgren / Jez Humble / Gene Kim** — *Accelerate* / **DORA**: the four keys; speed and stability rise together.
- **Noriaki Kano** — the **Kano model** (basic/performance/delight). **Sean Ellis / Dave McClure** — **AARRR** pirate metrics; product-market-fit survey.
- **Gary Klein** — the **pre-mortem**. **Kahneman / Flyvbjerg** — planning fallacy, reference-class forecasting, the outside view. **Cialdini** — influence/persuasion (applied via Skill 08). **Mendelow** — stakeholder power/interest grid.
- **Laws/limits invoked:** Brooks's Law · Hofstadter's Law · Little's Law · Goodhart's Law · Conway's Law (org→architecture, Skill 02) · the Cone of Uncertainty · Parkinson's Law & student syndrome · Pareto 80/20 (Skill 11).

---

## 13. ԲԱՌԱՐԱՆ (glossary)

**EN:** outcome vs output vs impact · empowered product team vs feature team · product trio (Product/Design/Eng) · PM vs PO vs PgM · dual-track agile (discovery ∥ delivery) · JTBD / job story / forces of progress (Switch) · ODI / desired outcome / opportunity score · opportunity-solution tree · continuous discovery / weekly touchpoint · assumption mapping / leap-of-faith assumption · the four risks (value/usability/feasibility/viability) · desirability · assumption test (fake-door/painted-door/concierge/Wizard-of-Oz/smoke test/spike) · leading vs lagging indicator · guardrail / counter-metric · North Star Metric · OKR (commit vs aspirational) · HEART (Goal→Signal→Metric) · AARRR (pirate metrics) · cohort / retention curve · vanity vs actionable metric · PRD / one-pager · working-backwards / PR-FAQ · RFC · ADR · user story / INVEST · acceptance criteria (Given/When/Then) · non-goals · RICE · ICE · WSJF / CD3 · cost of delay + urgency profiles (standard/expedite/fixed-date/intangible) · MoSCoW · Kano (basic/performance/delight) · value/effort 2×2 · Eisenhower (urgent/important) · buy-a-feature · Now/Next/Later · theme/outcome-based roadmap · vertical slice / SPIDR · small batch · WIP limits · Little's Law · Theory of Constraints / bottleneck · critical path / slack-float / crashing · iron triangle (scope/time/cost/quality) · RAID log (risks/assumptions/issues/dependencies) · risk register (avoid/mitigate/transfer/accept) · contingency/management reserve · Definition of Done · Scrum / sprint / velocity · Kanban / pull / flow · XP (TDD/pair/CI/refactor) · Lean / seven wastes · Shape Up / appetite / shaping / betting / hill chart / circuit breaker · Cone of Uncertainty · Brooks's Law · Hofstadter's Law · planning fallacy · reference-class forecasting / outside view · #NoEstimates · DORA (deploy freq / lead time / change-fail rate / MTTR) · pre-mortem / post-mortem · watermelon status · build trap / feature factory · HiPPO · disagree-and-commit · RACI · power/interest grid · influence without authority · sunk cost · build-measure-learn · MVP / MLP · validated learning · hypothesis-driven development · A/B test / guardrail / sample-size-up-front · pivot vs persevere · innovation accounting · Goodhart's Law.

**HY (հիմնական եզրեր, native):** outcome / output / impact (արդյունք / թողարկում / ազդեցություն — միշտ ասա ո՞րն ի նկատի) · empowered թիմ vs feature թիմ (խնդիր vs feature-ների ցուցակ) · product trio (Product/Design/Eng միասին) · PM vs PO vs PgM (outcome / increment-ի ճշտություն / համակարգված delivery) · dual-track agile (discovery ∥ delivery զուգահեռ) · JTBD / job story («When… I want… so I can…») / Switch-ի ուժերը (push+pull vs habit+anxiety) · ODI / opportunity score · opportunity-solution tree (outcome→opportunity→solution→experiment) · continuous discovery / weekly touchpoint (շաբաթական customer-ի հետ կապ՝ keystone սովորություն) · assumption mapping / leap-of-faith ենթադրություն · չորս ռիսկ (value/usability/feasibility/viability) · assumption test (fake-door/concierge/smoke test/spike — ըստ ռիսկի տեսակի) · leading vs lagging (ղեկ vs հաշիվ) · guardrail / counter-metric · North Star Metric · OKR (commit vs aspirational, 70%=win) · HEART · AARRR · cohort / retention կոր · vanity vs actionable · one-pager / PRD · working-backwards / PR-FAQ (press release-ը ՆԱԽ) · RFC (քննարկման առաջարկ) · ADR (մեկ որոշման անփոփոխ գրառում) · user story / INVEST / acceptance criteria · non-goals · RICE / ICE / WSJF / cost of delay (+ urgency profile-ներ) · MoSCoW · Kano · value/effort 2×2 · Eisenhower (urgent/important) · Now/Next/Later · theme-based roadmap · vertical slice / SPIDR · small batch · WIP limit · Little's Law · Theory of Constraints / bottleneck (խցան) · critical path / slack / crashing (արագացրու միայն critical path-ը) · iron triangle (scope/time/cost, quality-ով սահմանված — flex արա scope-ը) · RAID log (Risks/Assumptions/Issues/Dependencies) · risk register (avoid/mitigate/transfer/accept) · contingency reserve · Definition of Done (running system-ում verify-արած) · Scrum / sprint / velocity · Kanban / pull / flow · XP (TDD/pair/CI/refactor — կոդը shippable պահողը) · Lean / 7 waste · Shape Up / appetite / hill chart / circuit breaker · Cone of Uncertainty · Brooks's Law · planning fallacy / reference-class forecasting (outside view) · #NoEstimates · DORA · pre-mortem / post-mortem · watermelon status · build trap / feature factory · HiPPO · disagree-and-commit · RACI (մեկ A ամեն որոշման) · power/interest grid (Mendelow) · influence without authority (ship ազդեցությամբ, ոչ հրամանով) · sunk cost · build-measure-learn · MVP / MLP · validated learning · hypothesis-driven (threshold նախքան build) · A/B test (sample size/threshold նախապես) · pivot vs persevere · Goodhart-ի օրենք (target-ը դառնում է վատ չափիչ)։

---
*EN: Skill 04 v4 — top-level, living. Build the right thing, smallest valuable slice first, measure it moved. Discover continuously (weekly touchpoint, opportunity tree, test the riskiest assumption cheapest); empower the team with a problem, not a feature list; write to think (one-pager / PR-FAQ / ADR); prioritize ruthlessly (ICE→RICE→WSJF); roadmap as direction not promise; deliver in small verified batches; experiment your way through uncertainty (build-measure-learn, pivot-or-persevere); influence through honest status and evidence. Done = verified working in the running system, not "built." Outcomes over output; honest status over fast-looking status.*
*HY: Skill 04 v4 — top-level, living։ Կառուցիր ճիշտ բանը, ամենափոքր արժեքավոր slice-ը առաջինը, չափիր՝ շարժվեց։ Discover արա անընդհատ (շաբաթական touchpoint, opportunity tree, ամենառիսկային ենթադրությունը ամենաէժան թեստով). թիմին տուր *խնդիր*, ոչ feature-ների ցուցակ. գրիր որ մտածես (one-pager / PR-FAQ / ADR). prioritize արա անխնա (ICE→RICE→WSJF). roadmap-ը ուղղություն է, ոչ խոստում. ship արա փոքր verify-արած batch-երով. անորոշության միջով անցիր փորձարկելով (build-measure-learn, pivot-or-persevere). ազդիր անկեղծ status-ով ու evidence-ով։ Done = running system-ում verify-արած աշխատող, ոչ թե «սարքած»։ Outcome > output. անկեղծ status > արագ երևացող status։ 💪🤍*
*Deepened 2026-06-24: added §0.1 PM/PO/PgM roles · §2.0 empowered teams/product trio/dual-track agile · §2.5 assumption-test taxonomy by risk type · §3.1 doc types (PR-FAQ/RFC/ADR/INVEST stories) · §5 full metrics stack (leading/lagging/guardrails/cohorts/Goodhart) · §6.3 XP & Lean · §6.5 iron triangle + critical path · §6.6 risk management + RAID log · §7 Lean Startup/MVP/A-B/hypothesis-driven/pivot · §8 stakeholder management & influence-without-authority · §12 Canon quick-reference. All v3 content preserved.*
