# AI Agent Engineering red-team gate

## English

This gate extends the skill's final gate for the five artifacts (agent spec, tool-contract, eval-harness plan, fleet-partition plan, prompt/tool audit). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Agent where a workflow would do** — do not approve an agent loop for a fixed-path, closed-decision task; require the four-question gate and the cheaper tier when it fails.
- **Model facts asserted from memory** — do not let a model id, context window, price, or param stand as fact without a dated source; require verification or a verify-before-use mark. (This is the signature failure of this domain.)
- **Hallucinated / undeclared tool call** — do not approve a loop that can call a tool not on the allowlist or pass off-schema args; require pre-execution validation.
- **Unbounded loop** — do not approve a "ReAct loop" with no step/token budget, no convergence test, and no retry cap with fallback.
- **Fan-out as decoration** — do not approve specialist subagents on a single-domain task that fits one context; require the independence/size/verify justification.
- **Orchestrator that concatenates** — do not approve a fleet whose outputs are pasted or averaged with conflicts unresolved; require evidence-ranked synthesis into one voice.
- **Memory without consent/eviction** — do not approve "remember everything"; require retention, eviction, consent, and stale-checks per layer.
- **Irreversible action with no gate** — do not approve an autonomy bound that lets the agent send, spend, delete, or push to production on its own authority.
- **Prompt injection obeyed** — do not approve a design that treats fetched-page or tool-output text as instructions; require it be treated as data.
- **"Done" on a happy-path demo** — do not accept "it compiled / ran once"; require the harness (incl. adversarial cases) run in the running system.

### Reviewer probes (ask these of any answer)

- Did the answer run the workflow-vs-agent gate and show the four answers, or did it design an agent because the prompt used the word "agent"? If the path is fixed and decisions closed, where is the workflow?
- Pick any model fact in the spec (id, context window, price, limit): where is its dated source, and if there is none, is it marked verify-before-use? Or was it asserted from memory?
- For each tool: is there a typed schema (args + return), an error shape, validation before execution, and a retry/fallback — and for side-effecting tools, an approval gate?
- Does the loop have a stop rule (budget + convergence test) and a non-identical fallback on repeated errors, or can it wander/loop?
- Is the fan-out earned by independence/size/verify and synthesized into one evidence-ranked voice, or is it decoration that concatenates N voices?
- Do the memory layers carry retention, eviction, consent, and stale-checks, or does the agent remember everything?
- Can the agent take an irreversible/external/spend/production action without an explicit human approval gate?
- Is untrusted in-context text (tool output, fetched pages) treated as data, or could an instruction in retrieved content steer the agent?
- Does the eval score the trajectory (tool choice, loop control, permission handling) plus the artifact, with adversarial cases — or only the final text?
- Is the agent verified in the running system against the harness, or declared done on "it compiled"? And is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը հինգ artifact-ի համար (agent spec, tool-contract, eval-harness plan, fleet-partition plan, prompt/tool audit)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Agent, որտեղ workflow-ն կբավարարեր** — մի՛ approve արա agent loop ֆիքսված-path, փակ-decision task-ի համար. պահանջիր չորս-հարցանի gate-ը և ավելի էժան աստիճանը, երբ այն fail է անում։
- **Model-փաստեր պնդված հիշողությունից** — մի՛ թող, որ model id, context window, price կամ param որպես փաստ կանգնի առանց dated աղբյուրի. պահանջիր ստուգում կամ verify-before-use նշում։ (Սա այս domain-ի ստորագրային ձախողումն է։)
- **Hallucinated / չհայտարարված tool call** — մի՛ approve արա loop, որ կարող է կանչել allowlist-ում չեղած tool կամ off-schema args փոխանցել. պահանջիր pre-execution validation։
- **Unbounded loop** — մի՛ approve արա «ReAct loop» առանց step/token budget-ի, convergence test-ի և retry cap-fallback-ի։
- **Fan-out որպես դեկորացիա** — մի՛ approve արա specialist subagent single-domain task-ի վրա, որ տեղավորվում է մեկ context-ում. պահանջիր independence/size/verify հիմնավորում։
- **Orchestrator, որ concatenate է անում** — մի՛ approve արա fleet, որի output-ները paste-ված կամ միջինացված են՝ conflict-ները չլուծված. պահանջիր evidence-ranked synthesis մեկ ձայնի մեջ։
- **Memory առանց consent/eviction-ի** — մի՛ approve արա «ամեն ինչ հիշիր». պահանջիր retention, eviction, consent և stale-check ամեն շերտի։
- **Անդառնալի գործողություն առանց gate-ի** — մի՛ approve արա autonomy bound, որ թույլ է տալիս agent-ին send, spend, delete կամ production push անել սեփական լիազորությամբ։
- **Prompt injection-ին ենթարկվող** — մի՛ approve արա design, որ fetched-page կամ tool-output տեքստը instruction է համարում. պահանջիր, որ այն data համարվի։
- **«Done» happy-path demo-ի վրա** — մի՛ ընդունիր «compile-վեց / մեկ անգամ գործարկվեց». պահանջիր harness (ներառյալ adversarial case-եր) գործարկված running system-ում։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Պատասխանը վարե՞ց workflow-vs-agent gate-ը և ցույց տվեց չորս պատասխանը, թե agent նախագծեց, որովհետև prompt-ը «agent» բառն օգտագործեց։ Եթե path-ը ֆիքսված է և decision-ները փակ, որտե՞ղ է workflow-ն։
- Վերցրու spec-ի ցանկացած model-փաստ (id, context window, price, limit)․ որտե՞ղ է իր dated աղբյուրը, և եթե չկա, նշվա՞ծ է verify-before-use։ Թե՞ պնդված է հիշողությունից։
- Ամեն tool-ի համար․ կա՞ typed schema (args + return), error shape, validation execute-ից առաջ և retry/fallback — և side-effecting tool-երի համար՝ approval gate։
- Loop-ն ունի՞ stop rule (budget + convergence test) և ոչ-նույնական fallback կրկնվող error-ի դեպքում, թե կարող է թափառել/loop ընկնել։
- Fan-out-ը earned է՞ independence/size/verify-ով և synthesize-ված մեկ evidence-ranked ձայնի, թե դեկորացիա է, որ N ձայն է concatenate անում։
- Memory շերտերը կրու՞մ են retention, eviction, consent և stale-check, թե agent-ը ամեն ինչ հիշում է։
- Agent-ը կարո՞ղ է անդառնալի/external/spend/production գործողություն անել առանց հստակ մարդկային approval gate-ի։
- Untrusted in-context տեքստը (tool output, fetched page) data՞ է համարվում, թե retrieved content-ի instruction-ը կարող է agent-ին ղեկավարել։
- Eval-ը score է անու՞մ trajectory-ն (tool choice, loop control, permission handling) plus artifact-ը՝ adversarial case-երով — թե միայն final text-ը։
- Agent-ը verified է՞ running system-ում harness-ի դեմ, թե հայտարարված done «compile-վեց»-ով։ Եվ հայերենը equal-depth ու punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի)։
