# Data Architecture and Leadership patterns

## English

These are canonical data-architecture-and-leadership moves. Each is a mechanism for one of the domain's artifacts (platform/storage decision matrix, modeling/grain decision, data contract, MDM rulebook, medallion layering, maturity roadmap). Choose the move that changes the next decision, not the nicest label.

### 1. Platform selection matrix

- **Trigger:** Teams argue warehouse vs lake vs lakehouse vs mesh, or a request bundles "lakehouse plus mesh."
- **Mechanism:** Score the workload by latency, transactionality, governance, cost, schema volatility, and domain-ownership maturity. Split storage from operating model: pick the simplest storage that meets the hard constraints (lakehouse when you need ACID/evolution/time-travel on cheap storage), and treat mesh as a separate ownership decision. Name the binding constraint that forced the storage choice.
- **Do not use when:** The problem is one broken pipeline or one slow query — that is engineering/tuning, not an architecture decision.
- **Failure repair:** If "mesh" is proposed with no domain owners, contracts, SLAs, or stewards, reject it and recommend central/lakehouse until ownership is real.

### 2. Grain-first modeling chooser

- **Trigger:** A data model is slow, brittle, or double-counting, or someone is about to design a fact table.
- **Mechanism:** Write the grain in one sentence first ("one row = one shipped order line"). Then choose by grain, change rate, and audit need: 3NF for transactional integrity, Kimball for stable business-facing analytics (state conformed dimensions and SCD type), Data Vault for many volatile sources needing lineage (state hubs/links/satellites). The grain is the contract every metric is checked against.
- **Do not use when:** The symptom is a single bad query that indexes or a rewrite would fix — check that before re-modeling.
- **Failure repair:** If the grain is not written, no model review is complete; stop and define it before anything else, then re-check every metric for double-counting.

### 3. Contract-break review

- **Trigger:** A schema change threatens consumers, or a producer wants to rename/drop/narrow a field.
- **Mechanism:** Classify the change as backward / forward / full-compatible / breaking. For a breaking change, inventory consumers and their owners, define a versioned table/topic, a migration window, the registry rule that enforces it, and the rollback. Nullable-additive ships as backward-compatible.
- **Do not use when:** The data is disposable scratch with no downstream consumer — a contract there is ceremony.
- **Failure repair:** If consumer owners are unknown, freeze the breaking change until they are inventoried; do not ship a rename into the dark.

### 4. MDM golden-record design

- **Trigger:** A "single customer view" / "golden record" is requested, or two systems disagree about the same entity.
- **Mechanism:** Define match (deterministic key + probabilistic similarity) → merge → **survivorship per attribute** (which source wins legal name, tax id, contact, etc.) → stewardship (the human workflow for conflicts the rules cannot resolve). Write the survivorship table explicitly; it is the heart of the design.
- **Do not use when:** There is exactly one authoritative source for the entity — then it is reference data, not an MDM merge problem.
- **Failure repair:** If there is no per-attribute survivorship rule, the golden record is last-writer-wins; add the survivorship table and stewardship workflow before calling it MDM.

### 5. Medallion layering with immutable raw

- **Trigger:** Designing a lake/lakehouse refinement flow, or someone proposes "fixing" data in the raw layer.
- **Mechanism:** Land everything in **bronze** as immutable, append-only raw (the system of record for what arrived). Do all cleaning, dedupe, conforming, and joins **forward** into silver; build business aggregates and marts in gold. Corrections move forward, never by mutating bronze, so history can always be replayed and the source's actual payload can be proven.
- **Do not use when:** A tiny, single-source dataset with no audit/replay need — a flat governed table may be enough; do not impose three layers for ceremony.
- **Failure repair:** If bronze is being mutated (UPDATE/DELETE in place), block it, move the fix to a silver transform, restore bronze as append-only, and confirm replay still works.

### 6. Crawl/walk/run maturity roadmap

