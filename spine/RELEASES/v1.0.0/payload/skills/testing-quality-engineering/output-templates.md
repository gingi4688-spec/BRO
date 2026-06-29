# Testing and Quality Engineering output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every confidence claim traceable to a mechanism (layer choice, mutation score, contract, an observed signal), never to a coverage percentage alone. Do not invent benchmarks or tool numbers.

### Template 1 — Test strategy / risk-to-layer matrix

- **Change under test:** (what shipped, the failures feared)
- **Risk-to-layer map** (one row per feared failure):

  | Feared failure | Cheapest catching layer | Test / assertion | Owner | Failure signal |
  |---|---|---|---|---|
  | (e.g. wrong status mapping) | unit / property | (the invariant or case) | | |
  | (boundary / wiring) | integration / contract | | | |
  | (one critical journey) | E2E (keep thin) | | | |
  | (untrusted input) | fuzz | | | |

- **Mutation focus:** which critical modules get mutation testing, and the mutation-score target (not coverage)
- **Mocking boundary:** what is mocked (network/clock/external) and confirmation internals are NOT mocked
- **Contracts:** which producer/consumer boundaries have a consumer-driven contract
- **Pyramid check:** confidence is densest at unit/property, thin at E2E (not inverted)
- **Acceptance:** risk mapped to layers · mutation on critical code · boundary-only mocks · contracts named
- **Verify live:** the real behavior/metric observed before "done," not green CI

### Template 2 — Flaky-test triage card

- **Test & failure:** name; how it fails; how often; on what code (unchanged?)
- **Nondeterminism source (named):** time · randomness · order-dependence · network · external service · shared state · resource contention
- **Evidence:** seed / timestamp / order / environment; last clean pass; failure cluster
- **Decision:** real bug (deterministic repro → fix, do not quarantine) | flake (quarantine)
- **Quarantine:** owner · entry date · what protects the pipeline meanwhile
- **Root-cause fix:** inject clock / seed RNG / isolate data / pin the dependency
- **Removal condition:** explicit (e.g. N clean runs after the fix) — never "reran until green"
- **Acceptance:** source named · owner assigned · removal condition set · cause fixed, not rerun

### Template 3 — Release-confidence report

- **Release & scope:** what ships; the highest-risk paths
- **Coverage by layer:** unit / integration / contract / E2E — with what each proves (not just a %)
- **Mutation score on critical modules:** the honest confidence number where a bug is most expensive
- **Contract results:** consumer-driven contracts verified against the provider (pass/fail per consumer)
- **Open flakes:** quarantined items, owners, removal conditions (and whether any sit on a release path)
- **Quality gate / blocking criteria:** the conditions that would stop this release (failing critical test, contract break, mutation drop, escaped-defect class)
- **Residual risk & what is deferred:** the paths not tested to a senior bar, named explicitly
- **Verify-live step:** the real behavior/metric to observe post-release, before declaring done
- **Acceptance:** confidence rests on mechanism not %, gate has a blocking criterion, residual risk named

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն confidence-ի պնդում պահիր հետագծելի mechanism-ի (layer-ի ընտրություն, mutation score, contract, observed signal), երբեք միայն coverage percentage-ի։ Մի՛ հորինիր benchmark կամ tool թիվ։

### Template 1 — Test strategy / risk-ից-layer matrix

- **Change under test․** (ինչ ship-վեց, ինչ ձախողումներից վախ)
- **Risk-ից-layer map** (մեկ տող ամեն վախեցող ձախողման)․

  | Վախեցող ձախողում | Ամենաէժան բռնող layer | Test / assertion | Owner | Failure signal |
  |---|---|---|---|---|
  | (օր.՝ սխալ status mapping) | unit / property | (invariant-ը կամ case-ը) | | |
  | (boundary / wiring) | integration / contract | | | |
  | (մեկ critical journey) | E2E (պահիր բարակ) | | | |
  | (անվստահելի input) | fuzz | | | |

- **Mutation focus․** որ critical module-ները ստանում են mutation testing, և mutation-score target-ը (ոչ coverage)
- **Mocking boundary․** ինչ է mock-ված (network/clock/external) և հաստատում, որ internal-ները mock-ված ՉԵՆ
- **Contract-ներ․** որ producer/consumer boundary-ները ունեն consumer-driven contract
- **Pyramid check․** confidence-ը խիտ է unit/property-ի մոտ, բարակ՝ E2E-ի (ոչ շրջված)
- **Acceptance․** risk-ը կապված layer-ներին · mutation critical code-ի վրա · միայն-boundary mock · contract-ները անվանված
- **Verify live․** իրական behavior-ը/metric-ը դիտված մինչ «done», ոչ green CI

### Template 2 — Flaky-test triage card

- **Test & failure․** անունը. ոնց է fail անում. որքան հաճախ. որ code-ի վրա (չփոխվա՞ծ)
- **Nondeterminism source (անվանված)․** time · randomness · order-dependence · network · external service · shared state · resource contention
- **Evidence․** seed / timestamp / order / environment. վերջին clean pass. failure cluster
- **Decision․** իրական bug (deterministic repro → ուղղի՛ր, մի՛ quarantine արա) | flake (quarantine)
- **Quarantine․** owner · entry date · ինչն է մինչ այդ պաշտպանում pipeline-ը
- **Root-cause fix․** inject clock / seed RNG / isolate data / pin dependency-ն
- **Removal condition․** բացահայտ (օր.՝ N clean run fix-ից հետո) — երբեք «rerun մինչև green»
- **Acceptance․** source-ը անվանված · owner նշանակված · removal condition սահմանված · պատճառը ուղղված, ոչ rerun

### Template 3 — Release-confidence report

- **Release & scope․** ինչ է ship-վում. ամենաբարձր-risk path-երը
- **Coverage by layer․** unit / integration / contract / E2E — ինչ է ամեն մեկն ապացուցում (ոչ միայն %)
- **Mutation score critical module-ների վրա․** ազնիվ confidence թիվը, որտեղ bug-ն ամենաթանկն է
- **Contract result-ներ․** consumer-driven contract-ները verify-ված provider-ի դեմ (pass/fail ամեն consumer-ին)
- **Open flake-եր․** quarantine-ված item-ները, owner-ները, removal condition-ները (և արդյոք որևէ մեկը release path-ի վրա է)
- **Quality gate / block-ի criteria․** այն պայմանները, որ կկանգնեցնեին այս release-ը (fail-վող critical test, contract break, mutation-ի անկում, escaped-defect-ի դաս)
- **Residual risk & ինչ է հետաձգվում․** այն path-երը, որ senior նշաձողի չեն test-ված, բացահայտ անվանված
- **Verify-live քայլ․** իրական behavior-ը/metric-ը, որ պետք է դիտվի release-ից հետո, մինչ done հայտարարելը
- **Acceptance․** confidence-ը հենվում է mechanism-ի վրա, ոչ %-ի, gate-ը ունի block-ի criterion, residual risk-ը անվանված
