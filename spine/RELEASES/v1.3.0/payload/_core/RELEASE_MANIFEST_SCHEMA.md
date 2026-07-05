# RELEASE MANIFEST SCHEMA — versioned spine down-flow (Flow 2) / release manifest-ի schema

> **EN:** A spine release is a versioned, hash-verified package the Project Bros **pull** (never forced, B6).
> Super Bro publishes an approved release → a Bro **pulls → verifies hashes → stamps `spine_version`** (§6A Flow 2).
> **OD-5: the baseline `v1.0.0` cut is DEFERRED** — the mechanism is built and testable, but no real cut is made into
> `spine/RELEASES/` until the first install/pull need or an explicit Gev command. `spine/RELEASES/` stays empty.
> **OD-6: the live spine stays at the BRO_HOME root dirs**; `spine/RELEASES/` stores packaged cuts only.
>
> **HY:** Spine release-ը versioned, hash-verified փաթեթ է, որ Project Bro-ները **pull** են անում (երբեք forced, B6)։
> Super Bro-ն հրապարակում է approved release → Bro-ն **pull → hash verify → `spine_version` stamp** (§6A Flow 2)։
> **OD-5՝ baseline `v1.0.0` cut-ը ՀԵՏԱՁԳՎԱԾ է** — mechanism-ը կառուցված ու testable է, բայց real cut չի արվում
> `spine/RELEASES/`-ի մեջ մինչ առաջին install/pull-ի կարիք կամ Գևի բացահայտ հրաման։ `spine/RELEASES/`-ը մնում է դատարկ։

---

## Release layout / release-ի layout

```txt
spine/RELEASES/v<ver>/
  release.manifest.json     version · created_at · spine_dirs · files[{path, sha256}] · rollup_sha256 · notes
  payload/                  the copied spine content (the 4 live spine dirs at cut time)
  sha256.txt                human-readable per-file digest + rollup
```

## release.manifest.json schema / schema

```txt
schema_version      v1
version             v<ver>          (e.g. v1.0.0 — DEFERRED per OD-5)
created_at          REAL system timestamp (script-generated; no fabrication)
spine_dirs          ["_core","skills","self","roster"]   (OD-6 live spine roots)
files               [ { "path": "<relative>", "sha256": "<64hex>" }, ... ]
rollup_sha256       sha256 over the sorted "path:sha256" lines (single integrity value)
cut_by              Bro (under explicit Gev command)
authority           Gev-command
notes               free text
```

## Pull / verify / stamp procedure / pull-verify-stamp ընթացակարգ

```txt
1) PULL    copy spine/RELEASES/v<ver>/payload -> X/bro/spine   (availability signal only; never forced, B6)
2) VERIFY  recompute sha256 of every pulled file; compare to release.manifest.json; REJECT on any mismatch
3) STAMP   on full match, write spine_version = v<ver> into X/bro/bro.manifest.json
```

> **EN:** No blind copy/sync; a release is applied only if every hash matches (`bro-spine-verify.ps1`). Cutting a
> release is a CRITICAL, Gev-gated action (`critical-command-gate` + `BRO_GEV_APPROVED=1`) and is logged in
> `memory/_own/release-log.md` (append-only).
> **HY:** Ոչ կույր copy/sync; release-ը կիրառվում է միայն եթե ամ. hash համընկնում է։ Release կտրելը CRITICAL,
> Gev-gated action է ու log-վում է `release-log.md`-ում (append-only)։
