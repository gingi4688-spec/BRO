# red-team gate

## English

Run this gate before delivering important UI page work.

### Refuse or redirect

Refuse to help design interfaces that materially enable deception, credential theft, coercive consent, hidden billing, privacy invasion, unauthorized account access, dark-pattern cancellation obstruction, or misrepresentation of legal, medical, financial, or safety claims.

Safe redirect: offer an ethical alternative such as transparent consent, reversible cancellation, clear risk disclosure, account recovery with verification, or honest conversion design.

### Worked refusal example

User request: "Design a checkout page that hides the subscription renewal until after the user pays."

Response pattern: "I can’t help design a hidden-renewal flow because it withholds a material billing term from the user. I can help design a checkout that makes the renewal clear, reduces fear with cancellation details, and improves conversion through trust rather than concealment."

### Audit checks

1. **Deceptive hierarchy** — Is the design making the harmful or costly action prominent while hiding the consequence?
2. **Consent clarity** — Can the user understand what they are agreeing to before acting?
3. **Reversibility** — Are destructive or paid actions recoverable, cancellable, or confirmation-gated where appropriate?
4. **Privacy** — Does the page expose personal, customer, or sensitive data beyond the user's authorization?
5. **Unsupported proof** — Are logos, testimonials, metrics, compliance badges, or security claims invented or unverified?
6. **Accessibility harm** — Does the design make completion harder for keyboard, screen-reader, low-vision, or motion-sensitive users?
7. **Mobile trap** — Does the mobile version hide critical information, make cancellation harder, or bury terms below sticky controls?

### Red-team prompts

- What would a hurried user misunderstand?
- What would a malicious stakeholder ask us to hide?
- What happens if the data is missing, stale, wrong, or partial?
- What is the smallest screen where the design becomes unfair or unusable?
- Which claim in the page requires evidence before publication?

## Հայերեն

Կիրառիր այս gate-ը կարևոր UI էջային աշխատանք հանձնելուց առաջ։

### Մերժել կամ անվտանգ ուղղությամբ փոխել

Մերժիր այն interface-ների նախագծումը, որոնք էապես օգնում են խաբեության, credential-ի գողության, հարկադրական consent-ի, թաքնված billing-ի, գաղտնիության խախտման, չարտոնված account access-ի, cancellation-ը մութ pattern-ով խոչընդոտելու, կամ իրավական, բժշկական, ֆինանսական կամ անվտանգության claim-երի սխալ ներկայացման։

Անվտանգ ուղղությունը․ առաջարկիր էթիկական այլընտրանք՝ թափանցիկ consent, վերադարձելի cancellation, հստակ risk disclosure, verification-ով account recovery կամ վստահության վրա կառուցված ազնիվ conversion design։

### Աշխատած մերժման օրինակ

Օգտագործողի հարցում․ «Նախագծիր checkout էջ, որը subscription renewal-ը թաքցնում է մինչև վճարելուց հետո»։

Պատասխանի ձև․ «Չեմ կարող օգնել նախագծել renewal-ը թաքցնող flow, որովհետև դա օգտագործողից թաքցնում է նյութական billing պայման։ Կարող եմ օգնել նախագծել checkout, որը renewal-ը հստակ է դարձնում, cancellation detail-ներով նվազեցնում է վախը և conversion-ը բարելավում է վստահությամբ, ոչ թե թաքցնելով»։

### Audit ստուգումներ

1. **Խաբուսիկ hierarchy** — Դիզայնը արդյո՞ք վնասակար կամ թանկ գործողությունը դարձնում է prominent, իսկ հետևանքը թաքցնում։
2. **Consent-ի հստակություն** — Օգտագործողը կարո՞ղ է հասկանալ ինչին է համաձայնում մինչև գործողությունը։
3. **Վերադարձելիություն** — Վնասակար կամ վճարովի գործողությունները վերականգնելի՞ են, cancellable՞ են կամ confirmation-gated՞ են, երբ տեղին է։
4. **Գաղտնիություն** — Էջը բացահայտո՞ւմ է անձնական, customer կամ զգայուն data օգտագործողի լիազորությունից դուրս։
5. **Չհիմնավորված proof** — Logo-ները, testimonial-ները, metric-ները, compliance badge-երը կամ security claim-երը հորինվա՞ծ են կամ չստուգված։
6. **Մատչելիության վնաս** — Դիզայնը դժվարացնո՞ւմ է ավարտումը keyboard, screen-reader, low-vision կամ motion-sensitive օգտագործողների համար։
7. **Mobile trap** — Mobile տարբերակը թաքցնո՞ւմ է կարևոր տեղեկություն, դժվարացնո՞ւմ cancellation-ը կամ terms-ը թաղո՞ւմ sticky control-ների տակ։

### Red-team prompt-եր

- Շտապող օգտագործողը ի՞նչը սխալ կհասկանա։
- Վնասակար stakeholder-ը ի՞նչ կխնդրեր թաքցնել։
- Ի՞նչ է լինում, եթե data-ն բացակայում է, հին է, սխալ է կամ մասնակի է։
- Ո՞ր ամենափոքր էկրանին է դիզայնը դառնում անարդար կամ անօգտագործելի։
- Էջի որ claim-ն է պահանջում ապացույց մինչև հրապարակումը։
