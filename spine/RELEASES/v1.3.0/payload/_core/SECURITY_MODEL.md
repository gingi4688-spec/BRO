# SECURITY MODEL — what Bro's enforcement guarantees, and what it does NOT / ԱՆՎՏԱՆԳՈՒԹՅԱՆ ՄՈԴԵԼ — ինչ ա երաշխավորում Bro-ի enforcement-ը, ու ինչ՝ ՈՉ

> **EN:** An honest, evidence-first statement of Bro's security model — the layers that enforce the laws, and the **known limitations** they do not cover. Written so no layer reads as a hermetic seal when it is a defense-in-depth speed-bump. Resolves self-audit findings **M** (shell side-doors), and documents **H** (hook tamper-pin) + **N** (archive isolation) as part of the model.
>
> **HY:** Bro-ի անվտանգության մոդելի ազնիվ, evidence-first նկարագիր — շերտերը, որ կիրառում են օրենքները, ու **հայտնի սահմանափակումները**, որ չեն ծածկում։ Գրված է այնպես, որ ոչ մի շերտ hermetic seal չկարդացվի, երբ defense-in-depth speed-bump է։ Լուծում է self-audit finding **M**-ը (shell side-doors), ու փաստագրում **H** (hook tamper-pin) + **N** (archive isolation)։

---

## 0. Threat model (state it, don't assume it) / Threat model (նշիր, մի ենթադրիր)

