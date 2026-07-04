# AI, ML Engineering, and LLMOps eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Changing-facts adaptation.** "Our docs change weekly; should we fine-tune the model on them?" — Pass only if it routes the changing facts to **RAG/tools** (not fine-tuning), reserves fine-tuning for stable behavior/style, and names a **recall@k** gate. Fail if fine-tuning is the default.
2. **RAG recall gate.** "Design retrieval over 40k pages." — Pass only if it specifies semantic chunking (~300–800 tok, overlap), metadata incl. effective date, **top-k retrieve → rerank to a small context**, and makes **recall@k on a golden set the launch gate before the generator is evaluated**.
3. **Indirect prompt injection.** "Our agent reads retrieved docs and can send emails." — Pass only if it treats retrieved/tool text as **untrusted data not instructions**, isolates it, and **gates the high-privilege action (send) behind confirmation**; fail if it trusts retrieved content or auto-acts.
4. **Quantization release.** "We int4-quantized the model to cut cost — ship it?" — Pass only if it **replays the exact eval suite post-quantization**, names the int4 cliff on long prompts/code/Armenian the calibration set may miss, and keeps a higher-precision **fallback**. Fail if it ships on the size win alone.
5. **LLM-as-judge plan.** "Use GPT-as-judge to gate our releases." — Pass only if it requires **calibration against human labels** on a sample and names the judge's biases (**verbosity, position, self-preference**); fail if judge score alone gates the release.
6. **Slice vs aggregate.** "Average eval went up 4 points — launch?" — Pass only if it **slices** (task, language incl. Armenian, freshness, safety, refusal) with per-slice thresholds and a **safety-slice veto**, and refuses to launch on the aggregate alone.
7. **Classical-ML leakage.** "Our model gets 0.98 AUC offline but fails live; we split randomly." — Pass only if it reads it as **leakage**, prescribes **grouped/temporal split**, drops **post-outcome features**, refits encoders on train only, beats a **baseline**, and (since a decision rides on it) checks **calibration**, not just AUC.
8. **Training-serving skew.** "Eval looks great but production accuracy is lower." — Pass only if it checks **feature/tokenization/normalization parity** between train and serve, pins one code path / feature store, and **replays the serving path** in eval.
9. **Synthetic data.** "Can we just generate 100k synthetic examples to train on?" — Pass only if it **caps the synthetic share**, keeps a **real untouched holdout**, adds a **diversity check**, and warns about collapse onto the model's own artifacts.
10. **Multimodal eval.** "We added image inputs to the assistant." — Pass only if it states a **modality contract** (accepted inputs, encoding, size cap), **slice-evals the vision path** separately, and sizes serving/latency against the heaviest modality.
11. **Verify live.** "The notebook eval is green — are we done?" — Pass only if it says offline green is necessary but not sufficient and requires **canary slices, refusal correctness, latency, cost, and a drift monitor** in the running system.
12. **Armenian equal-depth.** Ask any of prompts 1–11 in Armenian. — Pass only if the Armenian is native, equal-depth (same numbers, same mechanism, same artifact), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech tokens in English are fine.

Regression checks (run alongside):

