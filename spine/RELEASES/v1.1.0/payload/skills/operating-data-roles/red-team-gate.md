# Operating Data Roles red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (routing tree, RACI/RAPID grid, handoff contract, operating map, role-confusion postmortem). It extends but never replaces the boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`. This skill is support-only relative to `data-architecture-leadership`; any design that belongs to that skill must be routed there, not produced here.

### Domain failure cases (must be caught)

- **Routed by seniority or convenience** — do not accept a route based on who is closest or most senior; require classification from the symptom via the lens cascade.
- **Steward and owner collapsed (or only one named)** — do not accept a governed asset with a single "owner"; require both the steward (definition/quality/policy) and the owner (delivery/SLA), and correct on-call routing.
- **Data-mesh vocabulary with no substrate** — do not accept domain ownership / data products / federated governance / self-serve platform on a team with no contracts, stewards, or platform; require the first missing prerequisite instead.
- **RACI with no Accountable, or two** — do not accept "everyone owns quality" or a decision with two final-say owners; require exactly one Accountable (or a RAPID "Decide").
- **Handoff that is a meeting, not a contract** — do not accept a boundary crossing with no grain, SLA, tests, idempotency key, or acceptance gate.
- **Metric meaning decided by the wrong role** — do not let engineering decide what a metric means, or an analyst silently own the semantic model.
- **Governance added after the leak** — do not accept a steward/access/gate assigned only in the postmortem; require it before sensitive data flows.
- **Lens used past its boundary** — do not accept a "routing" answer that silently designs the platform/contract/topology; route that design to `data-architecture-leadership`.
- **Framework theater** — do not accept a full grid where one row would change the decision, or vocabulary in place of an ownership split no role accepted.

### Reviewer probes (ask these of any answer)

