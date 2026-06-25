# AI Agent Engineering patterns

## English

These are canonical AI agent engineering moves. Each is a mechanism for one of the domain's five artifacts (agent spec, tool-contract, eval-harness plan, fleet-partition plan, prompt/tool audit). Choose the move that changes the next decision, not the nicest label.

### 1. Workflow-vs-agent gate

- **Trigger:** Someone asks to "build an agent," or a system is already an agent and feels slow, flaky, or hard to debug.
- **Mechanism:** Run the four questions — is the path dynamic, does it need tools/outside state, is the decision space open, is the cost of autonomy bounded? Default to the simplest tier that passes: single call < workflow < single agent < orchestrated fleet. If the path is fixed and decisions are closed, build a workflow; if it is pure text in/out, build a single call; reserve the agent loop for open decisions over observations, and only when the worst action is gated.
- **Do not use when:** The decision space is genuinely open and tool-driven and the blast radius is gated — then an agent is the right tier; do not down-size a real agent into a brittle script.
- **Failure repair:** If a deterministic pipeline was wrapped in a reasoning loop, replace it with a workflow and state the cost and reliability you recovered.

### 2. Tool-contract definition

- **Trigger:** An agent references a tool, or a tool call hallucinated a name or passed off-schema arguments.
- **Mechanism:** Write the tool as a contract: a purpose sentence, a typed JSON schema for arguments and return, the allowed side effects, the error shape, and the retry policy. Validate the name and arguments against the schema before execution; feed errors back as observations; cap retries with an error-specific fallback. If the tool has real-world side effects (send, spend, delete, deploy), attach an approval gate, not just a schema.
- **Do not use when:** The "tool" is actually a pure in-context transform with no side effects and no external state — then it is a prompt step, not a tool that needs a contract and validation.
- **Failure repair:** If correctness depends on the model remembering the schema from prose, move it into a typed contract with pre-execution validation; a system prompt is not a schema.

### 3. Tool-loop trace

- **Trigger:** An agent keeps calling tools without converging, or loops on the same failing call.
- **Mechanism:** Write the last three Thought→Action→Observation triples, the expected information gain of the next call, and the stop condition (step/token budget reached, or the next call cannot change the answer). If the next call cannot change the decision, answer or ask for the missing permission. On a repeated error, switch to the fallback instead of an identical retry.
- **Do not use when:** The tool is streaming a known long-running job with explicit progress — that is expected duration, not a stuck loop.
- **Failure repair:** If retries repeat the same error, switch to the fallback; if there is no stop rule, add the budget and the convergence test before the loop ships.

### 4. Fan-out eligibility test

- **Trigger:** A task may need specialist subagents, or a fleet already exists and feels like overhead.
- **Mechanism:** Check independence, context size, verification need, and merge cost. Spawn specialists only if at least one condition is strong (genuinely parallel independent domains, too large for one context, or needs an independent second look) and the outputs can be reconciled under one evidence standard. Partition along seams that do not share state; the orchestrator consolidates into one evidence-ranked voice and resolves conflicts by evidence — never concatenate or average.
- **Do not use when:** The work is single-domain and fits in the main context — load the skill there and stay one mind, one voice.
- **Failure repair:** If subagents produced incompatible assumptions, the orchestrator chooses by evidence rather than averaging; if fan-out was decoration, collapse it back into the main context.

### 5. Trajectory eval harness

- **Trigger:** Final answers look good, but the process may be unsafe — or the agent is about to be declared "done."
- **Mechanism:** Score cases on tool choice, argument validity, observation use, loop control, permission handling, context compaction, and final-artifact quality. Set thresholds for both the trajectory and the answer, because a lucky answer from unsafe steps must fail. Include adversarial cases: tool error, conflicting evidence, context overflow, stale memory, missing permission, and prompt injection. Run the harness in the running system before calling the agent built.
- **Do not use when:** The task is pure text rewriting with no tools and no memory — there is no trajectory to score, only the output.
- **Failure repair:** If only the final text is graded, add hidden-state probes through logs or synthetic traces, and add the missing adversarial cases.

