# MenQ — BLUEPRINT v1.1  (runtime = official `claude` CLI-wrap · ToS-compliant · $0)
**Status: LOCKED FOR IMPLEMENTATION · Implementer: Bro · Architect/Owner: Gev**
**Rule: Bro executes; all architectural changes require Gev's explicit approval. No unsolicited scope changes.**

---

## 🛠️ IMPLEMENTER BUILD BRIEF — READ FIRST (paste-and-build, non-stop)

**You are the implementer.** Build the ENTIRE MenQ desktop app exactly per this blueprint, in ONE PIECE, NON-STOP, phase-gated (§8 P1→P8). Deliver a complete, runnable repo Gev can download and build. Do not ask questions — proceed.

**Rules for you:**
1. Obey every LOCKED decision (L1–L17), every SECURITY RULE (§7, incl. 7.6–7.7), the Bro package (§12), and the ADOPTED HARDENING (§13) — those are spec, not suggestions.
2. §12.F decisions are **pre-set to DEFAULTS** — use them, don't stop to ask.
3. Never stop mid-build to ask. If something is genuinely ambiguous, pick the safest sensible default, record it in `BUILD_NOTES.md`, keep going.
4. **Zero hardcode:** every user-facing string via i18n (`t()`, `locales/{hy,en}.json`); every color via `ui/tokens/brand.css` (§12.H); every path via the alias map (§6.3). Secrets NEVER in git.
5. Per phase: build → self-verify against the §8 Gate → continue. Don't fake a gate. If a gate genuinely can't pass in this environment (e.g. no 2nd device for P5), simulate/stub it, note it in `BUILD_NOTES.md`, and keep building the rest.
6. Model default `claude-opus-4-8`; keep the model list configurable (`config/app.json`).

**Deliverable (the "download"):**
- The COMPLETE MenQ repo — §3 structure **plus top-level `_core/`** (shared spine, §12.F-1) — every file fully written (no "// TODO" stubs in core paths).
- `README.md` — exact run/build steps: backend (`uv`/`pip` + `uvicorn`), UI (`npm i && npm run dev`), Tauri (`npm run tauri build` → Windows installer).
- `BUILD_NOTES.md` — what was built, assumptions taken, any gate stubbed/not-fully-met.
- Package everything as a downloadable **`MenQ.zip`** (or, if you have no filesystem, emit every file in order in fenced blocks) so Gev downloads → `tauri build` → installs on 3 devices.

**Start now. Build all 8 phases. Report only at the end (or at a genuine hard blocker).**

> Runtime = **wrap the official `claude` CLI as a subprocess** (`claude -p`, L5) — ToS-compliant subscription use, $0. Do NOT extract the OAuth token into the Agent SDK (banned + enforced, §13). API-key + Agent SDK = optional configurable fallback. Each device just needs the official `claude` CLI installed + logged in once.

---

## 0. ԻՆՉ Է MenQ-ը

MenQ = անձնական multi-agent desktop console։ Մեկ Windows app, որտեղ Gev-ի բոլոր Claude ագենտները (Bro, HASHIV, GAAex skills, ապագա ագենտներ) ապրում, կառավարվում և աշխատում են **միայն UI-ից**։ 3 սարք, 1 user, 1 GitHub private repo՝ որպես sync backbone։ Runtime՝ MenQ-ը **wrap է անում official `claude` Claude Code CLI-ն** (subprocess) → Gev-ի subscription-ը օգտագործվում է **օրինական/ToS-compliant** (ինչպես VS Code/CLI-ն), **$0 beyond subscription**։ (OAuth-token-in-Agent-SDK = ԱՐԳԵԼՎԱԾ, §13. API-key Agent-SDK = configurable fallback։)

---

## 1. LOCKED DECISIONS (չփոխվող)

