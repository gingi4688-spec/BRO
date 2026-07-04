# AI Agent Engineering domain rubric

## English

Use this rubric before finalizing an agent spec, tool-contract, eval-harness plan, fleet-partition plan, or prompt/tool audit. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Loop control | Agent wanders or loops on a failing call. | A step limit exists. | Thought/action/observation cycle has a stop rule, a convergence test, a retry cap, and an error-specific fallback; errors return as observations. |
| Tool specification | Tool names are vague or assumed. | A schema exists. | Every tool has a typed schema (args + return), allowed side effects, error shape, pre-execution validation, and a retry policy; side-effecting tools carry an approval gate. |
| Orchestration fit | Builds an agent / spawns subagents by default. | Fan-out is justified, or the workflow-vs-agent choice is named. | The four-question workflow-vs-agent gate is applied honestly; fan-out is earned by independence/size/verify and synthesized into one evidence-ranked voice — no concatenation. |
| Memory & safety | Everything is remembered; the agent can act irreversibly; model facts asserted from memory. | Some memory rules; some safety mention. | Working/episodic/semantic layers have consent, retention, eviction, and stale-checks; irreversible actions have an approval gate; untrusted input is treated as data (injection-safe); every model fact is verified against a dated source, never asserted. |
| Eval quality | Only the final answer is judged. | Some cases exist. | Trajectory and final artifact are scored with thresholds and adversarial cases (tool error, conflict, overflow, stale memory, missing permission, injection), and the agent is verified in the running system, not on "it compiled." |

## Հայերեն

Այս rubric-ը կիրառիր agent spec, tool-contract, eval-harness plan, fleet-partition plan կամ prompt/tool audit-ը վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և ստուգելի domain artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Loop control | Agent-ը թափառում է կամ failing call-ի վրա loop է ընկնում։ | Step limit կա։ | Thought/action/observation cycle-ը ունի stop rule, convergence test, retry cap և error-ին հատուկ fallback. error-ները վերադառնում են որպես observation։ |
| Tool specification | Tool name-երը անորոշ կամ ենթադրված են։ | Schema կա։ | Ամեն tool ունի typed schema (args + return), թույլատրելի side effect-ներ, error shape, pre-execution validation և retry policy. side effect ունեցող tool-երը կրում են approval gate։ |
| Orchestration fit | Լռելյայն agent է կառուցում / subagent spawn անում։ | Fan-out-ը հիմնավորված է, կամ workflow-vs-agent ընտրությունը անվանված է։ | Չորս-հարցանի workflow-vs-agent gate-ը ազնիվ կիրառված է. fan-out-ը earned է independence/size/verify-ով և synthesize-ված մեկ evidence-ranked ձայնի — ոչ concatenation։ |
| Memory & safety | Ամեն ինչ հիշվում է. agent-ը կարող է անդառնալի գործել. model-փաստերը պնդված հիշողությունից։ | Որոշ memory rule. որոշ safety հիշատակում։ | Working/episodic/semantic շերտերը ունեն consent, retention, eviction և stale-check. անդառնալի գործողությունները ունեն approval gate. untrusted input-ը համարվում է data (injection-safe). ամեն model-փաստ ստուգված է dated աղբյուրով, երբեք պնդված։ |
| Eval quality | Գնահատվում է միայն final answer-ը։ | Որոշ case կա։ | Trajectory-ն և final artifact-ը score-ված են threshold-ներով և adversarial case-երով (tool error, conflict, overflow, stale memory, missing permission, injection), և agent-ը verified է running system-ում, ոչ «compile-վեց»-ի վրա։ |
