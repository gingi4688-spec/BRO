# SKILL CONTRACT MATRIX — v1.4.0 Block 1 / SKILL CONTRACT-Ի ՄԱՏՐԻՑ

> **EN:** One row per skill. `PRODUCTION_CONTRACT.md` is the 10-question production contract (template: [`_PRODUCTION_CONTRACT_TEMPLATE.md`](_PRODUCTION_CONTRACT_TEMPLATE.md)). **Status discipline (L15/L18):** a contract is **PROVEN** only when an INDEPENDENT runtime/evidence artifact has exercised the actual capability (UI slice = UISLICE-001, Code slice = CODESLICE-001). A filled contract file is **DECLARED**, never PROVEN — a contract existing proves the *plan*, not the *capability*. All 30 non-slice skills are DECLARED and honestly labeled; none is inflated.
>
> **HY:** Մեկ տող՝ ամեն skill։ `PRODUCTION_CONTRACT.md`-ն 10-հարցանի production contract-ն է։ **Կարգավիճակի կարգապահություն (L15/L18)․** contract-ը **PROVEN** է միայն, երբ ԱՆԿԱԽ runtime/evidence artifact-ը վազեցրել է իրական կարողությունը (UI = UISLICE-001, Code = CODESLICE-001)։ Լցված contract ֆայլը **DECLARED** է, երբեք PROVEN — contract-ի գոյությունն ապացուցում է *պլանը*, ոչ *կարողությունը*։

## Legend / Բացատրություն
- **PROVEN** — independent runtime evidence exists in `memory/_evidence/EVIDENCE_LEDGER.md` (UISLICE-001 / CODESLICE-001).
- **DECLARED** — contract complete + anchored to the skill's `domain-rubric.md` + `tests/eval-prompts.md` + `tests/red-team-prompts.md`; **no independent eval RUN yet**.
- **Missing proof** — what would flip DECLARED→PROVEN.
- **Next proof slice** — the concrete future run that would earn PROVEN (reuses a proven adapter or the L2/L4 LLM-graded eval harness from Block 2).

## Matrix / Մատրից (32)

