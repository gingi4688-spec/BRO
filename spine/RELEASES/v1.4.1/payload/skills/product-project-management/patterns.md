# Product and Project Management patterns

## English

These are canonical product/project-management moves. Each is a mechanism for one of the domain's artifacts (opportunity-solution tree, PRD, RICE/WSJF sheet, roadmap, delivery/dependency plan, launch readout). Choose the move that changes the next decision, not the nicest label.

### 1. Opportunity-solution discovery cut

- **Trigger:** A feature request arrives as the answer, or a stakeholder says "just build X."
- **Mechanism:** Map desired outcome → customer opportunities → candidate solutions → experiments. Reject any solution with no opportunity link and no outcome it moves. Attach an experiment to the riskiest assumption before committing build.
- **Do not use when:** The work is a compliance- or contract-mandated delivery where the solution is already obligatory — discovery cannot change it.
- **Failure repair:** If the tree has one branch, discovery has not happened; add real alternatives and the opportunities they map to.

### 2. RICE/WSJF priority sheet with sensitivity

- **Trigger:** A roadmap debate is political, or items are ordered by who asked.
- **Mechanism:** Compute RICE `(Reach × Impact × Confidence) / Effort` for uncertain product bets, or WSJF `Cost of Delay / Job Size` for a delivery queue. Tie confidence to evidence strength, show every input, and run a sensitivity check — does the rank flip under an honest confidence/effort change?
- **Do not use when:** A strategy constraint already excludes an option, or the choice is which market/price (route to `business-strategy-operations`).
- **Failure repair:** If confidence is 100% with no evidence, lower it and re-rank; if the favored item only wins at confidence 1.0, say so.

### 3. PRD acceptance gate

- **Trigger:** A spec is heading into build, or "the requirements are ready."
- **Mechanism:** Verify the PRD has problem-before-solution, users, non-goals, requirements/constraints, success metrics with instrumentation, rollout, risks, and edge cases — and that every acceptance criterion is testable in the running product, not an adjective.
- **Do not use when:** The change is a one-line fix or a trivial bug with no user-facing behavior to specify.
- **Failure repair:** If a success criterion cannot be instrumented, the PRD is not ready; convert the adjective to a measured metric or send it back.

### 4. Roadmap as bets with learning gates

- **Trigger:** A roadmap is requested, or one exists as a Gantt of dated feature promises.
- **Mechanism:** Sequence bets by horizon (now / next / later). Each bet carries a hypothesis, the outcome it serves, and a proceed/iterate/kill gate. Express confidence by horizon, not false-precise far-out dates; "now" is committed and detailed, "later" is directional.
- **Do not use when:** A hard external deadline (regulatory, contractual) genuinely fixes a date — then commit it, but still attach the dependency/critical-path basis.
- **Failure repair:** If the roadmap is a promise list, reframe each item as a bet with a gate and move far-out items to "later."

### 5. Dependency / critical-path delivery plan

- **Trigger:** A date is about to be committed, or a dependency surfaced after a commitment was made.
- **Mechanism:** Build the dependency graph, find the critical path (the longest chain of dependent work), and baseline the date from it. Track a risk burndown and a decision cadence. Only a change on the critical path moves the end date; protect it, and put slack where it does no harm.
- **Do not use when:** The work is a single independent task with no cross-team or sequential dependencies — a critical path of one is overhead.
- **Failure repair:** If a dependency was found after commitment, re-map the full graph now, re-baseline from the critical path, and name what slipped and why.

### 6. Launch-and-learning loop

- **Trigger:** A bet is about to ship, or a launch readout is being written.
- **Mechanism:** Before shipping, set a hypothesis, a guardrail metric (what must not get worse), the learning metric (what decides success), and a kill/iterate/scale threshold. After launch, read the result against the pre-agreed rule and decide. Verify the success metric in the running product, not on a closed ticket.
- **Do not use when:** The change is purely internal with no measurable user/business effect to learn from — but even then, name the guardrail that must not regress.
- **Failure repair:** If the launch had no pre-set threshold, the readout cannot decide anything; set the rule before the next launch and treat a flat result honestly, not as success.

## Հայերեն

Սրանք canonical product/project-management move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (opportunity-solution tree, PRD, RICE/WSJF sheet, roadmap, delivery/dependency plan, launch readout)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Opportunity-solution discovery cut

- **Երբ է պետք․** Feature request-ը գալիս է որպես պատասխան, կամ stakeholder-ն ասում է «պարզապես build արա X»։
- **Մեխանիզմը․** Քարտեզագրիր desired outcome → customer opportunity-ներ → candidate solution-ներ → experiment-ներ։ Reject արա ցանկացած solution՝ առանց opportunity link-ի և առանց outcome-ի, որ շարժում է։ Կցիր experiment ամենառիսկային assumption-ին՝ նախքան build commit անելը։
- **Երբ չօգտագործել․** Աշխատանքը compliance- կամ contract-mandated delivery է, որտեղ solution-ն արդեն պարտադիր է — discovery-ն չի կարող փոխել այն։
- **Ուղղում․** Եթե tree-ն մեկ ճյուղ ունի, discovery չի եղել. ավելացրու իրական alternative-ներ և opportunity-ները, որ դրանք map են անում։

