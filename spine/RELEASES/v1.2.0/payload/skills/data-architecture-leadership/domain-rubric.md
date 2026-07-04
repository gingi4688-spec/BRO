# Data Architecture and Leadership domain rubric

## English

Use this rubric before finalizing a platform decision matrix, modeling/grain decision, data contract, MDM rulebook, governance log, or maturity roadmap. A score of 5 requires the mechanism, the evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Architecture fit | Trendy platform pick; mesh and lakehouse bundled. | Some criteria named. | Storage choice follows the binding workload constraint and ownership maturity; storage is split from operating model; mesh endorsed only with real ownership. |
| Modeling mechanism | Tables only; no grain. | Model type named. | Grain stated in one sentence; history/SCD, dimensions/hubs, lineage, and query path are explicit; raw/bronze declared immutable. |
| Contract discipline | Schema changes ad hoc. | Contract named. | Compatibility class, registry rule, consumer owners, migration window, and rollback are concrete; unknown consumers freeze the change. |
| Master data | Golden record vague; last-writer-wins. | Matching discussed. | Match, merge, **per-attribute survivorship**, stewardship, and conflict workflow are defined. |
| Leadership tradeoff | Architecture memo only. | Recommendation exists. | Decision rights, standards, adoption path, exception process, and a crawl/walk/run next-stage are included. |

## Հայերեն

Այս rubric-ը կիրառիր platform decision matrix, modeling/grain որոշում, data contract, MDM rulebook, governance log կամ maturity roadmap վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, evidence և ստուգելի domain artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Architecture fit | Trendy platform ընտրություն. mesh-ն ու lakehouse-ը կապկպած։ | Որոշ criteria նշված է։ | Storage ընտրությունը բխում է binding workload constraint-ից և ownership maturity-ից. storage-ը բաժանված է operating model-ից. mesh-ը հաստատված է միայն իրական ownership-ով։ |
| Modeling mechanism | Միայն table-ներ. grain չկա։ | Model type-ը նշված է։ | Grain-ը նշված է մեկ նախադասությամբ. history/SCD, dimensions/hubs, lineage և query path բաց են. raw/bronze-ը հայտարարված է immutable։ |
| Contract discipline | Schema change-ը ad hoc է։ | Contract-ը նշված է։ | Compatibility class, registry rule, consumer owner-ներ, migration window և rollback կոնկրետ են. անհայտ consumer-ները freeze են անում change-ը։ |
| Master data | Golden record-ը vague է. last-writer-wins։ | Matching քննարկված է։ | Match, merge, **per-attribute survivorship**, stewardship և conflict workflow սահմանված են։ |
| Leadership tradeoff | Միայն architecture memo է։ | Recommendation կա։ | Decision rights, standards, adoption path, exception process և crawl/walk/run-ի հաջորդ stage ներառված են։ |