- **Trigger:** The question is about a team's overall data capability, or a small/immature team is reaching for mesh, automated contracts, or column-level lineage.
- **Mechanism:** Place the team on crawl (one governed warehouse + defined grain + basic contracts), walk (medallion + adopted catalog + MDM on the top entity), or run (domain ownership/mesh + automated contract enforcement + impact-pruned lineage). Recommend the *one* next stage as the actionable move, not the end-state destination. Match the architecture to the maturity, not the fashion.
- **Do not use when:** A single, concrete architecture decision is being asked — answer that with a matrix or contract, not a maturity tour.
- **Failure repair:** If a stage is being skipped (mesh before a governed warehouse, automated contracts before catalog adoption), reset to the sequence and install the missing intermediate stage instead of the leap.

## Հայերեն

Սրանք canonical data-architecture-and-leadership move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (platform/storage decision matrix, modeling/grain որոշում, data contract, MDM rulebook, medallion շերտավորում, maturity roadmap)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Platform selection matrix

- **Երբ է պետք․** Թիմերը վիճում են warehouse vs lake vs lakehouse vs mesh-ի շուրջ, կամ հարցումը կապկպում է «lakehouse plus mesh»։
- **Մեխանիզմը․** Workload-ը score արա latency, transactionality, governance, cost, schema volatility և domain-ownership maturity-ով։ Բաժանիր storage-ը operating model-ից․ ընտրիր ամենապարզ storage-ը, որ բավարարում է hard constraint-ները (lakehouse, երբ ACID/evolution/time-travel է պետք cheap storage-ի վրա), և mesh-ը համարիր առանձին ownership որոշում։ Անվանի՛ր binding constraint-ը, որ ստիպեց storage ընտրությունը։
- **Երբ չօգտագործել․** Երբ խնդիրը մեկ broken pipeline կամ մեկ դանդաղ query է — դա engineering/tuning է, ոչ architecture որոշում։
- **Ուղղում․** Եթե «mesh»-ը առաջարկվում է առանց domain owner-ի, contract-ի, SLA-ի կամ steward-ի, մերժիր և առաջարկիր central/lakehouse, մինչև ownership-ը իրական է։

### 2. Grain-first modeling chooser

- **Երբ է պետք․** Data model-ը slow, brittle կամ double-counting է, կամ ինչ-որ մեկը պատրաստվում է fact table նախագծել։
- **Մեխանիզմը․** Նախ grain-ը գրիր մեկ նախադասությամբ («մեկ row = մեկ shipped order line»)։ Հետո ընտրիր grain-ով, change rate-ով և audit need-ով․ 3NF՝ transactional integrity-ի, Kimball՝ կայուն business-facing analytics-ի (նշիր conformed dimension և SCD type), Data Vault՝ շատ փոփոխվող source-ների, որ lineage են պահանջում (նշիր hub/link/satellite)։ Grain-ը այն contract-ն է, որի դեմ ստուգվում է ամեն metric։
- **Երբ չօգտագործել․** Երբ symptom-ը մեկ bad query է, որ index կամ rewrite կուղղի — ստուգիր դա նախքան re-modeling-ը։
- **Ուղղում․** Եթե grain-ը գրված չէ, model review-ն ավարտված չէ. կանգնի՛ր և սահմանիր այն ամեն ինչից առաջ, հետո ամեն metric-ը կրկին ստուգիր double-counting-ի համար։

### 3. Contract-break review

- **Երբ է պետք․** Schema change-ը սպառնում է consumer-ներին, կամ producer-ը ուզում է rename/drop/narrow անել field։
- **Մեխանիզմը․** Change-ը classify արա backward / forward / full-compatible / breaking։ Breaking change-ի համար inventory արա consumer-ները և իրենց owner-ները, սահմանիր versioned table/topic, migration window, registry rule-ը, որ enforce է անում, և rollback-ը։ Nullable-additive-ը ship է որպես backward-compatible։
- **Երբ չօգտագործել․** Երբ data-ն disposable scratch է՝ առանց downstream consumer-ի — այնտեղ contract-ը ceremony է։
- **Ուղղում․** Եթե consumer owner-ները անհայտ են, freeze արա breaking change-ը, մինչև inventory-վեն. rename-ը խավարի մեջ մի՛ ship արա։

