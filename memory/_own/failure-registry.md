# Failure Registry / Ձախողումների ռեգիստր

> **EN:** Append-only evidence. Every serious failure → an entry + a regression-test candidate. This is **governance evidence, NOT project memory** — the Phase-2 drift detector must **whitelist** this file (it legitimately names projects; P0-R3). Format: Date · Project · Failure type · What happened · Root cause · Boundary violated · Impact · Fix · Test added · Promotion needed · Gev approval.
> **HY:** Append-only evidence. Ամ. լուրջ ձախողում → entry + regression-test candidate։ Սա **governance evidence է, ՈՉ project memory** — Phase-2 drift detector-ը պետք է **whitelist** անի այս ֆայլը (օրինաչափ project-անուններ է կրում; P0-R3)։

---

## Entry 1 — instance content treated as framework (altitude drift)

```txt
Date: 2026-06-29 · Project: EP
Failure: instance content treated as framework (altitude drift) — Bro wrote a scout (WOSM) safeguarding
         policy as if EP were the scout system.
Root cause: markdown discipline only; no structural altitude gate.
Boundary violated: framework-vs-instance altitude (EP D-020).
Fix: D-021 / red-line / AI-rule #19; scout content moved out to Desktop\scout.
Regression test: "spine/framework core must not contain project-specific facts" (drift detector rule).
Gev approval: yes (3-way GREEN).
```
*Source: canonical spec §13 — recorded here as the registry's first (founding) entry. / Աղբյուր՝ canonical §13։*
