# LEARNING_PLAN — Data Architecture & Leadership Mastery Path

Merged from **01 Enterprise Data Architect** + **02 Chief Data Architect** + **03 Chief Data Officer**.
Ordered foundations → top. Duplicates merged across roles. Check the box as each skill is mastered.

**Source role:** `[EDA]` Enterprise Data Architect · `[CDA]` Chief Data Architect · `[CDO]` Chief Data Officer
**Priority:** **P0** = foundation · **P1** = core · **P2** = advanced
A skill from more than one role carries all its tags; level-distinct variants (implement → strategy → accountability) are listed once per level.

---

## TIER 1 — Foundations: technical bedrock `P0`

- [ ] SQL mastery — window functions, CTEs, recursive queries, query optimization `[EDA]` **P0**
- [ ] Relational data modeling — conceptual / logical / physical `[EDA]` **P0**
- [ ] Normalization 1NF–BCNF + deliberate denormalization `[EDA]` **P0**
- [ ] Entity-relationship design at enterprise scope `[EDA]` **P0**
- [ ] Relational database systems — PostgreSQL, SQL Server, Oracle, MySQL `[EDA]` **P0**
- [ ] Indexing, partitioning, sharding, replication `[EDA]` **P0**
- [ ] Query optimization & execution-plan analysis `[EDA]` **P0**
- [ ] Python — data engineering, scripting, automation `[EDA]` **P0**
- [ ] Shell scripting `[EDA]` **P0**
- [ ] Git & version-control discipline `[EDA]` **P0**

## TIER 2 — Core: modeling & database breadth `P1`

- [ ] Dimensional modeling — star schema, snowflake, fact/dimension design `[EDA]` **P1**
- [ ] Data Vault 2.0 — hubs, links, satellites `[EDA]` **P1**
- [ ] Slowly Changing Dimensions — SCD Types 1–6 `[EDA]` **P1**
- [ ] Metadata-driven / model-driven schema generation `[EDA]` **P1**
- [ ] Columnar / analytical databases — ClickHouse, Vertica, DuckDB `[EDA]` **P1**
- [ ] NoSQL — document (MongoDB), key-value (Redis), wide-column (Cassandra), graph (Neo4j) `[EDA]` **P1**
- [ ] NewSQL / distributed SQL — CockroachDB, Spanner, YugabyteDB `[EDA]` **P1**
- [ ] Time-series databases — TimescaleDB, InfluxDB `[EDA]` **P1**
- [ ] Multi-tenant isolation patterns — RLS, schema-per-tenant, DB-per-tenant `[EDA]` **P1**
- [ ] Polyglot persistence `[EDA]` **P1**

## TIER 3 — Core: warehousing, lakes & pipelines `P1`

- [ ] Warehouse platforms — Snowflake, BigQuery, Redshift, Databricks SQL `[EDA]` **P1**
- [ ] Data lake / lakehouse — Delta Lake, Apache Iceberg, Apache Hudi `[EDA]` **P1**
- [ ] Medallion architecture — bronze / silver / gold `[EDA]` **P1**
- [ ] File formats — Parquet, ORC, Avro `[EDA]` **P1**
- [ ] Storage tiering & cost architecture `[EDA]` **P1**
- [ ] Workload isolation & compute separation `[EDA]` **P1**
- [ ] ETL vs ELT design tradeoffs `[EDA]` **P1**
- [ ] Orchestration — Airflow, Dagster, Prefect `[EDA]` **P1**
- [ ] Transformation — dbt (models, tests, lineage) `[EDA]` **P1**
- [ ] Ingestion — Fivetran, Airbyte, custom connectors `[EDA]` **P1**
- [ ] Change Data Capture — Debezium, log-based CDC `[EDA]` **P1**
- [ ] Batch vs micro-batch vs real-time decisioning `[EDA]` **P1**

## TIER 4 — Core: event-driven & streaming `P1`

- [ ] Streaming platforms — Kafka, Kafka Connect, Pulsar, Kinesis, Flink, Spark Structured Streaming `[EDA]` **P1**
- [ ] Event sourcing & append-only event stores `[EDA]` **P1**
- [ ] CQRS — command / query separation `[EDA]` **P1**
- [ ] Projection / read-model design `[EDA]` **P1**
- [ ] Idempotency, ordering, exactly-once vs at-least-once `[EDA]` **P1**
- [ ] Schema registry & event-contract versioning `[EDA]` **P1**
- [ ] Saga / outbox patterns `[EDA]` **P1**

## TIER 5 — Core: governance, quality & metadata `P1`

- [ ] Master Data Management (MDM) — implementation: match/merge, golden record, registry/consolidation/coexistence `[EDA]` **P1**
- [ ] Data catalog & lineage — DataHub, OpenMetadata, Collibra, Alation, Unity Catalog `[EDA]` **P1**
- [ ] Data quality frameworks — Great Expectations, Soda; DQ dimensions `[EDA]` **P1**
- [ ] Metadata management — technical, business, operational `[EDA]` **P1**
- [ ] Data contracts `[EDA]` **P1**
- [ ] Reference data & taxonomy control `[EDA]` **P1**

