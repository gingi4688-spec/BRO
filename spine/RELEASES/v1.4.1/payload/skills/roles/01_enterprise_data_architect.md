# Enterprise Data Architect — Full Skill Set

**Track:** IC / Technical (top of technical ladder)
**Mandate:** Design and govern data architecture across the entire organization. Set the standards every system follows.

---

## 1. Data Modeling

- Conceptual, logical, physical modeling
- Relational normalization (1NF–BCNF) and deliberate denormalization
- Dimensional modeling: star schema, snowflake schema, fact/dimension design
- Data Vault 2.0 (hubs, links, satellites)
- Slowly Changing Dimensions (SCD Types 1–6)
- Entity-relationship design at enterprise scope
- Metadata-driven / model-driven schema generation

## 2. Database Systems

- Relational: PostgreSQL, SQL Server, Oracle, MySQL
- Columnar / analytical: ClickHouse, Vertica, DuckDB
- NoSQL: document (MongoDB), key-value (Redis), wide-column (Cassandra), graph (Neo4j)
- NewSQL / distributed SQL: CockroachDB, Spanner, YugabyteDB
- Time-series: TimescaleDB, InfluxDB
- Indexing strategy, partitioning, sharding, replication
- Query optimization and execution plan analysis
- Multi-tenant isolation patterns (RLS, schema-per-tenant, DB-per-tenant)

## 3. Data Warehousing & Lakes

- Warehouse platforms: Snowflake, BigQuery, Redshift, Databricks SQL
- Data lake / lakehouse: Delta Lake, Apache Iceberg, Apache Hudi
- Medallion architecture (bronze / silver / gold)
- File formats: Parquet, ORC, Avro
- Storage tiering and cost architecture
- Workload isolation and compute separation

## 4. Data Integration & Pipelines

- ETL vs ELT design tradeoffs
- Orchestration: Airflow, Dagster, Prefect
- Transformation: dbt (models, tests, lineage)
- Ingestion: Fivetran, Airbyte, custom connectors
- Streaming: Kafka, Kafka Connect, Pulsar, Kinesis, Flink, Spark Structured Streaming
- Change Data Capture (Debezium, log-based CDC)
- Batch vs micro-batch vs real-time decisioning

## 5. Event-Driven & Streaming Architecture

- Event sourcing and append-only event stores
- CQRS (command/query separation)
- Projection / read-model design
- Idempotency, ordering, exactly-once vs at-least-once
- Schema registry and event contract versioning
- Saga / outbox patterns

## 6. Data Governance

- Master Data Management (MDM)
- Data catalog and lineage (DataHub, OpenMetadata, Collibra, Alation, Unity Catalog)
- Data quality frameworks (Great Expectations, Soda)
- Metadata management (technical, business, operational)
- Data contracts
- Reference data and taxonomy control

## 7. Security & Compliance

- Encryption at rest and in transit
- Row-level / column-level security
- Tokenization, masking, anonymization, pseudonymization
- RBAC / ABAC access models
- Regulatory: GDPR, HIPAA, SOC 2, PCI-DSS, CCPA
- Audit logging and immutable trails
- Key management (KMS, secrets management)

## 8. Cloud Data Platforms

- AWS: S3, Redshift, Glue, Athena, RDS, EMR, Lake Formation
- Azure: Synapse, Data Factory, ADLS, Fabric
- GCP: BigQuery, Dataflow, Dataproc, Pub/Sub
- Infrastructure as Code: Terraform
- Cost modeling and FinOps for data workloads

## 9. Modern Architecture Patterns

- Data Mesh (domain ownership, data-as-product, federated governance)
- Data Fabric
- Lambda and Kappa architectures
- Microservices data ownership / database-per-service
- Polyglot persistence

## 10. Programming & Tooling

- SQL (expert — window functions, CTEs, recursive queries, optimization)
- Python (data engineering, scripting, automation)
- Scala or Java (Spark/Flink workloads)
- Shell scripting
- Git and version control discipline
- CI/CD for data (testing, deployment, migration management)

## 11. Performance & Scale

- Horizontal vs vertical scaling decisions
- Caching layers (Redis, materialized views)
- Connection pooling and resource governance
- Cost-per-query optimization
- Capacity planning and load forecasting

## 12. Architecture Leadership

- Reference architecture authorship
- Architecture Decision Records (ADRs)
- Standards definition and enforcement across teams
- Technology selection and vendor evaluation
- Cross-team architectural review and approval
- Translating business requirements into data architecture
- Mentoring data engineers and junior architects

---

## Learning Sequence

1. SQL + relational modeling → mastery
2. Warehousing + dimensional modeling
3. Pipelines (dbt + Airflow) + cloud platform (pick one)
4. Streaming + event-driven architecture
5. Governance + security + compliance
6. Distributed systems + scale patterns
7. Data Mesh / Fabric + enterprise reference architecture
8. Architecture leadership + standards authority