**EN:** Bro runs on **Gev's own trusted machine** (single laptop, DESKTOP-3SNK3IJ). The model defends against:
- **accidental** leakage / mistakes (writing a project's content into the wrong place; committing project content into SuperBro),
- **structural** drift (a hook silently changed; a critical action run without Gev's token; an unreviewed autopilot push),
- **cross-project contamination** (one project's sealed memory reaching another, or SuperBro).

It does **NOT** attempt to defend against a **hostile operator with full write access to BRO_HOME on Gev's own machine** — that is out of scope (D0: Bro audits and gates; Gev is root). Enforcement is **defense-in-depth + detection + Gev-token gating**, NOT a hermetic sandbox.

**HY:** Bro-ն աշխատում է **Գևի սեփական վստահելի մեքենայի** վրա (մեկ laptop)։ Մոդելը պաշտպանում է՝ **պատահական** leak-ից/սխալից, **structural** drift-ից (hook լուռ փոխված. critical action առանց token-ի. unreviewed push), **cross-project contamination**-ից։ **ՉԻ** փորձում պաշտպանել **BRO_HOME-ի լիարժեք write-access ունեցող թշնամական operator-ից Գևի սեփական մեքենայի վրա** — դա scope-ից դուրս է (D0՝ Bro-ն audit ու gate է անում. Գևը root է)։ Enforcement-ը **defense-in-depth + detection + Gev-token gating** է, ՈՉ hermetic sandbox։

---

## 1. The layers (defense-in-depth) / Շերտերը (defense-in-depth)

| # | Layer | What it does | Type |
|---|-------|--------------|------|
| 1 | **5-hook wall** (`forbidden-path-write-guard`, `cross-memory-read-guard`, `critical-command-gate`, `log-append-only-guard`, `preflight-printer`) | PreToolUse structural enforcement: block writes outside BRO_HOME / into a project's sealed memory; block cross-scope memory reads; gate critical commands; keep evidence logs append-only | **Prevention** (structural) |
| 2 | **Structural push-disable during dispatch** (`bro-dispatch` disables the repo's push URL for the whole run) | The REAL "never push" guarantee — no command a dispatched agent runs can publish, regardless of pattern matching | **Prevention** (structural) |
| 3 | **Read-only audits** (`bro-doctor`, `bro-audit`, `bro-beast-check`, `bro-project-audit`, `bro-selfaudit`) | Detect drift, pollution, isolation breaches; flag only, never fix (D0) | **Detection** |
| 4 | **Hook tamper-pin** (`bro-hookpin` + `tools/hooks/hooks.sha256`) — finding **H** | Pin the SHA-256 of the wall's own hooks; flag any unexpected change; a legit hook edit must re-pin in the same commit | **Detection** |
| 5 | **Archive isolation check** (`bro-audit` [C]) — finding **N** | ZERO tracked archives in the repo — an opaque zip/tar cannot hide project content in SuperBro (the B4-class gap that a real gaahex-memory backup slipped through) | **Detection** |
| 6 | **Append-only evidence logs** (`memory/_own/*.md` via `bro-log`) | Every critical action / block leaves a tamper-evident, append-only trail | **Evidence** |
| 7 | **Gev-token gating** (`BRO_GEV_APPROVED=1`) | Push, release, promote, register, install, update-spine, cross-grant, hook re-pin need Gev's explicit token | **Authorization** |

---

## 2. Known limitations (honest — do NOT paper over) / Հայտնի սահմանափակումներ (ազնիվ)

### M — the critical-command-gate is a speed-bump, not a sandbox / M — critical-command-gate-ը speed-bump է, ոչ sandbox

**EN:** `critical-command-gate` is a **pattern-matching + evidence layer**, hardened (heredoc/quote scrub, wrapper-body scan, raw-push detection) so the *common* bypasses fail. But it matches command **text** — a determined local actor with shell access could, in principle, evade it (a novel wrapper, a compiled helper, a raw process spawn). **We do not pretend the regex is a hermetic sandbox.** The REAL push guarantee is **layer 2** (structural push-URL disable during dispatch), which does not depend on pattern matching. Adding ever-more brittle regex would buy *false confidence*, not safety — so we document the limit instead.

**HY:** `critical-command-gate`-ը **pattern-matching + evidence** շերտ է, hardened (heredoc/quote scrub, wrapper scan, raw-push detection), որ *սովորական* bypass-ները fail լինեն։ Բայց այն match է անում command **տեքստը** — shell-access ունեցող վճռական local actor-ը սկզբունքորեն կարող է շրջանցել (նոր wrapper, compiled helper, raw process spawn)։ **Չենք ձևացնում որ regex-ը hermetic sandbox է։** Push-ի իրական երաշխիքը **շերտ 2-ն** է (structural push-URL disable dispatch-ի ընթացքում), որ pattern-matching-ից կախված չէ։ Ավելի brittle regex = *false confidence*, ոչ անվտանգություն — ուստի սահմանը փաստագրում ենք։

### H — tamper detection is DETECTION, not PREVENTION / H — tamper detection-ը ԴԵՏԵԿՑԻԱ է, ոչ PREVENTION

**EN:** The hook-pin **detects** an unexpected change to the wall's own hooks and forces a legit edit to be explicit (re-pin in the same commit). A determined local actor with write access could modify a hook *and* re-pin it — the pin does not make that impossible. It raises the **cost and visibility** of tampering (accidental or undocumented drift is caught and goes RED), which is the correct goal under D0 (Bro audits, never self-rules; it does not lock its own author out).

**HY:** Hook-pin-ը **դետեկտ** է անում wall-ի hook-երի անսպաս փոփոխ ու ստիպում legit edit-ը բացահայտ լինել (re-pin նույն commit-ում)։ Write-access ունեցող վճռական actor-ը կարող է hook փոխել *ու* re-pin անել — pin-ը դա անհնար չի դարձնում։ Այն բարձրացնում է tampering-ի **արժեքն ու տեսանելիությունը** (պատահական/չփաստագրված drift-ը բռնվում է ու RED է) — ճիշտ նպատակը D0-ի տակ։

### Isolation depth / Isolation-ի խորություն

**EN:** The audits work at **filename / metadata / archive / hash** level. They do **not** read sealed project memory *content* (that would itself breach L8), and do not recompute every spine payload hash on every run (use `bro-spine-verify` / `bro-beast-check` for the deep pass). A GREEN audit means "these structural checks passed at this commit," never "the code is bug-free / a release is safe / sealed memory is correct."

**HY:** Audit-ները աշխատում են **filename / metadata / archive / hash** մակարդակում։ **Չեն** կարդում sealed project memory-ի *content*-ը (դա ինքը L8 կխախտեր), ու չեն recompute անում ամեն spine hash ամեն run-ի (խորի համար՝ `bro-spine-verify` / `bro-beast-check`)։ GREEN audit = «այս structural check-երը անցան այս commit-ին», ոչ երբեք «code-ը bug-free է / release-ը safe է»։

---

## 3. Procedures / Ընթացակարգեր

**Legit hook edit (must re-pin in the same commit) / Legit hook edit (պիտի re-pin նույն commit-ում):**
```
# after editing any tools/hooks/*.ps1:
BRO_GEV_APPROVED=1 pwsh tools/bro-hookpin.ps1 -Update
git add tools/hooks/<edited-hook>.ps1 tools/hooks/hooks.sha256
# commit both together — otherwise bro-audit [G] + beast flag the drift RED.
```

**Verify the wall integrity anytime (read-only) / Ստուգել wall-ի integrity-ն ցանկացած պահ (read-only):**
```
pwsh tools/bro-hookpin.ps1 -Verify     # hooks unchanged?
pwsh tools/bro-audit.ps1               # [C] archives · [F] isolation · [G] hook-pin
pwsh tools/bro-selfaudit.ps1           # doctor + audit + beast, one verdict
```

---

## 4. Cross-refs / Cross-ref-եր

- **D0** (Gev Root Authority) — Bro audits, gates, and detects; it never self-rules or locks Gev out. Prevention on Gev's own machine is out of scope by design.
- **L8 / L8-G** (memory sealed per work; grant is the only sanctioned crossing) — the isolation the audits protect.
- **L10** (only SuperBro strengthens) — enforcement is authored in SuperBro, delivered to projects; Project Bros never self-evolve.
- **L11** (recovery = forward-fix, never history rewrite) — a tampered/bad state is corrected forward, not rewritten.
- **B4** (SuperBro `_own`/BRO_HOME holds metadata/evidence only, never project content) — layers 5 + the `_own` boundary check.

---

*EN: Defense-in-depth + detection + Gev-token gating. Not a hermetic seal — and it says so.*
*HY: Defense-in-depth + detection + Gev-token gating։ Ոչ hermetic seal — ու ասում է դա։ 💪🤍*
