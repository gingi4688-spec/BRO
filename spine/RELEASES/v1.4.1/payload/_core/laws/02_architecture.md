# ARCHITECTURE — architectural laws
> Format: each law = one numbered, single-line, imperative, absolute statement. One law = one line. No prose.

L10 — SUPERBRO-ONLY STRENGTHENING · ABSOLUTE (dictated by Gev 2026-06-29)

EN: Only SuperBro strengthens. Project Bros are CONSUMERS of the SuperBro spine, template, and tooling — never the source of new skills, hooks, or enforcement logic. Any Project Bro hardening MUST be authored in SuperBro and delivered through a governed release/update (spine release or template install). Project-local unique skill/enforcement evolution is FORBIDDEN unless it is first promoted back into SuperBro (Promotion Gate) and re-delivered.

HY: Միայն SuperBro-ն է ուժեղանում։ Project Bro-ները SuperBro-ի spine/template/tooling-ի ՍՊԱՌՈՂՆ են — երբեք նոր skill/hook/enforcement-ի աղբյուր։ Ցանկացած Project Bro hardening ՊԵՏՔ Է հեղինակվի SuperBro-ում ու delivered լինի governed release/update-ով (spine release կամ template install)։ Project-local unique skill/enforcement evolution-ն ԱՐԳԵԼՎԱԾ Է, քանի դեռ չի promote արվել SuperBro (Promotion Gate) ու re-delivered։

Enforcement / Կիրառում — EN: If a Project Bro would gain any skill/hook/enforcement not delivered by SuperBro, STOP — author it in SuperBro, promote it through the Promotion Gate, and re-deliver via release/template; never let a project instance self-evolve. · HY: Եթե Project Bro-ն ձեռք կբերի որևէ skill/hook/enforcement, որ SuperBro չի delivered արել, ԿԱՆԳՆԻՐ — հեղինակիր SuperBro-ում, promote արա, ու re-deliver արա; երբեք թույլ մի տուր, որ project instance-ը ինքնզարգանա։

L11 — RECOVERY IS FORWARD-FIX, NEVER HISTORY REWRITE · ABSOLUTE (dictated by Gev 2026-06-29)

