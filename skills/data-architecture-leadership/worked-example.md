# Data Architecture and Leadership worked examples

## English

### Example A — platform decision matrix + architecture recommendation

**Prompt.** A company says it wants "lakehouse plus mesh." Constraints: regulatory reporting needs ACID tables and audit history; data science needs raw files; BI needs governed dimensions; domains do not yet own contracts. Build the decision matrix and the recommendation.

**Senior answer.** First, split the buzzword: "lakehouse" is a storage decision, "mesh" is an ownership decision — decide each separately.

Decision matrix (binding constraint per consumer):

| Consumer | Need | Binding constraint |
|---|---|---|
| Regulatory reporting | ACID tables, audit history, time travel | transactions + governance |
| Data science | raw files, schema-on-read | cheap raw storage |
| BI | governed conformed dimensions | modeled analytics |
| Domains | (do not yet own contracts) | ownership maturity = low |

**Storage recommendation: lakehouse.** Open table formats (Iceberg/Delta) give regulatory reporting the ACID transactions, schema evolution, and time travel it needs, while the underlying lake storage serves data science's raw files — one platform satisfies the two hard constraints without a separate warehouse. Layer it medallion: **bronze** is immutable, append-only raw (the audit system of record — never edited in place, so regulatory replay is always possible); **silver** is cleaned/conformed; **gold** holds Kimball marts for finance and sales BI (conformed dimensions, fact grain stated: *one row = one posted ledger line*).

**Operating-model recommendation: not mesh yet.** Domains cannot own data products because they have no contracts, SLAs, or stewards — drawing them as a mesh would be an org chart on a slide. Run central/lakehouse now; the path to mesh is: publish versioned contracts → assign product owners and stewards → meet SLAs → *then* federate ownership. Mesh is earned, not declared.

**Contract rule (concrete).** Adding a nullable column is backward-compatible and ships freely. Renaming `customer_id` is **breaking**: it needs a v2 table, a migration window, and a consumer inventory with owners — frozen until those consumers are known.

**MDM (per-attribute survivorship).** Golden customer record: CRM wins legal name, billing wins tax id, support wins contact preference; a steward resolves conflicts the rules cannot. Without this table, the "single customer view" is silently last-writer-wins.

**Assumptions/unknowns labeled.** Retention period for regulatory tables is jurisdiction-specific — verify before fixing it; do not assume "7 years."

**Why this passes.** It refuses the bundled buzzword and decides storage and operating model on separate evidence — the single most common failure in this domain. The storage pick is justified by the *binding constraint* (ACID/audit for reporting, cheap raw for science), not by trend, and it is shown to satisfy two needs with one platform. It declares bronze immutable and append-only and states the gold fact grain in one sentence (*one row = one posted ledger line*), closing the #1 warehouse bug before it starts. It withholds the mesh endorsement precisely because ownership is immature, and gives the concrete earn-path instead of a slide. The contract rule is classified (nullable-additive vs the breaking rename) with a migration window and a consumer inventory, and the MDM answer carries an explicit per-attribute survivorship table rather than last-writer-wins. Finally it flags the retention period as jurisdiction-specific instead of inventing a threshold.

### Example B — data-team maturity roadmap (crawl / walk / run)

**Prompt.** A five-person data team at a mid-size company keeps reading about data mesh and wants to adopt it. They currently have a few overlapping spreadsheets and one analytics database that two people query directly. What should they actually do?

**Senior answer.** This is a *coaching* question about team capability, not an architecture pick — answer with a sequenced maturity path, and the honest finding is that mesh is the wrong next move. A five-person team handed a mesh will fail: mesh needs per-domain product owners, contracts, SLAs, and stewards this team does not have.

Place them and name the **one** next stage:

- **Where they are: pre-crawl.** Overlapping spreadsheets and a directly-queried database mean no governed source of truth and no defined grain — every number is negotiable.
- **Crawl (the next stage, do this):** Consolidate to **one governed warehouse**. Define the grain of the core fact in one sentence (e.g. *one row = one completed order*). Write basic contracts for the two or three critical source feeds. Assign **one owner per critical metric** (one definition of "revenue," one of "active customer"). Goal: a single source of truth people trust and use. *Do not start mesh here.*
- **Walk (later):** Add medallion layering (immutable bronze, conformed silver, gold marts), a catalog that people actually adopt (tied to who-can-change-this decisions), and MDM on the top entity (customer). Compatibility-class every schema change with a registry.
- **Run (only when walk is solid):** Domain ownership / mesh — but only once domains can own products with contracts, SLAs, and stewards, with automated contract enforcement in CI and impact-pruned lineage.

