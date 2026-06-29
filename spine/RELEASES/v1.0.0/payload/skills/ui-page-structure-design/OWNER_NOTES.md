# UI page structure design owner notes

## English

### Needs human review when

This skill designs and reasons about interface structure; it produces the page plan, the states, and the handoff, but it must route to a human owner — not assert, not self-approve, not publish — when the page makes a claim that is legally or factually load-bearing, gates access, captures consent, or commits the product to a design-system contract. Stop and route to the named owner when:

- **Legal, regulated, or safety-critical copy** — terms, refund/cancellation policy, privacy language, medical/financial/insurance claims, eligibility or disclosure wording. Design the slot and the hierarchy; the wording is owned by legal/compliance. Do not author or restate regulated text as if it were verified.
- **Accessibility / WCAG conformance claims** — any published "WCAG 2.x AA compliant" / "accessible" badge or statement. The skill specifies accessible structure and intent; a conformance claim requires a real audit and an accessibility owner. State intent ("semantic order, keyboard-complete, contrast-checked") instead of asserting conformance that has not been tested.
- **Consent and dark-pattern-adjacent flows** — anything touching opt-in/opt-out, marketing or data-sharing consent, cookie/tracking choices, default-on toggles, cancellation friction, confirmshaming, or pre-checked boxes. Even a well-intentioned design here can cross into a consent-validity or regulatory problem; surface the trade-off and route the final consent UX to legal/privacy.
- **Role-gated and permission-sensitive surfaces** — admin panels, multi-tenant data, billing/finance actions, anything where different roles must see different data and actions. The visual gating is the skill's; the authorization model and the server-side enforcement belong to the system-architecture owner. Never present client-side hiding as access control.
- **Unverifiable proof and trust signals** — testimonials, customer logos, certification/security badges, usage counts, guarantees, benchmark numbers. Mark them as placeholders pending verification; the decision to publish a specific claim belongs to the owner of that fact (marketing/security/legal), never invented to fill the layout.
- **Irreversible or high-impact destructive UI** — flows that delete tenants/accounts, export bulk personal data, or trigger payments. Design the confirmation, the consequence text, and the recovery; the decision to expose the action to a given role is the product/security owner's.

The default posture for all of the above: produce the structure, the states, the accessibility intent, and the acceptance criteria; flag the claim or the gate explicitly; then stop and route to the owner. Do not publish a regulated claim, a conformance badge, or a consent flow on your own authority — and never call a page done until it has been opened and observed in the running UI.

### Owned future-improvement items

- Add a second worked example for a **role-gated admin/settings surface** (admin vs member vs read-only views from one entity), since the current worked example is a single-role dashboard and role-scoping is a top reviewer probe.
- Add a **consent / opt-in pattern** to `patterns.md` (affirmative, unbundled, purpose-visible) as the ethical counter-pattern to the dark-pattern refusals, so the skill teaches the right structure and not only the refusal.
- Add a **state-matrix completeness checklist** (loading, empty, error, success, permission, validation, partial, degraded, offline) as a copy-ready artifact, so state coverage is mechanical rather than remembered.
- Add an **accessibility intent vs conformance** worked snippet showing the exact safe phrasing to use when no audit has happened, to make the WCAG-claim gate concrete.
- Cross-link the conversion/landing overlap explicitly to `sales-revenue-growth` and the permission/data-contract overlap to `software-systems-architecture`, beyond the support-skill pointers already in `SKILL.md`.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը նախագծում և դատում է interface-ի կառուցվածքի մասին. այն արտադրում է էջի պլանը, վիճակները և handoff-ը, բայց պետք է ուղղորդի մարդ-տիրոջը — ոչ պնդի, ոչ ինքնահաստատի, ոչ հրապարակի — երբ էջը անում է իրավականորեն կամ փաստացի կրող claim, gate է անում access-ը, գրավում է consent կամ product-ը commit է անում design-system-ի պայմանագրի։ Կանգնի՛ր և ուղղորդիր նշված owner-ին, երբ․