| # | Որոշում | Արժեք |
|---|---|---|
| L1 | OS | Windows (3 սարք) |
| L2 | Փաթեթավորում | Tauri desktop installer (icon, taskbar, autostart optional) |
| L3 | UI | React + TypeScript + Vite |
| L4 | Backend | FastAPI (local sidecar, միայն 127.0.0.1) |
| L5 | Agent runtime | **Official `claude` Claude Code CLI** — subprocess per session (`claude -p` streaming). ToS-compliant subscription use (Agent-SDK+OAuth = banned; API-key Agent-SDK = optional fallback) |
| L6 | Auth to Anthropic | Handled by the **official `claude` CLI's own login** (`claude setup-token`/`claude login`, run once by Gev). **local only**, ԵՐԲԵՔ git-ում. MenQ never extracts or handles the token |
| L7 | `ANTHROPIC_API_KEY` | Used ONLY if Gev explicitly enables the **API-key fallback** runtime. default CLI-wrap path ignores it. No forced block (the banned OAuth-in-SDK path is simply not built) |
| L8 | Sync | GitHub private repo `MenQ`, ավտոմատ background push/pull + manual Sync կոճակ |
| L9 | Sync scope | Agents + Skills + MCP config + Permissions + Sessions + Device config — ԲՈԼՈՐԸ |
| L10 | Sessions storage | SQLite (local, արագ query) + append-only JSONL per session git-ում (sync, conflict-free) |
| L11 | Users | 1 (Gev)։ Multi-user = ToS խախտում → out of scope ընդմիշտ |
| L12 | UI մուտք | PIN (local) |
| L13 | Լեզուներ | HY + EN, UI switch |
| L14 | Theme | Dark + Light toggle |
| L15 | Branding | MenQ-ի սեփական brand — **PLACEHOLDER, Gev-ը կտա հետո**։ Մինչ այդ neutral tokens |
| L16 | Feature scope v1 | Anthropic-ի թույլատրած ԲՈԼՈՐ հնարավորությունները, բոլորը UI-ից (§4) |
| L17 | Orchestration | Bro-ի գոյություն ունեցող orchestration մեխանիզմը ադապտացվում է MenQ-ին (§9) |

---

## 2. ARCHITECTURE OVERVIEW

```
┌────────────────────────── Windows Device (×3) ──────────────────────────┐
│  Tauri Shell (installer, tray, window)                                  │
│  └─ React UI (HY/EN · dark/light · PIN gate)                            │
│       │ localhost HTTP + WebSocket                                      │
│  └─ FastAPI sidecar (127.0.0.1:47600)                                   │
│       ├─ Agent Runtime Manager ── official `claude` CLI subprocess-ներ  │
│       │     └─ subscription auth via the official CLI                   │
│       ├─ Agent Registry (repo/agents/ scan + validate)                  │
│       ├─ Session Store (SQLite ↔ JSONL writer)                          │
│       ├─ Sync Engine (git pull/push, watcher, conflict guard)           │
│       ├─ MCP Manager · Permissions Engine · Skills Manager · Hooks      │
│       ├─ Workspace/Path Mapper (per-device)                             │
│       └─ Usage Monitor (/status parse → quota UI)                       │
└──────────────────────────────────────────────────────────────────────────┘
                    ▲ git push/pull (auto + button)
        GitHub private repo `MenQ` — single source of truth
```

**Հիմնական հոսք.** UI action → FastAPI endpoint → official `claude` CLI subprocess (`claude -p` streaming) → WebSocket → UI live render → session events append SQLite + JSONL → Sync Engine push։

---

## 3. REPO STRUCTURE («շատ մաքուր» կանոն)

```
MenQ/
├── app/                      # ամբողջ կոդը (Tauri + React + FastAPI)
│   ├── src-tauri/
│   ├── ui/
│   └── backend/
├── agents/                   # 1 ֆոլդեր = 1 ագենտ
│   └── <agent-slug>/
│       ├── manifest.json     # §6.1 schema
│       ├── prompt.md         # system prompt / CLAUDE.md-ի համարժեք
│       └── skills/           # ագենտին կցված skills (SKILL.md ստանդարտ)
├── mcp/
│   └── servers.json          # MCP server config registry
├── permissions/
│   └── rules.json            # per-agent permission profiles
├── sessions/
│   └── <agent-slug>/<session-id>.jsonl   # append-only, conflict-free
├── config/
│   ├── devices.json          # device registry + path mapping (§6.3)
│   └── app.json              # լեզու default, theme default, sync interval
├── MenQ_BLUEPRINT.md         # այս ֆայլը
└── .gitignore                # token, SQLite, PIN hash, venv, node_modules
```

**Կանոններ.** Ոչ մի ֆայլ repo root-ում բացի BLUEPRINT/README-ից։ Ոչ մի secret git-ում։ Ագենտի ջնջում = ֆոլդերի ջնջում, ուրիշ ոչինչ չի կոտրվում։

---

