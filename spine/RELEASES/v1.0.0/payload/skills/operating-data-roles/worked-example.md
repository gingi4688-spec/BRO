# Operating Data Roles worked examples

## English

### Example A — routing tree + RACI for a stale-dashboard blame game

**Prompt.** A revenue dashboard has been showing stale numbers for three days. Sales blames Analytics, Analytics blames the warehouse, and nobody is fixing it. Build the routing tree and RACI.

**Senior answer.** Classify the symptom before naming anyone. The symptom is **freshness / late upstream load** — a delivery failure — so the lens is *pipeline*, and the owning role is **data engineering**, not the analyst who happens to know the dashboard. Route:

- **Data engineer — Responsible** for diagnosing the late load, running the idempotent backfill, and the freshness alert. Artifact: a handoff contract — source table, expected arrival 06:00, allowed lateness 30 min, idempotency key on `(date, source_id)`, row-count and freshness tests, on-call escalation. Acceptance check: the freshness test passes on two consecutive scheduled runs.
- **Data architect / steward — Accountable** *only if* the failure is that the source has no enterprise SLA or contract (a standard is missing), which is a `data-architecture-leadership` design question — route the standard there, keep the ownership assignment here.
- **Analytics engineer — Consulted**, because if the late load forced a partial recompute, the semantic-model grain could be affected; they confirm the metric's grain and tests still hold.
- **Analyst — Informed**, and Responsible for the stakeholder readout: which dates were stale, and what the corrected numbers are. The analyst owns the *explanation*, not the pipeline.
- **Sales stakeholders — Informed** through that readout.

RACI in one line: **DE/R** for backfill+alert, **Architect/A** for the source-SLA standard (design routed to `data-architecture-leadership`), **AE/C** for grain/tests, **Analyst/I+R** for the readout. Verify in the running model: the freshness test passes twice *and* the data engineer has accepted the contract — the chart alone is not evidence.

**Why this passes.** It routes from the *symptom* (freshness/late load → data engineering), not from who is closest to the dashboard, which is exactly the seniority/convenience trap that put the analyst on the hook in the first place. It splits Accountable from Responsible so there is one outcome owner, and it keeps the architect's accountability conditional on a *standard* being missing — naming the seam to `data-architecture-leadership` instead of designing the SLA here. The handoff is a real contract (grain via the idempotency key, SLA 06:00/30 min, tests, escalation), not a meeting, and the acceptance check is a passing run observed in the operating model, not a green chart. It keeps the analyst on the explanation and off the pipeline, repairing the most common role-confusion in this exact scenario.

### Example B — steward vs owner on a governed metric

**Prompt.** The "active customer" metric is wrong on a board deck — it counted trial accounts. The data was fresh and on time, the pipeline is green, but the number is meaningless. Who owns this, and how do we stop it recurring?

**Senior answer.** Separate the two accountabilities, because this is the steward-vs-owner case in its purest form. The pipeline was fresh and green, so the **owner** (Accountable for delivery/SLA) did their job — paging or blaming the data engineer here is the failure mode where the steward's bug lands on the owner. The defect is in **meaning**: the definition of "active customer" admitted trial accounts. That is the **steward's** accountability.

- **Steward = analytics engineer** (with the analyst Consulted on the business definition): Accountable for the canonical definition of "active customer," its grain (one row per customer per period, trials excluded), and the test that enforces it. Artifact: an updated metric spec plus a semantic-model test asserting `is_trial = false` in the active-customer set. Acceptance check: the test fails on the old logic and passes on the corrected logic, run against real data.
- **Owner = data engineer**: stays Accountable for delivery and SLA. They did not cause this and should not be the named root cause; their on-call stays scoped to freshness/delivery, not meaning.
- **Analyst — Consulted** for the business definition, **Informed + Responsible** for the corrected board readout (which figures were overstated, by how much).
- **Stakeholders — Informed** through the corrected spec.

Prevention (not a status meeting): the recurring control is a **definition test in the semantic model** that fails any active-customer computation including trials, owned by the steward and gated before publish. Route the on-call correctly so a *delivery* miss pages the owner and a *wrong-meaning* bug pages the steward. If the org wants this generalized into a contract *standard* for all governed metrics, that design is `data-architecture-leadership`'s — assign its steward here and hand the seam across.

