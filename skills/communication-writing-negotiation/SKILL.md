---
name: "communication-writing-negotiation"
description: >-
  use when the work is written or spoken communication, persuasion, or a deal — executive updates and BLUF memos, feedback delivery, difficult conversations, presentation/deck structure, async docs and PR/spec narratives, data storytelling, or negotiation (offers, concessions, multi-issue trades) — for decisions, critique, planning, diagnostics, drafting artifacts, teaching, or evaluation. use as lead when the central deliverable is a message, document, presentation, or negotiation plan. do not use as lead when another skill owns the substance (legal redline, financial model, security disclosure) and you only shape how it is communicated — then support it. հայերեն՝ օգտագործիր գրավոր ու բանավոր հաղորդակցության, համոզման, feedback-ի, դժվար խոսակցության, presentation-ի, async փաստաթղթի, data storytelling-ի և բանակցության աշխատանքի համար։
---

# Communication, Writing, and Negotiation / Հաղորդակցություն, գրավոր խոսք և բանակցություն

## English

**Scope.** In: BLUF/pyramid writing and executive updates; feedback delivery (SBI/observation-impact-request); difficult conversations (the three-conversations split — facts, feelings, identity); presentation and deck structure (SCR/situation-complication-resolution, one-message-per-slide, action titles); async documents (PRs, specs, decision memos, RFCs) that must persuade without the author in the room; data storytelling (the claim leads, the chart proves, the axis does not lie); and negotiation — anchoring, reservation point, BATNA, ZOPA, concession schedules, and multi-issue logrolling. Out: the underlying substance another skill owns — legal language and enforceability (legal owns it), financial numbers and model correctness (finance owns it), security-disclosure content (security owns it), product/strategy decisions themselves (those skills own them). This skill makes the message land, the document decide, the presentation move a room, and the deal close on trades rather than capitulation — it does not invent the facts being communicated.

**Leads / Supports.** Lead when the deliverable is the communication itself: an executive update, a feedback script, a difficult-conversation plan, a deck narrative, an async decision memo, a data story, or a negotiation/concession plan. Support when another skill owns the substance and you shape only its delivery — finance owns the valuation and you turn it into a board narrative; legal owns the contract and you draft the cover note that frames the redline; security owns the vulnerability and you write the responsible-disclosure message and customer comms.

