# SKILLS — Bro's capabilities / Bro-ի կարողությունները

> **EN:** This is where Bro's professional competencies live — durable, structured, loaded every session. Memory says *what we did / who we are*; skills say *what Bro CAN do* (like a senior operator in each domain). **32 skills**, rebuilt to god-level by Bro himself (v7_6, 2026-06-26), each a self-contained, bilingual (English + native Armenian) module of **11 files**: `SKILL.md` (always-in-context decision rules + failure modes), a deep `manual.md`, `patterns.md`, `domain-rubric.md`, `worked-example.md`, `output-templates.md`, `red-team-gate.md`, `tests/` (eval + red-team prompts), `OWNER_NOTES.md` (human-review triggers), and `agents/claude.md` (the Phase-2 specialist wrapper).
>
> **HY:** Այստեղ ապրում են Bro-ի professional competency-ները՝ durable, structured, ամեն session load-վող։ Memory-ն ասում է *ինչ ենք արել / ով ենք*. skills-ը ասում է *ինչ ԿԱՐՈՂ է Bro-ն անել* (ինչպես senior operator ամեն ոլորտում)։ **32 skill**, Bro-ի կողմից ինքնուրույն վերակառուցված god-level մակարդակով (v7_6, 2026-06-26), ամեն մեկը ինքնաբավ, երկլեզու (անգլերեն + native հայերեն) **11 ֆայլ** մոդուլ՝ `SKILL.md` (միշտ-context-ում decision rule + failure mode), խորը `manual.md`, `patterns.md`, `domain-rubric.md`, `worked-example.md`, `output-templates.md`, `red-team-gate.md`, `tests/` (eval + red-team prompt), `OWNER_NOTES.md` (մարդկային ստուգման trigger), և `agents/claude.md` (Phase-2 specialist wrapper)։

---

## Load order / Բեռնման հերթականություն

1. **`shared/OPERATING_PROTOCOL.md`** — the shared control layer every skill loads first (route → separate facts/assumptions → safety boundaries → executable output → bilingual → verify). / կառավարման շերտը, որ ամեն skill առաջինը բեռնում է։
2. **The lead skill's `SKILL.md`** — always-in-context decision rules + failure modes + the safety gate where one exists. / lead skill-ի `SKILL.md`-ն։
3. **Pull deeper files on demand** — `manual.md` / `patterns.md` / `domain-rubric.md` / examples / red-team / tests / owner-notes. / խորը ֆայլերը՝ ըստ պահանջի։
4. **`analysis-primary`** is the always-on framing lens — it frames first on ambiguous / complex / high-stakes input, then dispatches and verifies in the running system. / always-on framing ոսպնյակը։

---

## Registry / Հերթ (32)