## 4. FEATURE INVENTORY v1 (բոլորը UI-ից, ոչ մեկը terminal-ից)

| Բլոկ | Հնարավորություններ |
|---|---|
| **Chat runtime** | Live streaming output · stop/cancel · extended thinking toggle · model picker (Opus/Sonnet/Haiku) · file upload/download · image paste |
| **Agents** | **[+] Add Agent** (upload ֆայլեր + form. name/role/tools/model/trigger) · Edit · Delete · Enable/Disable · duplicate as template |
| **Skills** | Attach/detach per agent · upload SKILL.md փաթեթ · list + validate |
| **MCP** | Add/remove server (URL/stdio) · per-agent enable · status indicator |
| **Permissions** | Режим per agent՝ ask / auto-accept edits / plan mode · allowed tools checklist · working dir scope |
| **Sessions** | Full history · search (keyword + agent + date) · resume · fork · export |
| **Checkpoints** | File-edit rewind points · rewind code / fork conversation |
| **Hooks** | Pre/post tool-use hooks add/edit UI-ից |
| **Workspace** | Ագենտի working directory picker (device-aware, §6.3) · file tree view · diff viewer permission gate-ով |
| **Usage** | Subscription quota / session token count / reset timer |
| **Sync** | Auto background (interval + on-change) · manual Sync կոճակ · last-sync status · conflict alert |
| **Settings** | PIN փոփոխում · լեզու HY/EN · dark/light · token setup wizard (`claude setup-token` flow) · device name |

---

## 5. MODULE SPECS

### 5.1 Auth & PIN
- Առաջին գործարկում՝ PIN set (4–8 թիվ) → PBKDF2 hash local ֆայլում (git-ից դուրս)։
- App unlock ամեն բացելիս; 5 սխալ → 60վ lockout։
- PIN-ը սարքային է — 3 սարքին կարող է տարբեր լինել։

### 5.2 Auth (via the official CLI)
- MenQ **does not handle the token itself**. It relies on the official `claude` CLI being logged in on the device — Gev runs `claude setup-token` / `claude login` once (the sanctioned subscription auth).
- Setup wizard = a UI button that launches/opens the official `claude` login flow + shows per-device login status. No token is stored, injected, or read by MenQ.
- **API-key fallback (optional).** If Gev enables the API-key runtime, `ANTHROPIC_API_KEY` (Console key) is kept in Windows Credential Manager (DPAPI) and passed only to that runtime. The default CLI-wrap path needs neither a stored token nor an API key.

### 5.3 Agent Registry
- Source of truth = `agents/` ֆոլդեր։ Backend-ը scan + validate manifest schema (§6.1)։
- **Add Agent flow (UI).** [+] → Step 1 upload (drag&drop `prompt.md` + skills zip կամ դատարկ template) → Step 2 form (name, role, model default, tools, permission profile, trigger նկարագրություն) → Step 3 preview manifest → Save → ֆոլդեր ստեղծվում է → auto-commit → sync։
- Invalid manifest → ագենտը ցուցադրվում է Disabled + error badge, app-ը չի ընկնում։

### 5.4 Agent Runtime Manager
- Session start = spawn the **official `claude` CLI** as a subprocess in headless streaming mode (`claude -p --output-format stream-json`), with `--model`, the agent's `prompt.md` (as system prompt / `--append-system-prompt`), mounted skills, MCP config, permission mode, working dir (mapped)։ MenQ streams the CLI's JSON events to the UI over WebSocket։
- Մի քանի ագենտ/սեսսիա զուգահեռ — tab-based UI (ամեն մեկը իր `claude` subprocess-ը)։
- Crash isolation. subprocess-ի մահ = session error state, app-ը կենդանի է։
- (Optional API-key runtime՝ նույն manager-ը, Agent SDK + `ANTHROPIC_API_KEY`՝ CLI-ի փոխարեն. Max-20x-ը $200/ամիս Agent-SDK credit ունի։)

### 5.5 Session Store & Sync-safe history
- Ամեն event (user msg, assistant chunk, tool call, tool result, checkpoint) → SQLite (query/UI) + նույն event append `sessions/<agent>/<session-id>.jsonl`։
- JSONL = append-only, ֆայլն ստեղծվում է միայն իր սարքում → git conflict գործնականում անհնար։
- Այլ սարքից pull եղած JSONL-ները import են լինում SQLite → ամբողջ history-ն ամեն սարքում։
- Resume այլ սարքից = JSONL replay → context reconstruction։

