# output templates

## English

Use these templates when the user asks for a structured artifact. Do not force a template onto a casual question.

### Template A — page structure creation

```markdown
## Page frame
- User job:
- Business job:
- Page promise:
- Primary action:
- Assumptions:

## Decision flow
1. Question the user asks:
   - Section/component:
   - Purpose:
   - Primary content:
   - Action:
   - Risk handled:

## Layout plan
- Desktop:
- Tablet:
- Mobile:

## Component inventory
| Component | Purpose | Data needed | States | Notes |
|---|---|---|---|---|

## State matrix
| State | Trigger | UI behavior | Copy intent | Recovery |
|---|---|---|---|---|

## Accessibility notes
- Structure:
- Keyboard/focus:
- Forms/errors:
- Motion/contrast intent:

## Acceptance criteria
- [ ]
```

### Template B — severity-ranked critique

```markdown
## Verdict
One-sentence diagnosis.

## Findings
| Severity | Issue | Why it matters | Fix | Acceptance test |
|---|---|---|---|---|

## Rebuilt hierarchy
1.
2.
3.

## Risk notes
- Facts:
- Assumptions:
- Needs verification:
```

### Template C — developer handoff

```markdown
## Scope
- Page/screen:
- Users/roles:
- Out of scope:

## Components
| Component | Props/data | Behavior | States | Analytics/evaluation |
|---|---|---|---|---|

## Interaction rules
1.

## Responsive rules
| Breakpoint/context | Behavior |
|---|---|

## Accessibility and QA
- Keyboard path:
- Screen-reader structure:
- Error handling:
- Performance sensitivity:

## Done criteria
- [ ]
```

## Հայերեն

Օգտագործիր այս ձևանմուշները, երբ օգտագործողը կառուցվածքային artifact է խնդրում։ Մի պարտադրիր ձևանմուշը սովորական հարցին։

### Ձևանմուշ A — էջի կառուցվածքի ստեղծում

```markdown
## Էջի շրջանակ
- Օգտագործողի գործը․
- Բիզնես գործը․
- Էջի խոստումը․
- Գլխավոր գործողությունը․
- Ենթադրություններ․

## Որոշման հոսք
1. Օգտագործողի հարցը․
   - Բաժին կամ component․
   - Նպատակ․
   - Գլխավոր content․
   - Գործողություն․
   - Կառավարվող ռիսկ․

## Layout պլան
- Desktop․
- Tablet․
- Mobile․

## Component inventory
| Component | Նպատակ | Պահանջվող data | Վիճակներ | Նշումներ |
|---|---|---|---|---|

## Վիճակների մատրիցա
| Վիճակ | Trigger | UI վարք | Copy intent | Վերականգնում |
|---|---|---|---|---|

## Մատչելիության նշումներ
- Կառուցվածք․
- Keyboard և focus․
- Form-եր և error-ներ․
- Motion և contrast intent․

## Ընդունման չափանիշներ
- [ ]
```

### Ձևանմուշ B — խստությամբ դասավորված critique

```markdown
## Վճիռ
Մեկ նախադասությամբ diagnosis։

## Գտածոներ
| Խստություն | Խնդիր | Ինչու է կարևոր | Շտկում | Ընդունման test |
|---|---|---|---|---|

## Վերակառուցված hierarchy
1.
2.
3.

## Ռիսկի նշումներ
- Փաստեր․
- Ենթադրություններ․
- Ստուգման կարիք ունի․
```

### Ձևանմուշ C — developer handoff

```markdown
## Scope
- Էջ կամ էկրան․
- Օգտագործողներ կամ role-եր․
- Scope-ից դուրս․

## Component-ներ
| Component | Prop կամ data | Վարք | Վիճակներ | Analytics կամ evaluation |
|---|---|---|---|---|

## Interaction կանոններ
1.

## Responsive կանոններ
| Breakpoint կամ context | Վարք |
|---|---|

## Մատչելիություն և QA
- Keyboard path․
- Screen-reader structure․
- Error handling․
- Performance sensitivity․

## Done criteria
- [ ]
```
