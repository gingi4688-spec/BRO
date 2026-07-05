# agents scaffold

## English

The rebuilt package uses a hybrid agent model. The default path is one coherent Bro agent that loads skills on demand into its own context. Specialist Claude subagents are reserved for fan-out when a task is too large for one context, genuinely parallel across independent domains, or requires independent verification.

This delivery includes one specialist descriptor per rebuilt skill. Agent descriptors target the Claude runtime or a provider-neutral shape, never a vendor-specific manifest from another runtime. The orchestrator remains the public voice: specialists return structured findings, and Bro synthesizes, verifies, and answers once.

### Two files per skill — spec and instantiation

Each skill carries `skills/<slug>/agents/claude.md` — the **portable, provider-neutral specialist spec** (part of the 11-file skill module). `.claude/agents/<slug>.md` (at the repo root) is the **Claude Code runtime instantiation** of that spec, generated to carry the **same return contract**: *facts · assumptions · diagnosis · options · recommendation · risks · acceptance criteria · safety boundary*. These are spec → instantiation, **not two competing truths** — keep their contracts aligned, and regenerate the `.claude/agents/` set from the skills whenever the spec changes. Specialists are **advisory and read-only** (`Read`/`Grep`/`Glob`); Bro the orchestrator holds full tools and executes (build, fetch, verify-in-the-running-system). The orchestrator procedure is `orchestrator.md`; the task→skill routing map is `ROUTING.md`.

## Հայերեն

Վերակառուցված փաթեթը օգտագործում է hybrid agent մոդել։ Լռելյայն ճանապարհը մեկ միասնական Bro agent-ն է, որը skill-երը բեռնում է ըստ պահանջի իր սեփական համատեքստում։ Մասնագետ Claude ենթա-agent-երը պահվում են fan-out-ի համար, երբ խնդիրը չափազանց մեծ է մեկ համատեքստի համար, իսկապես զուգահեռ է անկախ ոլորտներով, կամ պահանջում է անկախ ստուգում։

Այս delivery-ում յուրաքանչյուր վերակառուցված skill ունի իր մասնագետ descriptor-ը։ Agent descriptor-երը թիրախավորում են Claude runtime-ը կամ provider-neutral ձևը, ոչ երբեք ուրիշ runtime-ի vendor-specific manifest։ Orchestrator-ը մնում է հանրային ձայնը․ specialist-ները վերադարձնում են կառուցվածքային գտածոներ, իսկ Bro-ն synthesize է անում, ստուգում և մեկ պատասխան է տալիս։

### Երկու ֆայլ ամեն skill-ի — spec և instantiation

Ամեն skill ունի `skills/<slug>/agents/claude.md` — **portable, provider-neutral specialist spec**-ը (11-ֆայլ skill-մոդուլի մաս)։ `.claude/agents/<slug>.md`-ն (repo-ի արմատում) այդ spec-ի **Claude Code runtime instantiation**-ն է, generate արված **նույն return contract**-ով՝ *facts · assumptions · diagnosis · options · recommendation · risks · acceptance criteria · safety boundary*։ Սրանք spec → instantiation են, **ոչ երկու մրցակից ճշմարտություն** — պահիր contract-ները aligned, ու regenerate արա `.claude/agents/`-ը skill-երից, երբ spec-ը փոխվում է։ Specialist-ները **advisory ու read-only** են (`Read`/`Grep`/`Glob`). Bro-orchestrator-ն ունի լրիվ tools ու ինքն է execute անում (build, fetch, verify-in-the-running-system)։ Orchestrator-ի ընթացակարգը՝ `orchestrator.md`, task→skill routing map-ը՝ `ROUTING.md`։
