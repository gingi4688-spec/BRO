# Data Engineering and Pipelines eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Exactly-once vs at-least-once.** "Make this streaming pipeline exactly-once." — Pass only if it resolves the guarantee at the **sink** (idempotency key + upsert/MERGE or transactional write), states that engine exactly-once covers only the processing stage, and downgrades to at-least-once when the sink cannot dedupe. Fail if it claims end-to-end exactly-once from an engine flag alone.
2. **Duplicate-after-retry.** "Rows duplicate after a retry — fix it." — Pass only if it traces source-replay vs transform-nondeterminism vs sink-append, defines a deterministic idempotency key, and converts the write to upsert/MERGE; fail if it just says "add a dedupe step downstream."
3. **Windowing & late data.** "Aggregate events that arrive late and out of order." — Pass only if it names the window **type** (tumbling/sliding/session with size/step/gap), sets a **watermark** strategy and **allowed-lateness**, and routes past-lateness events to a side-output/DLQ instead of dropping them.
4. **Window-type choice.** "Should this be a tumbling, sliding, or session window?" — Pass only if it picks by the requirement: count-once → tumbling, overlapping moving aggregate → sliding, inactivity-gap-bounded → session, and justifies the choice; fail if it names one with no contrast.
5. **CDC design.** "Design incremental capture from our OLTP database." — Pass only if it defaults to **log-based** CDC (order + deletes) and, if query-based is forced, states missed-delete handling, an overlap window, a monotonic cursor, and reconciliation.
6. **Schema evolution / registry.** "A producer wants to remove a field consumed by other teams. We use Avro + a registry." — Pass only if it classifies compatibility against the **registry mode** (BACKWARD/FORWARD/FULL), lists consumers, sequences add-with-default → dual-write → migrate → remove, and forbids reusing the field tag.
7. **Avro vs Protobuf.** "Avro or Protobuf for our event pipeline?" — Pass only if it chooses on the real constraint (Avro for registry-driven streaming evolution; Protobuf for compact typed cross-language contracts with stable tags) and pins compatibility rules; fail if it picks by popularity with no tradeoff.
8. **DLQ / poison handling.** "One malformed message keeps killing our consumer." — Pass only if it routes poison to a **DLQ** with payload/error/offset/timestamp, separates transient retries from poison, and documents a replay path; fail if it drops the record or blocks the stream.
9. **Idempotent backfill / ELT.** "Reprocess last month's data after a transform bug, without corrupting live tables." — Pass only if it writes a versioned/partitioned output, runs a reconciliation gate, and atomically swaps the serving view (idempotent per partition, reversible); bonus for framing it as ELT over immutable raw.
10. **Freshness & verify-live.** "How do we know the data is fresh and correct?" — Pass only if it gives a freshness contract (arrival, allowed lateness, completeness, owner, alert) and blocking quality gates, and ties "done" to a downstream reconciliation in the running warehouse, not a green DAG.
11. **Armenian equal-depth.** Ask any of prompts 1–10 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same window types, same registry modes, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a specific tool's throughput number or a named benchmark. — Pass only if it refuses to invent it or marks it verify-before-use with a formula/placeholder.
- **No thin framework-name answer.** Ask "just tell me data-pipeline best practices." — Pass only if it expands into a mechanism (key, watermark, registry mode, reconciliation) or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Exactly-once ընդդեմ at-least-once-ի.** «Այս streaming pipeline-ը exactly-once դարձրու»։ — Անցնում է միայն, եթե երաշխիքը լուծում է **sink**-ի վրա (idempotency key + upsert/MERGE կամ transactional write), նշում է, որ engine exactly-once-ը ծածկում է միայն processing stage-ը, և իջեցնում at-least-once, երբ sink-ը չի կարող dedupe անել։ Fail՝ եթե պնդում է end-to-end exactly-once միայն engine flag-ից։
2. **Retry-ից հետո duplicate.** «Row-երը duplicate են retry-ից հետո — ուղղիր»։ — Անցնում է միայն, եթե trace է անում source-replay ընդդեմ transform-nondeterminism-ի ընդդեմ sink-append-ի, սահմանում դետերմինիստիկ idempotency key և write-ը փոխում upsert/MERGE. fail՝ եթե միայն ասում է «downstream dedupe step ավելացրու»։
3. **Windowing & ուշ data.** «Aggregate արա event-ները, որ ուշ և out-of-order են գալիս»։ — Անցնում է միայն, եթե անվանում է window-ի **տեսակը** (tumbling/sliding/session՝ size/step/gap-ով), սահմանում **watermark** strategy և **allowed-lateness**, և ուղղորդում past-lateness event-ները side-output/DLQ, drop-ի փոխարեն։
4. **Window-տեսակի ընտրություն.** «Սա tumbling, sliding, թե session window պետք է լինի՞»։ — Անցնում է միայն, եթե ընտրում է ըստ պահանջի․ count-once → tumbling, հատվող շարժվող aggregate → sliding, inactivity-gap-bounded → session, և հիմնավորում ընտրությունը. fail՝ եթե անվանում է մեկը առանց հակադրման։
5. **CDC design.** «Նախագծիր incremental capture մեր OLTP database-ից»։ — Անցնում է միայն, եթե լռելյայն ընտրում է **log-based** CDC (order + deletes) և, եթե query-based-ը պարտադրված է, նշում missed-delete-ի մշակում, overlap window, monotonic cursor և reconciliation։
6. **Schema evolution / registry.** «Producer-ը ուզում է field հանել, որ ուրիշ թիմեր են սպառում։ Avro + registry ենք օգտագործում»։ — Անցնում է միայն, եթե classify է անում compatibility-ն **registry mode**-ի դեմ (BACKWARD/FORWARD/FULL), գրում consumer-ները, հերթականացնում add-with-default → dual-write → migrate → remove, և արգելում field tag-ի reuse-ը։
7. **Avro ընդդեմ Protobuf-ի.** «Avro թե Protobuf մեր event pipeline-ի համար»։ — Անցնում է միայն, եթե ընտրում է իրական constraint-ով (Avro՝ registry-driven streaming evolution-ի. Protobuf՝ compact typed cross-language contract-ի՝ stable tag-երով) և pin է անում compatibility rule-ները. fail՝ եթե ընտրում է ըստ ժողովրդականության առանց tradeoff-ի։
8. **DLQ / poison մշակում.** «Մեկ malformed message-ը անընդհատ սպանում է մեր consumer-ը»։ — Անցնում է միայն, եթե ուղղորդում է poison-ը **DLQ**՝ payload/error/offset/timestamp-ով, բաժանում transient retry-ները poison-ից, և փաստաթղթավորում replay path. fail՝ եթե drop է անում record-ը կամ block է անում stream-ը։
9. **Idempotent backfill / ELT.** «Reprocess արա անցյալ ամսվա data-ն transform bug-ից հետո՝ առանց live table-ները corrupt անելու»։ — Անցնում է միայն, եթե գրում է versioned/partitioned output, գործարկում reconciliation gate և atomic-ով swap անում serving view-ը (idempotent ըստ partition-ի, հետշրջելի). bonus՝ եթե framing-ը ELT է immutable raw-ի վրա։
10. **Freshness & verify-live.** «Ոնց իմանանք, որ data-ն fresh և ճիշտ է»։ — Անցնում է միայն, եթե տալիս է freshness contract (arrival, allowed lateness, completeness, owner, alert) և blocking quality gate-ներ, և «done»-ը կապում downstream reconciliation-ին running warehouse-ում, ոչ green DAG-ին։
11. **Հայերեն equal-depth.** Հարցրու 1–10-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն window տեսակները, նույն registry mode-երը, նույն artifact-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու կոնկրետ tool-ի throughput թիվ կամ named benchmark։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց կամ նշում է verify-before-use՝ formula/placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա data-pipeline best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism (key, watermark, registry mode, reconciliation) կամ worked micro-example, ոչ label-ների ցուցակ։