### 4. MDM golden-record design

- **Երբ է պետք․** «Single customer view» / «golden record» է խնդրվում, կամ երկու system համաձայն չեն նույն entity-ի շուրջ։
- **Մեխանիզմը․** Սահմանիր match (deterministic key + probabilistic similarity) → merge → **survivorship ամեն attribute-ի** (որ source-ն է հաղթում legal name-ում, tax id-ում, contact-ում և այլն) → stewardship (մարդկային workflow այն conflict-ների, որ rule-ները չեն կարող լուծել)։ Survivorship table-ը գրիր հստակ. այն design-ի սիրտն է։
- **Երբ չօգտագործել․** Երբ entity-ի համար կա ճշտիվ մեկ authoritative source — ապա դա reference data է, ոչ MDM merge խնդիր։
- **Ուղղում․** Եթե per-attribute survivorship rule չկա, golden record-ը last-writer-wins է. ավելացրու survivorship table-ը և stewardship workflow-ն, նախքան այն MDM կոչելը։

### 5. Medallion layering immutable raw-ով

- **Երբ է պետք․** Lake/lakehouse-ի զտման flow նախագծելիս, կամ երբ ինչ-որ մեկը առաջարկում է data-ն raw շերտում «շտկել»։
- **Մեխանիզմը․** Ամեն ինչ իջեցրու **bronze**-ում որպես immutable, append-only raw (ինչ եկավ՝ system of record)։ Ամբողջ մաքրումը, dedupe-ն, conforming-ը և join-ները արա **առաջ**՝ silver. business aggregate-ներն ու mart-ները կառուցիր gold-ում։ Ուղղումները շարժվում են առաջ, երբեք bronze-ը mutate անելով, որ history-ն միշտ replay-վի և source-ի իրական payload-ը ապացուցվի։
- **Երբ չօգտագործել․** Փոքր, single-source dataset՝ առանց audit/replay need-ի — flat governed table-ը կարող է բավարար լինի. երեք շերտ ceremony-ի համար մի՛ պարտադրիր։
- **Ուղղում․** Եթե bronze-ը mutate է արվում (UPDATE/DELETE տեղում), block արա այն, fix-ը տար silver transform, վերականգնիր bronze-ը որպես append-only, և հաստատիր, որ replay-ը դեռ աշխատում է։

### 6. Crawl/walk/run maturity roadmap

- **Երբ է պետք․** Հարցը թիմի ընդհանուր տվյալների կարողության մասին է, կամ փոքր/անհաս թիմը ձեռք է մեկնում mesh-ին, ավտոմատ contract-ին կամ column-level lineage-ին։
- **Մեխանիզմը․** Թիմը տեղադրիր crawl-ում (մեկ governed warehouse + սահմանված grain + հիմնական contract), walk-ում (medallion + adopt-ված catalog + MDM՝ top entity-ի վրա), կամ run-ում (domain ownership/mesh + ավտոմատ contract enforcement + impact-pruned lineage)։ Առաջարկիր *մեկ* հաջորդ stage-ը որպես actionable move, ոչ end-state destination-ը։ Architecture-ը համապատասխանեցրու maturity-ին, ոչ նորաձևությանը։
- **Երբ չօգտագործել․** Երբ մեկ կոնկրետ architecture որոշում է հարցվում — պատասխանիր matrix-ով կամ contract-ով, ոչ maturity-ի շրջագայությամբ։
- **Ուղղում․** Եթե stage է բաց թողնվում (mesh՝ նախքան governed warehouse, ավտոմատ contract՝ նախքան catalog adoption), reset արա հերթականությունը և install արա բացակայող միջանկյալ stage-ը, ոչ թռիչքը։
