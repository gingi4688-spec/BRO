---
name: "ui-page-structure-design"
description: >-
  use when designing, reviewing, restructuring, or specifying user-interface pages, product screens, saas dashboards, admin panels, landing pages, pricing pages, onboarding flows, component hierarchies, responsive behavior, accessibility states, or developer handoff for page-level ui. use as lead when the user's main need is page structure, interaction hierarchy, task flow, conversion flow, information architecture, screen states, or ui implementation readiness. do not use as lead for pure copywriting, backend architecture, financial modeling, roadmap prioritization, or legal/compliance review unless the ui page or screen design is the central artifact. հայերեն՝ օգտագործիր, երբ պետք է նախագծել, վերանայել կամ հստակեցնել էջի կամ էկրանի կառուցվածքը, հիերարխիան, վիճակները, responsive վարքը, մատչելիությունը կամ developer handoff-ը։
---

# UI page structure design

## English

Load `../shared/OPERATING_PROTOCOL.md` first. Then use this skill as the lead lens for page-level interface work.

This skill does not decorate screens. It turns user intent, business intent, content priority, interaction states, responsive constraints, accessibility requirements, and implementation realities into a page structure another designer or developer can build.

### Required local files

- `manual.md` — the operating manual and decision rules.
- `domain-rubric.md` — scoring standards for page structure quality.
- `patterns.md` — reusable page, section, and state patterns.
- `output-templates.md` — deliverable formats for creation, critique, and handoff.
- `red-team-gate.md` — failure tests and refusal or boundary behavior.
- `worked-example.md` — complete example of a senior-quality output.
- `tests/eval-prompts.md` — per-prompt regression tests.
- `tests/red-team-prompts.md` — adversarial/safety prompts with a pass-bar (dark patterns, accessibility-washing, role-gating bypass).
- `OWNER_NOTES.md` — when to route to a human owner (legal/regulated copy, WCAG claims, consent flows, role-gated surfaces) and owned future items.

### Operating sequence

1. Identify the page job. Ask what the user must understand, decide, or do.
2. Identify the primary user, their context, and their likely stage of intent. If unknown, state a labeled assumption.
3. Map the decision flow before naming sections. A good page follows the user's sequence of questions, not the organization's internal structure.
4. Assign one primary action per view or stage. Secondary actions must be visibly subordinate.
5. Decide the role-gating before the layout. If different roles see the surface (admin, member, read-only, owner, guest), each role sees different sections, fields, and actions — so design the actual permission-limited view for each, not one blind template with privileged content hidden by CSS. Authorization is enforced server-side; the UI requests and renders only what the role may see. State which role each section, field, and action belongs to.
6. Specify states: loading, empty, error, success, permission, validation, partial data, and degraded content.
7. Specify responsive behavior. Mobile is not a squeezed desktop; it changes priority, navigation, density, and input cost.
8. Specify accessibility. Include semantic structure, keyboard flow, focus behavior, contrast intent, labels, error text, and reduced-motion considerations when relevant.
9. Finish with developer handoff and acceptance criteria when the user is building or reviewing a real surface.

### Acceptance criteria

Before calling page work done, confirm:

- **Verify in the running UI, never assume.** A page is not done because the spec is written, the build is green, or the markup looks right. Open the surface in the running app and observe it: it renders, the primary action is reachable, the empty/error/permission/loading states actually appear, and the keyboard path completes. "Spec-complete" and "compiles" are not "verified."
- **Role-limited views exist where roles differ.** Each role that reaches the surface has its own designed view; no privileged section, field, or action is shipped to a role that may not use it (and never merely CSS-hidden over data the client still receives).
- The page job, primary user, and one primary action per stage are explicit.
- The state matrix is complete for the states that apply, and mobile behavior is specified by component and priority, not squeezed.
- Accessibility intent is stated (semantic order, keyboard, focus, labels, contrast, motion); no untested conformance claim ("WCAG compliant") is asserted.
- Facts, assumptions, and recommendations are separated; no invented metrics, logos, prices, or compliance badges.

### When to use supporting skills