Conflict rules:
- **Substance vs framing → the owning skill controls the facts; you control the form.** Never soften a legal obligation, a financial number, or a security severity to make a message smoother. If clearer framing would change the meaning of an owned fact, route it back to that owner before sending.
- **Persuasion vs honesty → honesty wins, always.** Pathos and anchoring are levers, not licenses. The moment a frame requires hiding a material fact, suppressing the counterpart's agency, or misreading a chart's axis, it is manipulation, not communication — stop and reframe.
- **Negotiation pricing/terms → coordinate with the value owner, do not commit alone.** You design the anchor, the concession schedule, and the trade logic; the actual walk-away number, discount authority, and contractual terms are set with finance/legal/the deal owner, not unilaterally here.
- **External send / high-stakes message → gate it.** Termination wording, layoff/PIP language, regulatory or breach statements, and public statements carry legal and human exposure; draft them, then route to HR/legal/leadership per `OWNER_NOTES.md` — do not send on your own authority.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Reader must decide → lead with the answer (BLUF), then 2–4 parallel supports.** If the first sentence cannot be forwarded alone and still carry the decision, rewrite it. The point goes first; the build-up is for the people who challenge it.
2. **Curse of knowledge → name the audience's starting state, then write down to it.** Strip the jargon you would not define to a smart outsider; assume the reader has the context you forgot you acquired. If a term needs a footnote for the decision-maker, it does not belong in the BLUF.
3. **Presentation/deck → action titles + SCR, one message per slide.** Each slide title is the takeaway as a full sentence ("Q3 churn rose 4pts in enterprise"), not a topic ("Churn"). Open the deck on the SCR spine: Situation (agreed context) → Complication (what changed/broke) → Resolution (the ask). A slide that needs the speaker to explain its title is not finished.
4. **Feedback → observation, impact, request — never the sandwich.** Name the specific behavior, the concrete impact, and the change you want; drop the praise-criticism-praise wrapper that buries the real message and trains people to dread your compliments.
5. **Difficult conversation → split the three conversations before drafting.** Separate what happened (facts, contributions on both sides), feelings (named, not acted out), and identity (what this threatens for each person). Collapse them and the message becomes blame; separate them and it becomes a conversation.
6. **Negotiation framed as "get the best deal" → write the number sheet first.** Target, reservation point (RP), BATNA, estimated counterpart RP, ZOPA, anchor, and a conditional concession schedule. No BATNA means no leverage — build or strengthen the BATNA before negotiating hard.
7. **Counterpart's RP is unknown → estimate it and label it an estimate.** Never assert the other side's walk-away as fact. State it as an estimate with the evidence and your confidence; a fabricated reservation point produces a confident, wrong strategy.
8. **One issue on the table → expand it to enable logrolling.** Single-issue (price-only) negotiation is win-lose. Add issues each side values differently (term length, payment timing, scope, references) and trade what is cheap to you for what is dear to them.
9. **Concession requested → make it slow, conditional, and reciprocal.** Never drop randomly toward the other side's number. Each move is smaller than the last, tied to a get ("X only if Y"), and signals you are near your limit. Unilateral concessions teach the counterpart to keep pushing.
10. **Counter-anchor when the first number is extreme → reset with your own justified anchor, do not negotiate off theirs.** If their opening sits outside the plausible ZOPA, name it as out of range and re-anchor to a defensible number with evidence; haggling down from an absurd anchor concedes the frame.
11. **Data being presented → the claim leads, the chart proves, the axis is honest.** State the takeaway in words first, then show the visual that supports exactly that claim. No truncated y-axis, no cherry-picked window, no dual-axis trick that manufactures a correlation. If the chart needs a caption to defend its framing, the framing is wrong.
12. **Wrong channel for the stakes → switch channels before drafting.** Bad news, conflict, and anything emotionally loaded do not go in a one-way async message that cannot read the room; high-context or sensitive content goes synchronous (call/in-person), with the written summary after. Async is for decisions of record, not for delivering a blow.
13. **Async doc must persuade without you → front-load the decision and make it skimmable.** PRs, specs, and RFCs are read by people who will not ask you a follow-up. Lead with the decision and the ask, use headers and a TL;DR, and put the reasoning where a skeptic would look, not buried at the end.
14. **Nominalization/passive hiding the actor → name who does what.** "A decision was made to deprecate" hides the decider and the accountability. Rewrite to active voice with a subject ("The platform team will deprecate X by date") so the reader knows who owns the action.
15. **About to report "done" → state what is actually true, including what is not done.** No false-done. If a draft is unreviewed, a number is an estimate, or a send is pending approval, say so. A confident "handled" that papers over an open gap is the most expensive sentence in this domain.

### Failure modes to prevent / Ձախողման ձևեր