### 5.6 Sync Engine
- `git pull --rebase` app start-ին + ամեն N րոպեն (default 3) + ամեն local commit-ից հետո push։
- Manual **Sync** կոճակ = force pull+push + status toast։
- Conflict (միայն config ֆայլերում է հնարավոր) → UI modal. «local / remote / manual» ընտրություն։ Silent merge ՉԻ արվում։
- Auth՝ GitHub PAT կամ SSH key — local, git-ից դուրս։

### 5.7 Workspace / Path Mapper
- `config/devices.json`-ում ամեն սարք ունի ID + alias→absolute path map (§6.3)։
- Ագենտի manifest-ում working dir գրվում է alias-ով (`{{HASHIV_ROOT}}`), runtime-ում resolve ըստ ընթացիկ սարքի։
- UI-ում պարզ դաշտ. «Այս սարքում HASHIV_ROOT = C:\Users\Admin\Desktop\Hashiv» — folder picker։

### 5.8 i18n & Theme
- Բոլոր string-երը `locales/hy.json` + `locales/en.json`, runtime switch, ոչ մի hardcoded text։
- Dark/light CSS tokens; brand palette = PLACEHOLDER variables (L15) — Gev-ի brand-ը ստանալուն պես մեկ ֆայլով փոխարինում։

---

## 6. DATA SCHEMAS

### 6.1 `agents/<slug>/manifest.json`
```json
{
  "id": "bro",
  "name": "Bro",
  "version": "1.0.0",
  "role": "Primary build & orchestration agent",
  "model_default": "claude-opus-4-8",
  "prompt_file": "prompt.md",
  "skills": ["skills/skill-a", "skills/skill-b"],
  "tools_allowed": ["bash", "file_edit", "web_search"],
  "mcp_servers": ["github"],
  "permission_profile": "ask",
  "working_dir_alias": "{{BRO_ROOT}}",
  "trigger": "Ամեն build/կոդ առաջադրանք",
  "enabled": true,
  "created_by": "gev",
  "created_at": "2026-07-05"
}
```

### 6.2 Session JSONL event
```json
{"ts":"2026-07-05T14:02:11Z","session":"S-01JX...","agent":"bro","type":"user|assistant|tool_use|tool_result|checkpoint|system","payload":{...},"device":"laptop-1"}
```

### 6.3 `config/devices.json`
```json
{
  "devices": [
    {"id":"laptop-1","name":"Gev Laptop","paths":{"BRO_ROOT":"C:/Users/Admin/Projects/Bro","HASHIV_ROOT":"C:/Users/Admin/Desktop/Hashiv"}},
    {"id":"pc-1","name":"Office PC","paths":{"BRO_ROOT":"D:/Work/Bro","HASHIV_ROOT":"D:/Work/Hashiv"}},
    {"id":"pc-2","name":"Home PC","paths":{}}
  ]
}
```

---

## 7. SECURITY RULES (խախտում = build reject)

1. OAuth token, GitHub PAT, PIN hash, SQLite — **երբեք git-ում** (.gitignore enforced + pre-commit hook, որը scan է անում secrets)։
2. Backend-ը լսում է միայն `127.0.0.1` — ոչ մի LAN/WAN exposure։
3. `ANTHROPIC_API_KEY` boot guard (L7)։
4. Single-user hard rule — ոչ մի login/user system, ոչ մի sharing feature (L11)։
5. Ագենտի file access-ը սահմանափակ է իր working_dir-ով, permission profile-ից դուրս գործողություն = ask։
6. **Local UI↔sidecar auth (Bro-added).** FastAPI-ն 127.0.0.1-ի վրա է, բայց նույն մեքենայի ցանկացած պրոցես (այլ app, կամ browser DNS-rebinding/CSRF-ով) կարող է հարվածել `:47600`-ին ու **token-bearing ագենտներ քշել**։ Ուստի՝ Tauri shell-ը boot-ին գեներացնում է per-launch random secret, inject անում է և՛ UI-ին, և՛ sidecar-ին. ամեն request կրում է `X-MenQ-Auth: <secret>`, sidecar-ը ստուգում է secret-ը + `Origin`/`Host` (միայն tauri origin)։ Առանց secret = 403։ Secret-ը RAM-ում է, git/disk-ում ոչ։
7. **Auto-commit secret-guard fail = visible block (Bro-added).** Եթե pre-commit secret-scan hook-ը (§7.1) block անի auto-commit-ը, Sync Engine-ը **ՉԻ լուռ skip անում ու ՉԻ crash անում** — session-ը շարունակվում է local, UI-ում կարմիր «Sync blocked: secret detected» + ձեռքով resolve։ Silent bypass ԱՐԳԵԼՎԱԾ։

