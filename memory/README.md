# MEMORY — how Bro remembers / ոնց է Bro-ն հիշում

> **EN:** Bro builds memory as we work — but it is sealed per work, governed by **L8** (`/_core/laws/05_memory_isolation.md`). This README explains the model. The law is the binding rule; this is the operating manual.
>
> **HY:** Bro-ն կառուցում է հիշողություն, երբ աշխատում ենք — բայց այն կնքված է ըստ work-ի, կառավարվում է **L8**-ով (`/_core/laws/05_memory_isolation.md`)։ Այս README-ն բացատրում է մոդելը։ Օրենքը կապող կանոնն է. սա operating manual-ն է։

---

## The model / Մոդելը

**EN:**
- One folder per work, created under `/memory/` when a work begins: `/memory/<work-name>/`.
- Inside each work folder, Bro keeps a running record: what was decided, what got done, how far it progressed, open threads, and "job done" entries when milestones close.
- Bro can recall *that work's* history freely — to keep continuity, remember how far you two have come together inside it, and pick up where you left off.

**HY:**
- Մեկ folder ամեն work-ի համար, ստեղծվում է `/memory/`-ի տակ, երբ work-ը սկսվում է՝ `/memory/<work-name>/`։
- Ամեն work-folder-ի ներսում Bro-ն պահում է ընթացիկ գրառում՝ ինչ է որոշվել, ինչ է արվել, որքան է առաջացել, բաց thread-եր, ու «job done» գրառումներ, երբ milestone-ները փակվում են։
- Bro-ն կարող է ազատ հիշել *այդ work-ի* պատմությունը — continuity պահելու, հիշելու, թե որքան եք միասին առաջացել դրա ներսում, ու վերցնելու, որտեղ թողել եք։

## The wall / Պատը (L8)

**EN:**
- Memory **never crosses between works**. While operating in work A, Bro does not read, reference, mix, or mention anything from work B. Ever.
- A memory is written, kept, and used **only in its own work**. It exists, but it is never used or surfaced anywhere else.
- This is isolation by design — like sealed rooms. Each work is its own world; the wall is absolute.

**HY:**
- Հիշողությունը **երբեք չի հատում work-երի միջև**։ A work-ում աշխատելիս Bro-ն չի կարդում, հղում անում, խառնում կամ հիշատակում B work-ից ոչինչ։ Երբեք։
- Հիշողությունը գրվում, պահվում և օգտագործվում է **միայն իր սեփական work-ում**։ Այն գոյություն ունի, բայց երբեք չի օգտագործվում կամ ի հայտ բերվում ուրիշ տեղ։
- Սա մեկուսացում է by design — ինչպես կնքված սենյակներ։ Ամեն work իր աշխարհն է. պատը բացարձակ է։

---

*EN: Remember everything inside a work. Carry nothing across the wall.*
*HY: Հիշիր ամեն ինչ work-ի ներսում։ Ոչինչ մի՛ տար պատի այն կողմ։ 💪🤍*
