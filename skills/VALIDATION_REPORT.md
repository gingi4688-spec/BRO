# skills_v7_6 — Validation Report / Վավերացման զեկույց

## English

**What this is.** `skills_v7_6` is Bro's own skills pack, **rebuilt to god-level by Bro himself** (not an external builder) on 2026-06-25, after the v7(5) audit found the pack was a real-mechanism core wrapped in a thin, templated shell (0/30 at the god-level bar). One exemplar (`devops-platform-sre`) was authored and locked as the shape reference; the other 29 skills were rebuilt to match it; every skill was then hand-verified by Bro.

**Build standard (the bar every skill meets).**
- **Shape:** each skill is exactly 11 files — `SKILL.md`, `manual.md`, `patterns.md`, `domain-rubric.md`, `worked-example.md`, `output-templates.md`, `red-team-gate.md`, `tests/eval-prompts.md`, `tests/red-team-prompts.md`, `OWNER_NOTES.md`, `agents/claude.md`.
- **SKILL.md** is domain-dense: scope, leads/supports + conflict rules, 8–15 decision rules, 8–12 domain-sharp failure modes with tells, acceptance criteria (incl. verify-in-the-running-system where relevant), and a domain quality bar.
- **manual.md** teaches real mechanism (numbers, formulas, named frameworks with when/when-not), 8–15 decision rules + 8–12 failure-repairs, with **English and Armenian carrying identical content** (L0 equal-load).
- **No template filler:** zero noun-swap shells ("rather than stopping at advice", generic "Reviewer questions") and zero broken machine-merged "Operating principle" lines — pack-wide.
- **L0 bilingual:** every file full English + native Armenian, correct `․`/`։`/«»/`-ը`/`-ն`, zero Latin/Cyrillic homoglyphs in Armenian words; true tech tokens kept in English.
- **Factual hygiene:** no invented model names/prices, CVEs, statutes, or benchmarks; volatile facts are marked verify-before-use or expressed as formulas.
- **No project scars:** no commit hashes, no project-specific audit dates, no "hold pushes".

