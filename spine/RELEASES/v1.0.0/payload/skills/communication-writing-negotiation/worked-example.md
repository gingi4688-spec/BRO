# Communication, Writing, and Negotiation worked examples

## English

### Example A — Before/after email (BLUF rewrite)

**Prompt.** Rewrite this email so the VP can decide in ten seconds: "Hi team, hope you're all well. As you know we've been looking at the migration for a while now, and there have been a lot of moving parts. The vendor got back to us and there were some concerns about timeline, and also the budget question came up again in last week's sync. We've done a fair bit of analysis and there are pros and cons to each path. I think it would be good to discuss when everyone has a chance. Let me know your thoughts when you can. Thanks!"

**Before (diagnosis).** The ask is missing entirely — there is no decision, no owner, no deadline. The point, if there is one, is buried under greetings and context. Passive, agentless phrasing ("there were some concerns," "the budget question came up") hides who is worried and who must decide. It is a curse-of-knowledge email: it assumes the VP already holds all the context the writer has. Nobody can act on it.

**After (senior rewrite).**

> **Subject: Decision needed by Thu: migration path A vs B (recommend A)**
>
> **Bottom line:** I recommend we commit to migration path A and start next sprint. I need your go/no-go by Thursday so we hold the vendor's Q-end slot.
>
> **Why A over B:**
> 1. **Timeline** — A ships in ~6 weeks; B needs ~10 because of the dual-write phase. The vendor's discounted slot expires at quarter-end, which A makes and B misses.
> 2. **Cost** — A is within the approved budget; B runs ~15% over and would need a new approval (assumption: last quarter's rate card still holds — verifying with finance before we commit).
> 3. **Risk** — A is reversible (feature-flagged); B has an atomic cutover with no clean rollback.
>
> **The one tradeoff:** A carries slightly more short-term toil for the platform team in weeks 1–2. They've reviewed it and are fine with it.
>
> **What I need from you:** a yes/no on A by Thursday EOD. If you'd rather discuss live, I have 20 min open Wed afternoon.

**Why this passes.** The subject line and first sentence are forwardable alone and still carry the decision (recommend A, go/no-go by Thursday) — the BLUF test is met. The three supports are parallel and decision-relevant (timeline, cost, risk), each one a reason a skeptic would raise, and the caveat (15% over, rate-card assumption) is nested under the cost support where it belongs, not floated as a vague worry. The actor is named in active voice throughout ("I recommend," "the platform team," "I need from you"), so accountability is legible. The one fact that could be wrong — the cost number — is explicitly labeled an assumption being verified, which is the opposite of false-done. And it offers the right channel as an option (a live 20-minute slot) without forcing it, because the content is a clean decision, not bad news.

### Example B — Vendor renewal negotiation

**Prompt.** Build a senior negotiation plan for a SaaS renewal: list price is $120k/yr, the vendor is pushing for a 3-year commit, and your usage is well below your current tier.

**Senior answer.**

- **Number sheet.** Target $88k/yr. Reservation point (RP) $96k — above that, the alternative is cheaper. BATNA: a competitor quoted $92k/yr with a one-time $8k migration cost, so the economic alternative is ~$100k of first-year pain but ~$92k in year two onward — a real, usable BATNA that gives me leverage. **Estimated** counterpart RP ~$90k (estimate, not fact — based on it being their quarter-end and our low expansion usage; confidence: medium). ZOPA is therefore roughly **$90k–$96k**.
- **Anchor.** Open at **$82k**, justified with three pieces of evidence so it lands as a credible anchor, not a flier: 35% seat utilization (we're paying for a tier we don't use), the competitor benchmark, and a willingness to prepay annually. Opening below my target pulls the midpoint toward me; the evidence keeps it inside the bounds of credibility.
- **Concession schedule (shrinking, conditional).** $82k → **$88k only if** they drop the 3-year lock to 1-year with a renewal option → **$93k only if** they include the premium support tier (worth ~$10k to us, low marginal cost to them) → **walk above $96k** to the BATNA. Each step is smaller and buys something.
- **Logrolling.** Term length and support tier are the trade currency. We value a short term and premium support; they value a long commit (revenue predictability) and prepay (cash now). Package it: "We'll sign a 2-year at $93k with annual prepay **if** you include premium support and a year-2 price cap." That trades what's cheap to each side for what's dear — better than grinding the single price line.

**Why this passes.** Every number on the sheet traces to a source or is labeled an estimate: the RP comes from a real BATNA (competitor quote plus migration cost), and the counterpart's $90k RP is explicitly an estimate with its evidence and a medium-confidence label — it is never asserted as fact, which is the cardinal sin this domain guards against. The $82k anchor is justified, not a bluff, so it re-anchors the negotiation toward the buyer's ZOPA without destroying credibility. The concession schedule shrinks and every step is conditional on a get ("only if"), so it never trains the vendor to keep pushing. And the logrolling move expands a price-only fight into a term/support/prepay trade where both sides value the issues differently, creating value instead of just dividing it — the move single-issue negotiators miss.

### Example C — Difficult feedback to a senior engineer

**Prompt.** A senior engineer, Sam, repeatedly merges large changes late on Fridays without review, and twice this caused weekend incidents. Write the feedback — Sam is talented and proud of moving fast.

**Senior answer (the spoken/written script).**

> Sam, I want to talk about the Friday merges, and I want to be specific because you're one of the strongest engineers on the team and I'd rather fix one habit than lose the velocity.
>
> **Observation:** In the last month, three large changes went to main after 5pm Friday with no review on the PR.
> **Impact:** Two of them triggered weekend incidents — the auth regression on the 12th and the billing timeout on the 26th — and the on-call engineer (not you) spent their Saturday on each. It also means a big change ships with no second set of eyes right before the lowest-staffed window.
> **My read, and where I might be wrong:** I think the Friday timing is about wanting to close things out before the weekend, not about avoiding review — tell me if I've got that wrong.
> **Request:** Two things. Large changes get a review before merge, even if it's a fast one. And anything that size lands Monday–Thursday, or behind a feature flag if it truly can't wait. Does that work, or is there a constraint I'm not seeing?

**Why this passes.** It is built on observation → impact → request, with zero feedback sandwich — the opening names Sam's strength as the *reason* for the conversation, not as padding to soften a blow, so the real message is never buried. The observation is specific and behavioral (three late-Friday no-review merges, with dates), not a character judgment ("you're reckless"), so it targets a changeable behavior rather than Sam's identity as a fast, talented engineer — which is exactly the identity stake that would otherwise trigger defensiveness. The impact is concrete and names a real cost borne by a real person (the on-call's Saturday), which makes the request land as fair rather than nitpicky. It explicitly surfaces the speaker's own possible misread and invites correction, which keeps it a two-way conversation (the "what happened" conversation done honestly) instead of a verdict. And it ends on a clear, doable request plus an open question, not a reprimand — so Sam leaves with a next action, not a wound.

## Հայերեն

### Օրինակ A — Before/after email (BLUF rewrite)

**Prompt.** Վերագրիր այս email-ը, որ VP-ն տասը վայրկյանում որոշի․ «Բարև թիմ, հուսով եմ բոլորդ լավ եք։ Ինչպես գիտեք, մի որոշ ժամանակ է՝ նայում ենք migration-ին, և շատ moving part-եր կան։ Vendor-ը պատասխանեց, և timeline-ի շուրջ որոշ concern-եր եղան, ու budget-ի հարցն էլ նորից բարձրացավ անցյալ շաբաթվա sync-ին։ Բավական analysis ենք արել, և ամեն path-ն ունի pro-ներ ու con-ներ։ Կարծում եմ լավ կլինի քննարկել, երբ բոլորը հնարավորություն ունենան։ Տեղեկացրեք ձեր մտքերը, երբ կարողանաք։ Շնորհակալություն»։

**Before (diagnosis).** Ask-ն ընդհանրապես բացակայում է — ոչ որոշում, ոչ owner, ոչ deadline։ Point-ը, եթե այդպիսին կա, թաղված է ողջույնների և context-ի տակ։ Passive, անդեմ ձևակերպումը («որոշ concern-եր եղան», «budget-ի հարցը բարձրացավ») թաքցնում է, ով է անհանգստացած և ով պետք է որոշի։ Սա curse-of-knowledge email է. ենթադրում է, որ VP-ն արդեն ունի ողջ context-ը, որ գրողն ունի։ Ոչ ոք չի կարող դրա վրա գործել։

**After (senior rewrite).**

> **Subject: Որոշում պետք է մինչև հնգ.-ը՝ migration path A ընդդեմ B (առաջարկում եմ A)**
>
> **Հիմնական եզրակացություն․** Առաջարկում եմ commit անել migration path A-ին և սկսել հաջորդ sprint-ից։ Քո go/no-go-ն պետք է մինչև հինգշաբթի, որ պահենք vendor-ի Q-end slot-ը։
>
> **Ինչու A, ոչ B․**
> 1. **Timeline** — A-ն ship է լինում ~6 շաբաթում. B-ին պետք է ~10՝ dual-write փուլի պատճառով։ Vendor-ի զեղչված slot-ը ժամկետանց է quarter-end-ին, որ A-ն հասցնում է, B-ն՝ ոչ։
> 2. **Cost** — A-ն approved budget-ի ներսում է. B-ն ~15% վեր է գնում և նոր approval կպահանջեր (ենթադրություն՝ անցյալ եռամսյակի rate card-ը դեռ ուժի մեջ է — finance-ի հետ ստուգում եմ մինչև commit-ը)։
> 3. **Risk** — A-ն հետշրջելի է (feature-flagged). B-ն ունի atomic cutover՝ առանց մաքուր rollback-ի։
>
> **Մեկ tradeoff-ը․** A-ն մի փոքր ավելի short-term toil է բերում platform team-ին 1–2 շաբաթներին։ Նրանք review են արել և համաձայն են։
>
> **Ինչ եմ քեզնից ուզում․** A-ի այո/ոչ մինչև հինգշաբթի EOD։ Եթե նախընտրում ես live քննարկել, չորեքշաբթի կեսօրից հետո ունեմ 20 րոպե։

**Ինչու է անցնում gate-ը.** Subject line-ը և առաջին նախադասությունը առանձին forward-վում են և դեռ կրում որոշումը (առաջարկում եմ A, go/no-go մինչև հինգշաբթի) — BLUF test-ը անցավ։ Երեք support-ները parallel են և որոշման-համար-կարևոր (timeline, cost, risk), ամեն մեկը պատճառ, որ skeptic-ը կբարձրացներ, և caveat-ը (15% վեր, rate-card ենթադրություն) բնադրված է cost support-ի տակ, ուր պատկանում է, ոչ թե լողացող մշուշոտ անհանգստություն։ Actor-ը անվանված է active voice-ով ողջ ընթացքում («առաջարկում եմ», «platform team-ը», «քեզնից ուզում եմ»), ուստի պատասխանատվությունը ընթեռնելի է։ Միակ փաստը, որ կարող է սխալ լինել — cost թիվը — բացահայտ label-ված է որպես ստուգվող ենթադրություն, որ false-done-ի հակառակն է։ Եվ այն առաջարկում է ճիշտ channel-ը որպես option (live 20-րոպեանոց slot)՝ առանց պարտադրելու, որովհետև բովանդակությունը մաքուր որոշում է, ոչ վատ լուր։

### Օրինակ B — Vendor renewal negotiation

**Prompt.** Կառուցիր senior negotiation plan SaaS renewal-ի համար. list price-ը $120k/տարի է, vendor-ը հրում է 3-տարյա commit-ի, և քո usage-ը քո ընթացիկ tier-ից շատ ցածր է։

**Senior պատասխան.**

- **Number sheet.** Target $88k/տարի։ Reservation point (RP) $96k — դրանից վեր alternative-ն ավելի էժան է։ BATNA՝ competitor-ը գնանշեց $92k/տարի՝ մեկանգամյա $8k migration cost-ով, ուստի economic alternative-ը ~$100k առաջին-տարվա pain է, բայց ~$92k երկրորդ տարուց — իրական, օգտագործելի BATNA, որ leverage է տալիս։ **Estimated** counterpart RP ~$90k (estimate, ոչ փաստ — հիմնված այն բանի վրա, որ նրանց quarter-end է, և մեր expansion usage-ը ցածր է. confidence՝ միջին)։ ZOPA-ն հետևաբար մոտ **$90k–$96k** է։
- **Anchor.** Բացիր **$82k**-ով՝ հիմնավորված երեք evidence-ով, որ վայրէջք կատարի որպես credible anchor, ոչ flier՝ 35% seat utilization (վճարում ենք tier-ի համար, որ չենք օգտագործում), competitor benchmark և annual prepay-ի պատրաստակամություն։ Target-ից ցածր բացելը ձգում է midpoint-ը դեպի ինձ. evidence-ը պահում է այն credibility-ի սահմաններում։
- **Concession schedule (փոքրացող, պայմանական).** $82k → **$88k միայն եթե** 3-տարյա lock-ը իջեցնեն 1-տարյա՝ renewal option-ով → **$93k միայն եթե** ներառեն premium support tier-ը (մեզ համար ~$10k արժե, իրենց՝ ցածր marginal cost) → **walk above $96k** դեպի BATNA։ Ամեն քայլ ավելի փոքր է և ինչ-որ բան գնում։
- **Logrolling.** Term length-ը և support tier-ը trade-ի արժույթն են։ Մենք գնահատում ենք կարճ term և premium support. նրանք գնահատում են երկար commit (revenue predictability) և prepay (cash հիմա)։ Փաթեթավորիր․ «Կստորագրենք 2-տարյա $93k-ով annual prepay-ով, **եթե** ներառեք premium support և year-2 price cap»։ Դա փոխանակում է այն, ինչ ամեն կողմին էժան է, այն բանի հետ, ինչ թանկ է — ավելի լավ, քան մեկ price գիծը մաշելը։

**Ինչու է անցնում gate-ը.** Sheet-ի ամեն թիվ հետ է գնում աղբյուրի կամ label-ված է որպես estimate. RP-ն գալիս է իրական BATNA-ից (competitor quote plus migration cost), և counterpart-ի $90k RP-ն բացահայտ estimate է՝ իր evidence-ով և միջին-confidence label-ով — այն երբեք պնդված չէ որպես փաստ, որ այս domain-ի պաշտպանած գլխավոր մեղքն է։ $82k anchor-ը հիմնավորված է, ոչ bluff, ուստի re-anchor է անում negotiation-ը դեպի buyer-ի ZOPA՝ առանց credibility ոչնչացնելու։ Concession schedule-ը փոքրանում է, և ամեն քայլ պայմանական է get-ից («միայն եթե»), ուստի երբեք չի սովորեցնում vendor-ին շարունակել հրել։ Եվ logrolling move-ը միայն-price կռիվը ընդլայնում է term/support/prepay trade-ի, որտեղ երկու կողմերն issue-ները տարբեր են գնահատում՝ արժեք ստեղծելով՝ պարզապես բաժանելու փոխարեն — այն move-ը, որ single-issue negotiator-ները բաց են թողնում։

### Օրինակ C — Դժվար feedback senior engineer-ին

**Prompt.** Senior engineer Sam-ը կրկնակի merge է անում մեծ change-եր ուշ ուրբաթ օրերին՝ առանց review-ի, և երկու անգամ դա առաջացրել է weekend incident։ Գրիր feedback-ը — Sam-ը տաղանդավոր է և հպարտ՝ արագ շարժվելով։

**Senior պատասխան (ասվող/գրվող script-ը).**

> Sam, ուզում եմ խոսել ուրբաթյա merge-ների մասին, և ուզում եմ կոնկրետ լինել, որովհետև դու թիմի ամենաուժեղ engineer-ներից ես, և կնախընտրեի մեկ սովորություն ուղղել, քան velocity-ն կորցնել։
>
> **Observation.** Վերջին ամսում երեք մեծ change գնաց main ուրբաթ ժամը 5-ից հետո՝ PR-ին առանց review-ի։
> **Impact.** Դրանցից երկուսը weekend incident առաջացրին — auth regression-ը 12-ին և billing timeout-ը 26-ին — և on-call engineer-ը (ոչ դու) ամեն մեկի վրա իր շաբաթ օրը ծախսեց։ Նաև նշանակում է, որ մեծ change ship է լինում առանց երկրորդ զույգ աչքերի՝ ճիշտ ամենաքիչ-համալրված window-ից առաջ։
> **Իմ ընթերցումը, և որտեղ կարող եմ սխալվել.** Կարծում եմ ուրբաթյա timing-ը շաբաթավերջից առաջ բաները փակելու ցանկության մասին է, ոչ review-ից խուսափելու — ասա, եթե սխալ եմ։
> **Request.** Երկու բան։ Մեծ change-երը merge-ից առաջ review են ստանում, նույնիսկ եթե արագ։ Եվ այդ չափի ամեն ինչ վայրէջք է անում երկուշաբթի–հինգշաբթի, կամ feature flag-ի հետևում, եթե իսկապես չի կարող սպասել։ Սա աշխատո՞ւմ է, թե կա constraint, որ ես չեմ տեսնում։

**Ինչու է անցնում gate-ը.** Կառուցված է observation → impact → request-ի վրա՝ զրո feedback sandwich-ով — բացումը Sam-ի ուժը անվանում է որպես խոսակցության *պատճառ*, ոչ թե հարված մեղմացնելու padding, ուստի իրական message-ը երբեք չի թաղվում։ Observation-ը կոնկրետ է և behavioral (երեք ուշ-ուրբաթ առանց-review merge՝ ամսաթվերով), ոչ բնավորության դատ («անզգույշ ես»), ուստի թիրախավորում է փոփոխելի վարք, ոչ Sam-ի identity-ն որպես արագ, տաղանդավոր engineer — որ հենց այն identity stake-ն է, որ այլապես defensiveness կառաջացներ։ Impact-ը կոնկրետ է և անվանում է իրական cost, որ կրում է իրական մարդ (on-call-ի շաբաթ օրը), ինչը request-ը դարձնում է արդար, ոչ մանրախնդիր։ Այն բացահայտ դուրս է բերում speaker-ի սեփական հնարավոր սխալ-ընթերցումը և հրավիրում ուղղում, ինչը պահում է երկկողմանի խոսակցություն («ինչ եղավ» խոսակցությունն ազնիվ արված)՝ verdict-ի փոխարեն։ Եվ ավարտվում է հստակ, անելի request-ով plus բաց հարցով, ոչ նկատողությամբ — ուստի Sam-ը հեռանում է հաջորդ action-ով, ոչ վերքով։