**Recommendation:** ignore mesh for now; spend the next quarter getting to crawl (one warehouse, defined grain, one owner per metric). Mesh is two stages away and is earned by maturity, not adopted by reading about it.

**Why this passes.** It correctly reads the prompt as a capability/coaching question and answers with a crawl/walk/run sequence instead of the most advanced pattern — and it explicitly names skipping stages as the failure, refusing to hand a five-person team a mesh. It diagnoses the team's actual position (pre-crawl: no governed source, no grain) from the evidence given, then prescribes the *single* actionable next stage (one governed warehouse, defined grain, one owner per metric) rather than the end-state. It ties the mesh refusal to the concrete missing prerequisites (product owners, contracts, SLAs, stewards), so the "no" is reasoned, not dismissive, and it gives an earn-path to run. The grain-first and one-owner-per-metric moves are the same disciplines the operating lens enforces, applied as the crawl foundation.

### Example C — MDM golden-record survivorship rulebook

**Prompt.** Customer data lives in three systems — CRM (sales-entered), Billing (finance-authoritative), and the Support tool (agent-entered). The same customer appears in all three with conflicting name, address, email, and status. Design the MDM rulebook that produces one golden record.

**Senior answer.** A golden record is not "pick the newest row" — it is a **per-attribute survivorship policy** plus a **matching rule** plus a **stewardship path** for what the rules cannot decide.

**1. Matching (which records are the same entity?)** Deterministic match on a strong key first (tax id / verified email); fall back to probabilistic match on name + address + phone with a score. Two thresholds: **auto-merge ≥ 0.90**, **auto-distinct < 0.75**, and the **0.75–0.90 gray zone → a steward review queue** — never auto-merge a maybe, because a wrong merge fuses two real customers and is painful to unpick. Tradeoff stated: a high auto-merge bar means more manual review but fewer false merges; for customer/billing identity, false merges are the worse error.

**2. Survivorship (per attribute, which source wins?)** — the golden value is chosen attribute-by-attribute, because no single system is authoritative for everything:

| Attribute | Winning source (rule) | Tiebreak / notes |
|---|---|---|
| Legal name | Billing (finance-verified) | if Billing null → CRM; then most-recently-updated non-null |
| Billing address | Billing | authoritative by definition; never overwrite from CRM |
| Email (contact) | most-recently-**verified** across sources | verified beats unverified regardless of recency; then recency |
| Phone | Support (most recent agent-confirmed) | then CRM; drop unformattable |
| Account status | Billing (active/suspended source of truth) | CRM "status" is a sales stage, not account status — do not merge the two concepts |
| Created date | **earliest** across all sources | identity is as old as its first appearance |

The precedence is **source-priority → recency → validity**: a verified-but-older email beats an unverified-newer one. Every golden attribute stores its **lineage** (which source + timestamp) so the record is auditable and the merge reversible.

**3. Stewardship (what the rules cannot decide).** Gray-zone matches, and any attribute conflict where the priority sources disagree *and* both are verified, go to a **named data steward**, not a coin flip. The steward decides; where the decision generalizes, it is folded back as a rule refinement. Ownership is explicit — a named steward owns customer MDM, survivorship rules are **versioned**, and a merge is **reversible** (keep source rows + lineage, never hard-delete on merge).

**Why this passes.** It refuses "newest row wins" and defines survivorship **per attribute** with an explicit source-priority → recency → validity precedence, so Billing owns billing address and status while a verified email can win on recency — matching how authority actually splits across systems. It sets **matching thresholds with a gray-zone steward queue** instead of auto-merging maybes (naming false-merge as the worse, hard-to-unpick error), keeps **lineage per attribute** so the golden record is auditable and the merge reversible, and routes the undecidable to a **named steward** with versioned rules rather than a silent default. It even catches the semantic trap (CRM sales-stage "status" ≠ Billing account status), which is exactly where naive MDM corrupts the golden record.

## Հայերեն

### Օրինակ A — platform decision matrix + architecture recommendation

**Prompt.** Ընկերությունն ասում է, որ ուզում է «lakehouse plus mesh»։ Constraint-ներ․ regulatory reporting-ը պահանջում է ACID table և audit history. data science-ը՝ raw file. BI-ը՝ governed dimension. domain-ները դեռ contract owner չեն։ Կառուցիր decision matrix-ը և recommendation-ը։