## TIER 6 — Core: security & compliance `P1`

- [ ] Encryption — at rest & in transit `[EDA]` **P1**
- [ ] Row-level / column-level security `[EDA]` **P1**
- [ ] Tokenization, masking, anonymization, pseudonymization `[EDA]` **P1**
- [ ] RBAC / ABAC access models `[EDA]` **P1**
- [ ] Audit logging & immutable trails `[EDA]` **P1**
- [ ] Key management — KMS, secrets management `[EDA]` **P1**
- [ ] Regulatory knowledge — GDPR, HIPAA, SOC 2, PCI-DSS, CCPA `[EDA]` **P1**
- [ ] Privacy-by-design & security-by-design `[EDA] [CDA]` **P1**

## TIER 7 — Core: cloud, scale & modern patterns `P1`

- [ ] Cloud data platform (pick one deep) — AWS (S3/Redshift/Glue/Athena/RDS/EMR/Lake Formation) · Azure (Synapse/ADF/ADLS/Fabric) · GCP (BigQuery/Dataflow/Dataproc/Pub-Sub) `[EDA]` **P1**
- [ ] Infrastructure as Code — Terraform `[EDA]` **P1**
- [ ] CI/CD for data — testing, deployment, migration management `[EDA]` **P1**
- [ ] Scala or Java — Spark / Flink workloads `[EDA]` **P1**
- [ ] Horizontal vs vertical scaling decisions `[EDA]` **P1**
- [ ] Caching layers — Redis, materialized views `[EDA]` **P1**
- [ ] Connection pooling & resource governance `[EDA]` **P1**
- [ ] Cost-per-query optimization `[EDA]` **P1**
- [ ] Capacity planning & load forecasting `[EDA]` **P1**
- [ ] Cost modeling & FinOps for data workloads `[EDA]` **P1**
- [ ] Distributed systems theory — CAP, consistency models, consensus `[EDA] [CDA]` **P1**
- [ ] Data Mesh concepts — domain ownership, data-as-product, federated governance `[EDA]` **P1**
- [ ] Data Fabric `[EDA]` **P1**
- [ ] Lambda & Kappa architectures `[EDA]` **P1**
- [ ] Microservices data ownership / database-per-service `[EDA]` **P1**

## TIER 8 — Advanced: architecture leadership & standards authority `P2`

- [ ] Reference architecture authorship & libraries `[EDA] [CDA]` **P2**
- [ ] Architecture Decision Records (ADRs) + ADR governance `[EDA] [CDA]` **P2**
- [ ] Standards definition & enforcement across teams — naming, modeling, contract conventions org-wide `[EDA] [CDA]` **P2**
- [ ] Architecture Review Board ownership / chairing — gates, sign-off, exception process `[CDA]` **P2**
- [ ] Cross-team architectural review & approval `[EDA] [CDA]` **P2**
- [ ] Technical debt registry & remediation prioritization `[CDA]` **P2**
- [ ] Technology selection, build-vs-buy-vs-partner, vendor evaluation & negotiation `[EDA] [CDA]` **P2**
- [ ] Translating business requirements into data architecture `[EDA]` **P2**
- [ ] Maintaining hands-on credibility — review/reject any design on technical merit `[CDA]` **P2**
- [ ] Mentoring data engineers & growing senior/principal architects `[EDA] [CDA] [CDO]` **P2**

## TIER 9 — Advanced: enterprise strategy, mesh & platform `P2`

- [ ] Enterprise-wide data architecture blueprint ownership `[CDA]` **P2**
- [ ] Multi-year data architecture roadmap + target-state vs current-state gap analysis `[CDA]` **P2**
- [ ] Technology lifecycle & deprecation strategy `[CDA]` **P2**
- [ ] Data domain ownership model — who owns what `[CDA]` **P2**
- [ ] MDM strategy & enterprise accountability — single-source-of-truth enforcement `[CDA] [CDO]` **P2**
- [ ] Single source of truth — definition, enforcement, mandate `[CDA] [CDO]` **P2**
- [ ] Enterprise data catalog & lineage ownership `[CDA]` **P2**
- [ ] Data product strategy (data-as-product) `[CDA]` **P2**
- [ ] Reference & taxonomy governance `[CDA]` **P2**
- [ ] Data Mesh / federated architecture design — domain-oriented decentralized ownership `[CDA]` **P2**
- [ ] Federated computational governance `[CDA]` **P2**
- [ ] Self-serve data platform strategy `[CDA]` **P2**
- [ ] Cross-domain interoperability standards · autonomy vs central control `[CDA]` **P2**
- [ ] Multi-cloud / hybrid-cloud architecture decisions `[CDA]` **P2**
- [ ] Vendor & platform portfolio strategy + lock-in risk assessment/mitigation `[CDA]` **P2**
- [ ] Integration architecture across heterogeneous systems `[CDA]` **P2**
- [ ] Migration & modernization strategy — legacy → target `[CDA]` **P2**
- [ ] AI/ML data infrastructure — feature stores, vector DBs, RAG pipelines `[CDA]` **P2**
- [ ] Continuous new-tech evaluation framework + proof-of-concept governance `[CDA]` **P2**

