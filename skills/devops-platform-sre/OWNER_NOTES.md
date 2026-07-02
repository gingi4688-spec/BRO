# DevOps, Platform, and SRE owner notes

## English

### Needs human review when

This skill plans and reasons about infrastructure; it must route to a human owner — not act or auto-approve — when a step is irreversible, can lose data, or changes the security/production posture. Escalate and require explicit approval when:

- **Irreversible production or infrastructure changes** — prod cutovers, region/cluster moves, deleting/replacing live resources, anything an IaC `apply` would destroy-and-recreate. Name the rollback before proceeding.
- **Data-loss-capable migrations** — schema drops, destructive backfills, irreversible data transforms. Require a backup/restore path and, where possible, an expand/contract sequence so the change is reversible.
- **Secret rotation and credential changes** — rotating prod credentials, changing IAM/access scope, moving to OIDC. These can lock out services if mis-sequenced; require an owner and a rollback window.
- **Production incident communications** — status-page wording, customer notifications, SLA/breach statements. Reliability facts are the engineer's; the external message is owned by incident command / comms / leadership.
- **Spend commitments** — reserved/committed-use capacity, plan changes, anything that commits money. Surface the unit-cost and savings math; the commitment decision belongs to the budget owner (see the cost/pricing conflict rule in `SKILL.md`).
- **Disabling a safety control under pressure** — skipping a canary, bypassing an approval gate, silencing alerts during an incident. Allowed only with explicit, time-boxed owner sign-off and a stated re-enable plan.

The default posture for all of the above: produce the plan, the evidence, and the rollback; then stop and route to the owner. Do not execute the irreversible step on your own authority.

### Owned future-improvement items

- Add a fourth worked example for **expand/contract schema migration** (dual-write/dual-read, backfill, contract), since it is the correct answer whenever a canary does not apply.
- Add a **toil-budget pattern** (measuring and capping operational toil as a first-class metric alongside the error budget).
- **✓ DELIVERED (gazan 2026-07-02)** — Add a **multi-window, multi-burn-rate alert recipe** with the specific window/burn pairings, so the alert policy is copy-ready rather than described.
- **✓ DELIVERED (gazan 2026-07-02)** — Add a **cost-attribution worked example** (cost per tenant / per request) to make the FinOps unit-metric requirement concrete end-to-end.
- Cross-link the security overlap explicitly to `cybersecurity-operations-soc` for supply-chain/build-provenance, beyond the OIDC secret-hygiene gate owned here.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը պլանավորում և դատում է ենթակառուցվածքի մասին. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ քայլը անդառնալի է, կարող է data կորցնել կամ փոխում է security/production-ի դիրքը։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Անդառնալի production կամ infrastructure փոփոխություններ** — prod cutover, region/cluster տեղափոխում, live resource-ի ջնջում/փոխարինում, ամեն ինչ, ինչ IaC `apply`-ը destroy-and-recreate կաներ։ Անվանի՛ր rollback-ը մինչև շարունակելը։
- **Data-loss-ունակ migration-ներ** — schema drop, destructive backfill, անդառնալի data transform։ Պահանջիր backup/restore path և, որտեղ հնարավոր է, expand/contract հերթականություն, որ փոփոխությունը հետշրջելի լինի։
- **Secret rotation և credential փոփոխություն** — prod credential-ների rotation, IAM/access scope-ի փոփոխություն, OIDC-ի անցում։ Սխալ հերթականության դեպքում սրանք կարող են service-ները կողպել. պահանջիր owner և rollback window։
- **Production incident-ի communication-ներ** — status-page-ի ձևակերպում, customer notification, SLA/breach հայտարարություն։ Հուսալիության փաստերը engineer-ինն են. արտաքին message-ը incident command-ի / comms-ի / leadership-ի սեփականությունն է։
- **Spend commitment-ներ** — reserved/committed-use capacity, plan change, ամեն ինչ, որ փող է commit անում։ Ցույց տուր unit-cost-ի և խնայողության հաշիվը. commitment-ի որոշումը budget owner-ինն է (տես cost/pricing կոնֆլիկտի կանոնը `SKILL.md`-ում)։
- **Safety control-ի անջատում ճնշման տակ** — canary-ի բացթողում, approval gate-ի շրջանցում, alert-ների լռեցում incident-ի ժամանակ։ Թույլատրելի է միայն հստակ, ժամանակ-սահմանված owner-ի sign-off-ով և նշված re-enable պլանով։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր պլանը, evidence-ը և rollback-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Անդառնալի քայլը մի՛ կատարիր սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու չորրորդ worked example **expand/contract schema migration**-ի համար (dual-write/dual-read, backfill, contract), քանի որ դա ճիշտ պատասխանն է, երբ canary-ն չի կիրառվում։
- Ավելացրու **toil-budget pattern** (operational toil-ի չափում և սահմանափակում որպես first-class metric՝ error budget-ի կողքին)։
- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու **multi-window, multi-burn-rate alert recipe** կոնկրետ window/burn զույգերով, որ alert policy-ն copy-ready լինի, ոչ նկարագրված։
- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու **cost-attribution worked example** (cost per tenant / per request), որ FinOps-ի unit-metric պահանջը կոնկրետ լինի ծայրից ծայր։
- Cross-link արա security-ի համընկնումը բացահայտ `cybersecurity-operations-soc`-ին՝ supply-chain/build-provenance-ի համար, այստեղ տիրվող OIDC secret-hygiene gate-ից այն կողմ։