- **Իրավական, կարգավորվող կամ safety-critical copy** — terms, refund/cancellation policy, privacy լեզու, բժշկական/ֆինանսական/ապահովագրական claim-եր, eligibility կամ disclosure ձևակերպում։ Նախագծի՛ր slot-ը և hierarchy-ն. ձևակերպումը legal/compliance-ինն է։ Մի՛ հեղինակիր կամ վերաշարադրիր կարգավորվող տեքստը այնպես, կարծես ստուգված է։
- **Accessibility / WCAG conformance claim-եր** — ցանկացած հրապարակվող «WCAG 2.x AA compliant» / «accessible» badge կամ հայտարարություն։ Skill-ը հստակեցնում է accessible կառուցվածք և intent. conformance claim-ը պահանջում է իրական audit և accessibility owner։ Նշի՛ր intent-ը («semantic order, keyboard-complete, contrast-checked») չ-test-ված conformance պնդելու փոխարեն։
- **Consent և dark-pattern-հարակից flow-եր** — ամեն ինչ, որ առնչվում է opt-in/opt-out-ի, marketing կամ data-sharing consent-ի, cookie/tracking ընտրության, default-on toggle-ների, cancellation friction-ի, confirmshaming-ի կամ pre-checked box-երի։ Նույնիսկ բարի մտադրությամբ design-ը այստեղ կարող է անցնել consent-validity կամ regulatory խնդրի։ Ցույց տուր trade-off-ը և վերջնական consent UX-ը ուղղորդիր legal/privacy-ին։
- **Role-gated և permission-զգայուն surface-ներ** — admin panel-ներ, multi-tenant data, billing/finance գործողություններ, ամեն ինչ, որտեղ տարբեր role-եր պետք է տեսնեն տարբեր data և գործողություններ։ Տեսողական gating-ը skill-ինն է. authorization model-ը և server-side enforcement-ը system-architecture owner-ինն է։ Երբեք client-side թաքցնելը մի՛ ներկայացրու որպես access control։
- **Չստուգելի proof և trust signal-ներ** — testimonial-ներ, customer logo-ներ, certification/security badge-եր, usage count-եր, guarantee-ներ, benchmark թվեր։ Նշի՛ր դրանք որպես placeholder՝ verification-ի սպասումով. կոնկրետ claim հրապարակելու որոշումը այդ փաստի owner-ինն է (marketing/security/legal), երբեք հորինված՝ layout-ը լցնելու համար։
- **Անդառնալի կամ high-impact destructive UI** — flow-եր, որ ջնջում են tenant/account, export են անում bulk personal data կամ trigger են անում payment։ Նախագծի՛ր confirmation-ը, consequence text-ը և recovery-ն. տվյալ role-ին գործողությունը բացելու որոշումը product/security owner-ինն է։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր կառուցվածքը, վիճակները, accessibility intent-ը և ընդունման չափանիշները. claim-ը կամ gate-ը բացահայտ flag արա. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Կարգավորվող claim, conformance badge կամ consent flow մի՛ հրապարակիր սեփական լիազորությամբ — և երբեք էջը done մի՛ անվանիր, քանի դեռ այն չի բացվել ու դիտվել running UI-ում։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու երկրորդ worked example **role-gated admin/settings surface**-ի համար (admin vs member vs read-only view-եր մեկ entity-ից), քանի որ ընթացիկ worked example-ը single-role dashboard է, իսկ role-scoping-ը գլխավոր reviewer probe է։
- Ավելացրու **consent / opt-in pattern** `patterns.md`-ին (հաստատող, unbundled, purpose-visible) որպես dark-pattern մերժումների էթիկական հակա-pattern, որ skill-ը սովորեցնի ճիշտ կառուցվածքը, ոչ միայն մերժումը։
- Ավելացրու **state-matrix-ի ամբողջականության checklist** (loading, empty, error, success, permission, validation, partial, degraded, offline) որպես copy-ready artifact, որ state coverage-ը մեխանիկական լինի, ոչ հիշվող։
- Ավելացրու **accessibility intent vs conformance** worked հատված, որ ցույց տա ճշգրիտ անվտանգ ձևակերպումը, երբ audit չի եղել, որ WCAG-claim gate-ը կոնկրետ լինի։
- Cross-link արա conversion/landing համընկնումը բացահայտ `sales-revenue-growth`-ին, իսկ permission/data-contract համընկնումը՝ `software-systems-architecture`-ին, `SKILL.md`-ում արդեն եղած support-skill pointer-ներից այն կողմ։