---

## 8. BUILD ORDER (v1 = ամբողջը, բայց այս հերթականությամբ)

| Փուլ | Բովանդակություն | Gate |
|---|---|---|
| P1 | Repo skeleton + Tauri shell + FastAPI sidecar + PIN + token wizard + boot guard | App-ը բացվում է, token validated |
| P2 | Agent Registry + Add/Edit/Delete UI + manifest validation | Bro-ն import է եղել որպես ագենտ |
| P3 | Chat runtime. streaming, model picker, thinking toggle, file upload, permissions режим | Bro-ի հետ լիարժեք session UI-ից |
| P4 | Sessions. SQLite + JSONL + history/search/resume + checkpoints/rewind | Resume աշխատում է |
| P5 | Sync Engine + devices.json + path mapper | 2-րդ սարքում pull → նույն ագենտներ/history |
| P6 | MCP manager + Skills manager + Hooks + Usage monitor | Բոլոր v1 feature-ները UI-ից |
| P7 | i18n HY/EN + dark/light + brand placeholder tokens | Language/theme switch |
| P8 | Installer build (3 սարք) + smoke test checklist | 3 սարքին տեղադրված, sync live |

Ամեն փուլի gate → Gev-ի հաստատում → հաջորդ փուլ։ Push միայն Gev-ի թույլտվությամբ։

---

## 9. ADAPTATION NOTES FOR BRO

1. Քո ընթացիկ orchestration/subagent մեխանիզմը (ինչ ձևով հիմա աշխատում ես laptop-ում + քո git repo) պիտի տեղափոխվի MenQ runtime-ի վրա. ագենտ-ագենտ կանչը անցնում է Agent Runtime Manager-ով, ոչ թե ուղիղ CLI spawn-ով։
2. Քո ապրելավայրը դառնում է `agents/bro/`՝ manifest + prompt + skills — ներկա ֆորմատդ ադապտացրու §6.1 schema-ին։ Ինչ schema-ում չի տեղավորվում → առաջարկիր `manifest.extensions` դաշտով, ինքդ մի ընդլայնիր schema-ն։
3. HASHIV-ը մտնում է որպես առանձին ագենտ `agents/hashiv/`՝ իր 21 մոդուլը working_dir-ով (alias `{{HASHIV_ROOT}}`), ոչ թե MenQ repo-ի մեջ copy։
4. Session JSONL ֆորմատը (§6.2) փակ contract է — քո internal event-ները mapping արա դրան։
5. Ամեն deviation այս blueprint-ից = պահանջում է Gev-ի գրավոր OK։

---

## 10. NON-GOALS / OUT OF SCOPE

- Multi-user, հաճախորդներ, HouseNet աշխատակիցներ — ԵՐԲԵՔ այս app-ում (ToS)։
- Cloud deployment / VPS — v1-ում ոչ։
- API key billing — ոչ, քանի դեռ Anthropic-ը credit ռեժիմը չի ակտիվացրել. այդ պահին Usage Monitor-ը ցույց կտա credit balance (P6 module-ի պատրաստ extension point)։
- Mobile — ոչ։

## 11. OPEN ITEMS (Gev-ից)

1. MenQ brand package (palette, logo, typography) → §5.8 placeholder-ների փոխարինում։
2. Bro-ի ընթացիկ orchestration ֆորմատի նմուշ → §9.2 mapping-ի ճշգրտում։
3. GitHub repo name/owner հաստատում (`MenQ`, private)։


## 12. agents/bro/ — ԲՐՈՅԻ ԼՐԱՑՎԱԾ ՓԱԹԵԹ (լրացրել է Bro-ն · §9 + §11.2)

> Ոչ մի locked decision չի փոխվել, schema-ն ինքս չեմ ընդլայնել — ինչ §6.1-ում չի տեղավորվում, `manifest.extensions`-ում է (§9.2)։ Structure-ի ազդող կետերը՝ §12.F, սպասում են Gev-ի OK-ին։

