# Routing map — task → skill / Ուղղորդման քարտեզ

## English

How the orchestrator picks the lead skill. Match the task's signal to its lead; pull supports as inputs; fan out only when `orchestrator.md`'s conditions hold. `analysis-primary` frames first on every non-trivial task, then routes here.

### Routing table

| Task signal | Lead skill | Typical supports / fan-out |
|---|---|---|
| Deep analysis, ambiguous/complex/high-stakes framing | `analysis-primary` | frames first, then dispatches to the lead below |
| An **audit** (assess against criteria → findings + report) | `auditing` | dispatches criteria to the domain skill (see its table) |
| Native Armenian, translation, language quality | `language-mastery` | — |
| Build/spec an AI agent, evals, the roster | `ai-agent-engineering` | `analysis-primary`, the target domain skill |
| Data modeling, warehouse/lake, governance, MDM | `data-architecture-leadership` | `operating-data-roles`, `databases-storage-engineering` |
| Pipelines, batch/stream, CDC, orchestration | `data-engineering-pipelines` | `data-architecture-leadership` |
| Experiments, stats, causal inference, A/B | `data-science-analytics` | `data-engineering-pipelines` |
| DB internals, indexing, transactions, store choice | `databases-storage-engineering` | `software-systems-architecture` |
| Data roles, stewardship, glossary | `operating-data-roles` | `data-architecture-leadership` |
| Backend, APIs, distributed/event-driven, scaling | `software-systems-architecture` | `security-privacy-engineering`, `databases-storage-engineering` |
| CI/CD, k8s, IaC, observability, SLO, incidents | `devops-platform-sre` | `security-privacy-engineering` |
| Tests, coverage, flaky-triage, quality gates | `testing-quality-engineering` | the domain being tested |
| Mobile (iOS/Android/cross-platform) | `mobile-engineering` | `frontend-ux-product-design` |
| ML lifecycle, RAG, LLMOps, prompt/context eng | `ai-ml-engineering-llmops` | `data-science-analytics`, `data-engineering-pipelines` |
| Interface craft, UX research, design systems, frontend eng | `frontend-ux-product-design` | `ui-page-structure-design`, `communication-writing-negotiation` |
| Page structure, IA, state-matrix, role-gated layout | `ui-page-structure-design` | `frontend-ux-product-design` |
| Ideation, divergent thinking, design-thinking | `creativity-ideation-design-thinking` | the target domain |
| Threat model, authN/authZ, appsec, crypto, privacy | `security-privacy-engineering` | `software-systems-architecture`, `cybersecurity-operations-soc` |
| SOC, detection, incident response, threat intel | `cybersecurity-operations-soc` | `security-privacy-engineering` |
| Pentest / offensive (authorized) | `offensive-security-pentesting` | `security-privacy-engineering` |
| ISP/telecom network ops, BNG, TR-069 | `telecom-isp-network-ops` | `devops-platform-sre` |
| Discovery, PRD, prioritization, roadmap, delivery | `product-project-management` | the building domain skills |
| Strategy, moats, business model, process, org design | `business-strategy-operations` | `finance-unit-economics`, `economics-market-design` |
| Funnels, sales motion, pricing, growth | `sales-revenue-growth` | `marketing-brand`, `finance-unit-economics` |
| Demand-gen, positioning, brand, channels | `marketing-brand` | `sales-revenue-growth`, `communication-writing-negotiation` |
| P&L, unit economics, DCF, modeling, pricing math | `finance-unit-economics` | `business-strategy-operations` |
| Markets, mechanism/auction design, macro, behavioral econ | `economics-market-design` | `data-science-analytics` |
| Hiring, comp, conflict, org, performance, remote | `people-org-leadership` | `legal-compliance-contracts` |
| Clear writing, persuasion, negotiation, storytelling | `communication-writing-negotiation` | `language-mastery` |
| Teaching, mentoring, curriculum, onboarding | `teaching-mentoring-knowledge-transfer` | the domain taught |
| Research, lit-review, source synthesis, fact-check | `research-knowledge-synthesis` | the domain researched |
| Contracts, GDPR/CCPA, employment law, compliance | `legal-compliance-contracts` | `people-org-leadership`, `security-privacy-engineering` |

### Cross-skill composition (the key delegations)

- **`analysis-primary` frames first**, then hands off — it is the lens, not usually the final deliverable.
- **`auditing` owns the method, dispatches the criteria** to the domain skill's `domain-rubric.md` + `red-team-gate.md`. It never re-teaches the domain.
- **`frontend-ux-product-design` ↔ `ui-page-structure-design`**: page structure / IA / state-matrix → the latter; component craft, tokens, frontend engineering, a11y → the former.
- **`finance-unit-economics` vs `economics-market-design`**: a company's P&L/modeling → finance; markets, incentives, mechanism design → economics.
- **Security trio**: defensive/architecture → `security-privacy-engineering`; SOC/detection/IR → `cybersecurity-operations-soc`; authorized offensive → `offensive-security-pentesting`.
- **Data cluster**: architecture/governance → `data-architecture-leadership`; movement → `data-engineering-pipelines`; inference → `data-science-analytics`; engine internals → `databases-storage-engineering`; roles → `operating-data-roles`.
- **Anything legal/regulatory as an opinion** → `legal-compliance-contracts` (UPL gate), even when another skill surfaced it.

