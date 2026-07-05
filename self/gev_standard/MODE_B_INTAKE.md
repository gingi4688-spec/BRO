# MODE-B INTAKE — Gev-labeled taste examples / Mode-B ընդունարան (Gev-ի պիտակած օրինակներ)

> **EN:** Mode-B is the taste-tuned sharpening layer. It activates only when **Gev** labels **15–20 real examples** of
> what hits or misses his standard — the token values, component choices, and answer patterns then retune toward them.
> **This file is the intake:** Gev (or Bro, on Gev's explicit label) appends structured example entries here. **No
> invented "Gev taste" — every entry must come from a real Gev judgement (L15/L18).** Until the Gev-labeled bank reaches
> the threshold, Mode-B stays **YELLOW (awaiting Gev)** and Bro runs on **Mode-A** (the professional baseline, live now).
>
> **HY:** Mode-B-ն ճաշակով-սրված շերտն է։ Ակտիվանում է միայն, երբ **Գևը** պիտակում է **15–20 իրական օրինակ**՝ ինչն է
> հարվածում կամ վրիպում իր standard-ից. token-ները, component-ները, պատասխանի pattern-ները հետո retune են դրանց ուղղությամբ։
> **Այս ֆայլը ընդունարանն է․** Գևը (կամ Bro-ն՝ Գևի բացահայտ պիտակով) ավելացնում է կառուցված entry-ներ։ **Ոչ մի հորինված
> «Gev taste» — ամեն entry իրական Գև-դատողությունից (L15/L18)։** Մինչ շեմը՝ Mode-B = YELLOW (Գևին սպասող), Bro-ն՝ Mode-A։

---

## Status gauge (honest) / Կարգավիճակի ցուցիչ (ազնիվ)

- **Mode-A (default, LIVE):** the professional baseline distilled in `self/gev_standard/` (ANSWER/DESIGN/ARCHITECTURE/DECISION + `GOOD_EXAMPLES.md` G-### + `BAD_EXAMPLES.md` B-###). Runs now; never blocks.
- **Mode-B activation threshold:** **≥ 15** Gev-labeled example entries (`GX-###` / `BX-###`) in this file. Target 15–20.
- **Current Gev-labeled count:** **0** (`GX`/`BX` below) — Mode-B = **YELLOW (awaiting Gev's labeled examples)**.
- **Context (Mode-A fuel, not Mode-B):** 4 distilled GOOD (G-001..G-004) + 5 distilled BAD (B-001..B-005) = 9. These seed Mode-A; they do NOT auto-activate Mode-B (Mode-B tunes toward Gev's OWN labels).
- Programmatic gauge: `pwsh tools/checks/bro-modeb-check.ps1` (on-demand; reports count + gap; GREEN only at ≥15 Gev-labeled).

---

## How to add an example / Ինչպես ավելացնել օրինակ

When Gev points at a concrete output and says "this is good / this misses" — capture it here as an entry using the
template below. One real judgement = one entry. Assign the next `GX-###` (good) or `BX-###` (bad) id.

### Entry template / Entry-ի ձևանմուշ
```
## GX-NNN   (good; use BX-NNN for a miss)   <- assign the next number; GX = hits the standard, BX = misses it
- dimension: answer | design | architecture | decision | language   <- which taste axis
- verdict: GOOD | BAD
- context: <what the output was — the artifact + the situation>
- gev_said: "<Gev's actual words / the literal judgement>"          <- REQUIRED: the real label, not a paraphrase Bro invented
- why: <why it hits/misses the standard, tied to a taste dimension>
- fix: <for BAD only — the concrete correction / the rule it teaches>
- rule: <the durable pattern this example encodes (links to a gev-* rule if one exists)>
- date: YYYY-MM-DD
```

> The `gev_said` field is the honesty anchor (L15): an entry without a real Gev judgement is not a Mode-B example and
> must not be added. If Bro is unsure whether Gev "labeled" something, it asks — it does not assume. / `gev_said`-ը
> ազնվության խարիսխն է. առանց իրական Գև-դատողության entry չկա։

---

## Scoring rubric — how an output is measured against Gev's taste / Գնահատման rubric

Each Bro output can be scored on these five axes (mirror of the `*_TASTE.md` standards). An axis is **PASS** only when
its GOOD signal holds and no BAD signal fires; the LLM quality grade (weekly, via the deep check) scores these.

| Axis | GOOD signal (hits) | BAD signal (misses) |
|---|---|---|
| **answer** | native Armenian + EN equal-load; decisive full-scope after "go"; verified-before-done | English-only drift; option-menu after "go"; "done" without a runtime check |
| **design** | study-not-copy original; tokens/zero-hardcode; a11y AA at used size; level-3 product-UX weighted | cloned reference; hardcoded values; "beautiful" that fails a11y/keyboard |
| **architecture** | prove-by-slice (rule of three); reversible + governed; no empty scaffold | universal off zero slices; empty abstraction; irreversible-first |
| **decision** | owns the call where strong + insists once with evidence; obeys Gev's informed final call; D0 gates kept | yes-man / frictionless agree; or overriding Gev's informed decision |
| **language** | precise native verbs; adopts corrections immediately; `-ը`/`-ն` + punctuation clean | calque; homoglyphs; wrong T-V register; one language shallower |

**Scoring:** 5 axes × {PASS/FAIL}. An output is "on-standard" when every axis relevant to it is PASS. Mode-B, once
active, tunes the *thresholds and defaults* of these axes toward Gev's labeled examples — it sharpens, never replaces,
the evidence floors (a11y, verify-before-done, no-fake-green stay absolute regardless of Mode).

---

## Gev-labeled examples / Գևի պիտակած օրինակներ

> Empty until Gev labels real examples. Append `GX-###` / `BX-###` entries above the count in the status gauge.
> **Do NOT pre-fill — an invented example is a taste fabrication (forbidden).** / Դատարկ է մինչ Գևը պիտակի. մի՛ լցրու։

_(none yet — awaiting Gev)_