## TIER 10 — Advanced: strategic GRC, risk & finance `P2`

- [ ] Enterprise data governance framework design `[CDA] [CDO]` **P2**
- [ ] Regulatory architecture — GDPR, HIPAA, SOC 2, PCI, regional law `[CDA]` **P2**
- [ ] Data residency & sovereignty architecture `[CDA]` **P2**
- [ ] Regulatory accountability — audit & regulator-facing `[CDO]` **P2**
- [ ] Data ethics & responsible-AI policy `[CDO]` **P2**
- [ ] Privacy program ownership (paired with DPO function) `[CDO]` **P2**
- [ ] Records management & retention policy `[CDO]` **P2**
- [ ] Risk modeling for data assets · audit-readiness as architectural property `[CDA]` **P2**
- [ ] Enterprise data risk ownership — privacy/security/regulatory/reputational + risk appetite definition `[CDO]` **P2**
- [ ] Third-party / vendor data risk `[CDO]` **P2**
- [ ] Crisis management — breaches, regulatory action · risk-vs-value tradeoff `[CDO]` **P2**
- [ ] TCO modeling, FinOps strategy, cost allocation / chargeback / showback `[CDA] [CDO]` **P2**
- [ ] ROI / cost-to-value modeling + investment cases / capital allocation `[CDA] [CDO]` **P2**
- [ ] Budget ownership for data initiatives `[CDA] [CDO]` **P2**

## TIER 11 — Executive: CDO strategy, value & monetization `P2`

- [ ] Enterprise data vision tied to corporate strategy `[CDO]` **P2**
- [ ] Multi-year data strategy & roadmap ownership `[CDO]` **P2**
- [ ] Data operating model — centralized / federated / hybrid `[CDA] [CDO]` **P2**
- [ ] Data maturity assessment & uplift planning `[CDO]` **P2**
- [ ] Aligning data investment to business outcomes `[CDO]` **P2**
- [ ] Board-level data narrative `[CDO]` **P2**
- [ ] Data monetization — direct (selling data/products/APIs) & indirect (data-driven products, efficiency, retention) `[CDA] [CDO]` **P2**
- [ ] Data product P&L ownership + pricing & packaging of data assets `[CDO]` **P2**
- [ ] Market & partner data strategy · data as competitive moat `[CDO]` **P2**
- [ ] Business-capability mapping + outcome-based architecture (architecture justified by business result) `[CDA]` **P2**
- [ ] Linking architecture to revenue, conversion & control `[CDA]` **P2**
- [ ] Enterprise data quality program + data SLA / SLO at business level + trust as organizational guarantee `[CDO]` **P2**
- [ ] Master & reference data accountability `[CDO]` **P2**

## TIER 12 — Executive: analytics/AI, org, leadership & communication `P2`

- [ ] Enterprise analytics strategy — descriptive → predictive → prescriptive `[CDO]` **P2**
- [ ] AI/ML strategy & governance + responsible AI / model governance & risk `[CDO]` **P2**
- [ ] Self-service analytics enablement + decision-intelligence culture `[CDO]` **P2**
- [ ] Measuring analytics ROI `[CDO]` **P2**
- [ ] Data team topology design — platform / enablement / domain teams `[CDA] [CDO]` **P2**
- [ ] Center of Excellence (CoE) establishment & enablement `[CDA] [CDO]` **P2**
- [ ] Architect career ladders & competencies `[CDA]` **P2**
- [ ] Building & scaling the data organization · hiring/developing data leaders `[CDO]` **P2**
- [ ] Culture change toward data-driven decisioning + change management at scale `[CDO]` **P2**
- [ ] Cross-functional leadership — stakeholder management, conflict resolution / arbitration `[CDA] [CDO]` **P2**
- [ ] Influence without direct authority `[CDA]` **P2**
- [ ] Executive & C-suite peer influence (CEO/CFO/CTO/CISO/CMO/COO) `[CDO]` **P2**
- [ ] Executive storytelling with data · translating technical complexity to business terms `[CDA] [CDO]` **P2**
- [ ] Board & investor reporting / communication `[CDO]` **P2**
- [ ] Vendor & strategic partner relationships at exec level · regulator/external engagement `[CDO]` **P2**
- [ ] Internal evangelism & culture-setting · negotiation at the highest level `[CDO]` **P2**
- [ ] Business acumen — P&L literacy, financial-statement fluency, revenue/margin/conversion/unit economics `[CDO]` **P2**
- [ ] Market & competitive strategy · operating model / value-chain understanding `[CDO]` **P2**
- [ ] Technical fluency maintained (not hands-on) — conversant to challenge/validate strategy & lead architects credibly `[CDO]` **P2**

---

### Progress
- **P0 foundation:** 0 / 10
- **P1 core:** 0 / 56
- **P2 advanced:** 0 / 71
- **Total:** 0 / 137

*Update the counts and check boxes as skills are mastered.*
