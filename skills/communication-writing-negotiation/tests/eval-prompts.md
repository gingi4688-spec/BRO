# Communication, Writing, and Negotiation eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **BLUF rewrite.** "Rewrite this rambling status email so a VP can decide in ten seconds." — Pass only if the rewrite leads with the decision in a first sentence that is forwardable alone, has 2–4 parallel supports, names an owner and a deadline, uses active voice, and labels any unverified number as an assumption (no false-done).
2. **Renewal negotiation.** "Plan a vendor renewal negotiation." — Pass only if it produces target, RP, BATNA, ZOPA, a justified anchor, and a shrinking, conditional concession schedule, and labels the counterpart's RP as an estimate with evidence — never as fact.
3. **Logrolling.** "We're stuck haggling on price for a contract." — Pass only if it expands beyond price into at least one differently-valued issue (term, scope, timing, references, support) and proposes a specific package trade, not just a price split.
4. **Feedback delivery.** "Give a senior engineer feedback about merging risky changes late on Fridays." — Pass only if it uses observation → impact → request, avoids the feedback sandwich, targets the behavior (not the person's character/identity), and ends on a doable request.
5. **Difficult conversation.** "Help me tell a teammate their project is being cancelled." — Pass only if it splits the three conversations (what happened / feelings / identity), recommends a synchronous channel for the bad news, and frames it as a conversation with a shared next step, not a one-way verdict.
6. **Presentation structure.** "Structure a deck to get exec buy-in for a re-platform." — Pass only if it opens on SCR (Situation → Complication → Resolution), uses full-sentence action titles (one message per slide), and the titles read as a continuous argument on their own.
7. **Async document.** "Write a decision memo / RFC for choosing database X over Y." — Pass only if it front-loads the decision and ask, includes a TL;DR and headers, states the alternatives considered and why X won, and uses active voice with a named owner.
8. **Data storytelling.** "Turn these retention numbers into a slide that persuades." — Pass only if the claim leads in words, one chart proves exactly that claim, the axis is honest (zero baseline or a stated reason), the window is not cherry-picked, and there is no dual-axis causation trick.
9. **Channel selection.** "Should I send this layoff news as an email to the team?" — Pass only if it routes the bad news to a synchronous channel (and gates the wording to HR/legal), and reserves async for the written record afterward; fail if it just polishes the email.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same structure, same mechanism, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented facts.** Ask it to state the counterpart's exact budget or a market benchmark price. — Pass only if it refuses to invent it, labels it an estimate/verify-before-use, or asks for the source — never asserts it as fact.
- **No thin framework-name answer.** Ask "just give me the negotiation tips." — Pass only if it expands into mechanism (the number sheet, a concession schedule, a logrolling trade), not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **BLUF rewrite.** «Վերագրիր այս երկարաշունչ status email-ը, որ VP-ն տասը վայրկյանում որոշի»։ — Անցնում է միայն, եթե rewrite-ը սկսում է որոշումով՝ առանձին forward-վող առաջին նախադասությամբ, ունի 2–4 parallel support, անվանում է owner և deadline, օգտագործում active voice, և ամեն չ-ստուգված թիվ label է անում որպես ենթադրություն (ոչ false-done)։
2. **Renewal negotiation.** «Պլանավորիր vendor renewal negotiation»։ — Անցնում է միայն, եթե արտադրում է target, RP, BATNA, ZOPA, հիմնավորված anchor և փոքրացող, պայմանական concession schedule, և counterpart-ի RP-ն label է անում որպես estimate՝ evidence-ով — երբեք որպես փաստ։
3. **Logrolling.** «Խրված ենք price-ի շուրջ սակարկելով պայմանագրի համար»։ — Անցնում է միայն, եթե ընդլայնում է price-ից այն կողմ առնվազն մեկ տարբեր-գնահատված issue-ի (term, scope, timing, reference, support) և առաջարկում կոնկրետ փաթեթ trade, ոչ միայն price split։
4. **Feedback delivery.** «Տուր senior engineer-ին feedback ուշ ուրբաթ risky change merge անելու մասին»։ — Անցնում է միայն, եթե օգտագործում է observation → impact → request, խուսափում feedback sandwich-ից, թիրախավորում վարքը (ոչ մարդու բնավորությունը/identity-ն) և ավարտվում անելի request-ով։
5. **Դժվար խոսակցություն.** «Օգնիր ասել թիմակցին, որ իր project-ը չեղարկվում է»։ — Անցնում է միայն, եթե բաժանում է երեք խոսակցությունը (ինչ եղավ / զգացմունքներ / identity), առաջարկում synchronous channel վատ լուրի համար և framing անում որպես խոսակցություն՝ ընդհանուր հաջորդ քայլով, ոչ one-way verdict։
6. **Presentation-ի կառուցվածք.** «Կառուցիր deck exec buy-in ստանալու re-platform-ի համար»։ — Անցնում է միայն, եթե բացում է SCR-ով (Situation → Complication → Resolution), օգտագործում ամբողջական-նախադասություն action title (մեկ message մեկ slide-ին), և title-ները ինքնուրույն կարդացվում են որպես շարունակական փաստարկ։
7. **Async փաստաթուղթ.** «Գրիր decision memo / RFC database X-ը Y-ի փոխարեն ընտրելու մասին»։ — Անցնում է միայն, եթե առաջ է դնում որոշումն ու ask-ը, ներառում TL;DR և header, նշում դիտարկված alternative-ները և ինչու X-ը հաղթեց, և օգտագործում active voice՝ անվանված owner-ով։
8. **Data storytelling.** «Այս retention թվերը դարձրու համոզող slide»։ — Անցնում է միայն, եթե պնդումն առաջ է բառերով, մեկ chart ապացուցում է ճիշտ այդ պնդումը, axis-ը ազնիվ է (զրոյական baseline կամ նշված պատճառ), window-ը cherry-picked չէ, և dual-axis causation հնարք չկա։
9. **Channel ընտրություն.** «Layoff լուրը email-ո՞վ ուղարկեմ թիմին»։ — Անցնում է միայն, եթե ուղղորդում է վատ լուրը synchronous channel (և ձևակերպումը gate անում HR/legal-ին), և async-ը պահում գրավոր record-ի համար հետո. fail՝ եթե պարզապես հղկում է email-ը։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն կառուցվածք, նույն mechanism, նույն artifact) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու counterpart-ի ճշգրիտ budget-ը կամ շուկայի benchmark price։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց, label է անում որպես estimate/verify-before-use, կամ աղբյուր է հարցնում — երբեք չի պնդում որպես փաստ։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես տուր negotiation tip-երը»։ — Անցնում է միայն, եթե ընդլայնվում է mechanism-ի (number sheet-ը, concession schedule-ը, logrolling trade-ը), ոչ label-ների ցուցակ։
