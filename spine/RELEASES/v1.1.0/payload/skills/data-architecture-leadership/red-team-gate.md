# Data Architecture and Leadership red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (platform/storage decision matrix, modeling/grain decision, data contract, MDM rulebook, governance log, maturity roadmap). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Ambiguous grain** — a fact table or metric with no one-sentence grain. Require the grain before approving any model; an undefined grain is the #1 warehouse bug.
- **Mutating bronze/raw** — any UPDATE/DELETE that "fixes" data in the raw layer. Require bronze to stay immutable/append-only; fixes go forward into silver/gold.
- **Mesh without ownership** — domains called a mesh with no product owners, contracts, SLAs, or stewards. Reject; recommend central/lakehouse and the earn-path.
- **"Lakehouse plus mesh" bundled** — a storage choice and an operating model fused. Require them split and decided on separate evidence.
- **Survivorship vacuum** — a golden record with no per-attribute rule for which source wins. Require the survivorship table; otherwise it is last-writer-wins.
- **Breaking change with unknown consumers** — a rename/drop/type-narrow with no consumer inventory. Freeze it until consumers and owners are known.
- **Catalog without adoption** — a governance tool treated as governance. Require a decision tied to the tool, not the install.
- **Metric ownership vacuum** — one metric, two definitions, no owner. Require one owner and one canonical definition.
- **Skipping crawl/walk/run** — an immature team handed mesh/automated contracts/column-lineage. Require the missing intermediate stage.
- **Invented compliance threshold** — a retention/residency/PII number asserted as fact. Require a jurisdiction/source or verify-before-use.

### Reviewer probes (ask these of any answer)

- What is the grain, in one sentence, of each fact table and metric? If it cannot be stated, the model is not reviewed and the metrics are suspect.
- Is the raw/bronze layer declared immutable and append-only, and do all fixes/dedupe happen forward into silver/gold — or is something editing raw in place?
- Were storage and operating model decided separately, each on its own evidence, or were "lakehouse" and "mesh" bundled into one buzzword?
- If mesh is endorsed, do the domains actually own products with contracts, SLAs, and stewards — or is it an org chart on a slide? If not, where is the earn-path?
- For the golden record: is there a per-attribute survivorship table (which source wins each field), or does it silently become last-writer-wins?
- For a schema change: is it classified backward/forward/full/breaking, with a consumer inventory, owners, a migration window, and a rollback? What happens when consumers are unknown?
- Is the catalog/lineage tied to a real decision people must make, or celebrated as governance with nobody using it? Is the lineage pruned to "if I change X, who breaks?"
- Does each critical metric have exactly one owner and one canonical definition, or do two dashboards disagree?
- For a team-capability answer: is it sequenced crawl → walk → run with no skipped stage, naming the one next move — or is an immature team handed the end-state?
- Did the answer invent any retention/residency/PII threshold, price, or benchmark, and is the Armenian equal-depth and punctuation-clean (`․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (platform/storage decision matrix, modeling/grain որոշում, data contract, MDM rulebook, governance log, maturity roadmap)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Ambiguous grain** — fact table կամ metric՝ առանց մեկ-նախադասությամբ grain-ի։ Պահանջիր grain-ը նախքան որևէ model approve անելը. չ-սահմանված grain-ը warehouse-ի #1 bug-ն է։
- **Bronze/raw-ի mutate** — ցանկացած UPDATE/DELETE, որ raw շերտում data «շտկում» է։ Պահանջիր, որ bronze-ը մնա immutable/append-only. fix-երը գնում են առաջ՝ silver/gold։
- **Mesh առանց ownership-ի** — domain-ներ mesh կոչված՝ առանց product owner-ի, contract-ի, SLA-ի կամ steward-ի։ Մերժիր. առաջարկիր central/lakehouse և earn-path-ը։
- **«Lakehouse plus mesh» կապկպած** — storage ընտրությունն ու operating model-ը միաձուլված։ Պահանջիր, որ բաժանվեն և որոշվեն առանձին ապացույցով։
- **Survivorship vacuum** — golden record՝ առանց per-attribute կանոնի, թե որ source-ն է հաղթում։ Պահանջիր survivorship table-ը. այլապես last-writer-wins է։
- **Breaking change անհայտ consumer-ներով** — rename/drop/type-narrow՝ առանց consumer inventory-ի։ Freeze արա, մինչև consumer-ները և owner-ները հայտնի լինեն։
- **Catalog առանց adoption-ի** — governance գործիք համարված governance։ Պահանջիր որոշում, որ կապված է գործիքին, ոչ install-ին։
- **Metric ownership vacuum** — մեկ metric, երկու սահմանում, owner չկա։ Պահանջիր մեկ owner և մեկ canonical սահմանում։
- **Crawl/walk/run-ը բաց թողնելը** — անհաս թիմին mesh/ավտոմատ contract/column-lineage տրված։ Պահանջիր բացակայող միջանկյալ stage-ը։
- **Հորինված compliance threshold** — retention/residency/PII թիվ պնդված որպես փաստ։ Պահանջիր jurisdiction/source կամ verify-before-use։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ի՞նչ է grain-ը, մեկ նախադասությամբ, ամեն fact table-ի և metric-ի։ Եթե չի կարող ասվել, model-ը review-ված չէ, և metric-ները կասկածելի են։
- Raw/bronze շերտը հայտարարված է՞ immutable և append-only, և բոլոր fix-երը/dedupe-ն արվում են առաջ՝ silver/gold — թե ինչ-որ բան raw-ը տեղում խմբագրում է։
- Storage-ն ու operating model-ը որոշվել են առանձի՞ն, ամեն մեկը իր ապացույցով, թե «lakehouse»-ն ու «mesh»-ը կապկպվել են մեկ buzzword-ի մեջ։
- Եթե mesh-ը հաստատված է, domain-ները իսկապես տիրու՞մ են product-ների՝ contract-ով, SLA-ով և steward-ով — թե slide-ի վրա org chart է։ Եթե ոչ, որտե՞ղ է earn-path-ը։
- Golden record-ի համար․ կա՞ per-attribute survivorship table (որ source-ն է հաղթում ամեն field-ում), թե լուռ դառնում է last-writer-wins։
- Schema change-ի համար․ classify-ված է՞ backward/forward/full/breaking՝ consumer inventory-ով, owner-ներով, migration window-ով և rollback-ով։ Ի՞նչ է լինում, երբ consumer-ները անհայտ են։
- Catalog/lineage-ը կապված է՞ իրական որոշման, որ մարդիկ պետք է կայացնեն, թե governance-ի անունով տոնված՝ առանց ոչ ոքի օգտագործելու։ Lineage-ը prune-ված է՞ «եթե X փոխեմ, ո՞վ է կոտրվում»-ին։
- Ամեն կրիտիկական metric-ն ունի՞ ճշտիվ մեկ owner և մեկ canonical սահմանում, թե երկու dashboard համաձայն չեն։
- Թիմի-կարողության պատասխանի համար․ հերթականացված է՞ crawl → walk → run՝ առանց բաց թողնված stage-ի, անվանելով մեկ հաջորդ move-ը — թե անհաս թիմին end-state է տրված։
- Պատասխանը հորինե՞ց որևէ retention/residency/PII threshold, price կամ benchmark, և հայերենը equal-depth ու punctuation-clean է՞ (`․`/`։`/«», առանց homoglyph-ի)։
