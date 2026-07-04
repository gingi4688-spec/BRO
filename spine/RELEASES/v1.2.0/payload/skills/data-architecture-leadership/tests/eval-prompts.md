# Data Architecture and Leadership eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Storage selection.** "Warehouse vs lake vs lakehouse vs mesh for our reporting + data-science needs?" — Pass only if it scores the workload against the binding constraints (latency, transactions, governance, cost, schema volatility, ownership), splits storage from operating model, and does not pick by trend.
2. **"Lakehouse plus mesh."** "We want a lakehouse plus mesh." — Pass only if it separates the storage decision from the ownership/operating-model decision and refuses to endorse mesh without domain owners, contracts, SLAs, and stewards.
3. **Ambiguous grain.** "Our revenue number is different in two dashboards." — Pass only if it identifies the grain as the root cause, requires the fact-table grain stated in one sentence, and traces the double-count/fan-out to it. Fail if it jumps to "add a filter."
4. **Immutable raw.** "Bad records landed in our bronze table; just UPDATE them to fix it." — Pass only if it refuses to mutate bronze, keeps raw immutable/append-only, and moves the fix forward into a silver transform so history can be replayed.
5. **Modeling choice.** "Kimball vs Data Vault for our analytics?" — Pass only if the choice is driven by grain, change rate, and audit need (Kimball for stable analytics with conformed dimensions/SCD; Data Vault for many volatile sources needing lineage), and the grain is stated.
6. **Schema-change review.** "We want to rename `customer_id` in a shared table." — Pass only if it classifies the change as breaking, requires a versioned table, a consumer inventory + owners, a migration window, and a rollback, and freezes it if consumers are unknown.
7. **MDM / survivorship.** "Build us a single customer view from CRM, billing, and support." — Pass only if it defines match → merge → **per-attribute survivorship** (which source wins each field) → stewardship; fail if the golden record is left as last-writer-wins.
8. **Crawl/walk/run coaching.** "Our five-person team wants to adopt data mesh." — Pass only if it answers as a maturity path (crawl → walk → run), names skipping stages as the failure, refuses mesh now, and prescribes the one next stage (governed warehouse + grain + one owner per metric).
9. **Compliance threshold.** "How long must we retain customer transaction data?" — Pass only if it requires a jurisdiction and a cited source or marks it verify-before-use, and refuses to invent a number like "7 years."
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same artifact, same decision), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a specific cloud table-format benchmark or a named retention statute. — Pass only if it refuses to invent it or marks it verify-before-use with a source/placeholder.
- **No thin framework-name answer.** Ask "just tell me the data-architecture best practices." — Pass only if it expands into mechanism, a grain/contract/survivorship rule, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Storage selection.** «Warehouse vs lake vs lakehouse vs mesh մեր reporting + data-science need-երի համար»։ — Անցնում է միայն, եթե score է անում workload-ը binding constraint-ների դեմ (latency, transactions, governance, cost, schema volatility, ownership), բաժանում է storage-ը operating model-ից և trend-ով չի ընտրում։
2. **«Lakehouse plus mesh».** «Ուզում ենք lakehouse plus mesh»։ — Անցնում է միայն, եթե բաժանում է storage որոշումը ownership/operating-model որոշումից և հրաժարվում mesh հաստատելուց առանց domain owner-ի, contract-ի, SLA-ի և steward-ի։
3. **Ambiguous grain.** «Մեր revenue թիվը տարբեր է երկու dashboard-ում»։ — Անցնում է միայն, եթե grain-ը նույնացնում է որպես root cause, պահանջում է fact-table grain-ը մեկ նախադասությամբ և double-count/fan-out-ը հետ է բերում դրան։ Fail՝ եթե թռչում է «filter ավելացրու»-ին։
4. **Immutable raw.** «Վատ record-եր իջան մեր bronze table-ում. պարզապես UPDATE արա, որ ֆիքսվի»։ — Անցնում է միայն, եթե հրաժարվում է bronze-ը mutate անելուց, raw-ը պահում immutable/append-only, և fix-ը տանում առաջ՝ silver transform, որ history-ն replay-վի։
5. **Modeling choice.** «Kimball vs Data Vault մեր analytics-ի համար»։ — Անցնում է միայն, եթե ընտրությունը driving է grain-ով, change rate-ով և audit need-ով (Kimball՝ կայուն analytics՝ conformed dimension/SCD-ով. Data Vault՝ շատ փոփոխվող source-ների lineage-ով), և grain-ը նշված է։
6. **Schema-change review.** «Ուզում ենք rename անել `customer_id`-ը shared table-ում»։ — Անցնում է միայն, եթե classify է անում որպես breaking, պահանջում versioned table, consumer inventory + owner-ներ, migration window և rollback, և freeze է անում, եթե consumer-ները անհայտ են։
7. **MDM / survivorship.** «Կառուցիր մեզ single customer view CRM-ից, billing-ից և support-ից»։ — Անցնում է միայն, եթե սահմանում է match → merge → **per-attribute survivorship** (որ source-ն է հաղթում ամեն field-ում) → stewardship. fail՝ եթե golden record-ը մնում է last-writer-wins։
8. **Crawl/walk/run coaching.** «Մեր հնգանոց թիմը ուզում է data mesh ընդունել»։ — Անցնում է միայն, եթե պատասխանում է որպես maturity path (crawl → walk → run), stage բաց թողնելը անվանում failure, հիմա mesh-ը մերժում, և նշանակում մեկ հաջորդ stage (governed warehouse + grain + մեկ owner ամեն metric-ի)։
9. **Compliance threshold.** «Որքա՞ն պետք է պահենք customer transaction data-ն»։ — Անցնում է միայն, եթե պահանջում է jurisdiction և վկայակոչված source կամ նշում verify-before-use, և հրաժարվում «7 տարի»-ի պես թիվ հորինելուց։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն artifact-ը, նույն որոշումը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու կոնկրետ cloud table-format benchmark կամ named retention statute։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց կամ նշում verify-before-use՝ source/placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա data-architecture best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, grain/contract/survivorship rule կամ worked micro-example, ոչ label-ների ցուցակ։
