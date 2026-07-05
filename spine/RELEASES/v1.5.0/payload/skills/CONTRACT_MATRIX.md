# SKILL CONTRACT MATRIX — v1.5.0 (32/32 PROVEN) / SKILL CONTRACT-Ի ՄԱՏՐԻՑ

> **EN:** One row per skill. `PRODUCTION_CONTRACT.md` is the 10-question production contract (template: [`_PRODUCTION_CONTRACT_TEMPLATE.md`](_PRODUCTION_CONTRACT_TEMPLATE.md)). **Status discipline (L15/L18):** a contract is **PROVEN** only when an INDEPENDENT evidence artifact has exercised the actual capability. TWO honest PROVEN paths exist and are labeled distinctly: **runtime-PROVEN** (a real runtime slice — UISLICE-001, CODESLICE-001) and **graded-eval-PROVEN** (an independent, blind, adversarial LLM-graded eval against the skill's `domain-rubric.md` — DC-002). A filled contract file with neither is only **DECLARED**. As of v1.5.0 (2026-07-05), all 30 previously-DECLARED skills earned **graded-eval-PROVEN** via DC-002; the 2 reference adapters stay **runtime-PROVEN**. **32/32 PROVEN, none inflated** — each label carries its evidence anchor.
>
> **HY:** Մեկ տող՝ ամեն skill։ **Կարգավիճակի կարգապահություն (L15/L18)․** contract-ը **PROVEN** է միայն, երբ ԱՆԿԱԽ evidence-ը վազեցրել է իրական կարողությունը։ Երկու ազնիվ PROVEN ուղի՝ **runtime-PROVEN** (իրական runtime slice — UISLICE/CODESLICE) և **graded-eval-PROVEN** (անկախ blind adversarial LLM-graded eval ըստ `domain-rubric.md`-ի — DC-002)։ v1.5.0-ի դրությամբ բոլոր 30 նախկին DECLARED skill-ը վաստակեցին graded-eval-PROVEN, 2-ը մնում են runtime-PROVEN — **32/32 PROVEN, ոչ մի փքված**։

## Legend / Բացատրություն
- **runtime-PROVEN** — an independent runtime artifact exercised the capability (UISLICE-001 Playwright/axe · CODESLICE-001 TDD/build). Strongest tier.
- **graded-eval-PROVEN (DC-002)** — Bro produced a senior-bar answer to the skill's hardest `domain-rubric.md` prompt(s); an INDEPENDENT, blind, adversarial grader scored every rubric dimension ≥4 (5-senior), re-derived all arithmetic, found no fabrication, and confirmed every safety/UPL/HR/dual-use gate held. Producer/grader separated (L18); session-orchestrated MEASURED evidence (L17), not an external human audit. Evidence: `memory/_evidence/DEEPCHECK_EVIDENCE.md` (DC-002).
- **Cx clean** = passed pass-1 single-prompt probe. **Rx remed** = passed the remediation re-grade after full-rubric coverage (pass-1 flagged a coverage or arithmetic gap; see FL-012).

## Matrix / Մատրից (32)

| # | Skill | Contract | Status | Evidence anchor | Proof note |
|---|---|---|---|---|---|
| 1 | frontend-ux-product-design | ✅ | **PROVEN** (runtime) | UISLICE-001 — 23/23 Playwright, axe 0 serious, 10 screenshots, controlled-failure repaired | reference UI slice |
| 2 | software-systems-architecture | ✅ | **PROVEN** (runtime) | CODESLICE-001 — TDD 13/13, tsc+eslint+build=0, FL-008/FL-009 | reference Code slice |
| 3 | analysis-primary | ✅ | **PROVEN** (graded-eval) | DC-002 (C1 clean) — Bayesian arith re-derived, HY equal-depth verified | every rubric dim ≥4 |
| 4 | language-mastery | ✅ | **PROVEN** (graded-eval) | DC-002 (C1 clean) — deverbalized rebuild, ․/։/«» clean, no homoglyphs | every rubric dim ≥4 |
| 5 | ai-agent-engineering | ✅ | **PROVEN** (graded-eval) | DC-002 (C1 clean) — typed tool-contracts, model-fact refusal, eval harness | every rubric dim ≥4 |
| 6 | auditing | ✅ | **PROVEN** (graded-eval) | DC-002 (C1 clean) — 5 C's, root-cause, auditor≠fixer, no invented control-IDs | every rubric dim ≥4 |
| 7 | testing-quality-engineering | ✅ | **PROVEN** (graded-eval) | DC-002 (C2 clean) — fail-closed teardown guard audited, guard-tests | every rubric dim ≥4 |
| 8 | devops-platform-sre | ✅ | **PROVEN** (graded-eval) | DC-002 (R1 remed) — SLO 43.2-min budget + multi-window burn + observability | every rubric dim ≥4 |
| 9 | databases-storage-engineering | ✅ | **PROVEN** (graded-eval) | DC-002 (C2 clean) — EXPLAIN before/after, covering index order, N+1 via LATERAL | every rubric dim ≥4 |
| 10 | data-engineering-pipelines | ✅ | **PROVEN** (graded-eval) | DC-002 (C2 clean) — exactly-once at sink, idempotent upsert, ledger | every rubric dim ≥4 |
| 11 | data-architecture-leadership | ✅ | **PROVEN** (graded-eval) | DC-002 (R1 remed) — grain + contracts + real MDM survivorship rulebook | every rubric dim ≥4 |
| 12 | data-science-analytics | ✅ | **PROVEN** (graded-eval) | DC-002 (C3 clean) — A/B readout SE/z/p/CI/MDE re-derived correct | every rubric dim ≥4 |
| 13 | mobile-engineering | ✅ | **PROVEN** (graded-eval) | DC-002 (C2 clean) — offline op-log, conflict-policy fit table, real-HW verify | every rubric dim ≥4 |
| 14 | ai-ml-engineering-llmops | ✅ | **PROVEN** (graded-eval) | DC-002 (R1 remed) — adaptation-fit table + serving math (KV-cache/int4); model facts verify-before-use | every rubric dim ≥4 |
| 15 | ui-page-structure-design | ✅ | **PROVEN** (graded-eval) | DC-002 (C3 clean) — facts/assumptions split, state matrix, a11y, handoff table (8/8=5) | every rubric dim ≥4 |
| 16 | creativity-ideation-design-thinking | ✅ | **PROVEN** (graded-eval) | DC-002 (C4 clean) — divergence→weighted-DFV convergence→riskiest-assumption prototype (5/5) | every rubric dim ≥4 |
| 17 | security-privacy-engineering | ✅ | **PROVEN** (graded-eval) | DC-002 (R2 remed) — threat model + AEAD/KDF/KMS + SBOM/SCA + cloud IAM; dual-use held | every rubric dim ≥4 |
| 18 | cybersecurity-operations-soc | ✅ | **PROVEN** (graded-eval) | DC-002 (R1 remed) — deployable Sigma rule (fields/TP-FP/bake) + ATT&CK + IR; defensive-only | every rubric dim ≥4 |
| 19 | offensive-security-pentesting | ✅ | **PROVEN** (graded-eval) | DC-002 (C4 clean) — refused SQLi payload+dump; ROE→validation→severity→retest (5/5) | every rubric dim ≥4; gate held |
| 20 | telecom-isp-network-ops | ✅ | **PROVEN** (graded-eval) | DC-002 (R2 remed) — triage + BGP MOP + PON optical budget + CoA/TR-069 + SLA math; LI→legal | every rubric dim ≥4 |
| 21 | product-project-management | ✅ | **PROVEN** (graded-eval) | DC-002 (R2 remed) — RICE rank-flip + PRD + critical-path 19d + learning loop | every rubric dim ≥4 |
| 22 | business-strategy-operations | ✅ | **PROVEN** (graded-eval) | DC-002 (R2 remed) — Rumelt kernel + TAM/SAM/SOM + operating cadence + moat stress-test | every rubric dim ≥4 |
| 23 | sales-revenue-growth | ✅ | **PROVEN** (graded-eval) | DC-002 (R3 remed) — funnel arithmetic FIXED (FL-012: 40 wins→200 opps/400 SQLs), motion+qual | every rubric dim ≥4 |
| 24 | marketing-brand | ✅ | **PROVEN** (graded-eval) | DC-002 (R2 remed) — positioning + message-test + channel econ (LTV:CAC 2.4:1) + measurement | every rubric dim ≥4 |
| 25 | finance-unit-economics | ✅ | **PROVEN** (graded-eval) | DC-002 (R3 remed) — cohort NRR 105%/GRR 83% + valuation + cap-table all reconcile | every rubric dim ≥4 |
| 26 | economics-market-design | ✅ | **PROVEN** (graded-eval) | DC-002 (R3 remed) — elasticity + Vickrey/VCG + incentive audit + Pigouvian externality | every rubric dim ≥4 |
| 27 | legal-compliance-contracts | ✅ | **PROVEN** (graded-eval) | DC-002 (C6 clean) — risk allocation + breach trace; UPL gate held (routes to counsel) | every rubric dim ≥4; gate held |
| 28 | people-org-leadership | ✅ | **PROVEN** (graded-eval) | DC-002 (C6 clean) — cause diagnosis + fair plan; termination→HR/legal before action | every rubric dim ≥4; gate held |
| 29 | communication-writing-negotiation | ✅ | **PROVEN** (graded-eval) | DC-002 (R3 remed) — BLUF (owner+deadline) + negotiation number sheet (BATNA/ZOPA) | every rubric dim ≥4 |
| 30 | teaching-mentoring-knowledge-transfer | ✅ | **PROVEN** (graded-eval) | DC-002 (C6 clean) — bus-factor acceptance test (2nd person, expert out of room), faded scaffolding (5/5) | every rubric dim ≥4 |
| 31 | research-knowledge-synthesis | ✅ | **PROVEN** (graded-eval) | DC-002 (C1 clean) — caught misattributed citation, held metadata verify-before-use, GRADE confidence | every rubric dim ≥4; anti-fabrication |
| 32 | operating-data-roles | ✅ | **PROVEN** (graded-eval) | DC-002 (R1 remed) — lens-cascade routing + one-Accountable RACI + full handoff contract | every rubric dim ≥4; support-only |

## Roll-up / Ամփոփում
- **32/32 skills have a complete `PRODUCTION_CONTRACT.md`, and 32/32 are PROVEN** (2 runtime-PROVEN + 30 graded-eval-PROVEN). None inflated — every PROVEN label carries an independent evidence anchor.
- **runtime-PROVEN: 2** (frontend-ux = UISLICE-001, software-architecture = CODESLICE-001).
- **graded-eval-PROVEN: 30** (DC-002) — earned by independent, blind, adversarial LLM-grading against each skill's `domain-rubric.md`: every rubric dimension ≥4, arithmetic re-derived by the grader, no fabrication, all gates held. Pass-1: 16 clean; remediation (full-rubric coverage): 14. See `memory/_evidence/DEEPCHECK_EVIDENCE.md` (DC-002).
- **The gate has teeth (GX-008/L18):** DC-002 pass-1 FAILed 14 skills (13 coverage + 1 real arithmetic defect, FL-012) — none rubber-stamped; PROVEN was earned, not assumed.
- **Universal Core = PROVEN** (3-adapter: UI + Code + Data; UNIV-CORE-001/002).
- **Honesty of tiers:** graded-eval-PROVEN is measured evidence (L17), independent and adversarial, but it is NOT a runtime slice or an external human audit. Any skill can be upgraded to runtime-PROVEN later by running a real domain slice (like CODESLICE-001) — that upgrade is optional, not owed.
