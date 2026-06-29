# EP PROJECT BRO PILOT — ASSUMPTIONS SEALED (PLAN ONLY) / EP pilot-ի assumption-ների կնիք

> **STATUS: 🔒 SEALED by Gev — 2026-06-29 · baseline `a74dd2f` (CLEAN SUPERBRO GREEN). PLAN ONLY.**
> **EN:** These are the locked assumptions for the FIRST Project Bro pilot (EP). Sealing them changes **nothing**
> operationally: EP is **not** registered, **not** installed, **no** `Desktop\EP` file is read or written, **no**
> release is cut, **no** migration, **no** push. This is the decision record the future rollout will read; each real
> step (REGISTER → INSTALL → …) still requires its own explicit Gev command + preview → `YES` + `BRO_GEV_APPROVED`.
> **HY:** Սրանք առաջին Project Bro pilot-ի (EP) կողպված assumption-ներն են։ Կնքելը գործնականում **ոչինչ** չի փոխում՝
> EP-ն **չի** register/install, `Desktop\EP`-ի ոչ մի ֆայլ չի կարդացվում/գրվում, **ոչ** release cut, **ոչ** migration,
> **ոչ** push։ Սա decision record-ն է, որ ապագա rollout-ը կկարդա. ամ. real քայլ դեռ պահանջում է առանձին Գևի հրաման։

---

## Sealed assumptions / կնքված assumption-ներ

| # | Assumption | Sealed value |
|---|---|---|
| 1 | EP project root path | `C:\Users\Admin\Desktop\EP` |
| 2 | `project_id` | `EP` |
| 3 | `memory_scope` | `EP_only` |
| 4 | Install location (`X/bro`) | `C:\Users\Admin\Desktop\EP\bro\` |
| 5 | **EP memory source** | **FRESH sealed memory** (new, empty at install) |
| 6 | Existing `C:\Users\Admin\Desktop\EP\memory` | **MUST REMAIN UNTOUCHED** — not read, not modified, not moved |
| 7 | Adopt existing memory | **NO** |
| 8 | Migrate existing memory | **NO** |
| 9 | Read-only mirror (`supermemory/EP`) | **NO** (not part of this pilot) |
| 10 | `EP/bro` authority | **ProjectBro** under SuperBro |
| 11 | Spine release EP pulls | future **`v1.0.0`** (first cut; OD-5 deferral lifted only by a later Gev command) |

## What this seal means / ինչ է նշանակում կնիքը

**EN:** At a future, separately-commanded install, `Desktop\EP\bro\` is created **additively** from
`tools/templates/project-bro/` with a **fresh, empty** `EP/bro/memory` (the only unique part, B1/B4/L8). EP's
pre-existing `Desktop\EP\memory` is **never** touched — no adopt, no migrate, no mirror. The registry holds only
metadata (B4); **no EP content ever enters SuperBro `_own` or any blended memory** (B6/L8). The wall continues to
block all EP writes until a narrow, registry-keyed write-exception is built for the approved install (see rollout plan §3).

**HY:** Ապագա, առանձին հրամայված install-ին `Desktop\EP\bro\`-ն ստեղծվում է **additive**` tools/templates/project-bro/`-ից՝
**fresh, դատարկ** `EP/bro/memory`-ով (միակ unique մասը, B1/B4/L8)։ EP-ի գոյություն ունեցող `Desktop\EP\memory`-ն
**երբեք** չի դիպչվում — ոչ adopt, ոչ migrate, ոչ mirror։ Registry-ն միայն metadata (B4); **ոչ մի EP content չի մտնում
SuperBro `_own` կամ blended memory** (B6/L8)։ Wall-ը շարունակում է block անել EP write-երը մինչ registry-keyed
write-exception-ը կառուցվի approved install-ի համար (rollout plan §3)։

## This seal does NOT authorize / այս կնիքը ՉԻ թույլատրում

`REGISTER EP` · `INSTALL EP PROJECT BRO` · any `Desktop\EP` read/write · `RELEASE SPINE` / `v1.0.0` cut · migration ·
mirror creation · `push`. Each remains a separate, explicit Gev-gated action. / Ամ. մեկը առանձին Gev-gated է։

---

*Sealed 2026-06-29 · Gev Root Authority (D0/L0) · plan-only · no project touched · no push. / Կնքված 2026-06-29։*