| # | Skill | Contract | Status | Evidence anchor | Missing proof | Next proof slice |
|---|---|---|---|---|---|---|
| 1 | frontend-ux-product-design | ✅ | **PROVEN** | UISLICE-001 (EVIDENCE_LEDGER) — 23/23 Playwright, axe 0 serious, 10 screenshots, controlled-failure repaired | — (proven) | — (reference UI slice) |
| 2 | software-systems-architecture | ✅ | **PROVEN** | CODESLICE-001 (EVIDENCE_LEDGER) — TDD 13/13, tsc+eslint+build=0, FL-008/FL-009 | — (proven) | — (reference Code slice) |
| 3 | analysis-primary | ✅ | DECLARED | domain-rubric + tests scaffold | no independent reasoning-eval RUN | L2 LLM-graded reasoning eval (Block 2) |
| 4 | language-mastery | ✅ | DECLARED | domain-rubric + tests scaffold; L0 exercised live each session (not an independent RUN) | no independent parity/register-eval RUN | L2 LLM-graded translation/register eval (Block 2) |
| 5 | ai-agent-engineering | ✅ | DECLARED | domain-rubric + tests scaffold | no independent agent-eval RUN | agent eval-harness run (evals mandatory) |
| 6 | auditing | ✅ | DECLARED | domain-rubric + tests scaffold | no independent audit-eval RUN | L2 LLM-graded audit eval (Block 2) |
| 7 | testing-quality-engineering | ✅ | DECLARED | Code-adapter pattern (PROVEN) + domain-rubric | not itself exercised on a slice | reuse PROVEN Code adapter on a test-strategy slice |
| 8 | devops-platform-sre | ✅ | DECLARED | Code-adapter pattern (PROVEN) + domain-rubric | not itself exercised on a slice | reuse PROVEN Code adapter on an IaC/CI slice |
| 9 | databases-storage-engineering | ✅ | DECLARED | Code-adapter pattern (PROVEN) + domain-rubric | not itself exercised on a slice | reuse PROVEN Code adapter on a schema/query slice |
| 10 | data-engineering-pipelines | ✅ | DECLARED | Code-adapter pattern (PROVEN) + domain-rubric | not itself exercised on a slice | reuse PROVEN Code adapter on a pipeline slice |
| 11 | data-architecture-leadership | ✅ | DECLARED | domain-rubric + tests scaffold | no independent design-review RUN | L2 LLM-graded design-decision eval (Block 2) |
| 12 | data-science-analytics | ✅ | DECLARED | Code-adapter pattern + domain-rubric | not itself exercised on a slice | reuse Code adapter on a stats/experiment slice |
| 13 | mobile-engineering | ✅ | DECLARED | Code-adapter pattern (PROVEN) + domain-rubric | not itself exercised on a slice | reuse PROVEN Code adapter on a mobile-logic slice |
| 14 | ai-ml-engineering-llmops | ✅ | DECLARED | Code-adapter pattern + domain-rubric | not itself exercised on a slice | reuse Code adapter on an ML/eval-harness slice |
| 15 | ui-page-structure-design | ✅ | DECLARED | UI-adapter pattern (PROVEN) + domain-rubric | not itself exercised on a slice | reuse PROVEN UI adapter on a page-structure slice |
| 16 | creativity-ideation-design-thinking | ✅ | DECLARED | domain-rubric + tests scaffold | no independent ideation-eval RUN | L2 LLM-graded ideation/convergence eval (Block 2) |
| 17 | security-privacy-engineering | ✅ | DECLARED | domain-rubric + red-team-gate + tests scaffold | no independent eval RUN (incl. refusal cases) | L2 LLM-graded eval + red-team refusal cases (Block 2) |
| 18 | cybersecurity-operations-soc | ✅ | DECLARED | domain-rubric + red-team-gate + tests scaffold | no independent eval RUN | L2 LLM-graded IR/detection eval (Block 2) |
| 19 | offensive-security-pentesting | ✅ | DECLARED | §4.11 refusal gate + red-team-gate + tests scaffold | no independent eval RUN (incl. refusal cases) | L2 LLM-graded eval — refusal/authorization gate cases (Block 2) |
| 20 | telecom-isp-network-ops | ✅ | DECLARED | domain-rubric + tests scaffold | no independent diagnostic-eval RUN | L2 LLM-graded diagnostic eval (Block 2) |
| 21 | product-project-management | ✅ | DECLARED | domain-rubric + tests scaffold | no independent eval RUN | L2 LLM-graded PRD/prioritization eval (Block 2) |
| 22 | business-strategy-operations | ✅ | DECLARED | domain-rubric + tests scaffold | no independent eval RUN | L2 LLM-graded strategy eval (Block 2) |
| 23 | sales-revenue-growth | ✅ | DECLARED | domain-rubric + tests scaffold | no independent eval RUN | L2 LLM-graded funnel/pricing eval (Block 2) |
| 24 | marketing-brand | ✅ | DECLARED | domain-rubric + tests scaffold | no independent eval RUN | L2 LLM-graded positioning eval (Block 2) |
| 25 | finance-unit-economics | ✅ | DECLARED | domain-rubric + tests scaffold; number-tracing discipline | no independent model-eval RUN | L2 LLM-graded model/valuation eval (Block 2) |
| 26 | economics-market-design | ✅ | DECLARED | domain-rubric + tests scaffold | no independent eval RUN | L2 LLM-graded mechanism/pricing eval (Block 2) |
| 27 | legal-compliance-contracts | ✅ | DECLARED | UPL gate + domain-rubric + tests scaffold | no independent eval RUN (incl. UPL boundary cases) | L2 LLM-graded eval + UPL-boundary cases (Block 2) |
| 28 | people-org-leadership | ✅ | DECLARED | HR/legal hard gate + domain-rubric + tests scaffold | no independent eval RUN (incl. gate cases) | L2 LLM-graded eval + HR/legal-gate cases (Block 2) |
| 29 | communication-writing-negotiation | ✅ | DECLARED | domain-rubric + tests scaffold | no independent eval RUN | L2 LLM-graded writing/negotiation eval (Block 2) |
| 30 | teaching-mentoring-knowledge-transfer | ✅ | DECLARED | domain-rubric + tests scaffold | no independent eval RUN | L2 LLM-graded curriculum/coaching eval (Block 2) |
| 31 | research-knowledge-synthesis | ✅ | DECLARED | #1 source gate + domain-rubric + tests scaffold | no independent eval RUN (incl. fabrication red-team) | L2 LLM-graded eval + fabrication red-team (Block 2) |
| 32 | operating-data-roles | ✅ | DECLARED | domain-rubric + tests scaffold | no independent routing-eval RUN | L2 LLM-graded routing/RACI eval (Block 2) |

## Roll-up / Ամփոփում
- **32/32 skills have a complete `PRODUCTION_CONTRACT.md`.**
- **PROVEN: 2** (frontend-ux-product-design = UISLICE-001, software-systems-architecture = CODESLICE-001).
- **DECLARED: 30** (all honestly labeled; none inflated to PROVEN).
- **Universal Core = PROVEN** (2-adapter extraction, UISLICE-001 + CODESLICE-001) — the shared engine under all Code-family / UI-family "next proof slice" entries.
- Path to PROVEN for the 30: either **reuse a proven adapter** (Code-family, UI-family) on a domain slice, or **run the L2/L4 LLM-graded eval harness** (Block 2) — never by the mere existence of the contract file (L18).
