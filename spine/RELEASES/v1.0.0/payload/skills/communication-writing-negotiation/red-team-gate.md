# Communication, Writing, and Negotiation red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (BLUF/decision memo, negotiation/concession plan, difficult-conversation plan, deck narrative, feedback script, data story). It extends but never replaces the inline safety gate in `SKILL.md` and the boundaries in `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Buried ask / no BLUF** — do not pass a message where the decision or request is not in the first sentence and the owner/deadline are missing.
- **Feedback sandwich** — do not pass feedback that wraps the criticism between two slices of praise; require observation → impact → request, with praise as a separate message.
- **Fabricated counterpart number** — do not pass a negotiation plan that asserts the other side's reservation point as fact; require it labeled an estimate with evidence and confidence.
- **Unilateral / random concessions** — do not pass a concession schedule whose steps grow, or that drops toward the counterpart with no get attached.
- **Negotiating down from an extreme anchor** — do not pass a plan that accepts an out-of-ZOPA opening as the reference; require a re-anchor.
- **Single-issue tunnel** — do not pass a price-only negotiation when term, scope, timing, or references are tradeable; require a logrolling check.
- **Manipulative persuasion** — do not pass a frame that hides a material fact, removes the counterpart's agency, or uses a misleading chart (truncated axis, cherry-picked window, dual-axis causation).
- **Nominalization / passive evasion** — do not pass agentless prose ("a decision was made") where accountability matters; require active voice with a named owner.
- **Hedge-everything** — do not pass a message with no falsifiable claim and no clear ask buried under qualifiers.
- **Wrong channel for the stakes** — do not pass bad news, conflict, or a sensitive decision delivered over a one-way async/text channel.
- **False-done report** — do not pass a "done/handled/sent" that hides an unreviewed draft, a pending approval, or an unverified number.
- **High-stakes message sent on this skill's authority** — do not pass a send-ready termination/PIP/regulatory/breach/public statement; require routing to HR/legal/leadership.

### Reviewer probes (ask these of any answer)

