# skills_v7_6 — Bro's god-level skills pack / Bro-ի god-level skills փաթեթ

## English

This is **Bro's skills pack, rebuilt to god-level by Bro himself** (2026-06-25). 32 domain skills, each a self-contained, bilingual (English + native Armenian), senior-operator knowledge module. Every runtime reference is relative — the pack is path-portable and adopted by unzip-and-copy.

### Layout

```
skills_v7_6/
├── README.md            # this file
├── VALIDATION_REPORT.md # the build standard + per-skill verification (30/30 god-level, Bro hand-verified)
├── AUDIT_NOTES.md       # how this pack was built (Bro-build record)
├── PATH_FIXES.md        # relative-path conventions
├── shared/
│   └── OPERATING_PROTOCOL.md   # the shared control layer every skill loads first
├── agents/              # the agents-layer scaffold (orchestrator + specialist wrapper) — Phase 2
└── skills/<slug>/       # ×32, identical 11-file shape:
    ├── SKILL.md             # domain-dense: decision rules, failure modes, acceptance, quality bar
    ├── manual.md            # the deep operating manual (mechanism reference + rules + repairs), EN≡HY
    ├── patterns.md          # canonical domain moves (trigger / mechanism / do-not-use / repair)
    ├── domain-rubric.md     # 5 scoring dimensions with 1/3/5 anchors
    ├── worked-example.md    # fully worked senior answers with a domain-specific "why it passes"
    ├── output-templates.md  # domain-shaped deliverable templates
    ├── red-team-gate.md     # domain failure cases + reviewer probes
    ├── tests/eval-prompts.md      # 8–10 regression prompts with per-prompt checks
    ├── tests/red-team-prompts.md  # adversarial / safety prompts with a pass-bar
    ├── OWNER_NOTES.md       # domain-specific human-review / escalation triggers
    └── agents/claude.md     # thin specialist wrapper for the agents layer
```

### Load order (runtime)

1. Load `shared/OPERATING_PROTOCOL.md` (route → separate facts/assumptions → safety boundaries → executable output → bilingual → verify).
2. Load the lead skill's `SKILL.md` (always-in-context decision rules + failure modes + the safety gate where one exists).
3. Pull `references` (manual / patterns / rubric / examples / red-team / tests / owner-notes) on demand.
4. `analysis-primary` is the always-on framing lens — it frames first on ambiguous/complex/high-stakes input, then dispatches and verifies in the running system.

### The 32 skills

ai-agent-engineering · ai-ml-engineering-llmops · analysis-primary · auditing · business-strategy-operations · communication-writing-negotiation · creativity-ideation-design-thinking · cybersecurity-operations-soc · data-architecture-leadership · data-engineering-pipelines · data-science-analytics · databases-storage-engineering · devops-platform-sre · economics-market-design · finance-unit-economics · frontend-ux-product-design · language-mastery · legal-compliance-contracts · marketing-brand · mobile-engineering · offensive-security-pentesting · operating-data-roles · people-org-leadership · product-project-management · research-knowledge-synthesis · sales-revenue-growth · security-privacy-engineering · software-systems-architecture · teaching-mentoring-knowledge-transfer · telecom-isp-network-ops · testing-quality-engineering · ui-page-structure-design

Status: **32/32 god-level, Bro-hand-verified, ACCEPTED — ready for adoption** (see `VALIDATION_REPORT.md`).

## Հայերեն

Սա **Bro-ի skills փաթեթն է, Bro-ի կողմից ինքնուրույն վերակառուցված god-level մակարդակով** (2026-06-25)։ 32 ոլորտային skill, ամեն մեկը ինքնաբավ, երկլեզու (անգլերեն + native հայերեն), senior-operator գիտելիքի մոդուլ։ Բոլոր runtime հղումները հարաբերական են — փաթեթը path-portable է, որդեգրվում է unzip-and-copy-ով։

### Կառուցվածք

Ամեն skill ճիշտ **11 ֆայլ** ունի (նույն ձևը 30-ի համար)՝ `SKILL.md` (domain-խիտ՝ decision rules, failure modes, acceptance, quality bar) · `manual.md` (խորը ձեռնարկ՝ mechanism reference + rules + repairs, EN≡HY) · `patterns.md` · `domain-rubric.md` · `worked-example.md` · `output-templates.md` · `red-team-gate.md` · `tests/eval-prompts.md` · `tests/red-team-prompts.md` · `OWNER_NOTES.md` · `agents/claude.md`։ Ընդհանուր ֆայլերը՝ `shared/OPERATING_PROTOCOL.md` (կառավարման շերտը, որ ամեն skill բեռնում է առաջինը), `agents/` (Phase 2 agents-շերտի scaffold), `VALIDATION_REPORT.md`, `AUDIT_NOTES.md`, `PATH_FIXES.md`։

### Բեռնման հերթականություն (runtime)

1. Բեռնի՛ր `shared/OPERATING_PROTOCOL.md`-ն (ուղղորդիր → բաժանիր փաստ/ենթադրություն → անվտանգության սահմաններ → կիրառելի արդյունք → երկլեզու → ստուգիր)։
2. Բեռնի՛ր lead skill-ի `SKILL.md`-ն (միշտ-context-ում decision rule-ներ + failure mode-ներ + safety gate-ը, որտեղ կա)։
3. `references`-ը (manual / patterns / rubric / examples / red-team / tests / owner-notes) քաշիր ըստ պահանջի։
4. `analysis-primary`-ն always-on framing ոսպնյակն է — ambiguous/բարդ/high-stakes input-ի վրա առաջինը շրջանակում է, հետո dispatch ու ստուգում աշխատող համակարգում։

Կարգավիճակ՝ **32/32 god-level, Bro-ի ձեռքով ստուգած, ԸՆԴՈՒՆՎԱԾ — պատրաստ որդեգրման** (տես `VALIDATION_REPORT.md`)։
