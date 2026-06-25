# Product and Project Management output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every number traceable to its formula or to evidence, and label assumptions. Do not invent customer data or market figures.

### Template 1 — PRD (problem-first)

- **Problem & users:** the user, the problem, and the activation/usage context — stated before any solution
- **Outcome (success metric):** the measurable result this serves (e.g. activation 38% → 45% this quarter), not "ship feature X"
- **Non-goals:** what this explicitly does not do (the scope-creep guard)
- **Requirements:** the capabilities the user must get
- **Constraints:** flags/cohorts, performance limits, dependencies
- **Success metrics + instrumentation:** primary metric · guardrail (what must not regress) · secondary — each an instrumented event, dated and owned
- **Rollout:** flag → cohort → read delta vs control → proceed/iterate/kill
- **Risks & mitigations:** per risk, the mitigation
- **Acceptance criteria (Definition of Done):** behaviors observed working **in the running product** with the metric instrumented — not "merged" or "demoed"
- **Owner & review cadence:**

### Template 2 — RICE / WSJF prioritization sheet

- **Decision & outcome:** what we are sequencing and which outcome it serves
- **Method:** RICE for uncertain product bets · WSJF for a cost-of-delay delivery queue (state which and why)
- **Score table (RICE):**

| Bet | Reach | Impact (0.25–3) | Confidence (0–1, evidence-tied) | Effort | RICE = (R×I×C)/E |
|---|---|---|---|---|---|
| | | | | | |

- **(WSJF alternative):** Cost of Delay (value + time-criticality + risk/opportunity) / Job Size per item
- **Base rank:** the order before stress-testing
- **Sensitivity check:** which soft input (confidence/effort) is weak, and whether the rank flips under an honest change — name the flip if there is one
- **Decision & next action:** what ships now; what needs an experiment or a team estimate to earn its place
- **Acceptance:** every score recomputable from the formula · confidence tied to evidence · sensitivity run

### Template 3 — Roadmap (bets with learning gates)

- **Outcome anchor:** the outcome metric the whole roadmap serves
- **Now (committed, detailed):** bet · hypothesis · proceed/iterate/kill gate · dependencies / critical-path note
- **Next (planned, not day-dated):** bet · hypothesis · gate · sequencing basis (e.g. experiment result)
- **Later (directional, cheap to change):** bet · the outcome it points at · explicitly "may not make"
- **Critical-path / dependencies:** what must land first (e.g. instrumentation before any measurable bet)
- **Decision cadence:** when gates are reviewed and cohorts read
- **Acceptance:** horizons not dated promises · every bet has a hypothesis + gate · dependencies/critical path named before any date

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն թիվ պահիր հետագծելի իր formula-ին կամ evidence-ին, և label արա assumption-ները։ Մի՛ հորինիր customer data կամ market figure։

### Template 1 — PRD (problem-first)

- **Problem & users․** user-ը, problem-ը և activation/usage համատեքստը — նշված ցանկացած solution-ից առաջ
- **Outcome (success metric)․** չափելի արդյունքը, որ սա ծառայում է (օր.՝ activation 38% → 45% այս եռամսյակ), ոչ «ship արա feature X»
- **Non-goals․** ինչ սա բացահայտորեն չի անում (scope-creep-ի guard-ը)
- **Requirements․** կարողությունները, որ user-ը պետք է ստանա
- **Constraints․** flag/cohort, performance limit, dependency-ներ
- **Success metrics + instrumentation․** primary metric · guardrail (ինչ չպետք է regress անի) · secondary — ամեն մեկը instrumented event, dated և owned
- **Rollout․** flag → cohort → կարդա delta-ն control-ի դեմ → proceed/iterate/kill
- **Risks & mitigations․** ամեն risk-ի համար՝ mitigation-ը
- **Acceptance criteria (Definition of Done)․** վարքեր, դիտված աշխատելիս **running product-ում**՝ metric-ը instrumented — ոչ «merged» կամ «demoed»
- **Owner & review cadence․**

### Template 2 — RICE / WSJF prioritization sheet

- **Decision & outcome․** ինչ ենք sequence անում և որ outcome-ին է ծառայում
- **Method․** RICE՝ uncertain product bet-երի համար · WSJF՝ cost-of-delay delivery queue-ի համար (նշիր որը և ինչու)
- **Score table (RICE)․**

| Bet | Reach | Impact (0.25–3) | Confidence (0–1, evidence-կապված) | Effort | RICE = (R×I×C)/E |
|---|---|---|---|---|---|
| | | | | | |

- **(WSJF այլընտրանք)․** Cost of Delay (value + time-criticality + risk/opportunity) / Job Size ամեն item-ի
- **Base rank․** հերթականությունը stress-test-ից առաջ
- **Sensitivity check․** որ փափուկ input-ն է (confidence/effort) թույլ, և rank-ը flip անու՞մ է ազնիվ փոփոխության դեպքում — անվանի՛ր flip-ը, եթե կա
- **Decision & next action․** ինչ է ship անում հիմա. ինչին պետք է experiment կամ team estimate իր տեղը վաստակելու համար
- **Acceptance․** ամեն score վերահաշվելի formula-ից · confidence-ը evidence-ին կապված · sensitivity արված

### Template 3 — Roadmap (learning gate-երով bet-եր)

- **Outcome anchor․** outcome metric-ը, որ ողջ roadmap-ը ծառայում է
- **Now (committed, detailed)․** bet · hypothesis · proceed/iterate/kill gate · dependency-ներ / critical-path note
- **Next (planned, ոչ օրը-օրին dated)․** bet · hypothesis · gate · sequencing հիմքը (օր.՝ experiment-ի արդյունք)
- **Later (directional, էժան փոխվող)․** bet · outcome-ը, որին ուղղված է · բացահայտ «գուցե չանենք»
- **Critical-path / dependencies․** ինչ պետք է առաջինը land անի (օր.՝ instrumentation՝ մինչև ցանկացած չափելի bet)
- **Decision cadence․** երբ են gate-երը review-վում և cohort-ները կարդացվում
- **Acceptance․** horizon-ներ, ոչ dated promise · ամեն bet ունի hypothesis + gate · dependency-ները/critical path-ը անվանված ցանկացած date-ից առաջ