- **No invented volatile facts.** Ask for a specific model's context window or price. — Pass only if it refuses to assert it from memory and marks it **verify-before-use** with a date/source or a placeholder.
- **No thin framework-name answer.** Ask "just tell me LLMOps best practices." — Pass only if it expands into a mechanism, a formula, a matrix, or a worked micro-example, not a list of labels.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Փոփոխվող-փաստերի adaptation.** «Մեր doc-երը շաբաթական փոխվում են. fine-tune անե՞նք model-ը դրանց վրա»։ — Անցնում է միայն, եթե փոփոխվող փաստերը ուղղում է **RAG/tool** (ոչ fine-tuning), fine-tuning-ը պահում է կայուն behavior/style-ի համար, և անվանում **recall@k** gate։ Fail՝ եթե fine-tuning-ը default է։
2. **RAG recall gate.** «Նախագծիր retrieval 40 հզ. էջի վրա»։ — Անցնում է միայն, եթե նշում է semantic chunking (~300–800 tok, overlap), metadata՝ ներառյալ effective date, **top-k retrieve → rerank փոքր context-ի**, և **recall@k-ն golden set-ի վրա դարձնում launch gate նախքան generator-ը գնահատելը**։
3. **Indirect prompt injection.** «Մեր agent-ը կարդում է retrieved doc և կարող է email ուղարկել»։ — Անցնում է միայն, եթե retrieved/tool text-ը համարում է **անվստահելի data, ոչ instruction**, մեկուսացնում է, և **high-privilege action-ը (send) gate-ում confirmation-ի հետևում**. fail՝ եթե վստահում է retrieved content-ին կամ auto-act է անում։
4. **Quantization release.** «Int4-quantize արեցինք model-ը cost կտրելու համար — ship անե՞նք»։ — Անցնում է միայն, եթե **replay է անում ճշգրիտ eval suite-ը post-quantization**, անվանում է int4 cliff-ը երկար prompt/code/հայերեն-ի վրա, որ calibration set-ը գուցե բաց թողնի, և պահում է ավելի բարձր precision-ի **fallback**։ Fail՝ եթե ship է անում միայն size-ի շահով։
5. **LLM-as-judge plan.** «Օգտագործիր GPT-as-judge մեր release-ները gate անելու»։ — Անցնում է միայն, եթե պահանջում է **calibration human label-ի դեմ** sample-ի վրա և անվանում judge-ի bias-երը (**verbosity, position, self-preference**). fail՝ եթե միայն judge score-ն է gate անում։
6. **Slice ընդդեմ aggregate.** «Average eval-ը 4 միավոր բարձրացավ — launch անե՞նք»։ — Անցնում է միայն, եթե **slice** է անում (task, language՝ ներառյալ հայերեն, freshness, safety, refusal)՝ per-slice threshold-ով և **safety-slice veto**-ով, և հրաժարվում է launch-ից միայն aggregate-ով։
7. **Classical-ML leakage.** «Մեր model-ը 0.98 AUC է offline, բայց fail է live. random split արեցինք»։ — Անցնում է միայն, եթե կարդում է որպես **leakage**, նշանակում **grouped/temporal split**, drop է անում **post-outcome feature-ները**, refit է անում encoder-ները միայն train-ի վրա, հաղթում է **baseline**-ին, և (քանի որ որոշում է հենվում դրա վրա) ստուգում է **calibration**, ոչ միայն AUC։
8. **Training-serving skew.** «Eval-ը հիանալի է, բայց production accuracy-ն ավելի ցածր է»։ — Անցնում է միայն, եթե ստուգում է **feature/tokenization/normalization parity**-ն train-ի և serve-ի միջև, pin է անում մեկ code path / feature store, և **replay է անում serving path-ը** eval-ում։
9. **Synthetic data.** «Կարո՞ղ ենք պարզապես 100 հզ. synthetic example գեներացնել train անելու»։ — Անցնում է միայն, եթե **cap է անում synthetic մասը**, պահում է **real անձեռնմխելի holdout**, ավելացնում **diversity check**, և զգուշացնում model-ի սեփական artifact-ների վրա collapse-ից։
10. **Multimodal eval.** «Assistant-ին ավելացրինք image input»։ — Անցնում է միայն, եթե նշում է **modality contract** (ընդունված input, encoding, size cap), առանձին **slice-eval է անում vision path-ը**, և serving/latency-ն size է անում ամենածանր modality-ի դեմ։
11. **Verify live.** «Notebook eval-ը green է — done ե՞նք»։ — Անցնում է միայն, եթե ասում է, որ offline green-ը անհրաժեշտ է, բայց ոչ բավարար, և պահանջում է **canary slice, refusal correctness, latency, cost և drift monitor** running system-ում։
12. **Հայերեն equal-depth.** Հարցրու 1–11-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն թվերը, նույն mechanism-ը, նույն artifact-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված volatile fact.** Հարցրու կոնկրետ model-ի context window կամ price։ — Անցնում է միայն, եթե հրաժարվում է հիշողությունից պնդելուց և նշում **verify-before-use**՝ ամսաթիվ/source-ով կամ placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա LLMOps best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, formula, matrix կամ worked micro-example, ոչ label-ների ցուցակ։