**Senior պատասխան.** Նախ բաժանի՛ր buzzword-ը․ «lakehouse»-ը storage որոշում է, «mesh»-ը՝ ownership որոշում — ամեն մեկը որոշիր առանձին։

Decision matrix (binding constraint ամեն consumer-ի համար)․

| Consumer | Need | Binding constraint |
|---|---|---|
| Regulatory reporting | ACID table, audit history, time travel | transactions + governance |
| Data science | raw file, schema-on-read | cheap raw storage |
| BI | governed conformed dimension | modeled analytics |
| Domain-ներ | (դեռ contract owner չեն) | ownership maturity = ցածր |

**Storage recommendation․ lakehouse.** Open table format-ները (Iceberg/Delta) regulatory reporting-ին տալիս են ACID transaction, schema evolution և time travel, որ պետք են, մինչ ներքևի lake storage-ը սպասարկում է data science-ի raw file-ները — մեկ հարթակը բավարարում է երկու hard constraint-ը՝ առանց առանձին warehouse-ի։ Շերտավորիր medallion-ով․ **bronze**-ը immutable, append-only raw է (audit system of record — երբեք տեղում չ-խմբագրված, որ regulatory replay-ը միշտ հնարավոր լինի). **silver**-ը մաքրված/conformed է. **gold**-ը պահում է Kimball mart-ներ finance և sales BI-ի համար (conformed dimension, fact grain նշված՝ *մեկ row = մեկ posted ledger line*)։

**Operating-model recommendation․ դեռ ոչ mesh.** Domain-ները չեն կարող data product-ի owner լինել, որովհետև contract, SLA կամ steward չունեն — դրանք mesh նկարելը slide-ի վրա org chart կլիներ։ Հիմա վարիր central/lakehouse. mesh-ի ճանապարհն է՝ versioned contract publish անել → product owner և steward նշանակել → SLA-ները բավարարել → *հետո* federate անել ownership-ը։ Mesh-ը վաստակվում է, ոչ հայտարարվում։

**Contract rule (կոնկրետ).** Nullable column ավելացնելը backward-compatible է և ship է ազատ։ `customer_id` rename-ը **breaking** է․ պետք է v2 table, migration window և consumer inventory՝ owner-ներով — frozen, մինչև այդ consumer-ները հայտնի լինեն։

**MDM (per-attribute survivorship).** Golden customer record․ CRM-ը հաղթում է legal name-ում, billing-ը՝ tax id-ում, support-ը՝ contact preference-ում. steward-ը լուծում է այն conflict-ները, որ rule-ները չեն կարող։ Առանց այս table-ի «single customer view»-ը լուռ last-writer-wins է։

**Assumption/unknown label-ված.** Regulatory table-ների retention period-ը jurisdiction-specific է — verify արա, նախքան ֆիքսելը. մի՛ ենթադրիր «7 տարի»։

**Ինչու է անցնում gate-ը.** Այն մերժում է կապկպած buzzword-ը և storage-ն ու operating model-ը որոշում առանձին ապացույցով — այս ոլորտի ամենահաճախ failure-ը։ Storage ընտրությունը հիմնավորված է *binding constraint*-ով (ACID/audit՝ reporting-ի, cheap raw՝ science-ի), ոչ trend-ով, և ցույց է տրված, որ մեկ հարթակով բավարարում է երկու need։ Այն հայտարարում է bronze-ը immutable և append-only և gold fact grain-ը նշում մեկ նախադասությամբ (*մեկ row = մեկ posted ledger line*)՝ փակելով warehouse-ի #1 bug-ը նախքան սկսելը։ Այն զսպում է mesh-ի հաստատումը հենց այն պատճառով, որ ownership-ը անհաս է, և slide-ի փոխարեն տալիս կոնկրետ earn-path։ Contract rule-ը classify-ված է (nullable-additive ընդդեմ breaking rename-ի)՝ migration window-ով և consumer inventory-ով, և MDM պատասխանը կրում է հստակ per-attribute survivorship table, ոչ last-writer-wins։ Վերջապես այն flag է անում retention period-ը որպես jurisdiction-specific՝ threshold հորինելու փոխարեն։

### Օրինակ B — տվյալների թիմի maturity roadmap (crawl / walk / run)

