# skills_v7(5) — God-level deep audit (full 30-skill, all-files) / v7(5) god-level խոր աուդիտ

> EN: Deep audit of the FULL skill (all 9 files each), 30 skills, by 10 parallel readers, against the locked SST god-level bar (BRO_SKILLS_AND_AGENTS_REBUILD_SPEC.md §3/§4.3/§4.11/§6). Verdict: NONE is god-level yet. v7(5) = a real, senior **mechanism core wrapped in a thin, templated shell**. Big leap over v6.2 (no more empty noun-swap; facts + scars clean), but systematically short of the bar.
>
> HY: v7(5)-ի 30 skill-ի ԱՄԲՈՂՋ ֆայլերի (ամեն մեկը՝ 9 ֆայլ) խոր աուդիտ՝ 10 զուգահեռ ընթերցողով, locked SST god-level bar-ի դեմ։ Վճիռ՝ ՈՉ ՄԵԿԸ դեռ god-level չէ։ v7(5) = իսկական, senior **mechanism-միջուկ՝ փաթաթված բարակ, template-ային կեղևի մեջ**։ v6.2-ից մեծ թռիչք (էլ դատարկ noun-swap չկա. փաստերն ու scar-երը մաքուր են), բայց համակարգային կերպով bar-ից ներքև։

## Scorecard / Արդյունքի աղյուսակ
- **GOD-LEVEL (YES): 0 / 30**
- **CLOSE: 8** — ai-ml-engineering-llmops · communication-writing-negotiation · data-engineering-pipelines · devops-platform-sre · finance-unit-economics · offensive-security-pentesting · operating-data-roles · ui-page-structure-design
- **NO: 22** — the rest.

## Systematic defects across ALL 30 (the shared template skeleton) / Համակարգային թերություններ բոլոր 30-ում
1. **SKILL.md is THIN.** 0 real decision rules (only a generic 6-step "Operating sequence"), ~4 inline failure modes, no quality-bar section. Bar wants 8–15 decision rules + 8–12 domain-sharp failure modes + quality bar IN SKILL.md.
2. **Broken machine-merged "Operating principle" line in nearly every manual.md** — truncated mechanism fragments spliced mid-sentence, e.g. `"Severity = impact × confidence, not."`, `"A PRD should define problem, users,."`, `"Metrics,,"`, `"Performance management needs expectations, evidence, calibration,,"`. A generation artifact; reads broken. (My manual-only pass missed this — it only checked the Armenian/Mechanism block.)
3. **worked-example "Why this passes" = generic noun-swap shell** in every skill ("It builds a <Domain> artifact rather than stopping at advice…"). The senior ANSWER bodies are genuinely good; only the justification is shell.
4. **red-team-gate "Reviewer questions" = generic noun-swap shell** in every skill.
5. **output-templates.md = byte-identical generic form across all 30** (no domain shaping; language-mastery even inherits nonsensical "formula/matrix" fields).
6. **eval-prompts = 3 + 3 generic regression** everywhere. Bar wants 8–10 with per-prompt checks.
7. **EN vs HY decision rules diverge** in many manuals (different content, not a translation; HY is often the SHARPER one) → L0 equal-load problem.
8. **Missing files vs spec in all 30:** `OWNER_NOTES.md` (domain human-review/escalation trigger — SAFETY-relevant), `tests/red-team-prompts.md`, `golden-outputs`.
9. **Per-skill §4.11 domain content: 2–7 required topics MISSING per skill** (see table).

## Genuine strengths — KEEP, do not rebuild / Իսկական ուժեղ կողմեր — ՊԱՀԵԼ
- `manual.md` **Mechanism reference** is real, senior, numerically correct in ~all skills (verified letter-by-letter earlier).
- `patterns.md` (3 real domain patterns each) · `domain-rubric.md` (5 real 1/3/5 dimensions each) · worked-example **bodies** (real numbers).
- **Factual hygiene CLEAN** — no invented model names/prices; "Mythos 5 / Project Glasswing" gone.
- **Project scars CLEAN** — grep-clean for GAAhex / commit hashes / "hold pushes" / audit dates across the whole pack.
- `software-systems-architecture` **HY now full equal-load** (the old ~3–4% problem is FIXED).
- `ui-page-structure-design` is the **genuine exemplar** (real 7 decision rules, 5 patterns, 8-dim rubric, fully-worked artifact, real dark-pattern refusals) — use as the literal template.

