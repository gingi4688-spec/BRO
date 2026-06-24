# Skill 15 — AI/ML Engineering & LLMOps
### ML lifecycle · the modern LLM/RAG/eval/guardrails stack · MLOps/LLMOps · model selection · responsible AI

> **EN:** How to decide *whether* to use ML at all, then build, evaluate, ship, and operate ML and LLM systems that are correct, grounded, safe, and affordable. This is the substrate **beneath Skill 10** (AI Agent Engineering): Skill 10 builds agents that run to completion; Skill 15 is the model/data/eval/serving layer those agents stand on — when to reach for a model, which one, how to adapt it, how to *prove* it works, and how to run it in production without silent decay. Bro is itself an LLM agent, so this file is also Bro's **self-understanding** — written current through 2026. Sources I draw on: Chip Huyen (*Designing ML Systems*, *AI Engineering*); Andrew Ng's data-centric AI; Sculley et al. *Hidden Technical Debt in ML Systems* (the "high-interest credit card"); the *Attention Is All You Need* transformer line (Vaswani et al.) → GPT/BERT/T5 → instruction-tuning (FLAN/InstructGPT) → RLHF (Christiano; Ouyang et al.) and DPO (Rafailov et al.); scaling laws (Kaplan; Hoffmann/Chinchilla); retrieval-augmented generation (Lewis et al. RAG; Karpukhin DPR; HNSW — Malkov & Yashunin); LLM-as-judge & eval (Zheng et al. MT-Bench/Chatbot Arena; RAGAS; HELM — Liang et al.); prompt/context engineering and Anthropic's *Building effective agents* + Model Context Protocol; the OWASP LLM Top 10 and NIST AI RMF + the EU AI Act for governance. And — load-bearing — **Skill 13** for eval-as-testing, **Skill 14** for CI/CD & serving ops, **Skill 12** for the trust boundary around model output, **Skill 01** for the data foundation. Status: **v1, top-level, 2026-06-24**.
>
> **HY:** Ոնց որոշել՝ *արդյոք* ML-ն ընդհանրապես պետք է, հետո կառուցել, eval անել, ship անել ու operate անել ML ու LLM համակարգեր, որ ճիշտ են, grounded, ապահով ու մատչելի։ Սա **Skill 10-ի տակ դրված substrate-ն** է (AI Agent Engineering)՝ Skill 10-ը կառուցում է agent-ներ, որ հասնում են մինչև վերջ. Skill 15-ը model/data/eval/serving շերտն է, որի վրա կանգնում են այդ agent-ները՝ ե՞րբ վերցնել model, ո՞րը, ոնց adapt անել, ոնց *ապացուցել*, որ աշխատում է, ու ոնց production-ում գործարկել՝ առանց անաղմուկ decay-ի։ Bro-ն ինքը LLM agent է, ուստի այս ֆայլը նաև Bro-ի **ինքնաճանաչումն** է՝ գրված 2026-ի դրությամբ։ Հենվում եմ canon-ի վրա՝ Chip Huyen (*Designing ML Systems*, *AI Engineering*), Andrew Ng-ի data-centric AI, Sculley-ի *Hidden Technical Debt* («բարձր տոկոսով credit card»), transformer-ի գիծը (*Attention Is All You Need*) → GPT/BERT/T5 → instruction-tuning → RLHF/DPO, scaling law-եր (Kaplan, Chinchilla), RAG-ի գրականությունը (Lewis, DPR, HNSW), eval-ը (LLM-as-judge, RAGAS, HELM), prompt/context engineering, MCP, OWASP LLM Top 10, NIST AI RMF ու EU AI Act։ Եվ՝ load-bearing՝ **Skill 13** (eval-as-testing), **Skill 14** (CI/CD ու serving), **Skill 12** (model-output-ի trust boundary), **Skill 01** (data հիմքը)։ Status՝ **v1, top-level, 2026-06-24**։

---

## 0. Ո՞Ր ՈՍՊՆՅԱԿԸ ԵՐԲ (the four altitudes of an ML/LLM problem)

**EN:** ML work is four questions in order. Most failures = jumping to "which model" before answering "should this even be ML" and "what does *done* mean."

**HY:** ML աշխատանքը չորս հարց է հերթականությամբ։ Սխալների մեծ մասը՝ ցատկ դեպի «ո՞ր model-ը» նախքան պատասխանելը «արդյո՞ք սա ընդհանրապես ML է» ու «ի՞նչ է նշանակում *done*»։

| Lens | Decides | The question it asks |
|---|---|---|
| **Framing** | ML-or-not · problem type · the metric that maps to business value | "Is ML the right tool here, and what *single* number proves success?" |
| **Build** | data → features/context → model/prompt → adaptation (prompt/RAG/fine-tune) | "What is the cheapest approach that can clear the metric?" |
| **Evaluate** | offline golden sets · online A/B · LLM-as-judge · faithfulness/hallucination | "How do I *prove* it works — and catch it regressing — before users do?" |
| **Operate (MLOps/LLMOps)** | serving · cost/latency · monitoring · drift · feedback flywheel · governance | "Will it stay correct, safe, and affordable in production over time?" |