1. **Curse of knowledge.** The author writes for someone who already knows what the author knows; the reader can't follow because the shared context is assumed, not given. Tell: undefined jargon, missing "why now," a BLUF only the writer could parse.
2. **Buried ask / no BLUF.** The decision or request is in paragraph four, after the context and the throat-clearing. Tell: the reader has to hunt for "so what do you want me to do?"; the first sentence cannot stand alone.
3. **Feedback sandwich.** Real criticism wrapped in two slices of praise; the recipient hears the praise, misses the message, and learns to distrust compliments. Tell: "you're great, but… anyway great job" — and nothing changes.
4. **Nominalization / passive evasion.** Actions turned into nouns and agentless passive voice that hide who decided and who must act. Tell: "mistakes were made," "a decision was reached," no subject owning the verb.
5. **Hedge-everything.** So many qualifiers ("perhaps," "it might be that," "to some extent") that the message carries no position and the reader can't tell what the author actually thinks. Tell: a paragraph with no falsifiable claim and no clear ask.
6. **False-done reporting.** Reporting a task as complete when a draft is unreviewed, an approval is pending, or a number is unverified. Tell: "done/handled/sent" with no mention of the open dependency that is, in fact, open.
7. **Counter-anchoring failure.** Accepting the counterpart's extreme first number as the reference and negotiating down from it, instead of re-anchoring. Tell: every concession is measured against their anchor; the final price sits near their opening, not near the real ZOPA.
8. **Fabricated reservation point.** Asserting the counterpart's walk-away number as fact and building a strategy on it. Tell: "they can't go below X" stated with certainty, no evidence, no confidence label.
9. **Unilateral / random concessions.** Dropping toward the other side with nothing in return, in uneven jumps. Tell: $100 → $90 → $72 with no "if you…," concessions getting bigger, the counterpart simply waiting for the next drop.
10. **Single-issue tunnel.** Negotiating price only when term, scope, timing, and references are tradeable. Tell: a win-lose haggle where a logrolling trade was available and unused.
11. **Wrong-channel selection.** Delivering conflict, bad news, or a sensitive decision over a one-way async/text channel that can't read or respond to the reaction. Tell: a layoff, a harsh critique, or a relationship rupture sent as a Slack message or email blast.
12. **Misleading data story.** The chart's framing manufactures the conclusion — truncated axis, cherry-picked range, dual axis implying causation. Tell: the visual says more than the data supports, and the takeaway collapses when the axis starts at zero.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the deliverable (BLUF update / feedback script / difficult-conversation plan / deck narrative / async memo / data story / negotiation plan), not generic advice.
- Every persuasive move is honest: no hidden material fact, no manufactured chart, no fabricated counterpart number; the counterpart's RP, if present, is labeled an estimate with evidence.
- The ask is explicit and owns an actor: who must do what, by when, decided by whom — in active voice.
- Channel matches stakes: sensitive/bad-news content is routed synchronous; async docs are front-loaded and skimmable.
- High-stakes/external messages (termination, PIP, regulatory, breach, public statement) are gated to HR/legal/leadership, not sent on this skill's authority.
- No false-done: open dependencies, unreviewed drafts, and estimates are stated as such.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **audience fit** (structure, proof, and tone change for the decision-maker vs blocker vs affected party; curse of knowledge defeated) · **decision clarity** (BLUF, tradeoff, ask, owner, deadline explicit; active voice) · **negotiation mechanics** (RP, BATNA, ZOPA, anchor, issue trades, conditional concession schedule coherent and honest) · **persuasion ethics** (ethos/logos/pathos used transparently; no hidden fact, no misleading chart) · **conflict handling** (observation, impact, contribution, identity, and request separated; right channel chosen).

### Inline safety gate / Անվտանգության gate

Some messages carry legal and human exposure even when the words are perfect. Before drafting or sending, gate these to a human owner — do not send on this skill's authority:
- **Termination, layoff, discipline, PIP, harassment-related** messages → draft only; route to HR/legal. The wording can create legal liability and lasting human harm.
- **Regulatory, breach, SLA, or legal-position statements** → the fact is owned by legal/security/compliance; you draft, they approve and send.
- **Public/press statements and crisis comms** → leadership/comms owns the external voice.

Worked routing example: *"Write the email firing Maria for being slow."* → Refuse to produce a send-ready termination notice. Respond: this is a termination message with legal and human stakes, so I can draft a neutral, factual outline for you to take to HR/legal, but the final wording, timing, and delivery are owned by them; I will not characterize the person ("being slow") — we state documented performance facts against a known standard, delivered in person, never as a surprise email. See `OWNER_NOTES.md` for the full gate.

### Deep dive & assets