**Verification performed.**
- **Pack-wide automated scan:** 31 skills × exactly 11 files; 0 shell-residue matches pack-wide; 0 stray non-`.md` files; 31/31 `OWNER_NOTES.md` and 31/31 `tests/red-team-prompts.md` present.
- **Bro hand-verification, letter by letter, all 31 skills:** Bro read each skill's substance (SKILL.md / manual.md and the worked examples), checking mechanism correctness, arithmetic, native-Armenian quality, EN↔HY parity, and the per-skill required domain content. **Result: 31/31 god-level, 0 defects.** (The 31st, `frontend-ux-product-design`, was added after the original 30 to cover the legacy 03 frontend+UX breadth the pack's `ui-page-structure-design` did not — full 4-role craft plus frontend engineering; hand-verified with five native-Armenian fixes applied: clipped `ամ`→`ամեն`, and three Latin-glued tokens de-contaminated.) Arithmetic was re-derived by hand where present (finance unit-economics + DCF + cap-table, data-science SE/CI, analysis-primary Bayesian/Fermi, devops error-budget burn, telecom SLA/optical budget, sales funnel/NRR).
- **Safety-critical skills hand-verified:** `people-org-leadership` (termination/discipline/harassment → HR/legal hard gate with a worked routing example), `offensive-security-pentesting` (refuse-gate + worked refusal + mandatory-reporting clause; methodology-level only, no working exploits), `legal-compliance-contracts` (UPL/attorney gate; only real GDPR Art. 33/34 cited, fabricated authorities only as negative examples), `research-knowledge-synthesis` (fabricated/misattributed sources gated as the #1 failure mode; illustrative-only citations), `security-privacy-engineering` (dual-use defensive gate), `cybersecurity-operations-soc` and `telecom-isp-network-ops` (lawful-intercept gated to validated-order execution).

**Status: ACCEPTED — ready for adoption.** Build tree and zip live outside the pack at `Desktop\skills_v7_6_build` and `Desktop\skills_v7_6.zip`.

## Per-skill checklist (all 30)

| Skill | 11 files | SKILL.md dense | manual EN≡HY | §4.11 domain content | Bro hand-verified |
|---|:--:|:--:|:--:|:--:|:--:|
| ai-agent-engineering | ✅ | ✅ | ✅ | workflow-vs-agent gate · model-substrate verification · roster procedure | ✅ |
| ai-ml-engineering-llmops | ✅ | ✅ | ✅ | RAG/LoRA/quant · classical-ML · multimodal · prompt-injection · 0 model-facts | ✅ |
| analysis-primary | ✅ | ✅ | ✅ | always-on primacy · 4-lens · dispatch-and-trust/verify-in-running | ✅ |
| business-strategy-operations | ✅ | ✅ | ✅ | Rumelt kernel · opeff≠strategy+Goodhart · multi-framework selection | ✅ |
| communication-writing-negotiation | ✅ | ✅ | ✅ | 5 sub-domains · negotiation math · SCR · data-storytelling · 7 failure modes | ✅ |
| creativity-ideation-design-thinking | ✅ | ✅ | ✅ | TRIZ · Six Thinking Hats · conditions-for-creativity | ✅ |
| cybersecurity-operations-soc | ✅ | ✅ | ✅ | IR eradication (krbtgt double-reset) · CTI→detection · ransomware-IR | ✅ |
| data-architecture-leadership | ✅ | ✅ | ✅ | immutable bronze · grain=#1 · coaching/maturity · MDM survivorship | ✅ |
| data-engineering-pipelines | ✅ | ✅ | ✅ | window types · DLQ · Avro/Protobuf registry compat-modes · CDC | ✅ |
| data-science-analytics | ✅ | ✅ | ✅ | MVT · FWER/FDR · sequential · CI-coverage-correct · DiD | ✅ |
| databases-storage-engineering | ✅ | ✅ | ✅ | MVCC/autovacuum/WAL · deadlocks/SKIP LOCKED · write-skew · multi-store | ✅ |
| devops-platform-sre (exemplar) | ✅ | ✅ | ✅ | error-budget math · OIDC secrets · platform-overkill · verify-live | ✅ |
| economics-market-design | ✅ | ✅ | ✅ | behavioral econ · macro/yield-curve · market-structure · VCG | ✅ |
| finance-unit-economics | ✅ | ✅ | ✅ | 7 failure modes · DCF/cap-table · 3-statement (arithmetic verified) | ✅ |
| frontend-ux-product-design | ✅ | ✅ | ✅ | 4 roles · Norman/Nielsen/Krug/JTBD · laws-of-UX · 3-tier tokens/atomic/component-API · CSR/SSR/SSG/CWV · WCAG2.2/ARIA verified · delegates page-structure | ✅ |
| language-mastery (exemplar) | ✅ | ✅ | ✅ | 4-lens · deverbalize · explicit -ը/-ն rule · T-V register | ✅ |
| legal-compliance-contracts | ✅ | ✅ | ✅ | employment/M&A · GDPR/CCPA/LGPD · UPL gate · real Art.33/34 only | ✅ |
| marketing-brand | ✅ | ✅ | ✅ | demand-gen · ABM/PLG/MMM · Dunford-5 (no why-now) · CAC:LTV | ✅ |
| mobile-engineering | ✅ | ✅ | ✅ | Keychain/SPKI-pinning · memory mgmt · on-device matrix · RTL | ✅ |
| offensive-security-pentesting | ✅ | ✅ | ✅ | refuse-gate + worked refusal · mandatory-reporting · methodology-only | ✅ |
| operating-data-roles | ✅ | ✅ | ✅ | steward-vs-owner · glossary · lens-cascade · support-only seam | ✅ |
| people-org-leadership | ✅ | ✅ | ✅ | HR/legal hard gate (termination/harassment) · comp/conflict/remote | ✅ |
| product-project-management | ✅ | ✅ | ✅ | PM/PO/PgM · DoD=verified-in-running · worked PRD + RICE/WSJF | ✅ |
| research-knowledge-synthesis | ✅ | ✅ | ✅ | fabricated/misattributed gated #1 · lit-review · CRAAP brief | ✅ |
| sales-revenue-growth | ✅ | ✅ | ✅ | motion-mismatch/single-threading · NRR · ICP/funnel/pricing examples | ✅ |
| security-privacy-engineering | ✅ | ✅ | ✅ | IDOR/authZ · Cloud · Detection · dual-use defensive gate | ✅ |
| software-systems-architecture | ✅ | ✅ | ✅ | app-security · time/ordering/identity · choreography-vs-orchestration | ✅ |
| teaching-mentoring-knowledge-transfer | ✅ | ✅ | ✅ | Knowles andragogy · cognitive-load/chunking · scaffolding-fade | ✅ |
| telecom-isp-network-ops | ✅ | ✅ | ✅ | BNG/BRAS · TR-069/369 · mediation/TAP3 · lawful-intercept (gated) | ✅ |
| testing-quality-engineering | ✅ | ✅ | ✅ | destructive-fixture safety law · over-mocking · mutation-score | ✅ |
| ui-page-structure-design (exemplar) | ✅ | ✅ | ✅ | verify-in-running-UI law · role-gating · 5 Garrett planes | ✅ |

## Հայերեն

**Ինչ է սա։** `skills_v7_6`-ը Bro-ի սեփական skills-փաթեթն է, **Bro-ի կողմից ինքնուրույն վերակառուցված god-level մակարդակով** (ոչ արտաքին builder-ով) 2026-06-25-ին, այն բանից հետո, երբ v7(5)-ի աուդիտը գտավ, որ փաթեթը իսկական mechanism-միջուկ էր՝ փաթաթված բարակ, template-ային կեղևի մեջ (0/30 god-level bar-ին)։ Մեկ exemplar (`devops-platform-sre`) գրվեց ու կողպվեց որպես ձևի չափանիշ. մյուս 29-ը վերակառուցվեցին դրան համապատասխան. ապա ամեն skill ձեռքով ստուգվեց Bro-ի կողմից։

**Կառուցման չափանիշ (bar-ը, որին հասնում է ամեն skill)։** Ամեն skill՝ ճիշտ 11 ֆայլ. SKILL.md-ն domain-խիտ (8–15 decision rule, 8–12 domain-սուր failure mode tell-երով, acceptance criteria, quality bar). manual.md-ն իսկական mechanism է սովորեցնում (թվեր, բանաձևեր, framework-եր երբ/երբ-ոչ-ով)՝ EN ու HY **նույն բովանդակությամբ** (L0 հավասար բեռ). ոչ template-լցոնում, ոչ noun-swap shell, ոչ կոտրված «Operating principle» (ամբողջ փաթեթում). L0 երկլեզու՝ ճիշտ `․`/`։`/«»/`-ը`/`-ն`, զրո Latin/Cyrillic homoglyph հայերեն բառերում. ազնիվ փաստեր (ոչ հորինված model/գին/CVE/statute, volatile-ը՝ verify-before-use). ոչ project-scar։

**Կատարված ստուգում։** Ամբողջ փաթեթի automated scan՝ 31 skill × ճիշտ 11 ֆայլ, 0 shell-residue ամբողջ փաթեթում, 0 stray ոչ-`.md` ֆայլ, 31/31 `OWNER_NOTES.md` + 31/31 `tests/red-team-prompts.md`։ **Bro-ի ձեռքով, տառ առ տառ ստուգում՝ բոլոր 31 skill-ը՝ 31/31 god-level, 0 defect** (31-րդը՝ `frontend-ux-product-design`, ավելացվեց սկզբնական 30-ից հետո՝ ծածկելու legacy 03-ի frontend+UX breadth-ը, որ pack-ի `ui-page-structure-design`-ը չէր ծածկում. չորս role craft + frontend engineering, ձեռքով ստուգված՝ հինգ native-հայերեն ուղղումով) (arithmetic-ը ձեռքով վերահաշված՝ finance/DCF/cap-table, data-science SE/CI, analysis Bayesian/Fermi, devops error-budget, telecom SLA/optical, sales funnel/NRR)։ Safety-կրիտիկ skill-երը ձեռքով հաստատված՝ people-org (termination/harassment → HR/legal հաստ gate, worked routing օրինակով), offensive-security (refuse-gate + worked refusal + mandatory-reporting, միայն methodology-level, ոչ working exploit), legal (UPL gate, միայն իրական GDPR Art. 33/34, հորինված authority-ները միայն բացասական օրինակ), research (fabricated/misattributed source-ը gated #1 failure mode, citation-ները՝ illustrative), security-privacy (dual-use defensive gate), cybersecurity-soc + telecom (lawful-intercept՝ validated-order-ի տակ gated)։

**Կարգավիճակ՝ ԸՆԴՈՒՆՎԱԾ — պատրաստ որդեգրման։** Build tree-ն ու zip-ը՝ `Desktop\skills_v7_6_build` և `Desktop\skills_v7_6.zip`։