### Safety-gated skills — route the gated decision to a human owner

`people-org-leadership` (termination/discipline/harassment), `offensive-security-pentesting` (authorization + mandatory-reporting), `legal-compliance-contracts` (UPL/attorney gate), `research-knowledge-synthesis` (fabricated/misattributed sources), `security-privacy-engineering` (dual-use), `cybersecurity-operations-soc` / `telecom-isp-network-ops` (lawful-intercept), `auditing` (fraud/illegality → escalation, compliance opinion → legal). When these gate, the orchestrator produces the analysis and routes the decision to a human owner per the skill's `OWNER_NOTES.md`.

## Հայերեն

Ոնց է orchestrator-ն ընտրում lead skill-ը։ Համապատասխանեցրու task-ի signal-ը իր lead-ին. support-ները քաշիր որպես input. fan-out արա միայն երբ `orchestrator.md`-ի պայմանները ճիշտ են։ `analysis-primary`-ն ամեն ոչ-տրիվիալ task-ի վրա նախ շրջանակում է, հետո route անում այստեղ։

### Ուղղորդման աղյուսակ

Lead skill-ի ընտրությունը՝ ըստ task-ի signal-ի (նույն աղյուսակը, ինչ անգլերենում)․ խորը analysis → `analysis-primary` · audit → `auditing` (criteria-ն dispatch ոլորտին) · native հայերեն/թարգմանություն → `language-mastery` · AI agent/eval/roster → `ai-agent-engineering` · data modeling/governance → `data-architecture-leadership` · pipeline/CDC → `data-engineering-pipelines` · stats/experiment/causal → `data-science-analytics` · DB internals/indexing → `databases-storage-engineering` · data roles → `operating-data-roles` · backend/API/distributed → `software-systems-architecture` · CI-CD/k8s/SRE → `devops-platform-sre` · test/quality → `testing-quality-engineering` · mobile → `mobile-engineering` · ML/RAG/LLMOps → `ai-ml-engineering-llmops` · interface craft/UX/design-system/frontend-eng → `frontend-ux-product-design` · page structure/IA/state-matrix → `ui-page-structure-design` · ideation → `creativity-ideation-design-thinking` · threat-model/appsec/privacy → `security-privacy-engineering` · SOC/detection/IR → `cybersecurity-operations-soc` · pentest → `offensive-security-pentesting` · telecom/ISP → `telecom-isp-network-ops` · PRD/roadmap/delivery → `product-project-management` · strategy/process/org → `business-strategy-operations` · sales/pricing/growth → `sales-revenue-growth` · marketing/brand → `marketing-brand` · P&L/DCF/unit-economics → `finance-unit-economics` · markets/mechanism-design → `economics-market-design` · hiring/comp/org/performance → `people-org-leadership` · writing/persuasion/negotiation → `communication-writing-negotiation` · teaching/curriculum → `teaching-mentoring-knowledge-transfer` · research/lit-review/fact-check → `research-knowledge-synthesis` · contracts/GDPR/employment-law → `legal-compliance-contracts`։

### Cross-skill composition (հիմնական delegation-ները)

- **`analysis-primary`-ն նախ շրջանակում է**, հետո փոխանցում — ոսպնյակ է, ոչ սովորաբար վերջնական deliverable։
- **`auditing`-ը տիրում է մեթոդին, dispatch է անում criteria-ն** ոլորտի `domain-rubric.md` + `red-team-gate.md`-ին. երբեք չի վերաուսուցանում ոլորտը։
- **`frontend-ux-product-design` ↔ `ui-page-structure-design`**․ page structure / IA / state-matrix → երկրորդը. component craft, token, frontend engineering, a11y → առաջինը։
- **`finance-unit-economics` vs `economics-market-design`**․ ընկերության P&L/modeling → finance. շուկաներ, incentive, mechanism design → economics։
- **Security եռյակ**․ defensive/architecture → `security-privacy-engineering`. SOC/detection/IR → `cybersecurity-operations-soc`. authorized offensive → `offensive-security-pentesting`։
- **Data cluster**․ architecture/governance → `data-architecture-leadership`. movement → `data-engineering-pipelines`. inference → `data-science-analytics`. engine internals → `databases-storage-engineering`. roles → `operating-data-roles`։
- **Ցանկացած legal/regulatory՝ որպես opinion** → `legal-compliance-contracts` (UPL gate), նույնիսկ երբ ուրիշ skill դուրս բերեց այն։

### Safety-gated skill-եր — gated որոշումը ուղղորդիր մարդ-տիրոջը

`people-org-leadership` (termination/discipline/harassment), `offensive-security-pentesting` (authorization + mandatory-reporting), `legal-compliance-contracts` (UPL gate), `research-knowledge-synthesis` (fabricated source), `security-privacy-engineering` (dual-use), `cybersecurity-operations-soc` / `telecom-isp-network-ops` (lawful-intercept), `auditing` (fraud → escalation, compliance opinion → legal)։ Երբ սրանք gate են անում, orchestrator-ը արտադրում է analysis-ը և որոշումը ուղղորդում մարդ-տիրոջը՝ ըստ skill-ի `OWNER_NOTES.md`-ի։