### ★ Primary lens / Առաջնային ոսպնյակ
| Skill | Covers |
|---|---|
| [**analysis-primary** — #1 FUNCTION](analysis-primary/SKILL.md) | **above all: deepest analysis on every task → full picture → dispatch & verify-in-running** · 4-lens · dispatch-and-trust / verify |

### ★ The two engines / Երկու շարժիչը
| Skill | Covers |
|---|---|
| [**language-mastery** — the L0 engine](language-mastery/SKILL.md) | **Armenian → native** · 4-lens · deverbalize · explicit `-ը`/`-ն` rule · T-V register · translation craft · + [Armenian lexicon set](reference/armenian/README.md) |
| [**ai-agent-engineering** — the roster-builder](ai-agent-engineering/SKILL.md) | **building expert agents that run to completion** · workflow-vs-agent gate · model-substrate verification · tools · evals · roster procedure |

### ★ The assurance conductor / Assurance-ի դիրիժորը
| Skill | Covers |
|---|---|
| [**auditing** — the cross-cutting conductor](auditing/SKILL.md) | independent, evidence-based assessment against **defined criteria** → findings + report · OWNS the universal spine (criteria-first · independence/self-review · evidence & sampling · design-vs-operating · 5 C's · calibrated severity · **completeness law — nothing slips uncovered** · reasonable-not-absolute assurance) · **DISPATCHES** the criteria to the relevant domain skill (code/security/financial/IT-controls/compliance/data/language/design/process/AI) |

### Data / Տվյալներ
| Skill | Covers |
|---|---|
| [data-architecture-leadership](data-architecture-leadership/SKILL.md) | modeling · warehouse/lake/lakehouse · immutable bronze · grain · MDM survivorship · governance · coaching/maturity |
| [data-engineering-pipelines](data-engineering-pipelines/SKILL.md) | batch/stream · window types · DLQ · Avro/Protobuf registry compat-modes · CDC · orchestration |
| [data-science-analytics](data-science-analytics/SKILL.md) | experiment design · MVT · FWER/FDR · sequential · CI-coverage · DiD · causal inference |
| [databases-storage-engineering](databases-storage-engineering/SKILL.md) | MVCC/autovacuum/WAL · deadlocks/SKIP LOCKED · write-skew · indexing · multi-store selection |
| [operating-data-roles](operating-data-roles/SKILL.md) | steward-vs-owner · glossary · lens-cascade · support-only seam (the operating companion) |

### Software · Platform · Quality / Ծրագր. · Platform · Որակ
| Skill | Covers |
|---|---|
| [software-systems-architecture](software-systems-architecture/SKILL.md) | backend · APIs · distributed/event-driven · app-security · time/ordering/identity · choreography-vs-orchestration · resilience · scaling |
| [devops-platform-sre](devops-platform-sre/SKILL.md) | CI/CD · containers/k8s · IaC · observability · SLI/SLO/error-budget math · incident response · platform/DX · FinOps · DORA |
| [testing-quality-engineering](testing-quality-engineering/SKILL.md) | pyramid/trophy · unit/integration/e2e/contract · property/fuzz/mutation · destructive-fixture safety law · flaky-triage · CI gates |
| [mobile-engineering](mobile-engineering/SKILL.md) | iOS/Android/cross-platform · Keychain/SPKI-pinning · memory mgmt · on-device matrix · lifecycle · store · RTL |
| [ai-ml-engineering-llmops](ai-ml-engineering-llmops/SKILL.md) | ML lifecycle · RAG/LoRA/quant · classical-ML · multimodal · prompt/context engineering · prompt-injection · MLOps/LLMOps · responsible AI |

### Frontend · Design / Frontend · Դիզայն
| Skill | Covers |
|---|---|
| [frontend-ux-product-design](frontend-ux-product-design/SKILL.md) | **4 roles**: UX research (Norman/Nielsen/Krug/JTBD) · laws-of-UX/interaction · design systems (3-tier tokens/atomic/component-API) · **frontend engineering** (component arch · state-by-ownership · CSR/SSR/SSG · Core Web Vitals · WCAG2.2/ARIA **verified**) |
| [ui-page-structure-design](ui-page-structure-design/SKILL.md) | page job · section order · role-gated layout · per-page **state matrix** · responsive priority · handoff · verify-in-running-UI law |
| [creativity-ideation-design-thinking](creativity-ideation-design-thinking/SKILL.md) | divergent/convergent · TRIZ · Six Thinking Hats · conditions-for-creativity · ideation facilitation |

### Security / Անվտանգություն
| Skill | Covers |
|---|---|
| [security-privacy-engineering](security-privacy-engineering/SKILL.md) | threat-model · authN/authZ · IDOR · appsec · crypto · secrets · cloud · detection & IR · dual-use defensive gate |
| [cybersecurity-operations-soc](cybersecurity-operations-soc/SKILL.md) | SOC · IR eradication (krbtgt double-reset) · CTI→detection · ransomware-IR · lawful-intercept (gated) |
| [offensive-security-pentesting](offensive-security-pentesting/SKILL.md) | methodology-only · **refuse-gate + worked refusal** · mandatory-reporting · authorized-scope discipline (no working exploits) |

### Telecom / Հեռահաղորդակցություն
| Skill | Covers |
|---|---|
| [telecom-isp-network-ops](telecom-isp-network-ops/SKILL.md) | BNG/BRAS · TR-069/369 · SLA/optical budget · mediation/TAP3 · lawful-intercept (gated to validated order) |

### Product · Business · Money / Product · Բիզնես · Փող
| Skill | Covers |
|---|---|
| [product-project-management](product-project-management/SKILL.md) | discovery · PRD · prioritization (RICE/WSJF) · roadmaps · delivery · DoD = verified-in-running |
| [business-strategy-operations](business-strategy-operations/SKILL.md) | Rumelt kernel · moats · business models · op-eff ≠ strategy + Goodhart · process · org design · SOPs |
| [sales-revenue-growth](sales-revenue-growth/SKILL.md) | funnels · motion-mismatch/single-threading · NRR · ICP · pricing · growth loops |
| [marketing-brand](marketing-brand/SKILL.md) | demand-gen · ABM/PLG/MMM · Dunford positioning · CAC:LTV · brand |
| [finance-unit-economics](finance-unit-economics/SKILL.md) | P&L · cash · LTV/CAC · DCF/cap-table · 3-statement modeling · pricing math |
| [economics-market-design](economics-market-design/SKILL.md) | behavioral econ · macro/yield-curve · market-structure · mechanism/auction design (VCG) |

### People · Comms · Knowledge · Legal / Մարդիկ · Հաղորդակցություն · Գիտելիք · Իրավ.
| Skill | Covers |
|---|---|
| [people-org-leadership](people-org-leadership/SKILL.md) | **HR/legal hard gate** (termination/discipline/harassment) · comp · conflict · remote · org design |
| [communication-writing-negotiation](communication-writing-negotiation/SKILL.md) | clear writing · SCR · persuasion · negotiation math · data-storytelling · channel comms |
| [teaching-mentoring-knowledge-transfer](teaching-mentoring-knowledge-transfer/SKILL.md) | Knowles andragogy · cognitive-load/chunking · scaffolding-fade · feedback · curriculum |
| [research-knowledge-synthesis](research-knowledge-synthesis/SKILL.md) | **fabricated/misattributed source gated #1** · lit-review · CRAAP · synthesis brief |
| [legal-compliance-contracts](legal-compliance-contracts/SKILL.md) | employment/M&A · GDPR/CCPA/LGPD · **UPL/attorney gate** · contracts (real authorities only) |

**Companions:** [shared/OPERATING_PROTOCOL.md](shared/OPERATING_PROTOCOL.md) (loaded first) · [learning_plan.md](learning_plan.md) (mastery path) · [reference/armenian/](reference/armenian/README.md) (native lexicon, Skill `language-mastery`) · [roles/](roles/) (data-role briefs) · [agents/](agents/) (the **agents layer** — [orchestrator](agents/orchestrator.md) + [ROUTING](agents/ROUTING.md) + 32 runtime specialists in `.claude/agents/`) · build record: [README.md](README.md) · [VALIDATION_REPORT.md](VALIDATION_REPORT.md) · [AUDIT_NOTES.md](AUDIT_NOTES.md)

---

## How skills work / Ոնց են աշխատում skills-ը

**EN:**
- Each skill is a **folder** (`<slug>/`) of 11 files, not a single manual — `SKILL.md` stays in context; the rest load on demand.
- The whole pack is **path-portable**: every reference is relative (`../shared/…`), so it works wherever `skills/` is copied.
- **Living** — when Gev teaches something or a lesson lands, the relevant skill gets a layer (and `OWNER_NOTES.md` records what must escalate to a human).
- Three skills are special: **`analysis-primary`** frames first, above everything; **`language-mastery`** powers L0 (native Armenian); **`ai-agent-engineering`** makes Bro the builder of the next agents.

**HY:**
- Ամեն skill **folder** է (`<slug>/`)՝ 11 ֆայլ, ոչ մեկ manual — `SKILL.md`-ն մնում է context-ում. մնացածը՝ ըստ պահանջի։
- Ամբողջ փաթեթը **path-portable** է՝ ամեն հղում հարաբերական է (`../shared/…`), ուստի աշխատում է, ուր էլ `skills/`-ը պատճենվի։
- **Living** — երբ Գևը նոր բան է սովորեցնում կամ lesson է կպնում, համապատասխան skill-ը շերտ է ստանում (և `OWNER_NOTES.md`-ն գրում է՝ ինչը պետք է escalate անել մարդուն)։
- Երեք skill հատուկ են՝ **`analysis-primary`**-ն շրջանակում է առաջինը, ամեն ինչից վեր. **`language-mastery`**-ն սնում է L0-ն (native հայերեն). **`ai-agent-engineering`**-ը Bro-ին դարձնում է հաջորդ agent-ների կառուցողը։

---
*EN: Bro — 32 skills deep, god-level, sharpening every session.*
*HY: Bro — 32 skill խորությամբ, god-level, սրվում ամեն session։ 💪🤍*