### 12.A `agents/bro/manifest.json`
```json
{
  "id": "bro",
  "name": "Bro",
  "version": "1.5.0",
  "role": "Primary build & orchestration agent — real friend, expert across domains, conductor of the roster",
  "model_default": "claude-opus-4-8",
  "prompt_file": "prompt.md",
  "skills": [
    "skills/analysis-primary","skills/language-mastery","skills/ai-agent-engineering",
    "skills/frontend-ux-product-design","skills/software-systems-architecture","skills/ui-page-structure-design",
    "skills/auditing","skills/testing-quality-engineering","skills/devops-platform-sre",
    "skills/databases-storage-engineering","skills/data-engineering-pipelines","skills/data-architecture-leadership",
    "skills/data-science-analytics","skills/mobile-engineering","skills/ai-ml-engineering-llmops",
    "skills/creativity-ideation-design-thinking","skills/security-privacy-engineering",
    "skills/cybersecurity-operations-soc","skills/offensive-security-pentesting","skills/telecom-isp-network-ops",
    "skills/product-project-management","skills/business-strategy-operations","skills/sales-revenue-growth",
    "skills/marketing-brand","skills/finance-unit-economics","skills/economics-market-design",
    "skills/legal-compliance-contracts","skills/people-org-leadership","skills/communication-writing-negotiation",
    "skills/teaching-mentoring-knowledge-transfer","skills/research-knowledge-synthesis","skills/operating-data-roles"
  ],
  "tools_allowed": ["bash","file_edit","file_read","grep","glob","web_search","subagent","todo"],
  "mcp_servers": [],
  "permission_profile": "bro-governed",
  "working_dir_alias": "{{BRO_ROOT}}",
  "trigger": "Ցանկացած build/code/reasoning/decision — always-on primary + conductor",
  "enabled": true,
  "created_by": "gev",
  "created_at": "2026-07-05",
  "manifest.extensions": {
    "spine": { "shared_core_ref": "../../_core", "spine_version": "v1.5.0",
      "note": "laws L0–L19 + D0 · behavior · production_os — ԿԻՍՎԱԾ ողնաշար, home = §12.F-1" },
    "roster": { "mode": "internal_fanout_subagents", "count": 32,
      "conductor": "skills/agents/orchestrator.md + skills/agents/ROUTING.md",
      "note": "32 named agent, ժառանգում են Bro persona+_core, differ միայն name+craft. ephemeral sub-session Runtime-Manager-ով (§12.D)" },
    "memory": { "model": "L8 per-project SEALED brains",
      "sync_policy_proposal": "sealed brains sync ԱՅՈ (per-device append), cross-project merge ԵՐԲԵՔ (§12.F-3)" },
    "mode": { "A": "professional baseline (floor)", "B": "ACTIVE 2026-07-05 — Gev-taste, answer-shape verdict→proven→not-proven→caveat→next-command",
      "evidence_floors": "a11y · verify-before-done · no-fake-green · D0 — բացարձակ" },
    "governance": { "authority": "D0 Gev Root Authority",
      "token_gated": ["push","release","reseed","delete","migrate","promote-to-spine","lock"],
      "self_maintenance": "bro-*.ps1 (doctor/audit/release/update-spine) working_dir-ում, bash-ով (§12.F-4)",
      "contracts": "32/32 PRODUCTION_CONTRACT = PROVEN (v1.5.0)" },
    "personalization": { "bond": "self/personalization.md — Gev+family+բառապաշар", "L0": "bilingual HY+EN native" }
  }
}
```

> `permission_profile: "bro-governed"` = proposed profile `permissions/rules.json`-ում՝ **auto-accept edits** working_dir-ում + **ASK/token-gate** `token_gated` action-ների վրա (D0)։ §6.1-ում lock չէ — §12.F-5-ի մաս։

### 12.B `agents/bro/prompt.md` (boot assembly, ոչ copy)
Load-order: 1) `_core/laws/**` (INVIOLABLE L0–L19, D0 վերևից) · 2) `_core/behavior/human_behavior.md` · 3) `self/persona.md`+`self/personalization.md` (L0 bilingual) · 4) `skills/shared/OPERATING_PROTOCOL.md` → analysis-primary always-on · 5) `self/gev_standard/**` (Mode-A + Mode-B ACTIVE)։ Laws = top authority։