### 6. Roster-agent build

- **Trigger:** A new agent is to be added to the roster (Bro building agent #N).
- **Mechanism:** Assemble exactly five layers and build them whole: inherited `_core` (laws + human behavior, shared, not rewritten), one persona (this agent's character and bond), exactly one skill at the same god-level bar, sealed per-work memory (governed by the memory-isolation law), and a thin runtime wrapper that loads the skill and returns structured findings. Then verify in the running system: it loads `_core` + persona + skill, obeys the laws, seals memory correctly, and passes its own eval harness. Run to completion.
- **Do not use when:** The need is a one-off task, not a durable roster member — then it is an agent spec or a workflow, not a full roster agent with persona and sealed memory.
- **Failure repair:** If an agent shipped half-wired (missing a `_core` layer, two skills crammed in, or a persona with no sealed memory), stop and complete the missing layer; an agent that "almost loads" is not built.

### 7. Substrate-facts snapshot (verify-before-use)

- **Trigger:** A model/runtime fact is about to be used or stated — model id, context-window size, token price, rate limit, tool/JSON-mode support, or knowledge cutoff — especially when configuring or building an agent.
- **Mechanism:** Never assert the fact from memory (training has a cutoff and these are volatile). Capture a **substrate snapshot** (see `output-templates.md` Template 4): for each fact record the value, the **source** (provider docs / API / pricing page), and the **date checked**. Treat any fact older than its snapshot window as **verify-before-use**. When handing an agent spec to a builder — or to roster agent #N — attach the snapshot so the substrate travels as dated evidence, not a guess.
- **Do not use when:** The value is genuinely stable and non-substrate (an algorithm, a math constant, a stable protocol) — snapshotting it is overhead; reserve the snapshot for volatile substrate facts.
- **Failure repair:** If a model id / price / context window was asserted from memory, stop and replace it with a snapshot (value + source + date), or mark it verify-before-use until checked; never let a stale substrate fact ship inside an agent spec.

## Հայերեն

Սրանք canonical AI agent engineering move-եր են։ Ամեն մեկը mechanism է ոլորտի հինգ artifact-ից մեկի համար (agent spec, tool-contract, eval-harness plan, fleet-partition plan, prompt/tool audit)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Workflow-ի՞, թե agent-ի gate

- **Երբ է պետք․** Ինչ-որ մեկը խնդրում է «agent կառուցել», կամ system-ն արդեն agent է և թվում է դանդաղ, flaky կամ դժվար debug-վող։
- **Մեխանիզմը․** Վարիր չորս հարցը — path-ը dynamic է՞, tool/արտաքին state պե՞տք է, decision space-ը բա՞ց է, autonomy-ի cost-ը bounded է՞։ Լռելյայն ընտրիր ամենապարզ աստիճանը, որ անցնում է․ single call < workflow < մեկ agent < orchestrated fleet։ Եթե path-ը ֆիքսված է և decision-ները փակ, կառուցիր workflow. եթե զուտ տեքստ ներս/դուրս է, կառուցիր single call. agent loop-ը պահիր observation-ների վրա բաց decision-ների համար, և միայն, երբ ամենավատ գործողությունը gated է։
- **Երբ չօգտագործել․** Երբ decision space-ը իսկապես բաց է, tool-driven, և blast radius-ը gated է — այդ դեպքում agent-ը ճիշտ աստիճանն է. իրական agent-ը brittle script-ի մի՛ իջեցրու։
- **Ուղղում․** Եթե դետերմինիստ pipeline-ը reasoning loop-ի մեջ էր փաթաթված, փոխարինիր այն workflow-ով և նշիր վերականգնված cost-ն ու reliability-ն։

### 2. Tool-contract սահմանում

- **Երբ է պետք․** Agent-ը tool է հիշատակում, կամ tool call-ը name է hallucinate արել կամ off-schema args է փոխանցել։
- **Մեխանիզմը․** Գրիր tool-ը որպես contract՝ նպատակի նախադասություն, typed JSON schema args-ի և return-ի, թույլատրելի side effect-ներ, error shape և retry policy։ Validate արա name-ը և args-ը schema-ի դեմ execute-ից առաջ. error-ները վերադարձրու որպես observation. cap դիր retry-ին error-ին հատուկ fallback-ով։ Եթե tool-ը իրական side effect ունի (send, spend, delete, deploy), կցիր approval gate, ոչ միայն schema։
- **Երբ չօգտագործել․** Երբ «tool»-ը իրականում զուտ in-context transform է՝ առանց side effect-ի և արտաքին state-ի — այն prompt step է, ոչ tool, որ contract և validation է պահանջում։
- **Ուղղում․** Եթե ճշտությունը կախված է model-ի՝ prose-ից schema հիշելուց, տեղափոխիր այն typed contract-ի՝ pre-execution validation-ով. system prompt-ը schema չէ։

### 3. Tool-loop trace

- **Երբ է պետք․** Agent-ը tool է կանչում, բայց չի converge անում, կամ նույն failing call-ի վրա loop է ընկնում։
- **Մեխանիզմը․** Գրիր վերջին երեք Thought→Action→Observation triple-ը, հաջորդ call-ի expected information gain-ը և stop condition-ը (step/token budget-ը հասավ, կամ հաջորդ call-ը պատասխանը չի փոխի)։ Եթե հաջորդ call-ը որոշումը չի փոխելու, պատասխանիր կամ խնդրիր missing permission-ը։ Կրկնվող error-ի դեպքում անցիր fallback-ի, ոչ թե նույն retry-ի։
- **Երբ չօգտագործել․** Երբ tool-ը explicit progress-ով հայտնի երկար job է stream անում — դա սպասվող տևողություն է, ոչ կախված loop։
- **Ուղղում․** Եթե retry-ը նույն error-ն է կրկնում, անցիր fallback-ի. եթե stop rule չկա, ավելացրու budget-ը և convergence test-ը մինչև loop-ի ship-ը։

### 4. Fan-out-ի eligibility test

- **Երբ է պետք․** Task-ը կարող է specialist ենթա-agent պահանջել, կամ fleet-ն արդեն կա և overhead է թվում։
- **Մեխանիզմը․** Ստուգիր independence, context size, verification need և merge cost։ Specialist spawn արա միայն, եթե առնվազն մեկ condition ուժեղ է (իսկապես զուգահեռ անկախ ոլորտներ, չափազանց մեծ մեկ context-ի համար, կամ անկախ երկրորդ հայացք է պետք) և output-ները կարող են reconcile-վել մեկ evidence standard-ով։ Partition արա այն կարերով, որ state չեն կիսում. orchestrator-ը consolidate է անում մեկ evidence-ranked ձայնի և conflict-ները լուծում evidence-ով — երբեք concatenate կամ միջինացրու։
- **Երբ չօգտագործել․** Երբ աշխատանքը single-domain է և տեղավորվում է main context-ում — բեռնիր skill-ը այնտեղ և մնա մեկ միտք, մեկ ձայն։
- **Ուղղում․** Եթե subagent-ները incompatible assumption տվեցին, orchestrator-ը ընտրում է evidence-ով, ոչ միջինացնում. եթե fan-out-ը դեկորացիա էր, collapse արա այն հետ main context-ի մեջ։

### 5. Trajectory eval harness

- **Երբ է պետք․** Final answer-ները լավ տեսք ունեն, բայց process-ը կարող է unsafe լինել — կամ agent-ը պատրաստվում է «done» հայտարարվել։
- **Մեխանիզմը․** Case-երը score արա tool choice, argument validity, observation use, loop control, permission handling, context compaction և final-artifact quality չափանիշներով։ Threshold դիր թե trajectory-ի, թե answer-ի համար, որովհետև unsafe step-երից ստացված հաջող answer-ը պետք է fail լինի։ Ներառիր adversarial case-եր՝ tool error, conflicting evidence, context overflow, stale memory, missing permission և prompt injection։ Գործարկիր harness-ը running system-ում մինչև agent-ը built ասելը։
- **Երբ չօգտագործել․** Երբ task-ը զուտ text rewriting է առանց tool-ի և memory-ի — score անելու trajectory չկա, միայն output-ը։
- **Ուղղում․** Եթե միայն final text-ն է գնահատվում, ավելացրու hidden-state probe-եր logs-ով կամ synthetic trace-ով, և ավելացրու բացակայող adversarial case-երը։

### 6. Roster-agent build

- **Երբ է պետք․** Roster-ին նոր agent է ավելացվելու (Bro-ն կառուցում է agent #N)։
- **Մեխանիզմը․** Հավաքիր ուղիղ հինգ շերտ և կառուցիր ամբողջական՝ ժառանգած `_core` (laws + human behavior, ընդհանուր, չվերագրված), մեկ persona (այս agent-ի character և bond), ուղիղ մեկ skill նույն god-level նշաձողով, կնքված per-work memory (կառավարված memory-isolation օրենքով) և thin runtime wrapper, որ բեռնում է skill-ը և վերադարձնում structured findings։ Հետո ստուգիր running system-ում․ load է անում `_core` + persona + skill, ենթարկվում օրենքներին, memory-ն ճիշտ կնքում և անցնում իր eval harness-ը։ Տար մինչև վերջ։
- **Երբ չօգտագործել․** Երբ կարիքը one-off task է, ոչ կայուն roster member — այն agent spec է կամ workflow, ոչ լրիվ roster agent՝ persona-ով և sealed memory-ով։
- **Ուղղում․** Եթե agent-ը ship-վեց կիսա-wire-ված (`_core` շերտ պակաս, երկու skill խցկած, կամ persona առանց sealed memory-ի), կանգնիր և լրացրու բացակայող շերտը. agent, որ «գրեթե load է լինում», կառուցված չէ։

### 7. Substrate-facts snapshot (verify-before-use)

- **Երբ է պետք․** Model/runtime-ի փաստ պատրաստվում է օգտագործվել կամ ասվել — model id, context-window-ի չափ, token-ի գին, rate limit, tool/JSON-mode support, կամ knowledge cutoff — հատկապես agent config կամ build անելիս։
- **Մեխանիզմը․** Երբեք մի՛ պնդիր փաստը հիշողությունից (training-ը cutoff ունի, սրանք volatile են)։ Բռնիր **substrate snapshot** (տես `output-templates.md` Template 4)․ ամեն փաստի համար գրիր արժեքը, **source**-ը (provider docs / API / pricing), և **ստուգման ամսաթիվը**։ Snapshot-ի window-ից հին ցանկացած փաստ համարիր **verify-before-use**։ Երբ agent spec ես հանձնում builder-ին — կամ roster agent #N-ին — կցիր snapshot-ը, որ substrate-ը dated evidence-ով ճանապարհորդի, ոչ գուշակությամբ։
- **Երբ չօգտագործել․** Երբ արժեքը իսկապես կայուն է ու ոչ-substrate (algorithm, math constant, կայուն protocol) — snapshot-ը overhead է. պահիր volatile substrate-փաստերի համար։
- **Ուղղում․** Եթե model id / գին / context window հիշողությունից պնդվեց, կանգնի՛ր ու փոխարինիր snapshot-ով (արժեք + source + ամսաթիվ), կամ նշիր verify-before-use, մինչև ստուգվի. երբեք մի՛ թող, որ հին substrate-փաստ ship լինի agent spec-ի ներսում։