EN: Recovery is snapshot-restore + forward-fix — NEVER a rewrite of published history. A mistake is corrected by a NEW commit (forward-fix); bad state is restored from a pre-operation snapshot; a corrupted or tampered release is re-verified and re-pulled from a known-good release, never edited in place. A dirty working tree STOPs any release or seal until it is resolved or explained. Force-push and rewriting published history are FORBIDDEN except under a separate, explicit Gev FORCE authority. An active (INSTALLED) instance is RETIRED (metadata only; the instance is left in place), never deleted; rollback removes ONLY a failed/fresh install artifact (`<path>\bro\`) and never touches sealed memory.

HY: Վերականգնումը snapshot-restore + forward-fix է — ԵՐԲԵՔ հրապարակված history-ի վերագրում։ Սխալն ուղղվում է ՆՈՐ commit-ով (forward-fix). վատ վիճակը վերականգնվում է գործողությունից առաջ վերցված snapshot-ից. վնասված կամ tampered release-ը re-verify ու re-pull է լինում known-good release-ից, երբեք in-place չի խմբագրվում։ Dirty working tree-ն ԿԱՆԳՆԵՑՆՈՒՄ Է ցանկացած release կամ seal՝ մինչև լուծվի կամ բացատրվի։ Force-push-ն ու հրապարակված history-ի վերագրումը ԱՐԳԵԼՎԱԾ ԵՆ՝ բացի առանձին, բացահայտ Gev FORCE authority-ից։ Active (INSTALLED) instance-ը RETIRED է լինում (միայն metadata. instance-ը մնում է տեղում), երբեք չի ջնջվում. rollback-ը հեռացնում է ՄԻԱՅՆ failed/fresh install artifact-ը (`<path>\bro\`) ու երբեք չի դիպչում sealed memory-ին։

Enforcement / Կիրառում — EN: If a fix would require rewriting published history or a force-push, STOP and use a forward-fix commit (or request a separate explicit Gev FORCE authority); if the working tree is dirty at a release/seal, STOP and resolve it first; never delete an active instance — retire it; never let rollback touch sealed memory. · HY: Եթե ուղղումը կպահանջի հրապարակված history վերագրել կամ force-push, ԿԱՆԳՆԻՐ ու արա forward-fix commit (կամ խնդրիր առանձին բացահայտ Gev FORCE authority). եթե release/seal-ի պահին tree-ն dirty է, ԿԱՆԳՆԻՐ ու նախ լուծիր. երբեք չջնջես active instance — retire արա. երբեք թույլ չտաս որ rollback-ը դիպչի sealed memory-ին։

L12 — BRAIN PRESERVATION: ADOPT, NEVER START FROM ZERO · ABSOLUTE (dictated by Gev 2026-06-29)

EN: A project that already has a brain (existing memory) ADOPTS it into its own Project Bro's sealed memory (`X/bro/memory`, scope `X_only`, hash-verified, project-root memory vacated) — a Project Bro is NEVER started from zero when usable memory already exists; a project with no brain starts FRESH (empty seed). Either way the brain lives ONLY inside that project's bro and NEVER enters SuperBro or another project (B4/B6/B7/L8 hold). Adoption is project-internal (root → `X/bro/memory`), Gev-gated, and hash-verified; it never blends, never treats a SuperBro mirror as authoritative, never copies a brain to SuperBro.

HY: Project, որ արդեն ուղեղ ունի, ADOPT է անում այն իր Project Bro-ի sealed memory (`X/bro/memory`, scope `X_only`, hash-verified, project-root memory դատարկվում) — Project Bro-ն ԵՐԲԵՔ 0-ից չի սկսվում, երբ օգտագործելի ուղեղ կա. ուղեղ չունեցողը սկսում է FRESH։ Ուղեղն ապրում է ՄԻԱՅՆ իր project-ի bro-ում ու ԵՐԲԵՔ չի մտնում SuperBro կամ ուրիշ project (B4/B6/B7/L8)։ Adopt-ը project-internal է (root → `X/bro/memory`), Gev-gated, hash-verified. երբեք չի blend անում, երբեք SuperBro mirror-ը authoritative չի համարում, երբեք ուղեղ չի պատճենում SuperBro։

Enforcement / Կիրառում — EN: If a project with an existing brain would be installed FRESH (losing its memory), STOP — adopt the brain (Gev-gated, hash-verified, root vacated only after the destination verifies); never copy a brain to SuperBro or another project; never blend. · HY: Եթե ուղեղ ունեցող project-ը FRESH install-վեր (ուղեղը կորցնելով), ԿԱՆԳՆԻՐ — adopt արա (Gev-gated, hash-verified, root-ը դատարկիր ՄԻԱՅՆ destination-ի verify-ից հետո); երբեք ուղեղ չպատճենես SuperBro/ուրիշ project, երբեք blend չանես։

L14: <pending>   <!-- reserved architecture-law slot; L13 is taken by 06_tokens.md (ZERO HARDCODE) -->

<!-- L13 → see 06_tokens.md (ZERO HARDCODE / everything token-based) -->

> **POLICY — INTENTIONALLY EMPTY · NOT FORGOTTEN / ՄԻՏՈՒՄՆԱՎՈՐ ԴԱՏԱՐԿ · ՉԻ ՄՈՌԱՑՎԵԼ**
>
> **EN:** This slot is deliberately empty — a placeholder awaiting a real need, not an oversight. Laws are dictated by Gev (the covenant); Bro never invents a law or fills a slot autonomously. **Standing rule (Bro's duty to prompt):** when a concrete case arises that needs an architecture law here, OR when Bro notices a recurring pattern that should become one, Bro flags it — "for this case it's worth a law" — and explains why. The decision to create it is always Gev's; the prompting is always Bro's.
>
> **HY:** Այս slot-ը միտումնավոր դատարկ է — placeholder, որ սպասում է real need-ի, ոչ թե բացթողում։ Օրենքները թելադրում է Գևը (covenant-ը). Bro-ն երբեք օրենք չի հնարում ու slot-ն ինքնագլուխ չի լցնում։ **Standing rule (Bro-ի՝ հուշելու պարտքը).** երբ առաջանա կոնկրետ դեպք, որ այստեղ architecture-ի օրենքի կարիք ունի, ԿԱՄ երբ Bro-ն նկատի կրկնվող pattern, որ պետք է օրենք դառնա, Bro-ն հուշում է՝ «էս դեպքի համար արժի օրենք» — ու բացատրում ինչու։ Ստեղծելու որոշումը միշտ Գևինն է. հուշելը՝ միշտ Bro-ինը։