**Why this passes.** It refuses to collapse steward and owner: the green, fresh pipeline proves the owner met the SLA, so the answer correctly puts the accountability on the *definition* (steward = analytics engineer) rather than reflexively blaming the data engineer for a meaning bug they do not control. The prevention is a concrete artifact — a definition test asserting `is_trial = false`, with an acceptance check that fails-old/passes-new on real data — not "communicate better." It fixes the on-call routing so each accountability is paged for what it owns, and it names the seam to `data-architecture-leadership` for the standard without designing the standard here, staying inside the support-only boundary.

## Հայերեն

### Օրինակ A — routing tree + RACI stale-dashboard blame game-ի համար

**Prompt.** Revenue dashboard-ը երեք օր stale թվեր է ցույց տալիս։ Sales-ը մեղադրում է Analytics-ին, Analytics-ը՝ warehouse-ին, և ոչ ոք չի շտկում։ Կառուցիր routing tree-ն և RACI-ն։

**Senior պատասխան.** Classify արա symptom-ը նախքան որևէ մեկին անվանելը։ Symptom-ը **freshness / ուշ upstream load** է — delivery failure — ուստի lens-ը *pipeline* է, և տիրող դերը **data engineering**-ն է, ոչ analyst-ը, որ պատահաբար dashboard-ը գիտի։ Route․

- **Data engineer — Responsible** ուշ load-ը diagnose անելու, idempotent backfill-ը գործարկելու և freshness alert-ի համար։ Artifact՝ handoff contract — source table, expected arrival 06:00, allowed lateness 30 րոպե, idempotency key `(date, source_id)`-ի վրա, row-count և freshness tests, on-call escalation։ Acceptance check՝ freshness test-ն անցնում է երկու հաջորդական scheduled run-ի վրա։
- **Data architect / steward — Accountable** *միայն եթե* failure-ն այն է, որ source-ը enterprise SLA կամ contract չունի (standard է բացակայում), ինչը `data-architecture-leadership`-ի design հարց է — ուղղորդիր standard-ը այնտեղ, ownership-ի նշանակումը պահիր այստեղ։
- **Analytics engineer — Consulted**, քանի որ եթե ուշ load-ը partial recompute պարտադրեց, semantic-model grain-ը կարող է ազդվել. նա հաստատում է, որ metric-ի grain-ը և tests-ը դեռ պահում են։
- **Analyst — Informed**, և Responsible stakeholder readout-ի համար․ որ date-երն էին stale, և որոնք են ուղղված թվերը։ Analyst-ը տիրում է *explanation*-ին, ոչ pipeline-ին։
- **Sales stakeholder-ներ — Informed** այդ readout-ով։

RACI մեկ տողով․ **DE/R** backfill+alert-ի համար, **Architect/A** source-SLA standard-ի համար (design ուղղորդված `data-architecture-leadership`-ին), **AE/C** grain/tests-ի համար, **Analyst/I+R** readout-ի համար։ Ստուգիր գործող model-ում․ freshness test-ն անցնում է երկու անգամ *և* data engineer-ը ընդունել է contract-ը — միայն chart-ը ապացույց չէ։

**Ինչու է անցնում gate-ը.** Այն ուղղորդում է *symptom*-ից (freshness/ուշ load → data engineering), ոչ նրանից, ով մոտ է dashboard-ին, ինչը հենց seniority/convenience trap-ն է, որ analyst-ին սկզբից դրեց պատասխանատվության տակ։ Այն բաժանում է Accountable-ը Responsible-ից, որ լինի մեկ outcome owner, և architect-ի accountability-ն պահում է պայմանական՝ *standard*-ի բացակայության վրա — անվանելով seam-ը `data-architecture-leadership`-ին, SLA-ն այստեղ դիզայն անելու փոխարեն։ Handoff-ը իրական contract է (grain՝ idempotency key-ով, SLA 06:00/30 րոպե, tests, escalation), ոչ meeting, և acceptance check-ը operating model-ում դիտված անցնող run է, ոչ green chart։ Այն analyst-ին պահում է explanation-ի վրա և pipeline-ից դուրս՝ շտկելով այս հենց scenario-ի ամենատարածված role-confusion-ը։

