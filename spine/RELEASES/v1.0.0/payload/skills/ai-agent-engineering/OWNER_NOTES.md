# AI Agent Engineering owner notes

## English

### Needs human review when

This skill designs and reasons about agents; it must route to a human owner — not act or auto-approve — when an agent would gain real-world authority, when a new roster member is being created, or when a decision rests on a volatile fact that cannot be verified. Escalate and require explicit approval when:

- **Granting an agent autonomy over an irreversible or real-world action** — sending messages/emails to real people, moving money or issuing refunds, deleting data, pushing to production, changing accounts or permissions. The agent may draft and propose; a human (or an explicit, capped, audited auto-approve policy) authorizes the action. Capability is not permission.
- **Deploying an agent that holds credentials or tool access to production systems** — the autonomy bounds, the approval gates, and the tool credential hygiene must be reviewed before it runs against anything real; the runtime/secret hygiene itself routes to `devops-platform-sre`.
- **Creating a new roster agent** — a new agent inherits the shared `_core` laws and behavior and gains its own persona, skill, and sealed memory; the owner reviews that the laws are inherited unchanged, the persona is right, the one-skill-at-max rule holds, and memory seals correctly before the agent is added to the roster.
- **Model-substrate decisions that drive cost, capability, or safety** — choosing or changing the substrate model, or any spec whose correctness depends on a model id / context window / price / limit. These are volatile facts: verify against a current dated source and route the commitment (a paid plan, a capacity assumption) to the owner. Never let a memory-asserted model fact stand.
- **Memory that retains personal or sensitive data** — any episodic/semantic memory holding user data, especially across sessions or users, needs consent, a retention policy, and an owner sign-off before it persists; "remember everything" is a privacy and poisoning decision, not a default.
- **An agent that can modify its own tools, prompts, or autonomy at runtime** — self-modification with side effects is gated; the owner reviews the validation, the bounds, and the approval step before any runtime change to the agent's own capabilities is allowed.

The default posture for all of the above: produce the spec, the contracts, the gates, and the eval harness; then stop and route the authorizing decision to the owner. Do not give an agent irreversible real-world authority, or add a member to the roster, on your own.

### Owned future-improvement items