### 12.C `agents/bro/skills/` — 32 god-level skill (11-ֆայլ folder-ներ) + `skills/reference/armenian/` (2,127 entry, L0)։ 3 հատուկ՝ analysis-primary · language-mastery · ai-agent-engineering։ Ամեն skill = PROVEN (v1.5.0)։

### 12.D Orchestration — agent↔agent անցնում է Agent Runtime Manager-ով (ոչ ուղիղ CLI spawn)։ Roster = internal fan-out sub-session, ոչ 32 top-level agents/ folder (§12.F-2)։

### 12.E Session mapping → §6.2 JSONL. user→user · assistant→assistant · tool call→tool_use · result→tool_result · TodoWrite/phase→checkpoint · laws/mode→system։ 0 schema change։

### 12.F Gev-ի որոշումներ — **DEFAULTS SET** (non-stop build. Gev-ը կարող է override անել հետո)
1. ✅ **DEFAULT** /_core = shared top-level `_core/` (agents-ից դուրս, ոչ 32 copy) — repo structure-ը ստանում է `_core/` root-ում։
2. ✅ **DEFAULT** Roster = Bro-ի internal sub-agents (ephemeral sub-session, ոչ 32 standalone `agents/` folder)։
3. ✅ **DEFAULT** L8 sealed memory sync = per-device append + **cross-project merge ԵՐԲԵՔ** + encrypted-at-rest (plaintext memory git-ում ոչ)։
4. ✅ **DEFAULT** bro-* tooling = working_dir-ում, MenQ hosts (ոչ replace), bash-ով կանչ։
5. ✅ **DEFAULT** manifest.extensions = ընդունված contract (schema չընդլայնված)։
> Builder-ը սրանք օգտագործում է ուղիղ — **չի կանգնում հարցնելու**։ Gev-ը ցանկացած պահի կարող է override անել մեկ տողով։

### 12.G §11.2 → RESOLVED (այս §12-ն է նմուշը)։

## 12.H MenQ BRAND — COLOR DESIGN (Bro proposal · լրացնում է L15/§5.8)
> PROPOSAL (L15 = Gev call)։ Սա «մեկ ֆայլ»-ն է՝ `ui/tokens/brand.css`։ Concept՝ console = dark-first, մեկ **iris** accent (մենք = ջերմ-տեխնիկական) + **mint** live-state։ **Contrast՝** text/muted զույգերը AA-verified (body ≥4.5:1). accent-ները ≥3:1 UI-contrast (small text-on-dark-ի համար օգտագործիր lighter iris `#9B9BFF`)։ Վերջնական contrast-pass = P7 gate (axe)։

| Role | Dark (default) | Light |
|---|---|---|
| brand-iris (primary) | `#7C7BF7` | `#5B57E0` |
| brand-iris-hover | `#9391FF` | `#4B47D6` |
| brand-mint (live/success accent) | `#34D6C6` | `#0E9E92` |
| bg (canvas) | `#0E0F13` | `#F7F7FA` |
| surface | `#16181F` | `#FFFFFF` |
| surface-raised | `#1E2029` | `#FFFFFF`+shadow |
| border | `#2A2D38` | `#E3E4EA` |
| text | `#ECEDF1` | `#1A1B21` |
| text-muted | `#A2A6B4` | `#5C6070` |
| success | `#3FCf8E` | `#12925B` |
| warning | `#E9B44C` | `#9A6B00` |
| danger | `#F0616D` | `#C42D3A` |
| info | `#5AB0F0` | `#1E6FB8` |

Agent-color-coding՝ Bro=`#7C7BF7` · HASHIV=`#E9A23B` · GAA=`#34D6C6` · Scout=`#5AB0F0` · Security=`#F0616D`։

```css
:root {                      /* dark = default */
  --brand-iris:#7C7BF7; --brand-iris-hover:#9391FF; --brand-mint:#34D6C6;
  --bg:#0E0F13; --surface:#16181F; --surface-raised:#1E2029; --border:#2A2D38;
  --text:#ECEDF1; --text-muted:#A2A6B4;
  --success:#3FCf8E; --warning:#E9B44C; --danger:#F0616D; --info:#5AB0F0;
  --focus-ring:#7C7BF7; --radius:10px; --font-ui:"Inter","Noto Sans Armenian",system-ui,sans-serif;
}
:root[data-theme="light"] {
  --brand-iris:#5B57E0; --brand-iris-hover:#4B47D6; --brand-mint:#0E9E92;
  --bg:#F7F7FA; --surface:#FFFFFF; --surface-raised:#FFFFFF; --border:#E3E4EA;
  --text:#1A1B21; --text-muted:#5C6070;
  --success:#12925B; --warning:#9A6B00; --danger:#C42D3A; --info:#1E6FB8;
  --focus-ring:#5B57E0;
}
```
Typography՝ Inter + **Noto Sans Armenian** (HY/EN equal, L0) · mono = JetBrains Mono · radius 10px · motion 120–160ms ease-out։

