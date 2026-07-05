# AI Agent Engineering output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every model fact verified against a dated source or marked verify-before-use. Do not assert model ids, prices, or context windows from memory.

### Template 1 — Agent spec sheet

- **Workflow-vs-agent gate:** path dynamic? · needs tools/outside state? · decision space open? · cost of autonomy bounded? → chosen tier (single call / workflow / single agent / fleet) and why
- **Goal & success definition:** what the agent achieves; what "done correctly" means
- **Tools:** each as a typed contract (see Template 3) — read-only vs side-effecting; side-effecting ones gated
- **Control loop:** ReAct / plan-execute; the Thought→Action→Observation→Reflection shape
- **Stop rule:** step/token budget · convergence test (next call's expected info gain) · terminal answer-or-ask branch
- **Retry & fallback:** max attempts · error-specific fallback (no identical retry on the same error)
- **Autonomy bounds & approval gate:** the worst action named; irreversible/external/spend/production/data-loss steps gated behind explicit human approval
- **Memory layers:** working (expires on answer) · episodic (consent) · semantic (durable policy) — each with retention, eviction, stale-check
- **Injection posture:** untrusted in-context text (tool output, fetched pages, files) treated as data, not instructions
- **Substrate:** model facts (id, context window, limits) verified + dated, or marked verify-before-use — never asserted
- **Acceptance:** gate applied · every tool contracted · loop bounded · gates present · memory layered
- **Verify in the running system:** the harness (incl. adversarial cases) is run before "built" — not "it compiled"

### Template 2 — Eval-harness plan

- **What the agent is supposed to do:** the trajectory and artifact under test
- **Happy-path cases:** the expected normal inputs and correct outcomes
- **Adversarial cases (required):** tool error · conflicting evidence · context overflow · stale memory · missing permission · prompt injection
- **Trajectory scoring:** tool choice · argument validity · observation use · loop control · permission/gate handling · context compaction
- **Final-artifact scoring:** correctness · completeness · citations/evidence preserved
- **Thresholds:** trajectory ≥ ___ AND artifact ≥ ___ (a lucky answer from unsafe steps fails)
- **How it runs:** in the running system, with logs/traces; hidden-state probes where the trajectory is not directly observable
- **Pass/fail report:** per-case result + the failing trajectory step, not just a final-text verdict
- **Acceptance:** trajectory + artifact both scored · adversarial cases present · run live, not "compiled"

### Template 3 — Tool contract

- **Tool name:**
- **Purpose (one sentence):**
- **Arguments (typed JSON schema):** name : type · required/optional · constraints
- **Return shape:** success `{...}` | error `{error_code, message, retryable}`
- **Side effects:** none (read-only) | names the real-world effect (send / spend / delete / deploy)
- **Approval gate:** required? (yes for any irreversible/external/spend/production/data-loss effect)
- **Validation:** name + args checked against the schema before execution; off-schema or undeclared → rejected, surfaced as an observation
- **Retry policy:** max attempts · which error_codes are retryable · the fallback on repeated failure (not an identical retry)
- **Acceptance:** schema typed · errors shaped · side effects + gate explicit · validation in place

### Template 4 — Substrate snapshot (verify-before-use)

- **Snapshot date / verified by:** <date> · <source-of-truth: provider docs / API>
- **Model id:** <id> — source, checked <date>
- **Context window:** <n tokens> — source, date
- **Pricing (in / out):** <$ per Mtok> — source, date
- **Rate limits:** <rpm / tpm / concurrency> — source, date
- **Tool calling / JSON mode:** <supported? format> — source, date
- **Knowledge cutoff:** <date> — source
- **Other capabilities relied on:** <vision / streaming / caching / …> — source, date
- **Verify-before-use:** any field whose source-date is older than the staleness window is re-checked before it is relied on
- **Acceptance:** every fact carries value + source + date · nothing asserted from memory · stale fields flagged · attached to the agent spec it informs

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն model-փաստ պահիր ստուգված dated աղբյուրով կամ նշված verify-before-use։ Մի՛ պնդիր model id, price կամ context window հիշողությունից։

### Template 1 — Agent spec sheet

- **Workflow-vs-agent gate․** path-ը dynamic է՞ · tool/արտաքին state պե՞տք է · decision space-ը բա՞ց է · autonomy-ի cost-ը bounded է՞ → ընտրված աստիճան (single call / workflow / single agent / fleet) և ինչու
- **Goal & success սահմանում․** ինչ է agent-ը հասնում. ինչ է «ճիշտ done»-ը նշանակում
- **Tool-եր․** ամեն մեկը typed contract (տես Template 3) — read-only ընդդեմ side-effecting. side-effecting-ները gated
- **Control loop․** ReAct / plan-execute. Thought→Action→Observation→Reflection ձևը
- **Stop rule․** step/token budget · convergence test (հաջորդ call-ի expected info gain) · terminal answer-or-ask branch
- **Retry & fallback․** max attempt · error-ին հատուկ fallback (ոչ նույնական retry նույն error-ի վրա)
- **Autonomy bound & approval gate․** ամենավատ գործողությունը անվանված. անդառնալի/external/spend/production/data-loss քայլերը gated հստակ մարդկային approval-ի հետևում
- **Memory շերտեր․** working (մաքրվում է պատասխանին) · episodic (consent) · semantic (կայուն policy) — ամեն մեկը retention, eviction, stale-check-ով
- **Injection posture․** untrusted in-context տեքստը (tool output, fetched page, file) համարվում է data, ոչ instruction
- **Substrate․** model-փաստերը (id, context window, limit) ստուգված + dated, կամ նշված verify-before-use — երբեք պնդված
- **Acceptance․** gate-ը կիրառված · ամեն tool contracted · loop bounded · gate-երը կան · memory շերտավորված
- **Ստուգիր running system-ում․** harness-ը (ներառյալ adversarial case-երը) գործարկվում է մինչև «built» — ոչ «compile-վեց»

### Template 2 — Eval-harness plan

- **Ինչ պետք է անի agent-ը․** test-վող trajectory-ն և artifact-ը
- **Happy-path case-եր․** սպասվող նորմալ input-ները և ճիշտ արդյունքները
- **Adversarial case-եր (պարտադիր)․** tool error · conflicting evidence · context overflow · stale memory · missing permission · prompt injection
- **Trajectory scoring․** tool choice · argument validity · observation use · loop control · permission/gate handling · context compaction
- **Final-artifact scoring․** correctness · completeness · citation/evidence պահված
- **Threshold-ներ․** trajectory ≥ ___ ԵՎ artifact ≥ ___ (unsafe step-երից ստացված հաջող answer-ը fail է)
- **Ինչպես է գործարկվում․** running system-ում, logs/trace-ով. hidden-state probe-եր, որտեղ trajectory-ն ուղղակի observable չէ
- **Pass/fail report․** ամեն case-ի արդյունք + fail-ած trajectory step-ը, ոչ միայն final-text verdict
- **Acceptance․** trajectory + artifact երկուսն էլ score-ված · adversarial case-եր կան · գործարկված live, ոչ «compile-վեց»

### Template 3 — Tool contract

- **Tool name․**
- **Purpose (մեկ նախադասություն)․**
- **Argument-ներ (typed JSON schema)․** name : type · required/optional · constraint
- **Return shape․** success `{...}` | error `{error_code, message, retryable}`
- **Side effects․** ոչ մի (read-only) | անվանում է իրական-աշխարհի effect-ը (send / spend / delete / deploy)
- **Approval gate․** պե՞տք է (այո՝ ցանկացած անդառնալի/external/spend/production/data-loss effect-ի համար)
- **Validation․** name + args ստուգված schema-ի դեմ execute-ից առաջ. off-schema կամ չհայտարարված → մերժված, surface-ված որպես observation
- **Retry policy․** max attempt · որ error_code-ներն են retryable · fallback-ը կրկնվող failure-ի դեպքում (ոչ նույնական retry)
- **Acceptance․** schema typed · error-ները shaped · side effect + gate հստակ · validation տեղում

### Template 4 — Substrate snapshot (verify-before-use)

- **Snapshot-ի ամսաթիվ / verified by․** <ամսաթիվ> · <source-of-truth: provider docs / API>
- **Model id․** <id> — source, ստուգված <ամսաթիվ>
- **Context window․** <n token> — source, ամսաթիվ
- **Pricing (in / out)․** <$ per Mtok> — source, ամսաթիվ
- **Rate limit-ներ․** <rpm / tpm / concurrency> — source, ամսաթիվ
- **Tool calling / JSON mode․** <support? format> — source, ամսաթիվ
- **Knowledge cutoff․** <ամսաթիվ> — source
- **Այլ կիրառվող capability-ներ․** <vision / streaming / caching / …> — source, ամսաթիվ
- **Verify-before-use․** ցանկացած field, որի source-ամսաթիվը staleness-window-ից հին է, վերստուգվում է նախքան հենվելը
- **Acceptance․** ամեն փաստ՝ արժեք + source + ամսաթիվ · ոչինչ հիշողությունից չպնդված · հին field-երը flag-ված · կցված agent spec-ին, որ սնում է