Use `sales-revenue-growth` as support for landing pages, pricing pages, funnels, CTA strategy, or conversion objections. Use `communication-writing-negotiation` as support when the main weakness is wording, persuasion, or message architecture. Use `product-project-management` as support when the task depends on scope, roadmap, prioritization, or acceptance criteria beyond the page. Use `software-systems-architecture` as support when the UI depends on APIs, permissions, realtime behavior, data contracts, or performance architecture.


### Locked shape rule for future dual-use skills

This UI skill is not an offensive or dual-use security skill, so its refusal examples may live in `red-team-gate.md`. Future dual-use skills must not copy that placement as a substitute. They must inline the authorization/refusal gate and a worked refusal example inside their own `SKILL.md`; a separate red-team file may only extend the main-file gate with additional tests.

### Final gate

Before finalizing, score the work against `domain-rubric.md`. If the answer is important, include acceptance criteria. If the user asked for a reusable artifact, use `output-templates.md`.

## Հայերեն

Նախ բեռնիր `../shared/OPERATING_PROTOCOL.md` ֆայլը։ Հետո այս skill-ը օգտագործիր որպես գլխավոր ոսպնյակ էջի մակարդակի interface աշխատանքի համար։

Այս skill-ը էկրաններ չի զարդարում։ Այն օգտագործողի մտադրությունը, բիզնես նպատակը, content-ի առաջնահերթությունը, interaction վիճակները, responsive սահմանափակումները, մատչելիության պահանջները և իրականացման իրողությունները դարձնում է էջի կառուցվածք, որը կարող է կառուցել մեկ այլ designer կամ developer։

### Պարտադիր տեղային ֆայլեր

- `manual.md` — աշխատանքային ձեռնարկը և որոշման կանոնները։
- `domain-rubric.md` — էջի կառուցվածքի որակի գնահատման չափանիշները։
- `patterns.md` — կրկնօգտագործվող էջային, բաժնային և վիճակային pattern-երը։
- `output-templates.md` — ստեղծման, քննադատության և handoff-ի ձևաչափերը։
- `red-team-gate.md` — ձախողման ստուգումները և մերժման կամ սահմանների վարքը։
- `worked-example.md` — senior մակարդակի ամբողջական օրինակը։
- `tests/eval-prompts.md` — յուրաքանչյուր prompt-ի regression test-երը։
- `tests/red-team-prompts.md` — adversarial/safety prompt-ներ pass-bar-ով (dark pattern-ներ, accessibility-washing, role-gating bypass)։
- `OWNER_NOTES.md` — երբ ուղղորդել մարդ-owner-ին (legal/կարգավորվող copy, WCAG claim-եր, consent flow-եր, role-gated surface-ներ) և սեփական ապագա կետեր։

### Աշխատանքային հերթականություն

1. Պարզիր էջի գործը։ Հարցրու՝ օգտագործողը ինչ պետք է հասկանա, որոշի կամ անի։
2. Պարզիր գլխավոր օգտագործողին, նրա համատեքստը և մտադրության հավանական փուլը։ Եթե անհայտ է, գրիր պիտակավորված ենթադրություն։
3. Մինչ բաժինների անունները տալը քարտեզագրիր որոշման հոսքը։ Լավ էջը հետևում է օգտագործողի հարցերի հերթականությանը, ոչ թե կազմակերպության ներքին կառուցվածքին։
4. Յուրաքանչյուր view-ի կամ փուլի համար նշանակիր մեկ գլխավոր գործողություն։ Երկրորդական գործողությունները պետք է տեսանելիորեն ստորադաս լինեն։
5. Որոշիր role-gating-ը նախքան layout-ը։ Եթե surface-ը տեսնում են տարբեր role-եր (admin, member, read-only, owner, guest), ամեն role տեսնում է տարբեր բաժիններ, field-եր և գործողություններ — ուստի նախագծիր իրական permission-limited view-ը յուրաքանչյուրի համար, ոչ թե մեկ կույր template՝ privileged content-ը CSS-ով թաքցրած։ Authorization-ը enforce է լինում server-side-ում. UI-ը հարցում և render է անում միայն այն, ինչ role-ին թույլատրված է։ Նշիր, թե յուրաքանչյուր բաժին, field և գործողություն որ role-ին է պատկանում։
6. Հստակեցրու վիճակները՝ loading, empty, error, success, permission, validation, partial data և degraded content։
7. Հստակեցրու responsive վարքը։ Mobile-ը սեղմված desktop չէ․ այն փոխում է առաջնահերթությունը, navigation-ը, խտությունը և input-ի արժեքը։
8. Հստակեցրու մատչելիությունը։ Ներառիր semantic structure, keyboard flow, focus behavior, contrast intent, label-ներ, error text և reduced-motion նկատառումներ, երբ տեղին է։
9. Ավարտիր developer handoff-ով և ընդունման չափանիշներով, երբ օգտագործողը իրական surface է կառուցում կամ վերանայում։