### 2. RICE/WSJF priority sheet՝ sensitivity-ով

- **Երբ է պետք․** Roadmap debate-ը political է, կամ item-ները դասավորված են ըստ նրա, ով խնդրեց։
- **Մեխանիզմը․** Հաշվիր RICE `(Reach × Impact × Confidence) / Effort` uncertain product bet-երի համար, կամ WSJF `Cost of Delay / Job Size` delivery queue-ի համար։ Confidence-ը կապիր evidence-ի ուժին, ցույց տուր ամեն input, և արա sensitivity check — rank-ը flip անու՞մ է ազնիվ confidence/effort փոփոխության դեպքում։
- **Երբ չօգտագործել․** Ստրատեգիայի constraint-ն արդեն exclude է անում option-ը, կամ ընտրությունը market/price-ի մասին է (ուղղորդիր `business-strategy-operations`-ին)։
- **Ուղղում․** Եթե confidence-ը 100% է առանց evidence-ի, իջեցրու և վերա-rank արա. եթե նախընտրած item-ը հաղթում է միայն confidence 1.0-ով, ասա՛ դա։

### 3. PRD acceptance gate

- **Երբ է պետք․** Spec-ը գնում է build, կամ «requirements-ը ready են»։
- **Մեխանիզմը․** Ստուգիր, որ PRD-ն ունի problem-ը-solution-ից-առաջ, users, non-goals, requirements/constraints, success metric-ներ instrumentation-ով, rollout, risks և edge case-եր — և որ ամեն acceptance criterion testable է running product-ում, ոչ ածական։
- **Երբ չօգտագործել․** Փոփոխությունը one-line fix է կամ չնչին bug՝ առանց user-facing վարքի, որ spec անել։
- **Ուղղում․** Եթե success criterion-ը instrument անել չի լինի, PRD-ն ready չէ. ածականը վերածիր չափված metric-ի կամ հետ ուղարկիր։

### 4. Roadmap՝ որպես learning gate-երով bet-եր

- **Երբ է պետք․** Roadmap է խնդրվում, կամ արդեն կա որպես dated feature-promise-ների Gantt։
- **Մեխանիզմը․** Sequence արա bet-երը horizon-ով (now / next / later)։ Ամեն bet կրում է hypothesis, outcome-ը, որ ծառայում է, և proceed/iterate/kill gate։ Confidence-ը արտահայտիր horizon-ով, ոչ false-precise հեռու date-երով. «now»-ը committed և detailed է, «later»-ը՝ directional։
- **Երբ չօգտագործել․** Կոշտ արտաքին deadline-ը (regulatory, contractual) իսկապես ֆիքսում է date — ապա commit արա այն, բայց դեռ կցիր dependency/critical-path հիմքը։
- **Ուղղում․** Եթե roadmap-ը promise list է, reframe արա ամեն item որպես bet՝ gate-ով, և հեռու item-ները տեղափոխիր «later»։

### 5. Dependency / critical-path delivery plan

- **Երբ է պետք․** Date-ն ուր որ է commit-վելու է, կամ dependency-ն երևաց commitment-ից հետո։
- **Մեխանիզմը․** Կառուցիր dependency graph-ը, գտիր critical path-ը (կախյալ աշխատանքի ամենաերկար շղթան) և baseline արա date-ը դրանից։ Հետևիր risk burndown-ին և decision cadence-ին։ Միայն critical path-ի վրա եղած փոփոխությունն է շարժում վերջնական date-ը. պաշտպանիր այն, և slack-ը դիր այնտեղ, որտեղ վնաս չի անում։
- **Երբ չօգտագործել․** Աշխատանքը մեկ անկախ task է՝ առանց cross-team կամ sequential dependency-ի — մեկ-տարրանի critical path-ը overhead է։
- **Ուղղում․** Եթե dependency-ն գտնվեց commitment-ից հետո, վերա-map արա ամբողջ graph-ը հիմա, re-baseline արա critical path-ից, և անվանի՛ր, թե ինչ սահեց ու ինչու։

### 6. Launch-and-learning loop

- **Երբ է պետք․** Bet-ն ուր որ է ship-վելու է, կամ launch readout է գրվում։
- **Մեխանիզմը․** Ship-ից առաջ սահմանիր hypothesis, guardrail metric (ինչ չպետք է վատանա), learning metric (ինչ է որոշում success-ը) և kill/iterate/scale threshold։ Launch-ից հետո կարդա արդյունքը նախապես համաձայնեցված rule-ի դեմ և որոշիր։ Verify արա success metric-ը running product-ում, ոչ փակված ticket-ի վրա։
- **Երբ չօգտագործել․** Փոփոխությունը զուտ ներքին է՝ առանց չափելի user/business էֆեկտի, որից սովորել — բայց նույնիսկ այդ դեպքում անվանի՛ր guardrail-ը, որ չպետք է regress անի։
- **Ուղղում․** Եթե launch-ը նախապես սահմանված threshold չուներ, readout-ը ոչինչ չի կարող որոշել. սահմանիր rule-ը հաջորդ launch-ից առաջ և flat արդյունքը վերաբերվիր ազնիվ, ոչ որպես success։