- Add a worked **prompt/tool audit** example end-to-end (an existing agent reviewed against the five dimensions, with the specific revisions), to make the audit response mode concrete.
- Add a **multi-agent consolidation recipe** showing exactly how the orchestrator resolves a conflict between two specialists by evidence (which source/run wins and why), so "synthesize, don't concatenate" is copy-ready.
- Keep a **live substrate snapshot for Bro's own runtime** in the repo (a dated `reference/substrate.md` filled from `output-templates.md` Template 4), so roster builds read current model facts from one verified place instead of re-checking each time. (The snapshot *pattern* now exists — `patterns.md` #7 + Template 4; this item is the live, filled instance.)
- Add a **roster-agent build checklist** (the five layers as a literal pre-ship gate) so a new agent cannot be shipped half-wired.
- Cross-link the runtime/reliability overlap explicitly to `devops-platform-sre` (SLOs, canary rollout of a new agent version, tool-credential secret hygiene) beyond the agent-design boundary owned here.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նախագծում և դատում է agent-ների մասին. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ agent-ը իրական-աշխարհի լիազորություն կստանա, երբ նոր roster member է ստեղծվում, կամ երբ որոշումը հենվում է փոփոխական փաստի վրա, որ չի կարող ստուգվել։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Agent-ին autonomy տալ անդառնալի կամ իրական-աշխարհի գործողության վրա** — իրական մարդկանց message/email ուղարկել, փող շարժել կամ refund անել, data ջնջել, production push անել, հաշիվ կամ permission փոխել։ Agent-ը կարող է draft անել և առաջարկել. մարդը (կամ հստակ, cap-ով, audited auto-approve policy-ն) authorize է անում գործողությունը։ Capability-ն permission չէ։
- **Production system-ների credential կամ tool access ունեցող agent deploy անել** — autonomy bound-ները, approval gate-ները և tool credential hygiene-ը պետք է review-վեն մինչև որևէ իրականի դեմ գործարկելը. runtime/secret hygiene-ն ինքը ուղղորդվում է `devops-platform-sre`-ին։
- **Նոր roster agent ստեղծել** — նոր agent-ը ժառանգում է ընդհանուր `_core` օրենքներն ու վարքը և ստանում սեփական persona, skill և sealed memory. տերը review է անում, որ օրենքները ժառանգված են անփոփոխ, persona-ն ճիշտ է, one-skill-at-max կանոնը պահվում է, և memory-ն ճիշտ է կնքվում մինչև agent-ը roster-ին ավելացնելը։
- **Model-substrate որոշումներ, որ ղեկավարում են cost, capability կամ safety** — substrate model ընտրել կամ փոխել, կամ ցանկացած spec, որի ճշտությունը կախված է model id / context window / price / limit-ից։ Սրանք փոփոխական փաստեր են․ ստուգիր ընթացիկ dated աղբյուրով և commitment-ը (վճարովի plan, capacity ենթադրություն) ուղղորդիր տիրոջը։ Երբեք մի՛ թող, որ հիշողությունից պնդված model-փաստ կանգնի։
- **Memory, որ պահում է անձնական կամ զգայուն data** — ցանկացած episodic/semantic memory, որ user data է պահում, հատկապես session-ների կամ user-ների միջև, պահանջում է consent, retention policy և owner-ի sign-off մինչև persist լինելը. «ամեն ինչ հիշիր»-ը privacy և poisoning որոշում է, ոչ լռելյայն։
- **Agent, որ կարող է runtime-ին փոխել սեփական tool-երը, prompt-ները կամ autonomy-ն** — side effect ունեցող self-modification-ը gated է. տերը review է անում validation-ը, bound-ները և approval step-ը մինչև agent-ի սեփական capability-ների ցանկացած runtime փոփոխություն թույլ տալը։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր spec-ը, contract-ները, gate-երը և eval harness-ը. հետո կանգնի՛ր և authorizing որոշումը ուղղորդիր տիրոջը։ Մի՛ տուր agent-ին անդառնալի իրական-աշխարհի լիազորություն, և մի՛ ավելացրու member roster-ին, սեփական որոշմամբ։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու worked **prompt/tool audit** օրինակ ծայրից ծայր (եղած agent՝ review-ված հինգ չափանիշի դեմ, կոնկրետ revision-ներով), որ audit response mode-ը կոնկրետ լինի։
- Ավելացրու **multi-agent consolidation recipe**, որ ցույց տա հստակ, թե ոնց է orchestrator-ը երկու specialist-ի conflict-ը լուծում evidence-ով (որ source/run-ն է հաղթում և ինչու), որ «synthesize, ոչ concatenate»-ը copy-ready լինի։
- Պահիր **live substrate snapshot Bro-ի սեփական runtime-ի համար** repo-ում (dated `reference/substrate.md`՝ լրացված `output-templates.md` Template 4-ով), որ roster build-երը ընթացիկ model-փաստերը կարդան մեկ ստուգված տեղից, ոչ թե ամեն անգամ վերստուգեն։ (Snapshot-ի *pattern*-ն արդեն կա՝ `patterns.md` #7 + Template 4. այս կետը live, լրացված instance-ն է։)
- Ավելացրու **roster-agent build checklist** (հինգ շերտը որպես բառացի pre-ship gate), որ նոր agent-ը չկարողանա ship-վել կիսա-wire-ված։
- Cross-link արա runtime/reliability համընկնումը բացահայտ `devops-platform-sre`-ին (SLO, նոր agent version-ի canary rollout, tool-credential secret hygiene)՝ այստեղ տիրվող agent-design սահմանից այն կողմ։