### Օրինակ B — steward ընդդեմ owner-ի governed metric-ի վրա

**Prompt.** «Active customer» metric-ը սխալ է board deck-ում — այն հաշվեց trial account-ները։ Data-ն fresh էր և ժամանակին, pipeline-ը green է, բայց թիվը անիմաստ է։ Ով է սա տիրում, և ինչպես ենք կանխում կրկնությունը։

**Senior պատասխան.** Բաժանիր երկու accountability-ն, քանի որ սա steward-vs-owner case-ն է իր ամենամաքուր ձևով։ Pipeline-ը fresh և green էր, ուստի **owner**-ը (Accountable delivery/SLA-ի համար) իր գործն արեց — այստեղ data engineer-ին page անելը կամ մեղադրելը այն failure mode-ն է, որտեղ steward-ի bug-ը ընկնում է owner-ի վրա։ Defect-ը *meaning*-ում է․ «active customer»-ի սահմանումը թույլ տվեց trial account-ներ։ Դա **steward**-ի accountability-ն է։

- **Steward = analytics engineer** (analyst-ը Consulted business սահմանման համար)․ Accountable «active customer»-ի canonical սահմանման, նրա grain-ի (մեկ row ամեն customer-ի ամեն period-ում, trial-ները բացառված) և test-ի համար, որ enforce է անում այն։ Artifact՝ թարմացված metric spec plus semantic-model test, որ պնդում է `is_trial = false` active-customer set-ում։ Acceptance check՝ test-ը fail է հին logic-ի վրա և pass՝ ուղղված logic-ի, գործարկված իրական data-ի դեմ։
- **Owner = data engineer**․ մնում է Accountable delivery-ի և SLA-ի համար։ Նա սա չպատճառեց և չպետք է լինի անվանված root cause. նրա on-call-ը մնում է scoped freshness/delivery-ին, ոչ meaning-ին։
- **Analyst — Consulted** business սահմանման համար, **Informed + Responsible** ուղղված board readout-ի համար (որ թվերն էին overstated, որքանով)։
- **Stakeholder-ներ — Informed** ուղղված spec-ով։

Prevention (ոչ status meeting)․ կրկնվող control-ը **definition test է semantic model-ում**, որ fail է անում ցանկացած active-customer computation, որ ներառում է trial-ներ, տիրված steward-ի կողմից և gated նախքան publish-ը։ Route արա on-call-ը ճիշտ, որ *delivery* miss-ը page անի owner-ին, իսկ *wrong-meaning* bug-ը՝ steward-ին։ Եթե org-ը ուզում է սա generalize անել contract *standard*-ի՝ բոլոր governed metric-ների համար, այդ design-ը `data-architecture-leadership`-ինն է — այստեղ նշանակիր նրա steward-ը և հանձնիր seam-ը այն կողմ։

**Ինչու է անցնում gate-ը.** Այն հրաժարվում է steward-ը և owner-ը միացնելուց․ green, fresh pipeline-ը ապացուցում է, որ owner-ը SLA-ն բավարարեց, ուստի պատասխանը ճիշտ դնում է accountability-ն *սահմանման* վրա (steward = analytics engineer)՝ meaning bug-ի համար data engineer-ին ռեֆլեքսով մեղադրելու փոխարեն, որ նա չի վերահսկում։ Prevention-ը կոնկրետ artifact է — definition test, որ պնդում է `is_trial = false`, acceptance check-ով, որ fail-old/pass-new է իրական data-ի վրա — ոչ «ավելի լավ շփվել»։ Այն շտկում է on-call routing-ը, որ ամեն accountability page ստանա այն բանի համար, որ տիրում է, և անվանում է seam-ը `data-architecture-leadership`-ին standard-ի համար՝ standard-ը այստեղ չդիզայն անելով, մնալով support-only boundary-ի ներսում։