### Ընդունման չափանիշներ

Նախքան էջի աշխատանքը done անվանելը, հաստատի՛ր․

- **Ստուգի՛ր running UI-ում, երբեք մի՛ ենթադրիր։** Էջը done չէ այն պատճառով, որ spec-ը գրված է, build-ը green է կամ markup-ը ճիշտ տեսք ունի։ Բացի՛ր surface-ը running app-ում և դիտի՛ր այն․ render է լինում, primary action-ը հասանելի է, empty/error/permission/loading վիճակները իրականում երևում են, և keyboard path-ն ավարտվում է։ «Spec-complete»-ը և «compile է լինում»-ը «verified» չեն։
- **Role-limited view-եր կան, որտեղ role-երը տարբեր են։** Surface հասնող յուրաքանչյուր role ունի իր նախագծված view-ը. ոչ մի privileged բաժին, field կամ գործողություն ship չի լինում role-ին, որ չի կարող այն օգտագործել (և երբեք պարզապես CSS-ով թաքցրած data-ի վրա, որ client-ը դեռ ստանում է)։
- Էջի գործը, գլխավոր օգտագործողը և յուրաքանչյուր փուլում մեկ primary action-ը հստակ են։
- State matrix-ը ամբողջական է կիրառելի վիճակների համար, և mobile վարքը նշված է ըստ component-ի և priority-ի, ոչ սեղմված։
- Accessibility intent-ը նշված է (semantic order, keyboard, focus, label-ներ, contrast, motion). չ-test-ված conformance claim («WCAG compliant») չի պնդվում։
- Փաստերը, ենթադրությունները և առաջարկությունները բաժանված են. հորինված metric, logo, գին կամ compliance badge չկա։

### Երբ օգտագործել օժանդակ skill-եր

`Sales-revenue-growth` skill-ը օգտագործիր որպես աջակցություն landing page-երի, pricing page-երի, funnel-ների, CTA strategy-ի կամ conversion objection-ների համար։ `Communication-writing-negotiation` skill-ը օգտագործիր, երբ հիմնական թուլությունը wording-ն է, համոզումը կամ message architecture-ը։ `Product-project-management` skill-ը օգտագործիր, երբ խնդիրը կախված է scope-ից, roadmap-ից, prioritization-ից կամ էջից դուրս ընդունման չափանիշներից։ `Software-systems-architecture` skill-ը օգտագործիր, երբ UI-ը կախված է API-ներից, permission-ներից, realtime վարքից, data contract-ներից կամ performance architecture-ից։


### Կողպված ձևի կանոն ապագա երկակի օգտագործման skill-երի համար

Այս UI skill-ը offensive կամ երկակի օգտագործման security skill չէ, ու դրա մերժման օրինակները կարող են մնալ `red-team-gate.md` ֆայլում։ Ապագա երկակի օգտագործման skill-երը չպետք է այս տեղադրումը կրկնօրինակեն որպես փոխարինող։ Դրանք պետք է authorization/refusal gate-ը և աշխատած մերժման օրինակը ներառեն հենց իրենց `SKILL.md` ֆայլում․ առանձին red-team ֆայլը կարող է միայն լրացուցիչ test-երով ընդլայնել հիմնական ֆայլի gate-ը։

### Վերջնական gate

Վերջնականացնելուց առաջ աշխատանքը գնահատիր `domain-rubric.md` ֆայլով։ Եթե պատասխանը կարևոր է, ներառիր ընդունման չափանիշներ։ Եթե օգտագործողը reusable artifact է խնդրել, կիրառիր `output-templates.md` ֆայլը։