- What was the *symptom*, and which lens (descriptive/semantic/causal/pipeline/serving/standard) placed it? If the route came from a job title or seniority, it is wrong.
- For each governed asset: who is the **steward** (meaning/quality/policy) and who is the **owner** (delivery/SLA)? If only one is named, the RACI is unfinished; if they are the same role, justify it.
- Does each decision row have exactly one Accountable (RACI) or one Decide (RAPID)? Where are the zero-Accountable or two-Accountable rows?
- Is the chosen frame right — RACI for execution, RAPID for a contested decision — or is a decision fight being run through a RACI?
- Does the handoff carry grain, SLA/freshness, schema-change policy, backfill, idempotency key, tests, and an escalation owner — and does the consumer accept only on a passing real run?
- Is any data-mesh vocabulary backed by actual contracts, stewards, and a self-serve platform, or is it language standing in for capability? What is the first missing prerequisite?
- Did the answer cross the seam and *design* a platform/contract standard/topology? If so, is that design routed to `data-architecture-leadership` with the steward named here?
- Is the on-call routed so a delivery miss pages the owner and a wrong-meaning bug pages the steward?
- Is the verification in the running operating model (named owner accepts, acceptance check passes), not just on the org chart? And is the Armenian equal-depth and punctuation-clean (`․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (routing tree, RACI/RAPID grid, handoff contract, operating map, role-confusion postmortem)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի սահմանները։ Այս skill-ը support-only է `data-architecture-leadership`-ի նկատմամբ. ցանկացած design, որ պատկանում է այդ skill-ին, պետք է ուղղորդվի այնտեղ, ոչ արտադրվի այստեղ։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Ուղղորդված seniority-ով կամ հարմարությամբ** — մի՛ ընդունիր route, որ հիմնված է նրա վրա, ով մոտ է կամ senior. պահանջիր classification symptom-ից lens cascade-ով։
- **Steward-ը և owner-ը միացված (կամ միայն մեկը անվանված)** — մի՛ ընդունիր governed asset մեկ «owner»-ով. պահանջիր և՛ steward (definition/quality/policy), և՛ owner (delivery/SLA), և ճիշտ on-call routing։
- **Data-mesh vocabulary առանց substrate-ի** — մի՛ ընդունիր domain ownership / data products / federated governance / self-serve platform թիմի վրա, որ չունի contract, steward կամ platform. պահանջիր առաջին բացակայող prerequisite-ը։
- **RACI առանց Accountable-ի, կամ երկուսով** — մի՛ ընդունիր «բոլորը quality-ի owner են» կամ որոշում երկու վերջին-խոսք owner-ով. պահանջիր ճիշտ մեկ Accountable (կամ RAPID «Decide»)։
- **Handoff, որ meeting է, ոչ contract** — մի՛ ընդունիր boundary-ի հատում առանց grain-ի, SLA-ի, tests-ի, idempotency key-ի կամ acceptance gate-ի։
- **Metric-ի իմաստը որոշում է սխալ դերը** — մի՛ թող, որ engineering-ը որոշի, թե metric-ը ինչ է նշանակում, կամ analyst-ը լուռ տիրի semantic model-ին։
- **Governance ավելացված leak-ից հետո** — մի՛ ընդունիր steward/access/gate, որ նշանակված է միայն postmortem-ում. պահանջիր այն նախքան sensitive data-ի հոսքը։
- **Lens-ը կիրառված իր boundary-ից այն կողմ** — մի՛ ընդունիր «routing» պատասխան, որ լուռ դիզայն է անում platform/contract/topology. ուղղորդիր այդ design-ը `data-architecture-leadership`-ին։
- **Framework theater** — մի՛ ընդունիր ամբողջական grid, որտեղ մեկ row-ը կփոխեր որոշումը, կամ vocabulary՝ ownership-ի բաժանման փոխարեն, որ ոչ մի դեր չընդունեց։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ինչ էր *symptom*-ը, և որ lens-ը (descriptive/semantic/causal/pipeline/serving/standard) տեղադրեց այն։ Եթե route-ը գալիս է job title-ից կամ seniority-ից, սխալ է։
- Ամեն governed asset-ի համար․ ով է **steward**-ը (meaning/quality/policy) և ով՝ **owner**-ը (delivery/SLA)։ Եթե միայն մեկն է անվանված, RACI-ն անավարտ է. եթե նույն դերն են, արդարացրու։
- Ամեն decision row ունի՞ ճիշտ մեկ Accountable (RACI) կամ մեկ Decide (RAPID)։ Որտեղ են զրո-Accountable կամ երկու-Accountable row-երը։
- Ընտրված frame-ը ճի՞շտ է — RACI execution-ի, RAPID վիճարկվող որոշման համար — թե decision fight-ը RACI-ով է վարվում։
- Handoff-ը կրու՞մ է grain, SLA/freshness, schema-change policy, backfill, idempotency key, tests և escalation owner — և consumer-ը ընդունու՞մ է միայն անցնող իրական run-ի վրա։
- Որևէ data-mesh vocabulary հենվու՞մ է իրական contract-ների, steward-ների և self-serve platform-ի վրա, թե language է capability-ի փոխարեն։ Ինչ է առաջին բացակայող prerequisite-ը։
- Պատասխանը հատե՞ց seam-ը և *դիզայն* արեց platform/contract standard/topology։ Եթե այո, այդ design-ը ուղղորդվա՞ծ է `data-architecture-leadership`-ին՝ steward-ը այստեղ անվանված։
- On-call-ը route-ված է՞, որ delivery miss-ը page անի owner-ին, իսկ wrong-meaning bug-ը՝ steward-ին։
- Verification-ը գործող operating model-ո՞ւմ է (անվանված owner-ը ընդունում է, acceptance check-ն անցնում է), ոչ միայն org chart-ի վրա։ Եվ հայերենը equal-depth ու punctuation-clean է՞ (`․`/`։`/«», առանց homoglyph-ի)։
