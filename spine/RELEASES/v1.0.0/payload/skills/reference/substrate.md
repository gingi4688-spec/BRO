# Substrate snapshot — Bro's runtime / Bro-ի runtime-ի substrate snapshot

> Filled from `skills/ai-agent-engineering/output-templates.md` Template 4, per `patterns.md` #7 (verify-before-use). Volatile facts — re-verify on any model change, and otherwise on a regular cadence. Facts here are taken from a **dated source**, never asserted from memory; anything without a source is marked **verify-before-use**.

## English

- **Snapshot date / verified by:** 2026-06-26 · source-of-truth = the **session environment / system context** the Claude Code harness reports at runtime (the most authoritative source for "what model am I on right now").
- **Model:** Opus 4.8 — **model id `claude-opus-4-8`** (the running variant this session is the 1M-context build, exact id `claude-opus-4-8[1m]`). Source: session environment, checked 2026-06-26.
- **Context window:** 1M (~1,000,000 tokens). Source: session environment ("Opus 4.8 (1M context)"), 2026-06-26.
- **Knowledge cutoff:** January 2026. Source: session environment, 2026-06-26.
- **Tool calling:** supported — **verified by direct observation** (this session is actively making tool calls). Structured/JSON output is available in this harness (observed via the Workflow `schema` mechanism); the exact API surface is verify-before-use.
- **Runtime:** Claude Code (CLI / desktop / web / IDE extension); this session runs inside the VSCode extension on win32. Source: session environment, 2026-06-26.
- **Sibling model ids (for model selection / roster builds):** Fable 5 = `claude-fable-5` · Sonnet 4.6 = `claude-sonnet-4-6` · Haiku 4.5 = `claude-haiku-4-5-20251001`. Source: session environment, 2026-06-26.

### Verify-before-use (no dated source held — do NOT assert from memory)

- **Pricing (in / out per Mtok):** unknown here → verify against the current provider pricing page before any cost estimate.
- **Rate limits (rpm / tpm / concurrency):** account-specific → verify per account. Operational note: heavy concurrent fan-out has hit this account's limit before (reset-gated, not money) — cap parallel specialists and pace batches.
- **Max output tokens / per-response limits:** verify against current API docs before relying on a number.
- **Caching / batch / vision specifics:** verify before relying on them for a build.

### Staleness rule

Re-verify the whole snapshot on any model change, and otherwise treat any field older than ~one quarter as verify-before-use. When this snapshot informs an agent spec (especially a roster build), attach it with its date so the substrate travels as dated evidence, not a guess.

## Հայերեն

- **Snapshot-ի ամսաթիվ / verified by․** 2026-06-26 · source-of-truth = **session environment / system context**-ը, որ Claude Code harness-ը report է անում runtime-ին (ամենահեղինակավոր աղբյուրը՝ «ո՞ր model-ի վրա եմ հենց հիմա»)։
- **Model․** Opus 4.8 — **model id `claude-opus-4-8`** (այս session-ի աշխատող variant-ը 1M-context build-ն է, ճշգրիտ id `claude-opus-4-8[1m]`)։ Source՝ session environment, ստուգված 2026-06-26։
- **Context window․** 1M (~1,000,000 token)։ Source՝ session environment («Opus 4.8 (1M context)»), 2026-06-26։
- **Knowledge cutoff․** January 2026։ Source՝ session environment, 2026-06-26։
- **Tool calling․** support-վում է — **ստուգված ուղիղ դիտմամբ** (այս session-ն ակտիվ tool call է անում)։ Structured/JSON output-ը հասանելի է այս harness-ում (դիտված Workflow `schema` մեխանիզմով). ճշգրիտ API surface-ը՝ verify-before-use։
- **Runtime․** Claude Code (CLI / desktop / web / IDE extension). այս session-ը գործում է VSCode extension-ի մեջ՝ win32-ի վրա։ Source՝ session environment, 2026-06-26։
- **Sibling model id-ներ (model selection / roster build-ի համար)․** Fable 5 = `claude-fable-5` · Sonnet 4.6 = `claude-sonnet-4-6` · Haiku 4.5 = `claude-haiku-4-5-20251001`։ Source՝ session environment, 2026-06-26։

### Verify-before-use (dated source չունեմ — հիշողությունից ՄԻ՛ պնդիր)

- **Pricing (in / out per Mtok)․** այստեղ անհայտ → ստուգիր provider-ի ընթացիկ pricing page-ի դեմ ցանկացած cost-գնահատականից առաջ։
- **Rate limit-ներ (rpm / tpm / concurrency)․** account-specific → ստուգիր ըստ account-ի։ Operational note․ ծանր concurrent fan-out-ն այս account-ի limit-ին առաջ կպել է (reset-gated, ոչ փող) — cap արա parallel specialist-ները ու pace արա batch-երը։
- **Max output token / per-response limit-ներ․** ստուգիր ընթացիկ API docs-ի դեմ նախքան թվի վրա հենվելը։
- **Caching / batch / vision specifics․** ստուգիր նախքան build-ի համար դրանց վրա հենվելը։

### Հնության կանոն

Վերստուգիր ամբողջ snapshot-ը ցանկացած model-ի փոփոխությամբ, և այլապես ~մեկ եռամսյակից հին ցանկացած field համարիր verify-before-use։ Երբ այս snapshot-ը սնում է agent spec (հատկապես roster build), կցիր այն իր ամսաթվով, որ substrate-ը dated evidence-ով ճանապարհորդի, ոչ գուշակությամբ։
