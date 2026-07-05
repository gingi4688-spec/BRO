# ui page structure domain rubric

## English

Score each category from 1 to 5. A production-ready page-structure answer must average 4.3 or higher, with no score below 4 for real customer-facing work.

| Category | 5 means | 3 means | 1 means |
|---|---|---|---|
| Page job clarity | The user job, business job, page promise, and primary action are explicit | The page type is named but the job is partly inferred | The answer lists sections without knowing why the page exists |
| Decision flow | Section order follows the user's questions and risk curve | Sections are plausible but not clearly sequenced by decision logic | Sections are decorative, internal, or random |
| Hierarchy and actions | One primary action is clear per stage; secondary actions are demoted | CTAs exist but compete in some areas | Multiple primary CTAs fight for attention |
| State coverage | Loading, empty, error, success, permission, validation, partial-data, and degraded states are considered when relevant | Some states are named but not designed | Only the happy path exists |
| Responsive behavior | Mobile, tablet, and desktop behavior changes are specified by component and priority | Breakpoints are mentioned generally | Desktop layout is simply squeezed |
| Accessibility | Semantic order, labels, keyboard flow, focus, contrast intent, errors, and motion are addressed | Accessibility is mentioned as a final checklist item | Accessibility is absent or falsely claimed |
| Component handoff | Components, data needs, interactions, and acceptance criteria are build-ready | Component list exists but dependencies are vague | Developers would need to guess structure and behavior |
| Evidence discipline | Facts, assumptions, and recommendations are separated; no invented metrics or claims | Assumptions are present but not always labeled | Unsupported claims drive the design |

### Severity labels for critique

- **P0 blocking** — a user cannot complete the primary task, a harmful or irreversible action is unsafe, the page leaks private data, or the design makes an unsupported factual/compliance claim.
- **P1 material** — the main flow works but hierarchy, trust, state coverage, mobile behavior, or accessibility is materially weak.
- **P2 polish** — the page works, but refinements would improve clarity, speed, scannability, or consistency.

### Passing answer shape

A strong answer does not need to be long. It needs to show the page's decision logic, then make concrete structural choices. It must avoid generic commands like "make it cleaner" unless it immediately names the exact section, component, state, or rule to change.

## Հայերեն

Յուրաքանչյուր բաժինը գնահատիր 1-ից 5։ Արտադրական պատրաստ էջի կառուցվածքի պատասխանը պետք է ունենա միջինում 4.3 կամ ավելի բարձր գնահատական, իսկ իրական customer-facing աշխատանքի համար ոչ մի բաժին չպետք է լինի 4-ից ցածր։

| Բաժին | 5 նշանակում է | 3 նշանակում է | 1 նշանակում է |
|---|---|---|---|
| Էջի գործի հստակություն | Օգտագործողի գործը, բիզնես գործը, էջի խոստումը և գլխավոր գործողությունը հստակ են | Էջի տեսակը նշված է, բայց գործը մասամբ է եզրակացված | Պատասխանը թվարկում է բաժիններ՝ առանց հասկանալու էջի գոյության պատճառը |
| Որոշման հոսք | Բաժինների հերթականությունը հետևում է օգտագործողի հարցերին և ռիսկի կորին | Բաժինները հավանական են, բայց որոշման տրամաբանությամբ հստակ չեն դասավորված | Բաժինները դեկորատիվ են, ներքին կամ պատահական |
| Հիերարխիա և գործողություններ | Յուրաքանչյուր փուլում մեկ գլխավոր գործողություն է հստակ, երկրորդականները իջեցված են | CTA-ներ կան, բայց որոշ տեղերում մրցում են | Մի քանի primary CTA-ներ պայքարում են ուշադրության համար |
| Վիճակների ծածկույթ | Loading, empty, error, success, permission, validation, partial-data և degraded վիճակները դիտարկված են, երբ տեղին են | Որոշ վիճակներ անվանված են, բայց չեն նախագծված | Կա միայն happy path-ը |
| Responsive վարք | Mobile, tablet և desktop վարքը նշված է ըստ component-ի և priority-ի | Breakpoint-երը նշված են ընդհանուր | Desktop layout-ը պարզապես սեղմված է |
| Մատչելիություն | Semantic order-ը, label-ները, keyboard flow-ն, focus-ը, contrast intent-ը, error-ները և motion-ը դիտարկված են | Մատչելիությունը նշված է որպես վերջնական checklist | Մատչելիությունը բացակայում է կամ կեղծ է պնդված |
| Component handoff | Component-ները, data need-երը, interaction-ները և ընդունման չափանիշները build-ready են | Component list կա, բայց dependency-ները մշուշոտ են | Developer-ները պետք է գուշակեն կառուցվածքն ու վարքը |
| Ապացույցների կարգապահություն | Փաստերը, ենթադրությունները և առաջարկությունները բաժանված են, հորինված metric կամ claim չկա | Ենթադրություններ կան, բայց միշտ պիտակավորված չեն | Չապացուցված պնդումները ղեկավարում են դիզայնը |

### Խստության պիտակներ critique-ի համար

- **P0 blocking** — օգտագործողը չի կարող ավարտել գլխավոր task-ը, վնասակար կամ անդառնալի գործողությունը անվտանգ չէ, էջը բացահայտում է մասնավոր տվյալ, կամ դիզայնը անում է չապացուցված factual կամ compliance պնդում։
- **P1 material** — գլխավոր flow-ն աշխատում է, բայց hierarchy-ն, trust-ը, state coverage-ը, mobile վարքը կամ մատչելիությունը նյութականորեն թույլ են։
- **P2 polish** — էջը աշխատում է, բայց refinement-ները կբարձրացնեն պարզությունը, արագությունը, scannability-ն կամ consistency-ն։

### Անցնող պատասխանի ձև

Ուժեղ պատասխանը պարտադիր երկար չէ։ Այն պետք է ցույց տա էջի որոշման տրամաբանությունը, հետո անի կոնկրետ կառուցվածքային ընտրություններ։ Այն պետք է խուսափի «ավելի մաքուր դարձրու» տեսակի generic հրահանգներից, եթե անմիջապես չի նշում ճշգրիտ բաժինը, component-ը, վիճակը կամ փոխելու կանոնը։