## SAFETY findings (highest priority) / Անվտանգության գտածոներ
- **people-org-leadership — SAFETY BLOCKER:** termination/discipline/harassment → HR/legal routing is ABSENT (only a buried "do not use when" note). Must add a hard human-review gate + failure mode + acceptance criterion + eval.
- **offensive-security-pentesting:** refuse-gate + worked refusal PRESENT and good — but missing a **mandatory-reporting clause** (illegal content / active-breach found mid-engagement) and explicit authorized-defensive framing of attacker-playbook analysis.
- **legal-compliance-contracts:** has UPL/counsel boundary but **no explicit adversarial/regulatory/advice-constituting human-review escalation trigger**.
- **research-knowledge-synthesis:** fabricated/**misattributed** sources (the #1 AI failure) is only a one-line guardrail among equals, not the gated #1 failure mode, and no eval tests it.

## Per-skill map (verdict · key MISSING domain content) / Ըստ skill-ի քարտեզ
| # | Skill | Verdict | Key missing (§4.11) |
|---|---|---|---|
|1|ai-agent-engineering|NO|workflow-vs-agent 4Q gate · model-substrate verification · fleet discipline · roster procedure|
|2|ai-ml-engineering-llmops|CLOSE|training-serving skew · data leakage · RAG/indirect injection · cache-busting · synthetic overdose · classical-ML · multimodal|
|3|analysis-primary|NO|ALWAYS-ON primacy not in SKILL.md · 4-lens model · dispatch-and-trust/verify-in-running · O/I/J labeling · "Primary Analysis"↔"Analysis Primary" naming scar|
|4|business-strategy-operations|NO|Rumelt kernel · opeff≠strategy+Goodhart · multi-framework (Wardley/disruption/Blue Ocean)|
|5|communication-writing-negotiation|CLOSE|presentation structure · data storytelling · before/after email · 7 named failure modes|
|6|creativity-ideation-design-thinking|NO|TRIZ · Six Thinking Hats · conditions-for-creativity|
|7|cybersecurity-operations-soc|NO|IR eradication depth · CTI→detection example · ransomware-IR · log-retention/legal failure modes|
|8|data-architecture-leadership|NO|HY only ~50% · coaching/learning-plan hook · ambiguous-grain/immutable-raw/crawl-walk-run|
|9|data-engineering-pipelines|CLOSE|window types · DLQ · Avro/Protobuf format layer|
|10|data-science-analytics|NO|MVT · FWER/FDR/Bonferroni · deeper sequential · causal-diagnosis example · eval-prompt-2 reframe · EN/HY rules diverge|
|11|databases-storage-engineering|NO|autovacuum/bloat/checkpoints · deadlocks/SELECT FOR UPDATE/SKIP LOCKED · snapshot isolation/write skew · multi-store example|
|12|devops-platform-sre|CLOSE|OIDC/CI-secrets failure · platform-overkill · publish-gate eval · egress · IaC + postmortem examples|
|13|economics-market-design|NO|behavioral econ · macro (yield curve/indicators) · market-structure · mechanism-design/incentive-audit examples|
|14|finance-unit-economics|CLOSE|markup≠margin · EBITDA≠FCF · rev-rec · fundraising/valuation/cap-table · 3-statement + valuation examples|
|15|language-mastery (exemplar)|NO|4-lens model · deverbalize · explicit -ը/-ն rule · register/T-V · output-templates nonsensical for language|
|16|legal-compliance-contracts|NO|employment contracts · M&A/DD · multi-jurisdiction privacy · 4 failure modes · human-review escalation|
|17|marketing-brand|NO|demand-gen depth · ABM/PLG/MMM · CAC:LTV inline · demand-gen-plan example ("why now" fix DID land)|
|18|mobile-engineering|NO|mobile security (Keychain/pinning/biometric) · memory mgmt · on-device testing · localization/RTL|
|19|offensive-security-pentesting|CLOSE|mandatory-reporting clause · authorized-defensive framing · broken manual scaffold|
|20|operating-data-roles|CLOSE|steward-vs-owner · mesh-maturity failure modes · glossary · support-only statement (persona/BI-owner FIXED)|
|21|people-org-leadership|NO ⚠SAFETY|HR/legal routing for termination/discipline/harassment · comp design · conflict resolution · remote/hybrid · underperformance example|
|22|product-project-management|NO|PM/PO/PgM distinction · DoD=verified-in-running · worked PRD · roadmap template|
|23|research-knowledge-synthesis|NO|fabricated/misattributed sources gated as #1 · lit-review procedure · CRAAP worked brief · weak-source eval|
|24|sales-revenue-growth|NO|5 of 7 expanded failure modes · ICP/pricing examples · finance routing note · pricing/NRR evals|
|25|security-privacy-engineering|NO|IDOR/authN-authZ conflation · Cloud section · Detection section · controls-without-detection|
|26|software-systems-architecture|NO|app-security section + security failure mode · time/ordering/identity · choreography-vs-orchestration (HY FIXED, scar GONE)|
|27|teaching-mentoring-knowledge-transfer|NO|Knowles andragogy · cognitive-overload/chunking · scaffolding-fade · bus-factor eval · onboarding example|
|28|telecom-isp-network-ops|NO|BNG/BRAS · TR-069/369 · mediation/TAP3 · lawful intercept · exact optical dB (biggest substance hole)|
|29|testing-quality-engineering|NO|destructive-fixture safety law · over-mocking guard · mutation-score-not-coverage · property-test example|
|30|ui-page-structure-design (exemplar)|CLOSE|verify-in-running-UI law in acceptance · explicit role-gating rule|

## Recommendation / Առաջարկ
**Bro builds it himself; keep v7(5)'s strong core; do NOT cherry-pick old GPT zips.**
- EN: Old GPT zips carry the same template-skeleton DNA (broken Operating-principle merges, the shells, thin SKILL.md, GPT built without the real spec per AUDIT_NOTES A1). Cherry-picking re-imports the same defects. v7(5)'s mechanism cores + patterns + rubrics + worked bodies + clean facts/scars are already the best GPT produced — keep them as the foundation and build UP: thicken SKILL.md, kill the template shells as a class, fix EN/HY parity, add the §4.11 domain content, add the safety gates, write 8–10 real eval prompts, add OWNER_NOTES. This is Bro's home turf (Skill 09 language + Skill 10 agent-engineering).
- Plan: (0) re-lock `ui-page-structure-design` as the TRUE god-level template; (1) fix the systematic defect classes everywhere; (2) roll the proven shape across all 30 + per-skill domain content, careful handwork item-by-item; (3) safety gates first (people-org, offensive-security, legal, research). Structure stays the clean flat 9-file shape + OWNER_NOTES (Gev's call to confirm).