- Can the first sentence be forwarded alone and still carry the decision? Where are the owner and the deadline, and is the ask in active voice?
- Is any praise doing the job of softening a blow (a sandwich), or are praise and critique separate honest messages? Is the criticism observation → impact → request?
- For the negotiation: is the counterpart's RP asserted as fact or labeled an estimate with evidence? Show the BATNA — is it real, and does it actually set the RP?
- Does the concession schedule shrink with each step, and is every step conditional on a get? If the counterpart opened extreme, did the plan re-anchor or negotiate down from their number?
- Was the negotiation expanded beyond price into a logrolling trade, or is it a single-issue win-lose haggle?
- Does any chart's axis start at zero (or justify not starting there), use an unfiltered window, and avoid a dual-axis trick? Does the visual claim only what the data supports?
- Is the prose active voice with a named actor, or does nominalized/passive phrasing hide who decided and who must act?
- Does the message carry a clear position and a falsifiable claim, or is it hedged into meaninglessness?
- Does the channel match the stakes — is anything sensitive being delivered async that should be synchronous?
- Does the answer report anything as done while a dependency is open (false-done)? Are unknowns and estimates labeled?
- Is this a termination/PIP/regulatory/breach/public message that must be gated to HR/legal/leadership rather than sent?
- Did the answer invent any price, statute, benchmark, or quote, and is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (BLUF/decision memo, negotiation/concession plan, դժվար-խոսակցության պլան, deck narrative, feedback script, data story)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի inline safety gate-ը և `../shared/OPERATING_PROTOCOL.md`-ի սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Թաղված ask / ոչ BLUF** — մի՛ անցկացրու message, որտեղ որոշումը կամ խնդրանքը առաջին նախադասությունում չէ, և owner/deadline-ը բացակայում է։
- **Feedback sandwich** — մի՛ անցկացրու feedback, որ քննադատությունը փաթաթում է երկու շերտ գովեստի մեջ. պահանջիր observation → impact → request, գովեստը՝ որպես առանձին message։
- **Հորինված counterpart թիվ** — մի՛ անցկացրու negotiation plan, որ պնդում է մյուս կողմի reservation point-ը որպես փաստ. պահանջիր label-ված որպես estimate՝ evidence-ով և confidence-ով։
- **Միակողմանի / պատահական concession-ներ** — մի՛ անցկացրու concession schedule, որի քայլերը մեծանում են, կամ որ իջնում է դեպի counterpart առանց get-ի։
- **Բանակցում ծայրահեղ anchor-ից ներքև** — մի՛ անցկացրու plan, որ ZOPA-ից-դուրս opening-ը ընդունում է որպես reference. պահանջիր re-anchor։
- **Single-issue թունել** — մի՛ անցկացրու միայն-price negotiation, երբ term, scope, timing կամ reference-ը tradeable են. պահանջիր logrolling ստուգում։
- **Manipulative persuasion** — մի՛ անցկացրու frame, որ թաքցնում է material fact, հեռացնում counterpart-ի agency-ն կամ օգտագործում մոլորեցնող chart (truncated axis, cherry-picked window, dual-axis causation)։
- **Nominalization / passive խուսափում** — մի՛ անցկացրու անդեմ արձակ («որոշում կայացվեց»), երբ պատասխանատվությունը կարևոր է. պահանջիր active voice՝ անվանված owner-ով։
- **Hedge-everything** — մի՛ անցկացրու message առանց falsifiable պնդման և առանց հստակ ask-ի՝ qualifier-ների տակ թաղված։
- **Stake-ի համար սխալ channel** — մի՛ անցկացրու վատ լուր, կոնֆլիկտ կամ sensitive որոշում՝ հանձնված one-way async/text channel-ով։
- **False-done զեկույց** — մի՛ անցկացրու «done/handled/sent», որ թաքցնում է unreviewed draft, pending approval կամ unverified թիվ։
- **High-stakes message ուղարկված այս skill-ի լիազորությամբ** — մի՛ անցկացրու send-ready termination/PIP/regulatory/breach/հանրային statement. պահանջիր ուղղորդում HR/legal/leadership-ին։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Առաջին նախադասությունը կարո՞ղ է առանձին forward-վել և դեռ կրել որոշումը։ Որտե՞ղ են owner-ը և deadline-ը, և ask-ը active voice-ո՞վ է։
- Որևէ գովեստ հարված մեղմացնելու՞ գործ է անում (sandwich), թե գովեստն ու քննադատությունը առանձին ազնիվ message-եր են։ Քննադատությունը observation → impact → request է՞։
- Negotiation-ի համար․ counterpart-ի RP-ն պնդվա՞ծ է որպես փաստ, թե label-ված որպես estimate՝ evidence-ով։ Ցույց տուր BATNA-ն — իրակա՞ն է, և իրակա՞ն է RP-ն սահմանում։
- Concession schedule-ը ամեն քայլով փոքրանո՞ւմ է, և ամեն քայլ պայմանակա՞ն է get-ից։ Եթե counterpart-ը ծայրահեղ բացեց, plan-ը re-anchor արե՞ց, թե նրա թվից ներքև բանակցեց։
- Negotiation-ն ընդլայնվա՞ծ է price-ից այն կողմ logrolling trade-ի, թե single-issue win-lose սակարկություն է։
- Որևէ chart-ի axis-ը զրոյից սկսո՞ւմ է (կամ հիմնավորում, թե ինչու ոչ), օգտագործո՞ւմ է չ-ֆիլտրված window և խուսափո՞ւմ dual-axis հնարքից։ Visual-ը պնդո՞ւմ է միայն այն, ինչ data-ն թույլ է տալիս։
- Արձակը active voice՝ անվանված actor-ո՞վ է, թե nominalized/passive ձևակերպումը թաքցնում է, ով որոշեց և ով պետք է գործի։
- Message-ը հստակ դիրք և falsifiable պնդո՞ւմ է կրում, թե hedge-ված է մինչև անիմաստություն։
- Channel-ը համապատասխանո՞ւմ է stake-ին — որևէ sensitive բան async-ով հանձնվո՞ւմ է, որ պետք է synchronous լիներ։
- Պատասխանը որևէ բան done զեկուցո՞ւմ է, մինչ dependency-ն բաց է (false-done)։ Unknown-ներն ու estimate-ները label-վա՞ծ են։
- Սա termination/PIP/regulatory/breach/հանրային message է՞, որ պետք է gate-վի HR/legal/leadership-ին՝ ուղարկվելու փոխարեն։
- Պատասխանը հորինե՞ց price, statute, benchmark կամ quote, և հայերենը equal-depth ու punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի)։