**Prompt.** Միջին չափի ընկերության հնգանոց տվյալների թիմը անընդհատ կարդում է data mesh-ի մասին և ուզում է ընդունել այն։ Հիմա ունեն մի քանի համընկնող spreadsheet և մեկ analytics database, որ երկու հոգի ուղղակիորեն query են անում։ Ի՞նչ պետք է իրականում անեն։

**Senior պատասխան.** Սա *coaching* հարց է թիմի կարողության մասին, ոչ architecture ընտրություն — պատասխանիր հերթականացված maturity path-ով, և ազնիվ եզրակացությունն այն է, որ mesh-ը սխալ հաջորդ քայլ է։ Հնգանոց թիմին տրված mesh-ը կ-fail անի․ mesh-ը պահանջում է per-domain product owner, contract, SLA և steward, որ այս թիմը չունի։

Տեղադրիր նրանց և անվանի՛ր **մեկ** հաջորդ stage-ը․

- **Որտեղ են․ pre-crawl.** Համընկնող spreadsheet-ները և ուղղակիորեն query-արվող database-ը նշանակում են ոչ governed source of truth, ոչ սահմանված grain — ամեն թիվ բանակցելի է։
- **Crawl (հաջորդ stage-ը, սա արա)․** Համախմբիր **մեկ governed warehouse**-ի։ Սահմանիր core fact-ի grain-ը մեկ նախադասությամբ (օր.՝ *մեկ row = մեկ completed order*)։ Գրիր հիմնական contract-ներ այն երկու-երեք կրիտիկական source feed-ի համար։ Նշանակիր **մեկ owner ամեն կրիտիկական metric-ի** (մեկ սահմանում «revenue»-ի, մեկ՝ «active customer»-ի)։ Նպատակ՝ մեկ source of truth, որ մարդիկ վստահում և օգտագործում են։ *Mesh-ը այստեղ մի՛ սկսիր։*
- **Walk (հետո)․** Ավելացրու medallion շերտավորում (immutable bronze, conformed silver, gold mart), catalog, որ մարդիկ իրականում adopt են անում (կապված who-can-change-this որոշումներին), և MDM՝ top entity-ի վրա (customer)։ Ամեն schema change compatibility-class արա registry-ով։
- **Run (միայն երբ walk-ը ամուր է)․** Domain ownership / mesh — բայց միայն երբ domain-ները կարող են product-ի owner լինել՝ contract-ով, SLA-ով և steward-ով, CI-ում ավտոմատ contract enforcement-ով և impact-pruned lineage-ով։

**Recommendation․** հիմա անտեսիր mesh-ը. հաջորդ եռամսյակը ծախսիր crawl-ի հասնելու վրա (մեկ warehouse, սահմանված grain, մեկ owner ամեն metric-ի)։ Mesh-ը երկու stage հեռու է և վաստակվում է maturity-ով, ոչ ընդունվում կարդալով։

**Ինչու է անցնում gate-ը.** Այն ճիշտ է կարդում prompt-ը որպես capability/coaching հարց և պատասխանում crawl/walk/run հերթականությամբ՝ ամենաառաջադեմ pattern-ի փոխարեն — և բացահայտ անվանում է stage բաց թողնելը որպես failure՝ հրաժարվելով հնգանոց թիմին mesh տալուց։ Այն diagnose է անում թիմի իրական դիրքը (pre-crawl․ ոչ governed source, ոչ grain) տրված ապացույցից, հետո նշանակում *մեկ* actionable հաջորդ stage (մեկ governed warehouse, սահմանված grain, մեկ owner ամեն metric-ի)՝ end-state-ի փոխարեն։ Այն mesh-ի մերժումը կապում է կոնկրետ բացակայող նախապայմաններին (product owner, contract, SLA, steward), ուստի «ոչ»-ը հիմնավորված է, ոչ թեթևամիտ, և տալիս է earn-path դեպի run։ Grain-first-ը և one-owner-per-metric move-ները նույն կարգապահություններն են, որ operating ոսպնյակը enforce է անում՝ կիրառված որպես crawl-ի հիմք։

### Օրինակ C — MDM golden-record survivorship rulebook

**Prompt.** Customer data-ն ապրում է երեք համակարգում — CRM (sales-entered), Billing (finance-authoritative) և Support tool (agent-entered)։ Նույն customer-ը հայտնվում է երեքում էլ՝ հակասող name, address, email և status-ով։ Նախագծիր MDM rulebook-ը, որ արտադրում է մեկ golden record։

