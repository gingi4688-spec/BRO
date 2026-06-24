# SKILLS ROSTER — proposal + build spec / առաջարկ + կառուցման spec

> **EN:** Bro's proposed full skill roster (Gev builds the new ones, possibly on a separate account to save usage; then we discuss and implement the good ones into Bro). This file is the durable list + the exact build-spec so every new skill matches the existing house style and the L0 bilingual law. Build each new file to the bar of the two exemplars: `skills/02_software_and_systems_architecture.md` and `skills/11_analysis.md`.
>
> **HY:** Bro-ի առաջարկվող ամբողջ skill roster-ը (նորերը Գևն է կառուցում, հնարավոր է առանձին account-ով՝ usage խնայելու համար. հետո քննարկում ենք ու լավերը implement անում Bro-ի մեջ)։ Այս ֆայլը durable list-ն է + ճշգրիտ build-spec-ը, որ ամեն նոր skill համընկնի եղած house-style-ին ու L0 երկլեզու օրենքին։ Ամեն նոր ֆայլ կառուցիր երկու exemplar-ի բարձրությամբ՝ `skills/02_…md` ու `skills/11_…md`։

---

## A. EXISTING (16) — already built / արդեն կառուցված
`00` operating-data-roles (companion) · `01` Data Architecture & Leadership · `02` Software & Systems Architecture · `03` Frontend, UX & Product Design · `04` Product & Project Management · `05` Business Strategy & Operations · `06` Sales, Revenue & Growth · `07` Finance & Unit Economics · `08` Communication, Writing & Negotiation · `09` Language Mastery (L0 engine) · `10` AI Agent Engineering · `11` Analysis ★ PRIMARY · `12` Security & Privacy Engineering · `13` Testing & Quality Engineering · `14` DevOps, Platform Engineering & SRE · `15` AI/ML Engineering & LLMOps

## B. PROPOSED NEW — to build / կառուցելու

### Tier 1 — highest value · GAAhex-relevant / ամենաարժեքավոր
| # | Skill | Scope |
|---|---|---|
| 16 🎯 | **Telecom / ISP / Network Operations (BSS-OSS)** | GPON/OLT/ONU, RADIUS/AAA, IPAM, provisioning, NOC, BSS/OSS, telco billing — **the GAAhex domain itself** (subject-matter expertise for what Bro builds). Folds in hardware/embedded/IoT for network devices. |
| 17 | **Marketing & Brand** | positioning, brand, content, demand-gen, SEO/paid/social, lifecycle, PR — pull, distinct from Sales (06)'s push. |
| 18 | **Legal, Compliance, Contracts & IP** | contracts, IP, corporate/regulatory, data-protection law, ToS/Privacy policy, risk — literacy + flag-to-counsel. |
| 19 | **People, Org & Leadership** | hiring, performance, 1:1s, culture, org design, management — people, distinct from Ops (05)'s process. |
| 20 | **Data Science & Analytics** | statistics, experimentation/causal inference, A/B, BI/viz, decision-analytics — distinct from ML-eng (15) and data-arch (01). |

### Tier 2 — deep technical / խորը տեխնիկական
| # | Skill | Scope |
|---|---|---|
| 21 | **Data Engineering & Pipelines** | ETL/ELT, streaming (Kafka), orchestration (Airflow/dbt), lakehouse, batch/stream — hands-on beneath Data Arch (01). |
| 22 | **Databases & Storage Engineering** | query optimization, indexing, OLTP/OLAP, Postgres deep, search, time-series, caching internals. |
| 23 | **Mobile Engineering** | iOS/Android/cross-platform (Flutter/RN), mobile UX/perf/release — distinct from web (03). |
| 24 | **Offensive Security & Pentesting** | red-team, exploit dev, recon, the attacker's playbook — the offensive complement to defensive (12). |
| 25 | **Cybersecurity Operations (Blue-team/SOC)** | detection engineering, SIEM, threat-intel, IR ops, forensics — the ops complement to (12). |

### Tier 3 — foundational · breadth / հիմնարար · լայնություն
| # | Skill | Scope |
|---|---|---|
| 26 | **Economics & Market Design** | micro/macro, game theory, mechanism/market design, incentives, pricing theory. |
| 27 | **Research & Knowledge Synthesis** | deep research, source evaluation, literature review, sense-making — sharpens Analysis (11) + the deep-research harness. |
| 28 | **Creativity, Ideation & Design Thinking** | divergent/convergent, innovation methods, lateral thinking. |
| 29 | **Teaching, Mentoring & Knowledge Transfer** | pedagogy, explaining, onboarding, enablement. |

### Fold-ins — NOT a new file; deepen an existing one / նոր ֆայլ չեն, եղածը խորացնել
Technical Writing & Documentation → **08** · Customer Success/Support → **06** · Statutory Accounting → **07** · Cloud-provider architecture (AWS/GCP/Azure) → **02 / 14** · Enterprise Program/Portfolio PM → **04** · Hardware/Embedded/IoT → **16** (telecom devices).

**Recommended build order / առաջարկվող հերթ:** 16 (Telecom — direct GAAhex leverage) → 18 (Legal) → 20 (Data Science) → rest by tier.

---

## C. BUILD SPEC — how to build each new skill so it matches / ինչպես կառուցել

1. **Read the two exemplars first** (`02`, `11`) and match their depth, density, voice, and structure.
2. **L0 BILINGUAL LAW (highest, non-negotiable):** every piece of content in BOTH English and Armenian — **English first, native Armenian directly below**, clearly separated. Armenian must be full, native, professional — never a rough/machine translation, held to the same bar as English. Technical terms may stay in Latin where that is the real Armenian tech usage (the exemplars do this). **No Cyrillic letters fused into Armenian words** (homoglyph trap — `о/а/п` are Cyrillic, `ո/ա/պ` are Armenian); Russian words appear only as deliberate, labeled examples.
3. **Structure (house style):** `# Skill NN — Name` + `### subtitle` → EN/HY intro blockquote naming the **canon/sources** → `## 0.` a "which lens/mode when" altitudes table → `## 1. MINDSET` principles → `## 2…N` comprehensive domain body → `## Decision rules (fast)` → `## Anti-patterns (smell → fix)` → `## Canon quick-reference` (attributed) → `## ԲԱՌԱՐԱՆ / Glossary` (bilingual) → bilingual footer ending with `💪🤍` + a `Skill NN v1 — top-level, living, <date>` tag.
4. **Quality bar = MAXIMUM:** the definitive operating manual a top-0.1% practitioner writes for themselves — frameworks with WHEN-to-use, named laws/canon attributed correctly, concrete decision-rules, smell→fix anti-patterns, thorough bilingual glossary. Include important material even if not immediately needed. ~250–400+ dense bilingual lines is normal.
5. **Cross-link, don't duplicate:** reference sibling skills by number (e.g., "see Skill 12 §3"); never repeat another skill's content.
6. **After building:** add the registry row to `skills/index.md` and (for fold-ins) bump the host skill's version tag, preserving all its existing content/scars.

*EN: Bro — the roster grows; every skill at maximum strength, always. 💪🤍*
*HY: Bro — roster-ը աճում է. ամեն skill ամենաուժեղ վիճակում, միշտ։ 💪🤍*