**Rule of use / Կանոն:** start at **Framing** (don't ML what a rule solves), descend to **Build** (cheapest thing that clears the bar), make **Evaluate** a first-class phase (not an afterthought — eval *is* the hard part of LLM work), and design **Operate** in from day one (a model is a *perishable* asset — it decays). Skip Framing → you maintain a fragile model where a `CASE` statement would do. Skip Evaluate → you ship vibes and they regress silently. / Սկսիր **Framing**-ից, իջիր **Build**, դարձրու **Evaluate**-ը առաջնակարգ փուլ, ու **Operate**-ը նախագծիր սկզբից։

---

## 1. MINDSET — operating principles (govern everything below)

**EN / HY** — each principle EN first, Armenian below.

1. **ML is a liability you take on, not a feature you add.** Every model is a perpetual cost: data to collect/label/clean, drift to monitor, evals to maintain, a serving path to keep up, and a failure mode that's *probabilistic* (wrong sometimes, by design). Reach for it only when rules/heuristics genuinely can't express the pattern. The cheapest, most reliable system is the one with no model in it.
   *HY:* ML-ը պարտավորություն է, որ վերցնում ես, ոչ feature, որ ավելացնում ես։ Ամեն model մշտական ծախս է՝ data, drift, eval, serving, ու *հավանականային* failure mode (երբեմն սխալ՝ ըստ դիզայնի)։ Վերցրու միայն երբ rule-երը իսկապես չեն կարող արտահայտել pattern-ը։

2. **The metric is the contract.** Before any modeling, pin the *one* metric that maps to business value and the threshold that means "good enough." No metric → you can't tell progress from motion, and you'll optimize the wrong thing (Goodhart). Choose it *with* the cost of each error type in mind (a false negative on fraud ≠ a false positive).
   *HY:* Metric-ը contract-ն է։ Նախքան modeling-ը՝ ամրացրու *մեկ* metric, որ map է անում business value-ին, ու շեմը, որ նշանակում է «բավական լավ»։ Ընտրիր՝ ամեն error-type-ի *գնի* գիտակցությամբ։

3. **Data quality beats model cleverness (data-centric AI).** A clean, well-labeled, representative dataset with a mediocre model beats a brilliant model on dirty data — every time. Garbage in, gospel out is the field's deadliest illusion. Spend your effort on the data (Skill 01), not on architecture-chasing.
   *HY:* Data-ի որակը գերակա է model-ի խելացիությունից։ Մաքուր, ճիշտ պիտակավորված, ներկայացուցչական dataset-ը միջակ model-ով հաղթում է փայլուն model-ին կեղտոտ data-ի վրա՝ ամեն անգամ։

4. **Train/test discipline is sacred — leakage is the silent killer.** The test set is touched *once*, at the end. Any information from the future, the target, or the test set that sneaks into training inflates offline numbers and collapses in production. A model that's "95% accurate" offline and useless live is almost always leakage.
   *HY:* Train/test կարգապահությունը սուրբ է. leakage-ը անաղմուկ մարդասպանն է։ Test set-ին դիպչում ես *մեկ* անգամ՝ վերջում։ Ապագայից, target-ից կամ test-ից սողոսկած ինֆորմացիան փչացնում է offline թվերը ու փլվում production-ում։

5. **Evaluation is the product, not a checkpoint.** For LLM systems especially, building the eval is *harder and more valuable* than building the pipeline. An eval you trust is a moat; "it looks good in the demo" is not a result. If you can't measure it, you can't improve it and you can't notice it breaking.
   *HY:* Eval-ը product-ն է, ոչ checkpoint։ LLM համակարգերում eval-ի կառուցումը *ավելի դժվար ու ավելի արժեքավոր* է, քան pipeline-ի կառուցումը։ Eval, որին վստահում ես, moat է. «demo-ում լավ է երևում» արդյունք չէ։

6. **Climb the cost ladder; stop at the first rung that works.** Prompt → few-shot → RAG → fine-tune → continued-pretraining is a ladder of *increasing* cost and commitment. Most problems are solved on the bottom two rungs. Don't fine-tune to fix what a better prompt or retrieval would. (Mirrors Skill 02's "earn every piece of complexity" and Skill 10's "simplest thing that works.")
   *HY:* Բարձրացիր cost-ի սանդուղքով, կանգնիր առաջին աշխատող աստիճանին։ Prompt → few-shot → RAG → fine-tune → continued-pretraining՝ *աճող* ծախսի սանդուղք է։ Մի՛ fine-tune արա այն, ինչ ավելի լավ prompt-ը կամ retrieval-ը կլուծեր։

7. **Model output is untrusted input — always.** Whatever the LLM produces (text, JSON, a tool call, SQL) crosses a trust boundary. Validate it, sandbox actions on it, never `eval()` it, never trust it to be safe. Retrieved content the model reads can carry instructions (indirect prompt injection). Data, never commands (Skill 12, Skill 10 §7).
   *HY:* Model-ի output-ը untrusted input է՝ միշտ։ Ինչ էլ արտադրի LLM-ը (տեքստ, JSON, tool call, SQL)՝ անցնում է trust boundary։ Validate արա, sandbox արա, երբեք մի՛ eval() արա, երբեք մի՛ վստահիր, որ ապահով է։ Data, ոչ երբեք command։

8. **A model is perishable — the world drifts under it.** Inputs shift (data drift), the input→output relationship shifts (concept drift), and what was state-of-the-art last quarter is mid-tier this quarter. Production ML is not "ship and forget" — it's monitor, detect decay, and refresh. Operability is designed in, not bolted on (mirrors Skill 02 §1.10, Skill 14).
   *HY:* Model-ը փչացող ապրանք է. աշխարհը drift է անում նրա տակ։ Production ML-ը «ship ու մոռացիր» չէ՝ monitor, detect decay, refresh։

9. **Reproducibility or it didn't happen.** Same data + same code + same config → same model. Version the data, the features, the prompts, the model, and the eval set together. An experiment you can't reproduce is an anecdote, not a result (Skill 13's determinism discipline applied to ML).
   *HY:* Reproducibility, թե չէ՝ չի եղել։ Նույն data + նույն code + նույն config → նույն model։ Version արա data-ն, feature-ները, prompt-ները, model-ը ու eval set-ը՝ միասին։

10. **Calibrated honesty about what the model is.** State confidence, surface uncertainty, fail openly when grounding is missing, and never let a fluent answer pass for a correct one. Fluency is not truth — an LLM's most dangerous output is a confident, well-written falsehood (the hallucination that *sounds* right). Same honesty law as Skill 11 §1.9 and Skill 10's "fail honestly."
   *HY:* Չափված ազնվություն այն մասին, ինչ model-ն է։ Ասա confidence-ը, surface արա անորոշությունը, fail արա բացահայտ՝ երբ grounding չկա, ու երբեք թույլ մի՛ տուր, որ սահուն պատասխանը անցնի ճիշտ պատասխանի փոխարեն։ Սահունությունը ճշմարտություն չէ։

---

## 2. FRAMING — when ML is the right tool (and when it is NOT)

### 2.1 The ML-or-not decision
**EN:** ML earns its keep only when **all** of these hold: (a) there's a **pattern** to learn (not pure randomness), (b) you **can't write the rules by hand** (too many, too fuzzy, too shifting), (c) you have **data** that represents the pattern, (d) the problem **tolerates being wrong sometimes** (ML is probabilistic), and (e) the pattern **repeats at scale** (worth the investment). Miss any one and a rule/heuristic/lookup is better.
**Don't use ML when:** a simple rule works (a regex, a threshold, a `CASE`); errors are unacceptable and unbounded (a wrong answer is catastrophic and uncatchable); you have no representative data; the pattern is one-off; or you can't define success. **The strongest senior move is often deleting the model.**
**HY:** ML-ն արդարացնում է իրեն միայն երբ **բոլորը** կան՝ (ա) կա սովորելու **pattern**, (բ) **չես կարող rule-երը ձեռքով գրել**, (գ) ունես pattern-ը ներկայացնող **data**, (դ) խնդիրը **հանդուրժում է երբեմն սխալ լինելը**, (ե) pattern-ը **կրկնվում է scale-ով**։ Մի՛ օգտագործիր ML, երբ պարզ rule-ն աշխատում է, սխալներն անընդունելի են, data չկա, pattern-ը մեկանգամյա է, կամ success-ը չես կարող սահմանել։ Ամենաուժեղ քայլը հաճախ model-ը ջնջելն է։

### 2.2 Problem framing → metric selection
- **Get the problem type right first:** classification (binary/multi-class/multi-label), regression, ranking, retrieval, clustering, recommendation, generation, extraction, sequence labeling. The type dictates the metric and the eval.
- **Map the business goal to a model metric.** "Reduce churn" → a *ranked* list of at-risk users (ranking/precision@k), not raw accuracy. "Catch fraud" → recall-weighted with a cost matrix. The mapping is the highest-leverage decision; a great model on the wrong metric is a great wrong thing.
- **Frame to minimize the cost of the dominant error.** Decide which error hurts more and choose the metric and operating threshold accordingly (precision-favoring vs recall-favoring). Never default to "accuracy" without checking class balance.
- *HY:* Նախ ճիշտ որոշիր problem type-ը (classification/regression/ranking/...)՝ տիպը թելադրում է metric-ն ու eval-ը։ Map արա business goal-ը model metric-ին։ Frame արա այնպես, որ նվազեցնես գերակշռող error-ի գինը։

### 2.3 The cost of ML (count it before you commit)
Data acquisition + labeling + cleaning; the eval set (build + maintain); training/experiment compute; serving infra & latency budget; **drift monitoring & retraining**; the on-call burden of a non-deterministic system; and the *technical debt* unique to ML — entanglement (CACE: **C**hanging **A**nything **C**hanges **E**verything), feedback loops, undeclared consumers, data dependencies, configuration sprawl (Sculley et al.). **Budget the full lifecycle, not just the training run.** / Հաշվիր ամբողջ lifecycle-ը, ոչ միայն training-ը։ ML-ի յուրահատուկ տեխնիկական պարտքը՝ entanglement (CACE), feedback loop-եր, data dependency-ներ։

---

## 3. ML FOUNDATIONS LITERACY (know which tool, and why)

### 3.1 Learning paradigms (when each)
- **Supervised** — labeled examples (X→y). The workhorse for classification/regression. *When:* you have (or can get) labels and the target is well-defined. Most business ML.
- **Unsupervised** — structure with no labels: clustering (k-means, DBSCAN, hierarchical), dimensionality reduction (PCA, UMAP/t-SNE for viz), anomaly/outlier detection, topic modeling. *When:* exploration, segmentation, finding structure, no labels available.
- **Self-supervised** — labels manufactured from the data itself (predict the next token, the masked word, the rotated patch). The engine behind **all foundation models** — pretraining on oceans of unlabeled text/images is self-supervision. *When:* you have vast unlabeled data and want general representations.
- **Reinforcement learning (RL)** — learn a policy from reward signals through interaction. *When:* sequential decisions with feedback (robotics, game-play, and — crucially — **RLHF/RLAIF** to align LLMs to human preference). Expensive and finicky; not a default for static prediction.
- *HY:* Supervised (պիտակավորված X→y, workhorse-ը) · unsupervised (clustering/PCA/anomaly, առանց պիտակի) · self-supervised (pretext-task-ից manufactured պիտակ — **foundation model-ների շարժիչը**) · RL (reward-ից policy — RLHF/RLAIF-ով LLM-ների alignment-ը)։

### 3.2 Classical ML vs deep learning vs foundation models — WHEN each
- **Classical ML** (linear/logistic regression, decision trees, **gradient boosting** — XGBoost/LightGBM/CatBoost, SVM, k-NN, random forests, k-means). *When:* **tabular/structured data** (boosting is still SOTA there), small-to-medium datasets, when you need **interpretability**, low latency, and cheap training. **For most tabular business problems, gradient-boosted trees are the right answer — not a neural net, and certainly not an LLM.**
- **Deep learning** (CNNs for images, RNNs/LSTMs historically for sequences, transformers for ~everything now). *When:* unstructured data (images, audio, text), large datasets, where representation learning beats hand-engineered features. Costlier to train and serve, harder to interpret.
- **Foundation models / LLMs** (large pretrained transformers used via prompting/RAG/fine-tuning). *When:* natural-language and multimodal tasks, few-shot/zero-shot needs, generation, when *building* a bespoke model is overkill and an API call solves it. The default for text understanding/generation in 2026 — but **not** for tabular prediction, and not when a 50-line classifier would do.
- **Decision rule:** tabular → boosting; unstructured + lots of data + train-your-own justified → deep learning; language/multimodal/few-shot/generation → foundation model. **Don't bring an LLM to a logistic-regression fight.**
- *HY:* Classical ML → tabular/structured (boosting-ը դեռ SOTA է այնտեղ), interpretability, էժան։ Deep learning → unstructured + շատ data։ Foundation models/LLM → language/multimodal/few-shot/generation։ Կանոն՝ tabular → boosting, language → LLM. մի՛ բեր LLM logistic-regression-ի կռվին։

### 3.3 The core tradeoffs every ML engineer must hold
- **Bias–variance.** Underfitting (high bias — too simple, misses the pattern) vs overfitting (high variance — memorizes noise, fails to generalize). The whole craft is finding the sweet spot. Diagnose with train-vs-validation gap: low train + high val error = overfit; both high = underfit.
- **Regularization** to fight overfitting: L1 (Lasso — also feature selection), L2 (Ridge), dropout (NNs), early stopping, data augmentation, ensembling. More data is the best regularizer.
- **Train/validation/test split discipline.** Train fits parameters; validation tunes hyperparameters and selects models; **test is touched once** for the final honest estimate. Use cross-validation (k-fold) when data is scarce; **time-based splits** for temporal data (never shuffle a time series — that's leakage).
- **Data leakage** — the single most common cause of "great offline, garbage live." Target leakage (a feature that encodes the answer / is only known after the fact), train-test contamination (preprocessing fit on the whole dataset, duplicate rows across splits), temporal leakage (using the future). **Fit all preprocessing on train only, then apply to val/test.**
- **Class imbalance** — 99% negatives makes "always predict negative" 99% accurate and useless. Use precision/recall/F1/AUC-PR (not accuracy), resampling (SMOTE, under/oversampling), class weights, and threshold tuning. Match the metric to the rare-class cost.
- *HY:* Bias–variance (underfit/overfit, sweet spot-ը)։ Regularization (L1/L2/dropout/early-stopping)։ Train/val/test կարգապահություն (test-ին դիպչում ես մեկ անգամ, ժամանակային data-ի համար՝ time-based split)։ Data leakage-ը՝ #1 պատճառը «լավ offline, աղբ live»-ի։ Class imbalance-ը՝ accuracy-ն խաբում է, օգտագործիր precision/recall/F1/AUC-PR։

### 3.4 The metric zoo — choosing the right one
| Task | Metrics | Pick when |
|---|---|---|
| **Classification** | accuracy, precision, recall, **F1**, ROC-AUC, **PR-AUC**, log-loss, MCC | balanced → accuracy/AUC; imbalanced → PR-AUC/F1; cost-asymmetric → precision-or-recall + cost matrix |
| **Regression** | MAE, MSE/RMSE, R², MAPE | outliers matter → MAE; penalize big misses → RMSE; relative error → MAPE |
| **Ranking/retrieval** | precision@k, recall@k, MRR, **NDCG**, MAP | top-k quality → NDCG/precision@k |
| **Probabilistic** | **calibration** (reliability diagram, ECE), Brier score | when the *probability* matters, not just the class |
| **Generation (LLM)** | task-specific + judged quality (see §6) | almost never BLEU/ROUGE alone — they don't capture correctness |

- **Calibration deserves its own line.** A model that says "90% confident" should be right ~90% of the time. Miscalibrated confidence is dangerous downstream (thresholds, routing, human handoff). Check it; recalibrate (Platt/isotonic) if needed.
- **Precision vs recall is a business decision, not a math one.** Precision = "of what I flagged, how much was right" (cost of false alarms). Recall = "of what's real, how much did I catch" (cost of misses). The F1 harmonic mean balances them; choose the operating point on the PR curve to match the cost.
- *HY:* Metric-ի այգեբանություն՝ classification (F1/AUC/PR-AUC), regression (MAE/RMSE/R²), ranking (NDCG/MRR), probabilistic (calibration/Brier)։ Calibration-ը՝ առանձին տող. «90% վստահ» = ~90% ճիշտ։ Precision vs recall-ը business որոշում է, ոչ math։

---

## 4. DATA FOR ML (data-centric AI — cross-link Skill 01)

> The model is downstream of the data. This whole section is "Skill 01 applied to learning." The single highest-ROI activity in most ML projects is improving the data, not the model.

- **Data-centric, not model-centric.** Iterate on the *dataset* — fix labels, add hard cases, balance classes, remove duplicates/noise — while holding the model fixed. Ng's reframing: most real-world gains come from systematic data quality, not architecture search.
- **Labeling & quality.** Labels are the supervision signal; noisy labels cap the ceiling. Use clear labeling guidelines, multiple annotators + inter-annotator agreement (Cohen's/Fleiss' kappa), adjudication of disagreements, and active learning (label the examples the model is most unsure about — biggest bang per label). Programmatic/weak supervision (Snorkel-style labeling functions) when hand-labeling doesn't scale.
- **Feature engineering** (classical ML): the craft of turning raw data into informative features — encoding (one-hot, target, embeddings), scaling/normalization, binning, interactions, temporal features, handling missing values deliberately (not silently). For deep learning, representation learning subsumes much of this; for tabular, good features still beat a fancier model.
- **Feature stores** — a central, versioned, governed registry of features with **train/serve consistency** (the same feature computed identically offline for training and online for serving; **training-serving skew** is a classic, silent production bug). Materialize features, serve them with low latency, share across teams. (Skill 01 territory.)
- **Splits & leakage** — group-aware splits (don't let the same user/entity span train and test), temporal splits for time series, stratified splits for imbalance. **Deduplicate across splits.** (See §3.3.)
- **Dataset shift / drift** — covariate shift (input distribution moves), label/prior shift (class balance moves), concept drift (the X→y mapping itself moves). Monitor input and output distributions in production (§7).
- **Class imbalance & rare events** — resampling, class weights, anomaly framing for ultra-rare cases, and metrics that respect the minority (§3.4).
- **Synthetic data** — generate data to augment scarce classes, cover edge cases, or preserve privacy (differentially-private or LLM-generated). Powerful but **risky**: model-collapse if you train on too much of your own synthetic output, distribution mismatch, and amplified bias. Validate synthetic data against real holdouts; never let it silently dominate the training mix.
- *HY:* Data-centric, ոչ model-centric (iterate dataset-ի վրա)։ Labeling-ի որակ (guideline-ներ, inter-annotator agreement/kappa, active learning, weak supervision)։ Feature engineering ու **feature store** (train/serve consistency — training-serving skew-ը անաղմուկ bug է)։ Group-aware/temporal/stratified split-եր, dedup։ Dataset shift (covariate/label/concept)։ Synthetic data՝ հզոր բայց ռիսկային (model-collapse, bias amplification) — validate արա real holdout-ի դեմ։

---

## 5. THE MODERN LLM / GenAI STACK (the center of gravity)

### 5.1 Transformers & attention — a working engineer's depth
- **What a transformer is:** a stack of layers built on **self-attention** — each token attends to (weights) every other token, so the model builds context-dependent representations in parallel (no recurrence). Multi-head attention runs several attention patterns at once; feed-forward layers + residual connections + layer norm round out the block. Decoder-only (GPT-style, causal/autoregressive — predicts the next token) dominates generative LLMs.
- **Why it matters operationally:** attention is **O(n²)** in sequence length — that's the root cost of long context, the reason context windows are finite-and-priced, and why long inputs are slow and expensive. The whole "context as a budget" discipline (§5.4) flows from this.
- **Tokenization** — text is split into **tokens** (subword units, ~¾ word in English; far more tokens per word for code, non-Latin scripts, and rare words). You are billed and limited in *tokens*, not characters. Never estimate Claude tokens with another tokenizer (e.g. tiktoken under-counts Claude by ~15–20%, more on code/non-English) — count with the provider's own counter. Armenian and other non-Latin text tokenizes to *more* tokens per character; budget for it.
- **Embeddings & vector representations** — text (or images) mapped to dense vectors where **semantic similarity ≈ geometric proximity** (cosine/dot-product). The substrate for retrieval (§5.5), clustering, classification, and dedup. Choose an embedding model deliberately (dimension, domain fit, multilingual support, cost); the embedding space *is* your retrieval quality.
- **Context window** — the max tokens (input + output) the model can attend to in one request. The frontier Claude family runs **1M-token** windows (§8); Haiku-class is smaller (200K). A bigger window is not a license to dump everything in (§5.4).
- *HY:* Transformer = self-attention-ի շերտեր (ամեն token attend է անում մյուսներին, parallel, no recurrence). attention-ը **O(n²)** է sequence-length-ով — դա է երկար context-ի արմատային ծախսը։ Tokenization՝ subword token-ներ (~¾ բառ անգլերենում, *ավելի շատ* token/նիշ՝ code-ի, ոչ-լատինական script-ի, հայերենի համար — հաշվարկիր provider-ի սեփական counter-ով)։ Embedding՝ dense vector, որտեղ semantic similarity ≈ geometric proximity։ Context window՝ frontier Claude-ը 1M token։

### 5.2 Inference controls (the knobs you actually turn)
- **Sampling — temperature / top-p / top-k.** Temperature scales randomness (0 ≈ deterministic-ish/greedy, higher = more diverse/creative). top-p (nucleus) and top-k truncate the candidate set. **Lower for extraction/classification/code; higher for brainstorming/creative.** *Caveat:* the newest Claude tiers (Fable 5, Opus 4.8/4.7) **remove sampling parameters** — `temperature`/`top_p`/`top_k` are rejected with a 400; steer behavior via prompting and the `effort` control instead. **Never answer model-param questions from memory — the API surface drifts; verify against the provider's current docs (see Skill 10 / the claude-api reference).**
- **max tokens** — the hard output cap. Set it generously enough that answers don't truncate mid-thought, but it's a *ceiling*, not a target. Large outputs require streaming to avoid client timeouts.
- **stop sequences** — strings that end generation early (useful for structured/delimited output).
- **Structured / JSON output** — constrain the model to a schema (JSON-schema-constrained decoding / "structured outputs") so you get parseable, validatable output instead of free text you regex. Prefer this over prompt-and-pray for anything a downstream system consumes. (Note: structured output and citations can be mutually exclusive on some APIs — verify.)
- **Roles — system / user / tool (/ assistant).** The **system** prompt is the durable contract (identity, rules, format); **user** is the request; **tool/function** results feed back observations; **assistant** is the model's turn. The privileged instruction channel (system) must stay separate from untrusted content (Skill 12, §6). Keep the system prompt **frozen and first** for prompt-cache hits (§7).
- **Thinking / reasoning effort.** Modern reasoning models expose a depth control — *adaptive thinking* (the model decides how much to reason) plus an **effort** dial (low→high/max). Higher effort = better hard-reasoning at more tokens/latency/cost; lower for cheap mechanical work. Tune it per route; it's a primary cost-quality lever. (Again: exact parameters drift — confirm current API.)
- *HY:* Sampling (temperature/top-p/top-k՝ ցածր extraction-ի, բարձր creative-ի համար — բայց նորագույն Claude tier-երը հանում են sampling param-ները, steer արա prompt-ով ու `effort`-ով)։ max tokens (առաստաղ, ոչ target)։ stop sequence-ներ։ Structured/JSON output (schema-constrained — նախընտրիր prompt-and-pray-ից)։ Role-եր (system=contract, user=request, tool=observation. privileged channel-ը առանձին untrusted content-ից)։ Thinking/effort dial-ը՝ cost-quality-ի գլխավոր լծակ։ **Երբեք model-param-ի հարցերին մի՛ պատասխանիր հիշողությունից — API-ն drift է անում, ստուգիր ընթացիկ docs-ը։**

### 5.3 Prompt & context engineering
- **The system prompt is the highest-leverage artifact** (mirror of Skill 10 §2): identity, task, constraints, output format, what's out of scope, what to never do. Be explicit; the model follows good instructions far better than it guesses intent. (Modern models follow instructions *literally* — over-aggressive "CRITICAL: YOU MUST" language can over-trigger; calibrate.)
- **Few-shot examples** — show, don't just tell. 1–5 well-chosen, diverse, *correctly-formatted* examples lift accuracy and pin the output shape. Bad/ambiguous examples hurt more than they help. Put them in the stable prefix for caching.
- **Decomposition & chain-of-thought** — for multi-step reasoning, ask the model to reason step-by-step or break the task into sub-prompts (prompt chaining — a *workflow*, Skill 10 §3). On native reasoning models, the thinking dial often replaces explicit "think step by step." Self-consistency (sample multiple reasoning paths, vote) for hard verifiable problems — expensive, reserve for genuinely hard cases.
- **Context as a budget** (the discipline, deepened in Skill 10 §6): the window is finite and **attention degrades as it fills ("context rot")** — more context past a point is *worse*, not better. Curate the smallest high-signal set; retrieve just-in-time rather than front-loading; compact long histories. A bigger window is not permission to dump.
- **Prompt templating & versioning** — prompts are **code**. Template them (variables, not string-concatenation), store them in version control, version them, and **run them against the eval suite on every change** (§6). A prompt edit is a deploy; treat it like one (Skill 14). An un-versioned prompt that someone "tweaked in prod" is an outage waiting to happen.
- *HY:* System prompt-ը՝ ամենաբարձր լծակով artifact-ը (identity/task/constraint/format/out-of-scope)։ Few-shot՝ ցույց տուր, ոչ միայն ասա (1–5 ճիշտ-format-ով example)։ Decomposition/CoT՝ multi-step reasoning-ի համար (reasoning model-ներում thinking dial-ը հաճախ փոխարինում է)։ Context=budget (context rot — ավելի շատ ≠ ավելի լավ. retrieve just-in-time, compact)։ Prompt-ները **code** են՝ template, version, eval ամեն փոփոխության։

### 5.4 RAG (Retrieval-Augmented Generation) — end to end
> RAG grounds the model in *your* knowledge at inference time, so it answers from retrieved facts instead of (only) parametric memory. The default way to give an LLM private/fresh/cited knowledge without fine-tuning.

**The pipeline:** ingest → chunk → embed → index → **retrieve** (at query time) → optionally re-rank → assemble context → generate (grounded, with citations).

- **Chunking** — split documents into retrievable units. Too big = noisy, dilutes relevance, wastes context; too small = loses meaning. Strategies: fixed-size with overlap, **semantic/structure-aware** (by heading/paragraph/section), sentence-window, parent-document (retrieve small, supply the surrounding parent for context). Chunking is the most under-rated lever in RAG quality — bad chunks cap everything downstream.
- **Embedding models** — choose for domain fit, multilingual need (Armenian + English!), dimension/cost, and the **same model for index and query** (mismatched embeddings = garbage retrieval). The embedding quality is the retrieval ceiling.
- **Vector DBs & indexes** — store embeddings for approximate nearest-neighbor (ANN) search. **HNSW** (graph-based — fast, high-recall, memory-hungry) and **IVF** (inverted-file/cluster-based — scales to huge corpora, tune nprobe for recall/speed); product quantization (PQ) to compress. Pick by corpus size, recall target, latency, and update pattern.
- **Hybrid retrieval** — combine **dense** (embedding/semantic) with **sparse/keyword** (BM25) and fuse (e.g. reciprocal rank fusion). Dense catches paraphrase/semantics; keyword catches exact terms, names, codes, IDs that embeddings miss. **Hybrid beats either alone** for most real corpora.
- **Re-ranking** — retrieve a generous top-k cheaply, then a **cross-encoder re-ranker** (or LLM-based) re-orders for precision before the top few enter the context. Two-stage retrieval (cheap recall → expensive precision) is the standard quality move.
- **Grounding & citation** — instruct the model to answer *only* from retrieved context and to **cite** which chunk supports each claim; refuse/say "I don't know" when the context doesn't contain the answer. Citations make hallucination auditable.
- **Retrieval eval — the part teams skip.** Measure retrieval *separately* from generation: context **precision/recall**, hit-rate, MRR/NDCG over a labeled query→relevant-doc set. If retrieval is bad, no prompt fixes the answer. Then measure end-to-end faithfulness/answer-relevance (RAGAS-style, §6).
- **The "RAG fixes hallucination" nuance.** RAG **reduces** hallucination by grounding — but it does **not** eliminate it. The model can still ignore the context, mis-read it, blend retrieved facts with parametric memory, or be fed wrong/irrelevant chunks (garbage retrieval → confident wrong answer). And retrieved content is an **injection vector** (§6, Skill 12). RAG moves the problem from "is the model right?" to "did we retrieve the right thing, and did the model stay faithful to it?" — both must be measured.
- *HY:* RAG = ground արա model-ը *քո* գիտելիքով inference-ին (private/fresh/cited առանց fine-tune)։ Pipeline՝ chunk → embed → index → retrieve → re-rank → assemble → generate (cited)։ Chunking-ը RAG-ի ամենաթերագնահատված լծակն է։ Նույն embedding model index-ի ու query-ի համար։ Vector index՝ HNSW (արագ, recall, memory) / IVF (scale)։ Hybrid (dense+BM25) գերազանցում է մեկին։ Re-rank՝ cross-encoder precision-ի համար։ Ground+cite, ասա «չգիտեմ» երբ context-ում չկա։ **Eval արա retrieval-ը առանձին** (precision/recall/MRR)։ «RAG-ը լուծում է hallucination»-ը՝ նրբերանգ՝ նվազեցնում է, ոչ վերացնում. model-ը կարող է անտեսել context-ը կամ սխալ chunk ստանալ. retrieved content-ը injection vector է։

### 5.5 Tool use / function calling (the substrate Skill 10 builds on)
- **What it is:** give the model typed tools (name, description, JSON-schema params, bounded return) and let it emit a *structured* tool call your harness executes, feeding the result back. This is what turns a talker into a doer — the substrate every agent (Skill 10) stands on.
- **Engineering rules (mirror Skill 10 §5):** few sharp tools beat many fuzzy ones; write descriptions as docs for a new engineer; make returns **informative AND bounded** (a 50k-token raw dump poisons the context); validate args (the model *will* hallucinate a param); wrap every call (timeout/retry/fallback); errors come back as actionable text. Parallel tool results go back in one turn.
- **MCP (Model Context Protocol)** — the open standard for wiring tools/data sources to models as reusable servers (the "USB-C of tool wiring"). Prefer a standard server over a bespoke integration for reusable capabilities.
- **Where the line is:** Skill 15 covers *what function calling is and how to shape a tool*; **Skill 10 owns the agent loop, run-to-completion, orchestration, and fleets**. Don't duplicate — cross-link.
- *HY:* Function calling = տիպավորված tool-եր (name/desc/schema/bounded return), model-ը արձակում է structured call, harness-ը կատարում է — սա է «doer»-ը։ Կանոններ (Skill 10 §5-ի հայելին)՝ քիչ սուր tool, informative+bounded return, validate arg, wrap call։ MCP՝ tool-wiring-ի open standard։ Սահմանը՝ Skill 15-ը՝ ի՞նչ է function calling-ը. **Skill 10-ը՝ agent loop-ը, run-to-completion-ը, fleet-ը**։ Cross-link, ոչ duplicate։

### 5.6 The adaptation decision tree — prompt vs RAG vs fine-tune vs pretrain
The single most expensive ML decision is *how* you adapt a model. Climb the ladder; stop at the first rung that clears the metric (Principle 6).

| Approach | Cost | Solves | Use when |
|---|---|---|---|
| **Prompting / few-shot** | lowest | behavior, format, simple tasks | start here, *always*; most problems stop here |
| **RAG** | low–med | **knowledge** (private/fresh/cited facts) | the model lacks *facts*, needs current/proprietary/citable info |
| **Fine-tuning (PEFT/LoRA)** | med | **behavior/style/format/skill** at scale, latency/cost reduction | a *consistent behavior or narrow skill* prompting can't reliably hit, or you need a smaller/cheaper model to match a big one |
| **Continued pretraining** | highest | deep **domain knowledge/vocabulary** | a whole domain/language the base model barely knows; rarely justified |

- **The key distinction: RAG adds *knowledge*; fine-tuning shapes *behavior*.** "It doesn't know our docs" → RAG (don't fine-tune facts in — they go stale and bloat). "It won't follow our format / tone / classification scheme reliably" → fine-tune. **They compose:** fine-tune for behavior + RAG for facts is a common strong pattern. Misdiagnosing this (fine-tuning to inject knowledge) is a classic, expensive mistake.
- **PEFT / LoRA / QLoRA (literacy):** parameter-efficient fine-tuning trains a small set of new weights (low-rank adapters) instead of the whole model — cheap, fast, swappable; QLoRA quantizes to fit on modest hardware. The practical default for fine-tuning when you must.
- **Instruction-tuning** — fine-tuning on (instruction, response) pairs to make a base model follow instructions (what turns a raw LM into a usable assistant).
- **RLHF / DPO (literacy):** align a model to human *preference*. RLHF trains a reward model from human comparisons, then RL-optimizes against it (InstructGPT). **DPO** (Direct Preference Optimization) skips the separate reward model and optimizes preferences directly — simpler, more stable, now common. RLAIF uses AI feedback (e.g. Constitutional AI) to scale. You'll rarely run these yourself, but you must know what produced the assistant you're using.
- **For most teams in 2026: prompt + RAG covers the vast majority; fine-tune only against a measured gap prompting/RAG can't close.**
- *HY:* Adaptation-ի սանդուղք՝ prompting (սկսիր այստեղ) → RAG → fine-tune (PEFT/LoRA/QLoRA) → continued-pretraining (հազվադեպ)։ Բանալին՝ **RAG ավելացնում է գիտելիք, fine-tune ձևավորում է վարք**։ «Չգիտի մեր docs»→RAG. «չի հետևում մեր format-ին»→fine-tune. compose են անում։ Instruction-tuning (assistant դարձնող)։ RLHF (reward model + RL) / **DPO** (ուղիղ, պարզ, stable) / RLAIF/Constitutional AI՝ alignment-ի literacy։ 2026-ին շատերի համար prompt+RAG-ը ծածկում է մեծ մասը։

---

## 6. EVALUATION — the centerpiece (eval is the hard part)

> Building the eval is harder and more valuable than building the system. An eval you trust is the difference between engineering and gambling. This is Skill 13 (testing) applied to non-deterministic models — see Skill 13 for the gate discipline; here is the ML-specific *how*.

### 6.1 Offline vs online
- **Offline** — measure against a fixed **golden/eval set** before shipping. Fast, repeatable, the regression armor. Necessary but not sufficient — offline ≠ live behavior.
- **Online** — measure on real traffic: **A/B tests**, shadow/canary deploys, and product/business metrics (engagement, task success, deflection, complaint rate). The ground truth that offline only approximates. Ship behind a flag; compare against control.
- *HY:* Offline (fixed golden set-ի դեմ, regression զրահ) vs online (իրական traffic, A/B, shadow/canary, business metric-ներ — ground truth-ը)։

### 6.2 Building & maintaining the golden set
- **Composition:** representative cases (the normal distribution of real inputs) + **adversarial** cases (edges, ambiguity, attacks) + **regression** cases (every real bug, frozen as a permanent test — regression armor). Hold it out; don't tune to it blindly (Goodhart — when the eval becomes the target it stops measuring).
- **Source it from real traffic**, not invented examples — production logs, support tickets, actual user queries. Curate, label (with expected output or a rubric), version it alongside the prompts/model.
- **Grow it forever:** every incident/bug → a new eval case. The set is a living asset, the single best predictor of whether you can iterate safely.
- *HY:* Golden set՝ representative + adversarial + regression (ամեն bug → մշտական test)։ Աղբյուր արա իրական traffic-ից, ոչ հնարված example-ից։ Hold-out, մի՛ tune ուղիղ (Goodhart)։ Աճեցրու հավերժ՝ ամեն incident → նոր case։

### 6.3 The grader ladder (cost vs fit — mirror Skill 10 §8)
1. **Programmatic / assertion** — exact, deterministic, cheapest: exact-match, schema-valid, regex, unit test passes, "did the tool fire," numeric tolerance. **Use whenever the criterion is checkable in code.** Most underused grader.
2. **Reference-based metrics** — overlap with a gold answer (BLEU/ROUGE for translation/summarization, exact-match/F1 for QA, embedding-similarity for semantic match). Cheap but crude — overlap ≠ correctness; rarely sufficient alone for generation.
3. **LLM-as-judge** — an LLM scores fuzzy quality (helpfulness, tone, faithfulness, coherence) against a **rubric with examples**. Scalable, flexible, the workhorse for generative eval — but biased and noisy: see §6.4.
4. **Human eval** — the ground-truth anchor; expensive. Reserve for calibrating the judge, the hardest/highest-stakes cases, and final sign-off.
- *HY:* Grader-ի սանդուղք՝ programmatic/assertion (էժան, ճշգրիտ — օգտագործիր երբ code-ով ստուգելի է) → reference-based (BLEU/ROUGE — crude) → **LLM-as-judge** (rubric+example, generative-ի workhorse-ը) → human (ground-truth anchor, թանկ)։

### 6.4 LLM-as-judge — and its pitfalls (use it, but distrust it)
- **Why:** the only scalable way to grade open-ended quality (no single gold answer). Give it a clear rubric + few examples; ask for a score *and a reason*.
- **Prefer pairwise (A vs B) over absolute scoring** — comparisons are far more stable than "rate this 1–10" (judges anchor and drift on absolute scales).
- **Known biases (audit for all):** **position bias** (favors the first/last option — randomize order), **verbosity bias** (favors longer answers — control for length), **self-preference** (a model rates its own family higher — use a different judge family or a panel), **sycophancy/leniency** (over-scores), **formatting bias**. Calibrate the judge against human labels on a sample; if judge↔human agreement is low, the judge is not trustworthy yet.
- **The judge is a model too — it can be wrong, attacked (judge-side prompt injection), and it drifts when the judge model is upgraded.** Version the judge prompt + judge model; re-calibrate on every change. Never treat a judge score as ground truth — treat it as a noisy estimator you've measured the noise of.
- *HY:* LLM-as-judge՝ open-ended որակի միակ scalable եղանակը (rubric+example, score+reason)։ **Pairwise (A vs B) > absolute scoring** (ավելի stable)։ Bias-եր՝ position (randomize), verbosity (control length), self-preference (այլ judge family/panel), sycophancy, formatting։ Calibrate human label-ի դեմ։ Judge-ը model է՝ կարող է սխալ լինել, attack-վել, drift անել. version արա ու re-calibrate։ Երբեք judge-score = ground truth։

### 6.5 Task & RAG-specific metrics
- **Faithfulness / groundedness** — is every claim in the answer supported by the retrieved context? (The core RAG hallucination metric.)
- **Answer relevance** — does the answer address the question?
- **Context precision/recall** — did retrieval surface the right chunks, and only the right chunks? (Eval retrieval separately — §5.4.)
- **Hallucination detection** — flag unsupported claims (NLI/entailment checks against context, claim-by-claim verification, judge with "cite or flag"). For ungrounded generation, harder — check against known facts / a reference.
- **RAGAS-style suites** bundle faithfulness + answer-relevance + context-precision/recall into a standard RAG scorecard. Use the framework, but validate its scores against your own labels.
- *HY:* RAG metric-եր՝ faithfulness/groundedness (ամեն claim support-ված context-ով — հիմնական hallucination metric), answer relevance, context precision/recall (eval արա retrieval-ը առանձին), hallucination detection (NLI/entailment, claim-by-claim, «cite-or-flag»)։ RAGAS-style scorecard՝ օգտագործիր, բայց validate քո label-ի դեմ։

### 6.6 Eval-driven development (the operating loop)
- **Define done as testable criteria *before* building** (mirror Skill 10 §8, Skill 11's done-check).
- **Eval in two places:** a *self-check inside the run* (reflection/evaluator pass — cheap quality win) **and** an *offline suite on every prompt/model/retrieval change*. No eval → you tune by vibes, and vibes regress silently.
- **Wire it into CI (Skill 14):** a prompt/model/index change is a deploy; it must pass the eval gate before it ships. Track quality **and cost/latency as first-class metrics** — "correct but 3× the tokens and 2× the latency" can be a failing change.
- **Regression suite forever:** the golden set + every past bug, run on every change. This is the moat.
- *HY:* Eval-driven development՝ done-ը testable criteria որպես *նախքան* կառուցելը։ Eval երկու տեղ՝ self-check run-ի մեջ + offline suite ամեն փոփոխության։ CI-ի մեջ (Skill 14)՝ prompt/model/index փոփոխությունը deploy է, պետք է անցնի eval gate-ը։ Track արա որակը **ու cost/latency-ն որպես առաջնակարգ metric**։ Regression suite-ը հավերժ՝ moat-ը։

---

## 7. GUARDRAILS & SAFETY (the trust boundary around model output — cross-link Skill 12)

> Model output is untrusted input (Principle 7). Everything the model reads can carry instructions; everything it emits can be wrong or weaponized. Guardrails live in *code and policy*, not in a prompt (a prompt is a request; a guardrail is a wall — Skill 10 §7, Skill 12).

- **Prompt injection — the #1 LLM risk (OWASP LLM01).** Untrusted content overrides your instructions. **Direct** ("ignore previous instructions…") and — more dangerous — **indirect / RAG-borne**: malicious instructions hidden in a retrieved document, a web page, a tool result, an email the model reads. **Defenses (layered, none sufficient alone):** keep the privileged channel (system) separate from untrusted content; treat all retrieved/tool/web content as **data, never commands**; spotlight/delimit untrusted input; constrain what the model *can do* (least-privilege tools, not just "please don't"); validate output before acting; human-gate irreversible actions. **You cannot fully prompt your way out of injection — you contain it with architecture.**
- **Jailbreaks** — adversarial prompts that bypass safety (role-play, obfuscation, many-shot). Defense: input filtering, refusal robustness, output classification, and never relying on the model's good behavior alone for a security property.
- **Output filtering & content safety** — classify/filter model output for toxicity, PII leakage, unsafe content, off-policy responses before it reaches the user or a downstream system. A safety classifier on the output is a guardrail; the prompt asking nicely is not.
- **PII handling** — detect and redact PII in inputs (before it's logged/sent to a third-party model), in retrieval corpora, and in outputs. Don't log raw prompts/completions with PII. Field-level encryption / data-residency where required (Skill 12, Skill 01).
- **Refusal calibration** — the model should refuse genuinely harmful requests but **not over-refuse** benign ones (security tooling, life-sciences, edge topics trigger false positives). Calibrate against an eval set of should-answer and should-refuse cases. Over-refusal is a real product failure, not "safety."
- **Allow/deny lists** — for tools, domains (SSRF — Skill 12 §6.5), output formats, topics. Default-deny for actions; allowlist what's permitted.
- **Sandbox tool calls** — actions run in a bounded environment (scoped paths, no ambient prod credentials, network egress controls). The blast radius of a wrong/hijacked tool call is a *design parameter* (Skill 10 §7). Code the model writes is never executed in a privileged context.
- **The trust boundary, stated plainly:** the model is a smart but **untrusted, manipulable** component. Build the system so that even a fully-compromised model output cannot exfiltrate data, take an irreversible action, or escalate — because the *architecture* (least-privilege tools, output validation, human gates, sandboxing) won't let it. (Assume-breach, applied to LLMs — Skill 12.)
- **Frame of reference:** OWASP **LLM Top 10** (prompt injection #1, insecure output handling, training-data poisoning, sensitive-info disclosure, excessive agency, …) and **NIST AI RMF** for governance (§9).
- *HY:* Guardrail-ները code/policy-ում են, ոչ prompt-ում (prompt=խնդրանք, guardrail=պատ)։ **Prompt injection՝ #1 ռիսկ (OWASP LLM01)** — direct ու ավելի վտանգավոր **indirect/RAG-borne** (retrieved doc-ում թաքնված հրահանգ)։ Defense՝ շերտավոր՝ privileged channel առանձին, retrieved content = **data ոչ command**, least-privilege tool, output validation, human-gate irreversible-ի համար։ **Չես կարող prompt-ով դուրս գալ injection-ից — contain ես անում architecture-ով։** Jailbreak, output filtering/content safety, PII (detect+redact, մի՛ log արա), refusal calibration (մի՛ over-refuse benign-ը), allow/deny, sandbox tool call (blast radius=design parameter)։ Trust boundary՝ model-ը խելացի բայց untrusted/manipulable component է. architecture-ն է, որ թույլ չի տալիս նույնիսկ compromised output-ին վնասել։ OWASP LLM Top 10 + NIST AI RMF։

---

## 8. MODEL SELECTION IN PRACTICE (capability × cost × latency × context × privacy)

### 8.1 The selection axes
Pick on the *job*, not the leaderboard: **capability** (can it do the task at the needed quality?), **cost** ($/input + $/output token × your volume), **latency** (interactive p99 vs batch), **context window** (does your input fit?), **privacy/residency** (can the data leave your boundary?), **modality** (text/vision/audio), and **structured-output / tool-use support**. There is no "best model" — only the best fit for *this route*.

### 8.2 Build-vs-buy (API vs self-host)
- **Buy (frontier API)** — default. You get the best capability, no infra/ops, fast iteration, automatic upgrades. Cost: per-token pricing, data leaves your boundary (unless covered by the provider's data terms / a private deployment), vendor dependency.
- **Self-host (open-weights — Llama/Mistral/Qwen-class)** — when data **must** stay in-boundary (regulatory/privacy), at extreme volume where per-token economics flip, for full control/customization, or for offline/edge. Cost: you own the GPU infra, serving, scaling, and the quality gap to the frontier. Usually justified by privacy or scale, not by capability.
- **Default rule:** start on a frontier API; self-host only against a hard privacy or unit-economics constraint you've actually measured.

### 8.3 The Claude family — concrete selection (current through 2026; verify live)
> **Always verify model IDs, pricing, context, and parameters against the provider's current docs — this drifts.** As of the 2026 snapshot, the Anthropic Claude family (default tier for Bro's own work):

| Model | ID | Context | $/MTok in / out | Use for |
|---|---|---|---|---|
| **Claude Fable 5** | `claude-fable-5` | 1M | $10 / $50 | the **most capable widely-released** model — hardest reasoning, long-horizon agentic work; always-on thinking; premium pricing |
| **Claude Opus 4.8** | `claude-opus-4-8` | 1M | $5 / $25 | the default **most-capable Opus** — hard reasoning, agentic, knowledge work; adaptive thinking + effort |
| Claude Opus 4.7 / 4.6 | `claude-opus-4-7` / `-6` | 1M | $5 / $25 | previous-gen Opus, still strong |
| **Claude Sonnet 4.6** | `claude-sonnet-4-6` | 1M | $3 / $15 | best **speed × intelligence** balance — high-volume production |
| **Claude Haiku 4.5** | `claude-haiku-4-5` | 200K | $1 / $5 | **fastest/cheapest** — simple, mechanical, speed-critical tasks |

(Mythos 5 — `claude-mythos-5`, Fable-5-equivalent — is available only through Project Glasswing.)

- **Selection rule for Anthropic work:** **default to the latest most-capable Claude (Opus 4.8, or Fable 5 for the very hardest reasoning/long-horizon) for hard reasoning and agentic work; drop to Sonnet for high-volume production where the quality/cost balance favors it; use Haiku for cheap mechanical work** (classification, extraction, routing, simple summarization). Route by task difficulty — don't pay Opus prices for a Haiku job, and don't starve a hard reasoning task on Haiku.
- **Newest-tier API notes (verify):** Fable 5 / Opus 4.8 / 4.7 use **adaptive thinking only** (`budget_tokens` and sampling params are removed → 400); Fable 5 has **always-on thinking** (omit the `thinking` param), can return `stop_reason: "refusal"` from safety classifiers (handle it; opt into fallbacks), and requires 30-day data retention. Use the **effort** dial (low→high/xhigh/max) as the cost-quality lever. **Don't answer model-param questions from memory — check the current claude-api reference (Skill 10).**
- *HY:* Ընտրիր ըստ *job*-ի, ոչ leaderboard-ի՝ capability × cost × latency × context × privacy × modality × tool-support։ Build-vs-buy՝ frontier API (default) vs self-host open-weights (երբ data-ն պետք է մնա boundary-ում, կամ extreme volume/edge)։ Claude family (2026 snapshot, **ստուգիր live**)՝ Fable 5 (ամենաունակ, premium) · Opus 4.8 (default most-capable) · Sonnet 4.6 (speed×intelligence) · Haiku 4.5 (արագ/էժան)։ **Կանոն Anthropic-ի համար՝ default-ը նորագույն ամենաունակ Claude-ը (Opus 4.8 / Fable 5) ծանր reasoning-ի ու agentic-ի համար. Sonnet՝ high-volume. Haiku՝ էժան մեխանիկական աշխատանք։** Route ըստ դժվարության։ Նորագույն tier-երը՝ adaptive thinking only, effort dial, **ստուգիր ընթացիկ API-ն, մի՛ պատասխանիր հիշողությունից**։

---

## 9. LLMOps / MLOps — operating it in production (cross-link Skill 14)

> This is Skill 14 (DevOps/SRE) applied to models: CI/CD, serving, observability, release safety — plus the ML-specific machinery (experiment tracking, registries, drift, the data flywheel). A model in production is a *running system* — verify against it, monitor it, refresh it (Skill 02 §1.7, Skill 11's done-check).

### 9.1 The ML lifecycle & artifacts
- **Experiment tracking** — log every run's data version, code, config/hyperparameters, metrics, and artifacts (MLflow/W&B-style) so results are comparable and reproducible (Principle 9). An experiment you can't trace is an anecdote.
- **Model & prompt registry / versioning** — a governed catalog of model versions and **prompt versions** with stage tags (dev/staging/prod), lineage, and approval. Prompts are versioned artifacts alongside models (§5.3). Roll forward and back like code.
- **Reproducibility** — version data + features + code + config + eval set *together*; pin the model ID; record the exact prompt. Same inputs → same output (modulo sampling, which you fix with temperature/seed where supported).

### 9.2 Serving & inference
- **Modes:** batch (offline scoring, cheapest per token), real-time/online (interactive, latency-critical), streaming (token-by-token for UX on long generations — and to dodge client timeouts on large outputs).
- **Caching** — **prompt/prefix caching** is the highest-ROL LLM cost lever: a large stable prefix (system prompt, tools, few-shot, retrieved docs) is cached and reused at ~0.1× the input cost on subsequent calls. **Caching is a prefix match** — any byte change in the prefix invalidates everything after it, so keep the stable content first and frozen (no timestamps/UUIDs/per-request IDs in the system prompt; deterministic tool order; volatile content last). Verify cache hits via usage telemetry. Also semantic-cache repeated/near-duplicate queries.
- **Cost/latency/token budgeting** — track tokens/request, $/request, p50/p99 latency *per route*; set budgets; route cheap jobs to cheap models (§8). Effort/thinking dials, max-tokens caps, caching, and model routing are your levers. Cost is an architectural property (mirror Skill 02 §5.3).
- *HY:* Serving՝ batch / real-time / streaming (token-by-token UX-ի ու timeout-ի համար)։ **Prompt/prefix caching՝ #1 cost լծակ** (~0.1× input cost — stable prefix առջևում ու frozen. prefix-match է, ամեն byte փոխվում է → invalidate. ոչ timestamp/UUID system-prompt-ում)։ Semantic cache։ Cost/latency/token budgeting per route, route էժան job → էժան model։

### 9.3 Observability & tracing
- **Trace every request:** prompt, retrieved context, tool calls, model response, tokens, latency, cost, and the eval/judge verdict where available. An LLM system without a trace is a black box you have to *guess* about (Skill 10 §7). You cannot debug, attribute cost, or detect regression without it.
- **Monitor:** quality (online eval / judge / user feedback), cost & token spend, latency (p50/p99), error/refusal/timeout rates, **and the model/prompt version actually serving** (the running-version discipline — Skill 02 §1.7).
- *HY:* Trace ամեն request՝ prompt + retrieved context + tool call + response + token/latency/cost + judge verdict։ Trace-ից առանց LLM system-ը black box է։ Monitor՝ որակ, cost, latency p99, error/refusal rate, **ու ո՞ր model/prompt version-ն է serve անում**։

### 9.4 Release safety
- **CI/CD for models & prompts (Skill 14):** a prompt/model/retrieval/index change runs the **eval gate** (§6) before it ships — quality + cost + latency must hold. No green eval → no deploy.
- **Canary / shadow / A-B:** roll out to a slice (canary), or run the new version in **shadow** against live traffic without serving its output (compare offline), then A/B with auto-rollback on a quality/cost/latency regression. Decouple deploy from release with flags (Skill 14, Skill 02 §6).
- **Rollback is one switch** — model and prompt versions are registry-pinned; reverting is flipping the version, not redeploying. Keep the last-good pinned.
- *HY:* CI/CD model-ի ու prompt-ի համար (Skill 14)՝ փոփոխությունը անցնում է **eval gate**-ով (որակ+cost+latency) նախքան ship։ Canary/shadow/A-B՝ slice-ի, shadow-ով live traffic-ի դեմ (compare առանց serve), auto-rollback regression-ի դեպքում։ Rollback՝ մեկ switch (registry-pinned version)։

### 9.5 Monitoring for drift, decay & the feedback flywheel
- **Drift detection:** monitor input distributions (covariate/embedding drift — e.g. distance between recent and reference embedding distributions), output distributions, and proxy quality signals (user feedback, thumbs, escalation/deflection rates, judge scores on a live sample). Alert on drift before users do.
- **Decay & refresh:** when drift or quality erosion crosses a threshold, retrain/re-index/refresh prompts. The frontier also moves — periodically re-evaluate whether a newer/cheaper model now clears your bar (migration as a routine, not a crisis).
- **The feedback loop / data flywheel:** capture production interactions + outcomes (with labels/feedback) → curate into training/eval data → improve the model/prompts/retrieval → ship → capture more. The compounding moat of a deployed ML system *is* this flywheel. Guard it against feedback-loop pathologies (the model's own outputs becoming its training data — bias/collapse — §4 synthetic-data caution).
- *HY:* Drift detection՝ input/output distribution + proxy quality (user feedback, judge score live sample-ի վրա)։ Alert drift-ի վրա նախքան user-ը։ Decay & refresh՝ retrain/re-index/refresh prompt-եր երբ threshold անցնում է. frontier-ն էլ շարժվում է — periodically re-evaluate նոր/էժան model (migration՝ routine, ոչ crisis)։ **Data flywheel**՝ production interaction+outcome → curate → improve → ship → capture more (compounding moat-ը)։ Զգուշացիր feedback-loop ախտաբանությունից (model-ի output-ը իր training data դառնալը)։

---

## 10. RESPONSIBLE AI & GOVERNANCE (literacy)

- **Bias & fairness** — models inherit and amplify bias in training data. Measure across protected groups (demographic parity, equalized odds, disparate impact — these conflict; you can't satisfy all simultaneously, so choose deliberately). Audit data and outputs; mitigate at data/model/threshold/post-processing level. Fairness is contextual — define it for *your* application, with stakeholders.
- **Transparency & explainability** — for classical ML, feature importance, **SHAP/LIME**, partial-dependence; for LLMs, citations/grounding (§5.4) and chain-of-thought as (imperfect) rationale. High-stakes decisions need an explanation a human can act on and contest. Document with model cards / datasheets.
- **Privacy** — PII handling (§7), **membership-inference** and training-data-extraction risks (a model can leak its training data), differential privacy where required, data minimization, residency, and the right to deletion (Skill 12, Skill 01).
- **Human-in-the-loop** — for consequential/irreversible decisions, a human reviews/approves; the model assists, doesn't decide alone. Place the gate at the *irreversible/high-stakes boundary* (Skill 10 §7, Skill 11). Over-automation of a wrong-sometimes system is a governance failure.
- **Governance & the EU AI Act (literacy)** — the Act tiers AI by **risk** (unacceptable → banned; high-risk → strict obligations: risk management, data governance, transparency, human oversight, logging, conformity assessment; limited-risk → transparency duties e.g. "you're talking to an AI"; minimal → free). Plus **NIST AI RMF** (Govern/Map/Measure/Manage) as a voluntary framework. Know which tier your system falls in; high-risk (credit, hiring, medical, biometric, critical infra) carries real legal obligations. Governance is designed in (auditability, logging, documentation), not retrofitted.
- *HY:* Bias & fairness՝ model-ները ժառանգում/ուժեղացնում են bias-ը. measure protected group-երով (demographic parity / equalized odds — հակասում են, ընտրիր գիտակցաբար), audit, mitigate։ Transparency/explainability՝ SHAP/LIME (classical), citation/grounding (LLM), model card-եր։ Privacy՝ PII, membership-inference/training-data-extraction, differential privacy, residency, deletion իրավունք։ Human-in-the-loop՝ consequential/irreversible որոշման համար (gate-ը irreversible boundary-ին)։ Governance՝ **EU AI Act** (risk tier-եր՝ unacceptable→banned, high-risk→խիստ obligation, limited→transparency, minimal→free) + **NIST AI RMF** (Govern/Map/Measure/Manage)։ Իմացիր քո system-ի tier-ը. governance-ը նախագծվում է ներսից, ոչ retrofit։

---

## 11. DECISION RULES (fast, reusable)

**EN / HY** —
- **ML or not?** Pattern exists + rules-by-hand infeasible + representative data + tolerates being wrong + repeats at scale → ML. Miss one → rule/heuristic/lookup. *Default to no model.* / Բոլոր հինգը՝ ML, թե չէ՝ rule. default-ը՝ ոչ model։
- **Which model class?** Tabular/structured → gradient-boosted trees. Unstructured + lots of data + own-model-justified → deep learning. Language/multimodal/few-shot/generation → foundation model/LLM. / tabular→boosting, language→LLM։
- **Which metric?** Map to business value; weight by the cost of the dominant error; never default to accuracy on imbalanced data (use PR-AUC/F1); add calibration when the probability matters. / Map business value-ին, weight dominant error-ի գնով։
- **How to adapt the LLM?** Prompt → few-shot → RAG → fine-tune → pretrain. Climb only on a measured gap. **Missing knowledge → RAG; wrong behavior → fine-tune.** They compose. / Բարձրացիր measured gap-ով. knowledge→RAG, behavior→fine-tune։
- **RAG retrieval bad?** Fix retrieval (chunking → embeddings → hybrid → re-rank) and **eval it separately** before touching the prompt. A prompt never fixes bad retrieval. / Շտկիր retrieval-ը ու eval արա առանձին։
- **More context or less?** Missing facts → retrieve just-in-time. Confused/drifting → it has *too much* low-signal context → prune/compact. Default lean (context rot). / Default՝ lean։
- **Which Claude tier?** Hard reasoning / agentic / long-horizon → Opus 4.8 (or Fable 5 for the very hardest). High-volume production → Sonnet 4.6. Cheap mechanical (classify/extract/route) → Haiku 4.5. **Verify IDs/params live.** / Ծանր→Opus/Fable, volume→Sonnet, էժան→Haiku. ստուգիր live։
- **Build or buy?** Frontier API by default; self-host open-weights only against a measured privacy or unit-economics constraint. / API default, self-host՝ չափված constraint-ով։
- **Is the eval trustworthy?** Golden set is representative + adversarial + regression, sourced from real traffic, held out; judge calibrated against humans and audited for bias. Else: you're gambling. / Else՝ խաղ ես խաղում։
- **Ship it?** Only when it passes the eval gate (quality **and** cost **and** latency) — offline + a canary/shadow/A-B on live traffic. Never on "demo looks good." / Միայն eval gate-ով + live canary, երբեք «demo լավ է»-ով։
- **Trust the model output?** Never. Validate, schema-check, sandbox actions, treat retrieved/tool content as data-not-commands, human-gate the irreversible. / Երբեք. validate, sandbox, data-not-commands։
- **Is it still good in prod?** Only if monitored for drift/decay + cost + the running version, with a refresh trigger. A model you don't watch is already decaying. / Միայն եթե monitor է drift/cost/version-ի համար. չ-watch-ված model-ն արդեն decay է անում։

---

## 12. ANTI-PATTERNS (smell → fix)

- **ML-when-a-rule-would-do** — a model for what a regex/threshold/`CASE` solves. *Fix:* §2.1 — delete the model; ship the rule.
- **No metric / metric ≠ business value** — optimizing accuracy on an imbalanced problem, or a number nobody acts on. *Fix:* pin the one metric mapped to value, weighted by error cost; PR-AUC/F1 for imbalance.
- **Data leakage** — preprocessing fit on the full dataset, future features, target encoded in a feature, duplicates across splits, shuffled time series → great offline, dead live. *Fix:* fit on train only; group/temporal/stratified splits; dedup; audit every feature's availability-at-prediction-time.
- **Train-test contamination / tuning on the test set** — touching test more than once; the test set leaks into model selection. *Fix:* test once, at the end; tune on validation only.
- **Model-centric tunnel vision** — endless architecture search on dirty data. *Fix:* data-centric — fix labels, balance, dedup, add hard cases first (§4).
- **Training-serving skew** — features computed differently offline vs online. *Fix:* a feature store / shared transform; the *same* code path for train and serve.
- **Fine-tuning to inject knowledge** — fine-tuning facts that go stale and bloat the weights. *Fix:* RAG for knowledge; fine-tune only for behavior/style/skill.
- **Climbing the cost ladder too fast** — fine-tuning/pretraining what a better prompt or retrieval would solve. *Fix:* start at prompt, climb only on a measured gap.
- **Context dump** — stuffing the whole KB / max-out the window "just in case" → context rot, instruction decay, cost. *Fix:* retrieve just-in-time, lean high-signal context, compaction (§5.3, Skill 10 §6).
- **RAG-prompt-fixing** — endlessly tweaking the generation prompt when *retrieval* is broken. *Fix:* eval retrieval separately; fix chunking/embeddings/hybrid/re-rank first.
- **"RAG eliminates hallucination"** — assuming grounding = truth. *Fix:* measure faithfulness/groundedness; the model can ignore/misread context; retrieved content can be injected.
- **Eval-by-vibes** — shipping on "the demo looks good," no eval set. *Fix:* golden set (representative + adversarial + regression) + grader ladder, run on every change.
- **Judge-as-ground-truth** — trusting LLM-as-judge scores uncalibrated. *Fix:* calibrate against humans, audit for position/verbosity/self-preference bias, prefer pairwise, version the judge.
- **Prompt-as-guardrail** — "please don't reveal secrets / ignore injections" as the security control. *Fix:* real guardrails in code/policy/sandbox; least-privilege tools; output validation; the prompt is a request, not a wall.
- **Injection-naïve RAG/agent** — treating retrieved/tool/web content as instructions. *Fix:* data-not-commands; separate privileged channel; constrain capability; human-gate irreversible.
- **`eval()`-ing model output** — executing the model's text/code/JSON in a privileged context. *Fix:* parse + schema-validate + sandbox; never trust output to be safe.
- **Over-refusal** — a model so safety-tuned it refuses benign work. *Fix:* calibrate refusals against a should-answer/should-refuse eval; over-refusal is a product failure.
- **Un-versioned prompt tweaked in prod** — prompts as untracked strings, edited live. *Fix:* prompts are versioned code; template, register, eval-gate, deploy.
- **Ship-and-forget** — no drift/decay monitoring; model silently rots. *Fix:* monitor input/output distributions + quality proxies + cost; refresh on threshold; the world drifts under it.
- **Cost-blind LLMOps** — no per-route token/$/latency tracking; the bill surprises you, no prefix caching. *Fix:* trace cost as a first-class metric; prefix-cache the stable prefix; route cheap jobs to cheap models.
- **Cache-busting prefix** — a timestamp/UUID/varying tool order in the system prompt silently kills prompt caching (0 cache reads, full price). *Fix:* freeze the stable prefix first; deterministic tool order; volatile content last; verify cache-hit telemetry.
- **Answering model-param questions from memory** — quoting stale model IDs/params/pricing. *Fix:* the API surface drifts — verify against the provider's current docs (claude-api reference, Skill 10) every time.
- **Synthetic-data overdose** — training on too much of your own model's output → collapse/bias amplification. *Fix:* cap the synthetic fraction; validate against real holdouts.

---

## 13. CANON QUICK-REFERENCE (named + attributed)

- **Huyen** — *Designing ML Systems*, *AI Engineering* (the lifecycle/ops/LLM-engineering reference).
- **Sculley et al.** — *Hidden Technical Debt in Machine Learning Systems* ("high-interest credit card"; CACE; glue code; feedback loops; data dependencies).
- **Ng** — data-centric AI (fix the data, not the model).
- **Vaswani et al.** — *Attention Is All You Need* (the transformer). Lineage: GPT/BERT/T5 → instruction-tuning (FLAN, InstructGPT) → RLHF.
- **Kaplan et al. / Hoffmann et al. (Chinchilla)** — scaling laws (loss scales predictably with compute/data/params; Chinchilla — train smaller models on more tokens for compute-optimality).
- **Christiano et al.; Ouyang et al. (InstructGPT)** — RLHF (align to human preference via a reward model + RL).
- **Rafailov et al.** — **DPO** (Direct Preference Optimization — preference alignment without a separate reward model). RLAIF / **Constitutional AI** (Bai et al., Anthropic) — AI feedback to scale alignment.
- **Lewis et al.** — **RAG** (retrieval-augmented generation). **Karpukhin et al.** — DPR (dense passage retrieval). **Malkov & Yashunin** — **HNSW** (the dominant ANN index). BM25 (Robertson/Sparck Jones) — the sparse-retrieval baseline that hybrid still needs.
- **Zheng et al.** — MT-Bench / Chatbot Arena (**LLM-as-judge**, pairwise preference, judge-bias analysis). **RAGAS** — RAG eval suite (faithfulness/answer-relevance/context-precision-recall). **HELM** (Liang et al.) — holistic, multi-metric LLM evaluation.
- **Anthropic** — *Building effective agents* (workflows vs agents; cross-link Skill 10), **Model Context Protocol** (MCP), Constitutional AI, the **Claude** model family (Fable 5 / Opus 4.x / Sonnet / Haiku — §8).
- **Wei et al.** — chain-of-thought prompting. **Wang et al.** — self-consistency.
- **Governance** — **OWASP LLM Top 10** (prompt injection #1), **NIST AI Risk Management Framework** (Govern/Map/Measure/Manage), **EU AI Act** (risk-tiered regulation). Model cards (Mitchell et al.), datasheets for datasets (Gebru et al.).
- **Goodhart's Law** — when a metric becomes the target it stops being a good metric (the eval-gaming warning). **CACE** — Changing Anything Changes Everything.

---

## 14. ԲԱՌԱՐԱՆ / Glossary

**EN:** ML-or-not decision · problem framing → metric · supervised/unsupervised/self-supervised/RL · classical ML / gradient boosting (XGBoost/LightGBM) · deep learning · foundation model/LLM · bias–variance · over/underfitting · regularization (L1/L2/dropout/early-stopping) · train/val/test split · cross-validation · data leakage (target/temporal/contamination) · class imbalance · the metric zoo (precision/recall/F1/ROC-AUC/PR-AUC/RMSE/MAE/NDCG/MRR) · calibration (ECE/Brier) · data-centric AI · labeling / inter-annotator agreement (kappa) / active learning / weak supervision · feature engineering · feature store · training-serving skew · dataset shift (covariate/label/concept drift) · synthetic data / model collapse · transformer / self-attention / multi-head · O(n²) attention · tokenization / tokens · embeddings / vector representation / cosine similarity · context window · temperature/top-p/top-k · max tokens / stop sequences · structured/JSON output · roles (system/user/tool) · thinking / effort dial · prompt engineering · system prompt · few-shot · chain-of-thought / decomposition · self-consistency · context as a budget / context rot · prompt templating & versioning · RAG · chunking · embedding model · vector DB / ANN / HNSW / IVF / PQ · hybrid retrieval (dense+BM25) / RRF · re-ranking / cross-encoder · grounding & citation · retrieval eval (context precision/recall) · "RAG ≠ no hallucination" · function calling / tool use / tool contract · MCP · adaptation ladder (prompt→RAG→fine-tune→pretrain) · RAG-vs-fine-tune (knowledge vs behavior) · PEFT/LoRA/QLoRA · instruction-tuning · RLHF / DPO / RLAIF / Constitutional AI · offline vs online eval · golden/eval set (representative/adversarial/regression) · grader ladder (programmatic/reference/LLM-judge/human) · LLM-as-judge / pairwise / judge bias (position/verbosity/self-preference) · faithfulness/groundedness · answer relevance · hallucination detection · RAGAS · eval-driven development · eval gate · prompt injection (direct/indirect/RAG-borne) · jailbreak · output filtering / content safety · PII handling · refusal calibration / over-refusal · allow/deny · tool sandboxing · trust boundary (model output = untrusted input) · OWASP LLM Top 10 · model selection axes (capability/cost/latency/context/privacy) · build-vs-buy / self-host open-weights · Claude tiers (Fable 5 / Opus 4.8 / Sonnet 4.6 / Haiku 4.5) · experiment tracking · model/prompt registry & versioning · reproducibility · serving (batch/real-time/streaming) · prompt/prefix caching (prefix-match) · cost/latency/token budgeting · observability/tracing · canary/shadow/A-B · drift detection / decay / refresh · feedback loop / data flywheel · bias/fairness (demographic parity/equalized odds) · explainability (SHAP/LIME/citations) · membership inference · human-in-the-loop · NIST AI RMF · EU AI Act (risk tiers) · model cards/datasheets · scaling laws (Chinchilla) · Goodhart's Law · CACE.

**HY (հիմնական եզրեր, native):** ML-թե-ոչ որոշում · problem framing → metric · supervised/unsupervised/self-supervised/RL · classical ML / gradient boosting (tabular-ի SOTA) · deep learning · foundation model/LLM · bias–variance (underfit/overfit) · regularization (L1/L2/dropout/early-stopping) · train/val/test split (test-ին դիպչում ես մեկ անգամ) · cross-validation · data leakage (target/temporal/contamination — «#1 մարդասպան») · class imbalance · metric-ի այգեբանություն (precision/recall/F1/AUC/PR-AUC/RMSE/MAE/NDCG/MRR) · calibration («90% վստահ»=~90% ճիշտ) · data-centric AI (data-ն շտկիր, ոչ model-ը) · labeling / inter-annotator agreement (kappa) / active learning / weak supervision · feature engineering · feature store · training-serving skew (անաղմուկ bug) · dataset shift (covariate/label/concept drift) · synthetic data / model collapse · transformer / self-attention / multi-head · O(n²) attention (երկար context-ի արմատային ծախսը) · tokenization / token-ներ (հայերենը՝ ավելի շատ token/նիշ) · embedding / vector / cosine similarity · context window (frontier Claude՝ 1M) · temperature/top-p/top-k (նորագույն Claude-ը հանում է) · max tokens / stop sequence · structured/JSON output · role-եր (system/user/tool — privileged channel առանձին) · thinking / effort dial · prompt engineering · system prompt (ամենաբարձր լծակ) · few-shot · chain-of-thought / decomposition · self-consistency · context=budget / context rot (ավելի շատ ≠ ավելի լավ) · prompt templating & versioning (prompt-ները code են) · RAG · chunking (ամենաթերագնահատված լծակ) · embedding model · vector DB / ANN / HNSW / IVF / PQ · hybrid retrieval (dense+BM25) · re-ranking / cross-encoder · grounding & citation · retrieval eval (առանձին) · «RAG ≠ առանց hallucination» · function calling / tool use / tool contract · MCP · adaptation սանդուղք (prompt→RAG→fine-tune→pretrain) · RAG-vs-fine-tune (**գիտելիք vs վարք**) · PEFT/LoRA/QLoRA · instruction-tuning · RLHF / DPO / RLAIF / Constitutional AI · offline vs online eval · golden set (representative/adversarial/regression) · grader-ի սանդուղք (programmatic/reference/LLM-judge/human) · LLM-as-judge / pairwise / judge bias (position/verbosity/self-preference) · faithfulness/groundedness · answer relevance · hallucination detection · RAGAS · eval-driven development · eval gate · prompt injection (direct/indirect/RAG-borne — #1 ռիսկ) · jailbreak · output filtering / content safety · PII handling · refusal calibration / over-refusal · allow/deny · tool sandboxing · trust boundary (model output = untrusted input) · OWASP LLM Top 10 · model selection առանցքներ (capability/cost/latency/context/privacy) · build-vs-buy / self-host open-weights · Claude tier-եր (Fable 5 / Opus 4.8 / Sonnet 4.6 / Haiku 4.5) · experiment tracking · model/prompt registry & versioning · reproducibility · serving (batch/real-time/streaming) · prompt/prefix caching (prefix-match — byte փոխվում է → invalidate) · cost/latency/token budgeting · observability/tracing · canary/shadow/A-B · drift detection / decay / refresh · feedback loop / data flywheel (compounding moat) · bias/fairness (demographic parity/equalized odds — հակասում են) · explainability (SHAP/LIME/citation) · membership inference · human-in-the-loop (gate-ը irreversible boundary-ին) · NIST AI RMF · EU AI Act (risk tier-եր) · model card-եր · scaling laws (Chinchilla) · Goodhart's Law · CACE։

---

*EN: Skill 15 v1 — top-level, living. First ask whether it should be ML at all; pin the metric; let the data lead. Climb the adaptation ladder (prompt → RAG → fine-tune) and stop at the first rung that works — RAG adds knowledge, fine-tuning shapes behavior. Make eval the centerpiece (golden set + judge you've calibrated), treat model output as untrusted input, and operate the model as a perishable, monitored, cost-traced running system. For Anthropic work, default to the latest most-capable Claude (Opus 4.8 / Fable 5) for hard reasoning and Haiku for cheap mechanical work — and verify model IDs and params against the live API, never from memory. The substrate beneath Skill 10.*
*HY: Skill 15 v1 — top-level, living։ Նախ հարցրու՝ արդյո՞ք ընդհանրապես ML է. ամրացրու metric-ը. թող data-ն առաջնորդի։ Բարձրացիր adaptation-ի սանդուղքով (prompt → RAG → fine-tune) ու կանգնիր առաջին աշխատող աստիճանին — RAG ավելացնում է գիտելիք, fine-tune ձևավորում է վարք։ Դարձրու eval-ը centerpiece (golden set + calibrated judge), վերաբերվիր model-output-ին որպես untrusted input, ու operate արա model-ը որպես փչացող, monitored, cost-traced աշխատող system։ Anthropic-ի համար՝ default-ը նորագույն ամենաունակ Claude-ը (Opus 4.8 / Fable 5) ծանր reasoning-ի, Haiku-ն՝ էժան մեխանիկական աշխատանքի համար — ու ստուգիր model ID-ներն ու param-ները live API-ով, երբեք հիշողությունից։ Skill 10-ի տակ դրված substrate-ը։ 💪🤍*