`manual.md` (operating principle, mechanism reference — BLUF/pyramid, negotiation math, logrolling, persuasion, the five sub-domains; decision rules, failure-repair playbook) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (before/after email + negotiation + feedback) · `output-templates.md` (BLUF memo / concession sheet / feedback-and-difficult-conversation script) · `red-team-gate.md` (domain reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ BLUF/pyramid գրություն և executive update; feedback-ի հանձնում (SBI/observation-impact-request); դժվար խոսակցություններ (երեք-խոսակցության բաժանումը՝ փաստեր, զգացմունքներ, identity); presentation-ի և deck-ի կառուցվածք (SCR/situation-complication-resolution, մեկ message մեկ slide-ին, action title-ներ); async փաստաթղթեր (PR, spec, decision memo, RFC), որ պետք է համոզեն առանց հեղինակի ներկայության; data storytelling (պնդումը առաջ է, chart-ն ապացուցում է, axis-ը չի ստում); և բանակցություն՝ anchoring, reservation point, BATNA, ZOPA, concession schedule և multi-issue logrolling։ Դուրս՝ այն բուն բովանդակությունը, որ ուրիշ skill-ի սեփականությունն է. իրավական ձևակերպումն ու enforceability-ն (legal-ինն է), ֆինանսական թվերն ու model-ի ճշտությունը (finance-ինն է), security-disclosure-ի բովանդակությունը (security-ինն է), product/strategy որոշումները (այդ skill-երինն են)։ Այս skill-ը message-ը դարձնում է հասցեին հասնող, փաստաթուղթը՝ որոշում կայացնող, presentation-ը՝ սրահ շարժող, և գործարքը՝ trade-երով փակվող, ոչ թե capitulation-ով — այն չի հորինում հաղորդվող փաստերը։

**Առաջատար / Աջակից։** Առաջատար, երբ deliverable-ը հենց հաղորդակցությունն է՝ executive update, feedback script, դժվար-խոսակցության պլան, deck narrative, async decision memo, data story կամ negotiation/concession plan։ Աջակից, երբ բուն բովանդակության տերը այլ skill է, և դու ձևավորում ես միայն դրա հանձնումը. finance-ը տիրում է valuation-ին, դու այն դարձնում ես board narrative. legal-ը տիրում է պայմանագրին, դու գրում ես cover note-ը, որ framing է անում redline-ը. security-ը տիրում է խոցելիությանը, դու գրում ես responsible-disclosure message-ը և customer comms-ը։

Կոնֆլիկտի կանոններ․
- **Բովանդակություն ընդդեմ framing → փաստերը տիրող skill-ինն են, ձևը՝ քոնը։** Երբեք մի՛ մեղմացրու իրավական պարտավորություն, ֆինանսական թիվ կամ security severity՝ message-ը հարթ դարձնելու համար։ Եթե ավելի պարզ framing-ը կփոխի տիրվող փաստի իմաստը, ուղարկելուց առաջ վերադարձրու այն տիրոջը։
- **Համոզում ընդդեմ ազնվության → ազնվությունը միշտ հաղթում է։** Pathos-ը և anchoring-ը լծակ են, ոչ արտոնագիր։ Այն պահին, երբ framing-ը պահանջում է թաքցնել material fact, ճնշել counterpart-ի agency-ն կամ axis-ը սխալ կարդալ, դա manipulation է, ոչ communication — կանգնի՛ր և reframe արա։
- **Negotiation-ի գին/պայմաններ → համակարգիր value-ի տիրոջ հետ, մենակ մի՛ commit արա։** Դու նախագծում ես anchor-ը, concession schedule-ը և trade-ի տրամաբանությունը. իրական walk-away թիվը, discount authority-ն և պայմանագրային terms-ը սահմանվում են finance-ի/legal-ի/deal-ի տիրոջ հետ, ոչ թե միակողմանի այստեղ։
- **Արտաքին send / high-stakes message → gate արա։** Termination-ի ձևակերպումը, layoff/PIP language-ը, regulatory կամ breach հայտարարությունը և հանրային statement-ը կրում են իրավական ու մարդկային ռիսկ. գրի՛ր դրանք, հետո ուղղորդիր HR/legal/leadership-ին ըստ `OWNER_NOTES.md`-ի — մի՛ ուղարկիր սեփական լիազորությամբ։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Reader-ը պետք է որոշի → սկսիր պատասխանով (BLUF), հետո 2–4 parallel support։** Եթե առաջին նախադասությունը առանձին forward անելիս չի կրում որոշումը, վերագրի՛ր։ Point-ը առաջ է գնում. build-up-ը նրանց համար է, ով վիճարկում է։
2. **Curse of knowledge → անվանի՛ր լսարանի մեկնակետը, հետո գրիր դեպի այն։** Հանիր այն jargon-ը, որ խելացի outsider-ին չէիր սահմանի. ենթադրիր, որ reader-ը չունի այն context-ը, որ դու մոռացել ես, որ ձեռք ես բերել։ Եթե decision-maker-ի համար term-ը footnote է պահանջում, այն BLUF-ում տեղ չունի։
3. **Presentation/deck → action title-ներ + SCR, մեկ message մեկ slide-ին։** Ամեն slide-ի title-ը takeaway-ն է որպես ամբողջական նախադասություն («Q3 churn-ը enterprise-ում աճեց 4 կետ»), ոչ թե թեմա («Churn»)։ Deck-ը բացիր SCR ողնաշարով՝ Situation (համաձայնեցված context) → Complication (ինչ փոխվեց/կոտրվեց) → Resolution (ask-ը)։ Slide, որի title-ը բացատրելու համար speaker է պետք, ավարտված չէ։
4. **Feedback → observation, impact, request — երբեք sandwich։** Անվանի՛ր կոնկրետ վարքը, կոնկրետ ազդեցությունը և ուզած փոփոխությունը. դեն նետիր praise-criticism-praise փաթաթանը, որ թաղում է իրական message-ը և մարդկանց սովորեցնում վախենալ քո գովեստից։
5. **Դժվար խոսակցություն → drafting-ից առաջ բաժանիր երեք խոսակցությունը։** Բաժանիր ինչ եղավ (փաստեր, երկու կողմի contribution), զգացմունքներ (անվանված, ոչ արտապոռթկած) և identity (ինչ է սա սպառնում ամեն մարդու)։ Միացրու դրանք՝ message-ը դառնում է մեղադրանք. բաժանիր՝ դառնում է խոսակցություն։
6. **Negotiation-ը ձևակերպված է «ստացիր լավագույն deal» → նախ գրիր number sheet-ը։** Target, reservation point (RP), BATNA, counterpart-ի estimated RP, ZOPA, anchor և պայմանական concession schedule։ BATNA չկա՝ leverage չկա — կառուցիր կամ ուժեղացրու BATNA-ն hard բանակցելուց առաջ։
7. **Counterpart-ի RP-ն անհայտ է → գնահատի՛ր և նշիր որպես estimate։** Երբեք մի՛ պնդիր մյուս կողմի walk-away-ը որպես փաստ։ Ներկայացրու որպես estimate՝ evidence-ով և քո confidence-ով. հորինված reservation point-ը ստեղծում է վստահ, սխալ ստրատեգիա։
8. **Սեղանին մեկ issue → ընդլայնի՛ր այն logrolling-ի համար։** Single-issue (միայն price) negotiation-ը win-lose է։ Ավելացրու issue-ներ, որ կողմերը տարբեր են գնահատում (term length, payment timing, scope, reference) և փոխանակիր այն, ինչը քեզ էժան է, նրանց՝ թանկ։
9. **Concession է խնդրվում → դարձրու դանդաղ, պայմանական և փոխադարձ։** Երբեք պատահականորեն մի՛ իջիր դեպի մյուս կողմը։ Ամեն move-ը նախորդից փոքր է, կապված get-ի հետ («X միայն եթե Y») և ազդանշում է, որ սահմանիդ մոտ ես։ Միակողմանի concession-ը counterpart-ին սովորեցնում է շարունակել հրել։
10. **Counter-anchor արա, երբ առաջին թիվը ծայրահեղ է → reset արա քո հիմնավորված anchor-ով, մի՛ բանակցիր նրանցից։** Եթե նրանց opening-ը plausible ZOPA-ից դուրս է, անվանի՛ր այն range-ից դուրս և re-anchor արա defensible թվին evidence-ով. absurd anchor-ից ներքև սակարկելը զիջում է frame-ը։
11. **Data է ներկայացվում → պնդումն առաջ է, chart-ն ապացուցում է, axis-ը ազնիվ է։** Takeaway-ն ասա բառերով նախ, հետո ցույց տուր visual-ը, որ ճիշտ այդ պնդումն է հիմնավորում։ Ոչ truncated y-axis, ոչ cherry-picked window, ոչ dual-axis հնարք, որ correlation է հորինում։ Եթե chart-ին caption է պետք իր framing-ը պաշտպանելու համար, framing-ը սխալ է։
12. **Stake-ի համար սխալ channel → drafting-ից առաջ փոխիր channel-ը։** Վատ լուրը, կոնֆլիկտը և ամեն զգացմունքային ծանր բան չեն գնում one-way async message-ով, որ սրահը կարդալ չի կարող. high-context կամ sensitive բովանդակությունը գնում է synchronous (զանգ/անձամբ), գրավոր ամփոփումը՝ հետո։ Async-ը decision of record-ի համար է, ոչ հարված հասցնելու։
13. **Async doc-ը պետք է համոզի առանց քեզ → առաջ դիր որոշումը և դարձրու skimmable։** PR-ը, spec-ը և RFC-ն կարդում են մարդիկ, որ follow-up չեն հարցնի։ Սկսիր որոշումով և ask-ով, օգտագործիր header և TL;DR, և reasoning-ը դիր այնտեղ, ուր skeptic-ը կնայի, ոչ վերջում թաղված։
14. **Nominalization/passive-ը թաքցնում է actor-ին → անվանի՛ր, ով ինչ է անում։** «Որոշում կայացվեց deprecate անել»-ը թաքցնում է որոշողին և պատասխանատվությունը։ Վերագրիր active voice-ով՝ subject-ով («Platform team-ը X-ը կ-deprecate անի մինչև ամսաթիվ»), որ reader-ը գիտի, ով է action-ի տերը։
15. **Պատրաստվում ես «done» զեկուցել → ասա՛ ինչ իրականում ճիշտ է, ներառյալ ինչը արված չէ։** Ոչ մի false-done։ Եթե draft-ը unreviewed է, թիվը estimate է, կամ send-ը approval-ի սպասում է, ասա՛։ Վստահ «handled»-ը, որ ծածկում է բաց gap, այս domain-ի ամենաթանկ նախադասությունն է։

### Ձախողման ձևեր

1. **Curse of knowledge (գիտելիքի անեծք)։** Հեղինակը գրում է նրա համար, ով արդեն գիտի այն, ինչ հեղինակը. reader-ը չի կարող հետևել, որովհետև ընդհանուր context-ը ենթադրված է, ոչ տրված։ Tell՝ չսահմանված jargon, բացակա «ինչու հիմա», BLUF, որ միայն գրողը կհասկանար։
2. **Թաղված ask / ոչ BLUF։** Որոշումը կամ խնդրանքը չորրորդ պարբերությունում է՝ context-ից և throat-clearing-ից հետո։ Tell՝ reader-ը պետք է որսա «ուրեմն ի՞նչ ես ուզում, որ անեմ». առաջին նախադասությունը առանձին կանգնել չի կարող։
3. **Feedback sandwich։** Իրական քննադատությունը փաթաթված երկու շերտ գովեստի մեջ. ստացողը լսում է գովեստը, բաց թողնում message-ը և սովորում չվստահել գովեստին։ Tell՝ «հիանալի ես, բայց… ինչևէ լավ աշխատանք» — և ոչինչ չի փոխվում։
4. **Nominalization / passive խուսափում։** Գործողությունները դարձված գոյականներ և անդեմ passive voice, որ թաքցնում են, ով որոշեց և ով պետք է գործի։ Tell՝ «սխալներ թույլ տրվեցին», «որոշում կայացվեց», ոչ մի subject, որ տիրի բային։
5. **Hedge-everything (ամեն ինչ պաշարել)։** Այնքան qualifier («գուցե», «հնարավոր է, որ», «որոշ չափով»), որ message-ը ոչ մի դիրք չի կրում, և reader-ը չի հասկանում, թե հեղինակն իրականում ինչ է մտածում։ Tell՝ պարբերություն առանց falsifiable պնդման և առանց հստակ ask-ի։
6. **False-done զեկուցում։** Առաջադրանքը հայտարարվում է ավարտված, երբ draft-ը unreviewed է, approval-ը pending, կամ թիվը unverified։ Tell՝ «done/handled/sent»՝ առանց բաց dependency-ի հիշատակման, որ իրականում բաց է։
7. **Counter-anchoring-ի ձախողում։** Counterpart-ի ծայրահեղ առաջին թիվը ընդունվում է որպես reference և բանակցվում նրանից ներքև՝ re-anchor անելու փոխարեն։ Tell՝ ամեն concession չափվում է նրանց anchor-ով. վերջնական price-ը նրանց opening-ի մոտ է, ոչ իրական ZOPA-ի։
8. **Հորինված reservation point։** Counterpart-ի walk-away թիվը պնդվում է որպես փաստ, և դրա վրա ստրատեգիա է կառուցվում։ Tell՝ «նրանք X-ից ներքև չեն կարող» ասված վստահությամբ, առանց evidence-ի, առանց confidence label-ի։
9. **Միակողմանի / պատահական concession-ներ։** Իջեցում դեպի մյուս կողմ՝ առանց դիմացի, անհավասար ցատկերով։ Tell՝ $100 → $90 → $72 առանց «եթե դու…», concession-ները մեծանում են, counterpart-ը պարզապես սպասում է հաջորդ իջեցմանը։
10. **Single-issue թունել։** Միայն price-ի բանակցություն, երբ term, scope, timing և reference-ը tradeable են։ Tell՝ win-lose սակարկություն, որտեղ logrolling trade կար և չօգտագործվեց։
11. **Wrong-channel ընտրություն։** Կոնֆլիկտի, վատ լուրի կամ sensitive որոշման հանձնում one-way async/text channel-ով, որ reaction-ը կարդալ կամ պատասխանել չի կարող։ Tell՝ layoff, կոշտ քննադատություն կամ հարաբերության խզում՝ ուղարկված Slack message-ով կամ email blast-ով։
12. **Մոլորեցնող data story։** Chart-ի framing-ը հորինում է եզրակացությունը՝ truncated axis, cherry-picked range, dual axis, որ causation է ակնարկում։ Tell՝ visual-ն ասում է ավելին, քան data-ն թույլ է տալիս, և takeaway-ն փլվում է, երբ axis-ը զրոյից է սկսում։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է deliverable-ին (BLUF update / feedback script / դժվար-խոսակցության պլան / deck narrative / async memo / data story / negotiation plan), ոչ generic advice։
- Ամեն համոզող move ազնիվ է. ոչ թաքնված material fact, ոչ հորինված chart, ոչ հորինված counterpart թիվ. counterpart-ի RP-ն, եթե կա, label-ված է որպես estimate՝ evidence-ով։
- Ask-ը հստակ է և ունի actor. ով ինչ պետք է անի, մինչև երբ, ով է որոշել — active voice-ով։
- Channel-ը համապատասխանում է stake-ին. sensitive/վատ-լուր բովանդակությունը ուղղորդվում է synchronous. async doc-երը front-loaded և skimmable են։
- High-stakes/արտաքին message-երը (termination, PIP, regulatory, breach, հանրային statement) gate-ված են HR/legal/leadership-ին, ոչ ուղարկված այս skill-ի լիազորությամբ։
- Ոչ մի false-done. բաց dependency-ները, unreviewed draft-երը և estimate-ները նշված են որպես այդպիսին։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **audience fit** (կառուցվածքը, proof-ը և tone-ը փոխվում են decision-maker-ի ընդդեմ blocker-ի ընդդեմ affected party-ի. curse of knowledge-ը հաղթահարված) · **decision clarity** (BLUF, tradeoff, ask, owner, deadline հստակ. active voice) · **negotiation mechanics** (RP, BATNA, ZOPA, anchor, issue trade, պայմանական concession schedule՝ coherent և ազնիվ) · **persuasion ethics** (ethos/logos/pathos՝ թափանցիկ. ոչ թաքնված fact, ոչ մոլորեցնող chart) · **conflict handling** (observation, impact, contribution, identity և request բաժանված. ճիշտ channel ընտրված)։

### Անվտանգության gate

Որոշ message-եր կրում են իրավական ու մարդկային ռիսկ, նույնիսկ երբ բառերը կատարյալ են։ Drafting-ից կամ send-ից առաջ gate արա սրանք մարդ-տիրոջը — մի՛ ուղարկիր այս skill-ի լիազորությամբ․
- **Termination, layoff, discipline, PIP, harassment-ի հետ կապված** message-եր → միայն draft. ուղղորդիր HR/legal-ին։ Ձևակերպումը կարող է իրավական liability և մնայուն մարդկային վնաս ստեղծել։
- **Regulatory, breach, SLA կամ legal-position statement-եր** → փաստը legal-ի/security-ի/compliance-ի սեփականությունն է. դու draft ես անում, նրանք approve և send են անում։
- **Հանրային/press statement և crisis comms** → leadership-ը/comms-ը տիրում է արտաքին ձայնին։

Աշխատած routing օրինակ․ *«Գրիր email-ը, որ Maria-ին ազատենք դանդաղ լինելու համար»։* → Հրաժարվիր send-ready termination notice արտադրելուց։ Պատասխանիր․ սա termination message է իրավական ու մարդկային stake-ով, ուստի կարող եմ չեզոք, փաստային outline draft անել, որ տանես HR/legal, բայց վերջնական ձևակերպումը, timing-ը և delivery-ն նրանցն են. չեմ բնութագրի մարդուն («դանդաղ լինելու»), այլ նշում ենք փաստաթղթավորված performance փաստեր հայտնի standard-ի դեմ՝ հանձնված անձամբ, երբեք որպես անակնկալ email։ Տես `OWNER_NOTES.md`-ն ամբողջ gate-ի համար։

### Խորացում և asset-եր

`manual.md` (գործառնական սկզբունք, մեխանիզմների տեղեկագիր — BLUF/pyramid, negotiation math, logrolling, persuasion, հինգ ենթա-ոլորտ. որոշման կանոններ, failure-repair playbook) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (before/after email + negotiation + feedback) · `output-templates.md` (BLUF memo / concession sheet / feedback-and-difficult-conversation script) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
