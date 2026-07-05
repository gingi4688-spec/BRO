# Product and Project Management red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (opportunity-solution tree, PRD, RICE/WSJF sheet, roadmap, delivery plan, launch readout). It extends but never replaces the boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Solution-first PRD** — a spec that names the build before the user problem, with no outcome and no non-goals. Re-root it in the problem and the success metric.
- **Roadmap as dated promises** — fixed far-out dates with no hypothesis or learning gate. Reframe as bets by horizon with proceed/iterate/kill gates.
- **Adjective success metric** — "easy," "fast," "shipped" standing in for a measurable user/business outcome. Require an instrumented metric.
- **Prioritization theater** — RICE/WSJF reverse-engineered to justify a pre-made pick, confidence pinned at 100%, no sensitivity. Recompute with honest confidence and run the rank-flip check.
- **Late dependency** — a date committed with no dependency map or critical path. Require the critical path before any date.
- **Silent scope creep** — new scope absorbed with no date or scope tradeoff named. Force the tradeoff to the surface.
- **Role confusion (PM/PO/PgM)** — an artifact that mixes lenses, or one person asked to own why/what + backlog + cross-team schedule with no distinction. Name the role each decision belongs to.
- **Invented evidence** — customer data, adoption figures, or market numbers stated as fact without a source. Refuse to invent; label as assumption or verify-before-use.
- **"Done" on a merge** — an item closed on "merged"/"demoed" with no acceptance criteria observed in the running product. Require verified-in-the-running-system.
- **Strategy under a PM label** — a market/pricing/build-vs-buy decision answered as prioritization. Route to `business-strategy-operations`.

### Reviewer probes (ask these of any answer)

- Does the PRD state the **problem and outcome before the solution**, and does it have **non-goals**? If it opens with "build X," it is not ready.
- Is every success criterion an **instrumented metric** read in the running product, or is it an adjective ("easy," "fast")?
- For each RICE/WSJF score: can you **recompute it from the inputs**, is **confidence tied to evidence**, and does a **sensitivity check** show whether the rank survives an honest change?
- Is the roadmap **bets-with-gates by horizon**, or a list of far-out dated promises? Where is each bet's **hypothesis** and its **proceed/iterate/kill** rule?
- Was the **critical path and dependency map** built **before** any date was committed — or did a dependency surface afterward?
- When scope changed, was the **tradeoff named** (what slips, what date moves), or was it silently absorbed?
- Which **role** does this artifact serve — PM (why/what), PO (backlog/acceptance), or PgM (cross-team schedule)? Is it built for one clear lens, or does it blur them?
- Does the launch carry a **hypothesis, guardrail, learning metric, and kill/iterate/scale rule set before shipping**, so the readout can decide?
- Does "done" mean **verified in the running system** against acceptance criteria with the metric instrumented — or does it stop at "merged"?
- Did the answer **invent** any customer data, adoption number, or market figure, is any **strategy decision** being made under a PM label, and is the **Armenian equal-depth and punctuation-clean**?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (opportunity-solution tree, PRD, RICE/WSJF sheet, roadmap, delivery plan, launch readout)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Solution-first PRD** — spec, որ build-ը անվանում է user-ի problem-ից առաջ, առանց outcome-ի և non-goals-ի։ Վերա-խարսխիր այն problem-ի և success metric-ի վրա։
- **Roadmap՝ որպես dated promise** — հաստատ հեռու date-եր՝ առանց hypothesis-ի կամ learning gate-ի։ Reframe արա որպես bet-եր horizon-ով՝ proceed/iterate/kill gate-երով։
- **Ածական success metric** — «easy», «fast», «shipped»՝ չափելի user/business outcome-ի փոխարեն։ Պահանջիր instrumented metric։
- **Prioritization theater** — RICE/WSJF՝ հակառակ-ինժեներված նախապես կայացված ընտրությունն արդարացնելու, confidence-ը 100%-ի վրա pin-ված, sensitivity չկա։ Վերահաշվիր ազնիվ confidence-ով և արա rank-flip check-ը։
- **Ուշ dependency** — date՝ commit-ված առանց dependency map-ի կամ critical path-ի։ Պահանջիր critical path ցանկացած date-ից առաջ։
- **Լուռ scope creep** — նոր scope՝ կլանված առանց date կամ scope tradeoff անվանելու։ Հանի՛ր tradeoff-ը մակերես։
- **Role confusion (PM/PO/PgM)** — artifact, որ խառնում է ոսպնյակները, կամ մեկ մարդ՝ խնդրված տիրել why/what + backlog + cross-team schedule-ին առանց տարբերակման։ Անվանի՛ր role-ը, որին ամեն որոշում պատկանում է։
- **Հորինված evidence** — customer data, adoption figure կամ market թիվ՝ նշված որպես fact առանց աղբյուրի։ Հրաժարվիր հորինելուց. label արա որպես assumption կամ verify-before-use։
- **«Done» merge-ի վրա** — item, փակված «merged»/«demoed»-ի վրա առանց acceptance criteria-ի դիտված running product-ում։ Պահանջիր verified-in-the-running-system։
- **Ստրատեգիա PM label-ի տակ** — market/pricing/build-vs-buy որոշում՝ պատասխանված որպես prioritization։ Ուղղորդիր `business-strategy-operations`-ին։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- PRD-ն նշու՞մ է **problem-ը և outcome-ը solution-ից առաջ**, և ունի՞ **non-goals**։ Եթե սկսում է «build X»-ով, ready չէ։
- Ամեն success criterion **instrumented metric** է՞՝ կարդացված running product-ում, թե ածական է («easy», «fast»)։
- Ամեն RICE/WSJF score-ի համար․ կարո՞ղ ես **վերահաշվել input-երից**, **confidence-ը evidence-ին կապվա՞ծ է**, և **sensitivity check**-ը ցույց է տալիս, որ rank-ը գոյատևո՞ւմ է ազնիվ փոփոխության։
- Roadmap-ը **bets-with-gate-ներ horizon-ով** է՞, թե հեռու dated promise-ների list։ Որտեղ է ամեն bet-ի **hypothesis**-ը և իր **proceed/iterate/kill** rule-ը։
- **Critical path-ը և dependency map-ը** կառուցվե՞լ են ցանկացած date commit անելուց **առաջ** — թե dependency-ն երևաց հետո։
- Երբ scope-ը փոխվեց, **tradeoff-ը անվանվե՞ց** (ինչ է սահում, որ date-ն է շարժվում), թե լուռ կլանվեց։
- Որ **role**-ին է ծառայում այս artifact-ը — PM (why/what), PO (backlog/acceptance), թե PgM (cross-team schedule)։ Կառուցված է՞ մեկ հստակ ոսպնյակի համար, թե խառնում է դրանք։
- Launch-ը կրու՞մ է **hypothesis, guardrail, learning metric և kill/iterate/scale rule՝ սահմանված ship-ից առաջ**, որ readout-ը կարողանա որոշել։
- «Done»-ը նշանակու՞մ է **verified running system-ում** acceptance criteria-ի դեմ՝ metric-ը instrumented — թե կանգնում է «merged»-ի վրա։
- Պատասխանը **հորինե՞ց** որևէ customer data, adoption թիվ կամ market figure, որևէ **ստրատեգիայի որոշում** կայացվու՞մ է PM label-ի տակ, և **հայերենը equal-depth ու punctuation-clean** է՞։