**Senior պատասխան.** Golden record-ը «վերցրու ամենանոր row-ը» չէ — այն **per-attribute survivorship policy** է plus **matching rule** plus **stewardship path** այն բանի համար, ինչ կանոնները չեն կարող որոշել։

**1. Matching (որ record-ներն են նույն entity-ն?)** Deterministic match նախ strong key-ով (tax id / verified email). fall back probabilistic match-ի name + address + phone-ով՝ score-ով։ Երկու threshold՝ **auto-merge ≥ 0.90**, **auto-distinct < 0.75**, և **0.75–0.90 gray zone → steward review queue** — երբեք auto-merge մի՛ արա «գուցե»-ն, որովհետև սխալ merge-ը միաձուլում է երկու իրական customer և ցավոտ է քանդել։ Tradeoff-ը ասված․ բարձր auto-merge շեմը նշանակում է ավելի շատ manual review, բայց ավելի քիչ false merge. customer/billing identity-ի համար false merge-ը ավելի վատ error-ն է։

**2. Survivorship (per attribute, որ source-ն է հաղթում?)** — golden value-ն ընտրվում է attribute-առ-attribute, որովհետև ոչ մի համակարգ authoritative չէ ամեն ինչի համար․

| Attribute | Հաղթող source (կանոն) | Tiebreak / նշում |
|---|---|---|
| Legal name | Billing (finance-verified) | եթե Billing null → CRM. հետո ամենավերջին-update-ված non-null |
| Billing address | Billing | authoritative ըստ սահմանման. երբեք մի՛ overwrite արա CRM-ից |
| Email (contact) | ամենավերջին-**verified** source-ների միջև | verified-ը հաղթում է unverified-ին անկախ recency-ից. հետո recency |
| Phone | Support (ամենավերջին agent-confirmed) | հետո CRM. drop արա unformattable-ը |
| Account status | Billing (active/suspended source of truth) | CRM «status»-ը sales stage է, ոչ account status — մի՛ միաձուլիր երկու concept-ը |
| Created date | **ամենավաղը** բոլոր source-ների միջև | identity-ն այնքան հին է, որքան իր առաջին հայտնվելը |

Precedence-ը **source-priority → recency → validity** է․ verified-բայց-հին email-ը հաղթում է unverified-նոր-ին։ Ամեն golden attribute պահում է իր **lineage**-ը (որ source + timestamp), որ record-ը auditable լինի և merge-ը reversible։

**3. Stewardship (ինչ կանոնները չեն կարող որոշել).** Gray-zone match-երը, և ցանկացած attribute conflict, որտեղ priority source-երը համաձայն չեն *և* երկուսն էլ verified են, գնում են **անվանված data steward**-ի, ոչ մետաղադրամի նետում։ Steward-ը որոշում է. որտեղ որոշումը generalize է անում, այն ծալվում է հետ որպես կանոնի ճշգրտում։ Ownership-ը բացահայտ է — անվանված steward-ը տիրում է customer MDM-ին, survivorship rule-ները **versioned** են, և merge-ը **reversible** է (պահիր source row-երը + lineage, երբեք hard-delete merge-ի ժամանակ)։

**Ինչու է անցնում gate-ը.** Այն մերժում է «ամենանոր row-ը հաղթում է»-ն և սահմանում survivorship **per attribute**՝ բացահայտ source-priority → recency → validity precedence-ով, ուստի Billing-ը տիրում է billing address-ին ու status-ին, մինչ verified email-ը կարող է հաղթել recency-ով — համապատասխանելով, թե ինչպես է authority-ն իրականում բաժանվում համակարգերի միջև։ Այն սահմանում է **matching threshold-ներ gray-zone steward queue-ով**՝ «գուցե»-ները auto-merge անելու փոխարեն (false-merge-ը անվանելով ավելի վատ, դժվար-քանդվող error), պահում է **lineage per attribute**, որ golden record-ը auditable լինի և merge-ը reversible, և undecidable-ը ուղղորդում է **անվանված steward**-ի versioned կանոններով՝ լուռ default-ի փոխարեն։ Այն նույնիսկ բռնում է semantic trap-ը (CRM sales-stage «status» ≠ Billing account status), որը հենց այնտեղ է, որտեղ naive MDM-ը corrupt է անում golden record-ը։
