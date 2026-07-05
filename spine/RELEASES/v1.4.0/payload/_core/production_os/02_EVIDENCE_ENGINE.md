# production_os / 02 — EVIDENCE ENGINE / ԱՊԱՑՈՒՅՑԻ ՇԱՐԺԻՉ

> **EN:** Step 3 of the loop, governed by **L15** (proof or label) and **L18** (independent evidence). Every load-bearing claim gets a label and, where PROVEN, an anchor. **HY:** Loop-ի 3-րդ քայլը՝ **L15** (ապացույց կամ պիտակ) և **L18** (անկախ ապացույց)։ Ամեն կրող claim ստանում է պիտակ, և PROVEN-ի դեպքում՝ խարիսխ։

## 1. The four labels / Չորս պիտակը (L15)

| Label | Meaning | Ships as fact? |
|---|---|---|
| **PROVEN** | named source / file / code / test / runtime observation / calculation the reader can check | yes |
| **INFERRED** | reasoned from proven facts, not directly observed | yes, as inference |
| **ASSUMED** | taken as true to proceed, unchecked | **never as fact** |
| **UNKNOWN** | not established | **never as fact** |

Unlabeled load-bearing claim → default no-higher-than **INFERRED**. A PROVEN whose anchor cannot be shown → downgrade. / Չպիտակված կրող claim → default ոչ բարձր քան INFERRED։ PROVEN առանց ցուցադրելի խարիսխի → իջեցրու։

## 2. Proof by domain / Ապացույց ըստ ոլորտի (L18)

| Domain | What counts as PROVEN |
|---|---|
| Code | test run + typecheck + lint + build output (not "should pass") |
| UI | rendered in running app + states + viewports + keyboard + a11y + screenshot |
| Research | real, reachable source + citation + freshness date |
| Business/Finance | source + calculation shown + assumptions labeled + sensitivity |
| Agent/skill | eval cases run + failure cases handled |
| Audit | criteria + evidence per finding + severity |

File-presence is never proof of capability (L18). / Ֆայլ-presence-ը երբեք կարողության ապացույց չէ (L18)։

## 3. Evidence record / Ապացույցի գրառում

Each material claim used in a decision gets a record appended to [`memory/_evidence/EVIDENCE_LEDGER.md`](../../memory/_evidence/EVIDENCE_LEDGER.md):

```txt
task_id · input · claim · evidence_type · source/anchor · verification_method · confidence · status(PROVEN/INFERRED/ASSUMED/UNKNOWN) · used_in_decision(y/n) · date
```

The ledger is **append-only** (never hand-edited/rewritten). / Ledger-ը **append-only** է. երբեք ձեռքով չի վերագրվում։

## 4. Output of this step / Այս քայլի արդյունք

A labeled evidence set → handed to the Best-Solution Engine ([`03_BEST_SOLUTION_ENGINE.md`](03_BEST_SOLUTION_ENGINE.md)). Missing evidence is itself recorded as UNKNOWN, not silently skipped. / Պիտակված evidence set → Best-Solution Engine։ Բացակա evidence-ը գրանցվում է որպես UNKNOWN, ոչ լուռ բաց թողնված։