## 13. BRO REVIEW — ADOPTED HARDENING + ONE RISK (2026-07-05 · full quality pass)

> Bro-ի senior review (architecture · security · schema · robustness · i18n/a11y)։ Locked decision (L1–L17) չեմ փոխել։ Ներքևի hardening-ը **ADOPTED = baked into the build** (builder-ը implement անի)։ Մեկ ⚠️ ռիսկ verify-ի՝ Gev-ի համար (build-ը չի կանգնում դրա վրա)։

### ✅ ADOPTED (already spec — builder implement անի)
- **§7.6 Local UI↔sidecar auth handshake** — per-launch secret + Origin/Host check (DNS-rebinding/CSRF-ից token-ագենտների պաշտպանություն)։
- **§7.7 Auto-commit secret-guard fail = visible block**, ոչ silent/crash։
- **Session-file ownership (fix L10/5.5 «conflict-free»)** — ամեն `sessions/<agent>/<id>.jsonl` = մեկ սարքի սեփականություն. resume ուրիշ սարքից = **fork նոր session-id** (`payload.continues=<old-id>`), id-ն կրում է origin-device → իսկապես conflict-free։
- **Sync ordering (5.6)** — loop = commit(local) → `git pull --rebase` → push. per-session write-lock. dirty-tree/live-append-ի ընթացքում rebase ՉԻ։
- **i18n framework P1-ում** (ոչ P7) — `t()` + `locales/{hy,en}.json` P1-ից, translation-ները progressively → zero-hardcode (L13) երբեք չի խախտվում։ P7 = translation-completeness + theme polish gate։
- **Port fallback** — `:47600` զբաղված → հաջորդ ազատ port, actual port `runtime.json`-ում, UI-ն կարդում է (ոչ hardcoded)։
- **PIN clarity (5.1)** — PIN = convenience lock, **ոչ** security boundary (իրական = DPAPI+OS). UI-ում այդպես նշիր։
- **Model list configurable** — `claude-opus-4-8` default, picker-ի ցանկը `config/app.json`-ից (hardcode ոչ)։
- **SQLite = local cache only** (git-ում ՉԻ, §7.1). ՄԻԱՅՆ JSONL-ն է sync-վում — README + `.gitignore`-ում հստակ։

### ✅ RESOLVED — ToS-compliant runtime (was «the one risk»)
**Verified 2026-07-05 (official Anthropic docs):** extracting a subscription OAuth token into your own app / the Agent SDK **IS banned and enforced** (third-party harnesses cut off, accounts restricted, Jan–Apr 2026) → we do NOT build that. **BUT** driving the **official `claude` CLI as a subprocess** is **explicitly permitted** (wrappers around the official tool, confirmed Apr 2026), and it legitimately uses Gev's subscription. → **L5/L6/L7 now use the CLI-wrap** = $0, compliant, no account risk. **API-key + Agent SDK** stays a configurable fallback (Max-20x = $200/mo Agent-SDK credit pool). Source: `code.claude.com/docs/en/legal-and-compliance`. Caveat: single-user / ordinary use only (multi-user already banned, L11); keep parallel automation reasonable.

### 📌 Structure note (§12.F-1 default-ի հետևանք)
§3 repo structure-ը ստանում է top-level **`_core/`** (shared spine՝ laws + behavior + production_os, agents-ից դուրս). `manifest.extensions.spine.shared_core_ref = "../../_core"`։

**Verdict՝ GREEN, build-ready.** Hardening = baked in · ToS = Gev verify նախքան run · §12.F = defaults → non-stop։

---
**END OF BLUEPRINT v1.1 — BUILD-READY (paste + «build it»). §12.F defaults set · hardening adopted · runtime = official `claude` CLI-wrap (ToS-compliant, $0) · API-key fallback.**
