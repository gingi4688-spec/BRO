# GAAhex — AI/ML Surface Audit (sealed per L8) / AI/ML մակերեսների աուդիտ

> EN: Sealed to the GAAhex work only. Never cross-referenced into another work.
> HY: Կնքված միայն GAAhex work-ին։ Երբեք cross-reference ուրիշ work-ի մեջ։
> Audit done 2026-06-15 on Gev's directive: "ML — audit first, characterize every surface
> real/heuristic/stub/fantasy (OLT-driver discipline), no make-real or new-build until
> characterized, keep it a SEPARATE track from Ph4–6." Logged: GAAhex/docs/governance/DECISIONS.md.

---

## Verdict in one line
**Zero trained ML models. Zero fantasy. The "AI" is 1 honest heuristic + a real, dormant
LLM gateway (stub-by-default → real the moment a key is dropped in .env).** The architecture
is genuinely good — provider-agnostic, fail-soft, LLM kept out of the write path, permission-gated,
scoped, and honestly self-labeled in the UI. This is "dormant-but-real-shaped," not fake-it code.

## Surface-by-surface characterization

| # | Surface | Code | Reality | Verdict |
|---|---------|------|---------|---------|
| 1 | **Lead scoring** | `backend/app/ai.py:145` `score_lead()` · `/api/ai/score-lead` · `frontend/.../modals/AiAssistModal.tsx` | Pure rule-based weighted sum: phone +30, email +25, name +10, source map, status map → `{score 0-100, band hot/warm/cold, reasons[]}`. No model, no training, no external call. Always on. | **HEURISTIC** (transparent, deterministic). UI honestly says "deterministic heuristic from the lead's fields." |
| 2 | **Summarize record** | `ai.py:179` `summarize_record()` · `/api/ai/summarize` | Builds a prompt, routes through `complete()`. No provider → `_deterministic_stub` (extractive "- key: value" fact-line concat). Key set → real LLM. Same caller either way. | **HYBRID: STUB-by-default → REAL-when-keyed.** |
| 3 | **Ask GAAhex** | `ai.py:200` `ask_assistant()` · `/api/ai/ask` · `frontend/.../views/AskGaaexView.tsx` | Grounded Q&A over live SCOPED business context (reuses `analytics.overview`, same perms/scope). No provider → extractive readout. Key → real answer. | **HYBRID: STUB→REAL.** UI labels "Built-in (no external AI configured)" vs "Live · {provider}". |
| 4 | **Agent planner / act** | `ai.py:247` `plan_chat()` · `/api/ai/chat` + `/api/ai/act` | Propose→confirm→execute. No provider → ALWAYS answers (never proposes, read-only). Key → model proposes ONE structured JSON action (create_lead / move_lead ONLY), server **re-validates against allowlist** + executes via the SAME records engine (scoped + audited, no special privilege). LLM is fully out of the write path. | **HYBRID: read-only STUB → REAL-agent-when-keyed.** Safe-by-design. |
| 5 | **Provider gateway** | `ai.py:103` `configure_ai()` + `ai.py:123` `complete()` | Registry: openai/gemini/groq (OpenAI-compatible wire) + anthropic. Activated only when `AI_PROVIDER`+`AI_API_KEY` in gitignored `.env`; default `none`. Fail-soft: any provider error → deterministic stub. Mirrors channel-adapter discipline. | **REAL plumbing, dormant by default.** Production-grade adapter. |

## NOT ML — don't let the names fool you
- **Churn** (`scripts/seed_churn_data.py`, `routers/analytics.py` weekly-trend / net-growth): real SQL aggregation over `Subscription` + append-only `Event` rows. Counts PAST cancellations. No prediction/propensity model. → **DETERMINISTIC ANALYTICS** (correctly named).
- **Revenue Assurance "anomaly"** (`services/revenue_assurance.py`, 283 ln): pure rule-based reconciliation — active Service w/o active Subscription; active Subscription not invoiced this cycle. "anomaly" = a leakage finding, not anomaly-detection ML. → **DETERMINISTIC RULES.**

## Fantasy check → NONE
Swept frontend for `ai-powered|machine-learning|ml|predict|forecast|smart|recommend|neural|propensity|gpt|llm`
→ zero false marketing claims (all hits were order-fulfillment "pipeline" wording). Every AI surface
self-labels honestly. UI never claims intelligence it doesn't have. (L7-honest, by design.)

## Test coverage
`tests/test_ai.py` (90 ln) + `tests/test_ai_agent.py` (86 ln) exist.

## Cross-track breadcrumb (NOT an ML issue — for the Ph6 page tracer)
`AiAssistModal.tsx` still uses legacy CSS classes (`pill pill-danger`, `ai-result`, `ai-score`,
`muted`) instead of `--gx-*` tokens / gx- components → a §2/§3 conformance gap to fix when the
page-by-page tracer reaches it. Logged here so it isn't lost; do NOT fix on the ML track.

## My recommendation (delivered to Gev, awaiting his call — NOT yet executed)
1. **Highest leverage, ~zero cost/risk: flip on a free-tier provider** (e.g. Gemini free tier) by
   dropping a key in `backend/.env`. Capabilities 2/3/4 go stub→real with ZERO code change, fully
   reversible, still scoped+audited+permission-gated+fail-soft.
2. **Keep the lead-scorer heuristic as-is.** For an ISP CRM, transparent > black-box, and there's no
   labeled conversion-outcome volume to train on. Later option: data-tune the weights from real
   conversion outcomes — still rule-based, just informed.
3. **Do NOT build new ML now** (churn-risk model, anomaly-detection). The deterministic versions are
   correct + sufficient; real ML needs data volume + MLOps we have no current reason to take on.

**State:** audit COMPLETE + characterized + logged. Make-real / new-build is GATED on Gev's decision
(his rule). Separate track from Ph4 (shell+nav+gx-Modal) · Ph5 (global search) · Ph6 (page tracer).
