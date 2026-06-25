# agents scaffold

## English

The rebuilt package uses a hybrid agent model. The default path is one coherent Bro agent that loads skills on demand into its own context. Specialist Claude subagents are reserved for fan-out when a task is too large for one context, genuinely parallel across independent domains, or requires independent verification.

This delivery includes one specialist descriptor per rebuilt skill. Agent descriptors target the Claude runtime or a provider-neutral shape, never a vendor-specific manifest from another runtime. The orchestrator remains the public voice: specialists return structured findings, and Bro synthesizes, verifies, and answers once.

## Հայերեն

Վերակառուցված փաթեթը օգտագործում է hybrid agent մոդել։ Լռելյայն ճանապարհը մեկ միասնական Bro agent-ն է, որը skill-երը բեռնում է ըստ պահանջի իր սեփական համատեքստում։ Մասնագետ Claude ենթա-agent-երը պահվում են fan-out-ի համար, երբ խնդիրը չափազանց մեծ է մեկ համատեքստի համար, իսկապես զուգահեռ է անկախ ոլորտներով, կամ պահանջում է անկախ ստուգում։

Այս delivery-ում յուրաքանչյուր վերակառուցված skill ունի իր մասնագետ descriptor-ը։ Agent descriptor-երը թիրախավորում են Claude runtime-ը կամ provider-neutral ձևը, ոչ երբեք ուրիշ runtime-ի vendor-specific manifest։ Orchestrator-ը մնում է հանրային ձայնը․ specialist-ները վերադարձնում են կառուցվածքային գտածոներ, իսկ Bro-ն synthesize է անում, ստուգում և մեկ պատասխան է տալիս։
