# DevOps, Platform, and SRE output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every number traceable to a formula or an observed metric. Do not invent prices or benchmarks.

### Template 1 — SLO / error-budget sheet

- **Service & user journey:** (what user-facing flow this protects)
- **SLI:** good events / valid events — exact definition (e.g. HTTP 200–499 / all valid requests)
- **SLO & window:** target % over N days
- **Error budget:** `(1 − SLO) × window` = ___ minutes
- **Current burn rate:** `observed error rate / allowed error rate` = ___ ×
- **Alert policy (multi-window):**
  - Fast page: burn ≥ ___ × over ___ (short window)
  - Slow ticket: burn ≥ ___ × over ___ (long window)
- **Budget policy:** when healthy → spend on velocity; when exhausted/burning → freeze risky launches
- **Owner / review cadence:**
- **Acceptance:** budget math correct · alerting is burn-rate not raw-count · owner named
- **Verify live:** which real metric/endpoint confirms the SLI is measuring user success

### Template 2 — Canary / rollout plan

- **Change & blast radius:** what ships, who is exposed at each step
- **Strategy:** canary | blue-green | feature flag | expand/contract (and why; if data/schema is atomic, not a percentage canary)
- **Traffic steps & bake time:** e.g. 5% / 30m → 25% / 30m → 50% / 30m → 100%
- **Guardrail metrics (per step):** p99 latency · error-budget burn · saturation (CPU throttle / queue depth) · one business metric
- **Automatic abort threshold:** exact condition per guardrail (do not wait for a human)
- **Rollback path:** command/revision — and confirmation it has been rehearsed (incl. migration-down if schema touched)
- **Owner & approval:** who approves production; irreversible/data-loss steps gated
- **Acceptance:** p99 + saturation present · auto-abort defined · rollback tested
- **Verify live:** observe the SLI for the canary window in the running system, not green CI

### Template 3 — Incident postmortem (blameless)

- **Impact & severity:** user-facing impact + duration; severity by impact, not by who pushed
- **Timeline:** detection → diagnosis → mitigation → recovery (with timestamps; isolate the slow leg)
- **Contributing factors (not one root cause):** what made it possible · what made it worse · what slowed detection · what slowed recovery
- **Controls shipped (one per factor):** alert / guardrail / automation / validation / runbook fix
- **What worked (keep):** mechanisms that helped (e.g. a rehearsed rollback)
- **No individual named as the cause:** the cause is the missing control, now added
- **Action owners & dates:**
- **Acceptance:** every contributing factor has a control · alerting moved to burn-rate if detection was slow · drift/validation closed if applicable

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն թիվ պահիր հետագծելի formula-ի կամ observed metric-ի։ Մի՛ հորինիր price կամ benchmark։

### Template 1 — SLO / error-budget sheet

- **Service & user journey․** (որ user-facing flow-ն է սա պաշտպանում)
- **SLI․** good events / valid events — ճշգրիտ սահմանում (օր.՝ HTTP 200–499 / բոլոր valid request-ները)
- **SLO & window․** target % N օրվա համար
- **Error budget․** `(1 − SLO) × window` = ___ minute
- **Current burn rate․** `observed error rate / allowed error rate` = ___ ×
- **Alert policy (multi-window)․**
  - Fast page․ burn ≥ ___ × ___-ի ընթացքում (կարճ window)
  - Slow ticket․ burn ≥ ___ × ___-ի ընթացքում (երկար window)
- **Budget policy․** երբ առողջ է → ծախսիր velocity-ի վրա. երբ սպառված/այրվող է → freeze risky launch-երը
- **Owner / review cadence․**
- **Acceptance․** budget math-ը ճիշտ է · alerting-ը burn-rate է, ոչ raw-count · owner անվանված
- **Verify live․** որ իրական metric-ը/endpoint-ն է հաստատում, որ SLI-ն չափում է user-ի success-ը

### Template 2 — Canary / rollout plan

- **Change & blast radius․** ինչ է ship-վում, ով է exposed ամեն step-ին
- **Strategy․** canary | blue-green | feature flag | expand/contract (և ինչու. եթե data/schema-ն atomic է, percentage canary չէ)
- **Traffic step-եր & bake time․** օր.՝ 5% / 30ր → 25% / 30ր → 50% / 30ր → 100%
- **Guardrail metric-ներ (ամեն step)․** p99 latency · error-budget burn · saturation (CPU throttle / queue depth) · մեկ business metric
- **Automatic abort threshold․** ճշգրիտ պայման ամեն guardrail-ի (մարդու մի՛ սպասիր)
- **Rollback path․** command/revision — և հաստատում, որ rehearsed է (ներառյալ migration-down, եթե schema է դիպել)
- **Owner & approval․** ով է approve անում production-ը. անդառնալի/data-loss step-երը gated
- **Acceptance․** p99 + saturation կա · auto-abort սահմանված · rollback ստուգված
- **Verify live․** դիտիր SLI-ն canary window-ի ընթացքում running system-ում, ոչ green CI

### Template 3 — Incident postmortem (blameless)

- **Impact & severity․** user-facing impact + տևողություն. severity ըստ impact-ի, ոչ ըստ նրա, ով push արեց
- **Timeline․** detection → diagnosis → mitigation → recovery (timestamp-ներով. առանձնացրու դանդաղ հատվածը)
- **Contributing factors (ոչ մեկ root cause)․** ինչը հնարավոր դարձրեց · ինչը վատացրեց · ինչը դանդաղեցրեց detection-ը · ինչը դանդաղեցրեց recovery-ն
- **Ship արված control-ներ (մեկ ամեն factor-ին)․** alert / guardrail / ավտոմատացում / validation / runbook fix
- **Ինչն աշխատեց (պահիր)․** մեխանիզմներ, որ օգնեցին (օր.՝ rehearsed rollback)
- **Ոչ մի անհատ չի անվանվում որպես cause․** cause-ը բացակայող control-ն է, այժմ ավելացված
- **Action owner-ներ & ամսաթվեր․**
- **Acceptance․** ամեն contributing factor ունի control · alerting-ը տեղափոխված burn-rate, եթե detection-ը դանդաղ էր · drift/validation փակված, եթե կիրառելի է
