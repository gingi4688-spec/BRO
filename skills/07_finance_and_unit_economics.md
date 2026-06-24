# Skill 07 — Finance & Unit Economics
### P&L · cash · modeling · pricing math · valuation · fundraising · FP&A · CFO / unit-economics operator

> **EN:** How to read the numbers, model the business, protect cash, value it, fund it, and allocate capital. This is Bro's operating manual for finance-for-decisions — the way a sharp founder-CFO and a senior FP&A lead actually run a company, not exam accounting. Sister disciplines: Skill 05 (strategy — business models, moats, capital-allocation *intent*) and Skill 06 (sales/growth — the funnel, pricing strategy, growth loops); this skill is the *math and money* beneath them. Sources I draw on: managerial/corporate finance (**Damodaran** on valuation & cost of capital; **Higgins** on sustainable growth; Brealey-Myers *Principles of Corporate Finance*), capital-allocation discipline (**Thorndike, *The Outsiders***; Buffett's owner-earnings letters), the financial-literacy canon (**Berman & Knight, *Financial Intelligence***), the SaaS-metrics canon (**Skok** on the SaaS funnel & CAC payback; **Maxio/ChartMogul** metrics standards; **Bessemer** *State of the Cloud* / efficiency scores; the **Rule of 40**; **Sacks** burn multiple), survival discipline (**Graham**, default-alive/default-dead; the 13-week cash forecast), and pricing economics (van Westendorp, price-volume-profit, McKinsey's 1%-price finding). **Not accounting-for-compliance — finance-for-decisions.** Binding/booked calls (statutory accounting, tax, audit, anything legally filed or that hits an investor's screen as fact) → flag for a qualified accountant/CFO/CPA. Architect proposes the number and the logic; the accountant ratifies what's *booked*.
>
> **HY:** Ոնց կարդալ թվերը, modeling անել business-ը, պաշտպանել cash-ը, գնահատել այն (valuation), ֆինանսավորել ու բաշխել կապիտալը (capital allocation)։ Սա Bro-ի operating manual-ն է finance-ի համար՝ որոշումներ կայացնելու — էնպես, ոնց իրական founder-CFO-ն ու senior FP&A lead-ը կառավարում են ընկերությունը, ոչ թե քննության հաշվապահություն։ Քույր դիսցիպլիններ՝ Skill 05 (strategy — business model-ներ, moat-եր, կապիտալի բաշխման *մտադրությունը*) ու Skill 06 (sales/growth — funnel-ը, pricing-ի ստրատեգիան, growth loop-երը). այս skill-ը դրանց տակ ընկած *մաթեմատիկան ու փողն* է։ Ոչ թե հաշվապահություն-compliance-ի համար — finance որոշումների համար։ Binding call-երը (statutory հաշվապահություն, հարկեր, audit, ինչ-որ բան, որ պաշտոնապես ներկայացվում է կամ investor-ի էկրանին հայտնվում է որպես փաստ) → flag արա qualified accountant/CFO/CPA-ի համար։ Architect-ը առաջարկում է թիվն ու տրամաբանությունը, հաշվապահը հաստատում է էն, ինչ *գրանցվում* է։

---

## 0. Ո՞Ր ՈՍՊՆՅԱԿԸ ԵՐԲ (the four finance lenses)

**EN:** Finance is one capability worn through several altitudes. Most finance mistakes = answering at the wrong altitude — running a CFO decision on bookkeeping reflexes, arguing accounting policy when the real question is "do we have cash in March," or modeling to the second decimal when the decision needed a sign and an order of magnitude.

**HY:** Finance-ը մեկ կարողություն է՝ կրած մի քանի altitude-ով։ Finance-ի սխալների մեծ մասը = սխալ altitude-ով պատասխանելը — CFO որոշումը bookkeeping ռեֆլեքսով վարելը, accounting policy-ի շուրջ վիճելը, երբ իրական հարցը «մարտ ամսին cash կունենա՞նք»-ն է, կամ երկրորդ տասնորդական նիշով modeling անելը, երբ որոշմանը պետք էր ընդամենը նշան ու կարգ։

| Lens | Horizon | Ի՞նչ ա որոշում | Question it asks |
|---|---|---|---|
| **Accountant / Controller** | record & truth | *Ի՞նչ իրականում տեղի ունեցավ* — book it correctly, close the period, stay compliant | "Is this recorded right, GAAP/IFRS-clean, and auditable?" |
| **FP&A / Analyst** | model & explain | *Ի՞նչ ա սա նշանակում ու ի՞նչ ա լինելու* — drivers, variance, forecast, scenarios | "Why did the number move, what drives it, and what happens if…?" |
| **CFO / founder-finance** | allocate & protect | Capital allocation, cash survival, fundability, risk, what to fund/cut | "Does this create value, can we afford it, and will we still be alive?" |
| **Investor / capital-markets** | price & underwrite | *Ինչքա՞ն ա սա արժե ու ի՞նչ ա underwrite արվում* — valuation, multiple, ownership, return on capital | "What is this worth, what return does the capital earn, and what's the risk to it?" |

**EN — Rule of use:** start from the CFO question (cash survival + capital allocation + value), descend to FP&A (drivers / variance / scenario), land on the accountant question (is it booked correctly) only when the number is *filed or reported as fact*, and put on the investor lens when you raise, sell, buy, or allocate against a cost of capital. For an internal decision you live at CFO+FP&A; for anything external/legal you must pass through the accountant; for any financing or M&A event you must also speak investor. Jumping straight to accounting precision on a decision question = false precision on a fast-moving estimate. Skipping accounting on a *booked* number = a misstatement. Ignoring the investor lens on a raise = leaving ownership or money on the table.

**HY — Օգտագործման կանոն:** սկսիր CFO հարցից (cash-ի գոյատևում + կապիտալի բաշխում + արժեք), իջիր FP&A-ի (driver-ներ / variance / scenario), իջիր accountant-ի հարցին (ճի՞շտ է գրանցված) միայն երբ թիվը *ներկայացվում կամ որպես փաստ հաղորդվում է*, ու հագիր investor ոսպնյակը, երբ raise անում, վաճառում, գնում ես կամ cost of capital-ի դեմ ես բաշխում։ Ներքին որոշման համար ապրում ես CFO+FP&A-ում. արտաքին/իրավական ամեն բանի համար պետք է անցնես accountant-ի միջով. ցանկացած ֆինանսավորման կամ M&A event-ի համար պետք է խոսես նաև investor-ի լեզվով։ Որոշման հարցին ուղիղ accounting-ի ճշտությամբ ցատկելը = false precision արագ շարժվող estimate-ի վրա։ *Գրանցված* թվի վրա accounting-ը բաց թողնելը = misstatement։ Raise-ի ժամանակ investor ոսպնյակն անտեսելը = ownership կամ փող սեղանին թողնելը։

---

## 1. PRINCIPLES (CFO-level, govern everything below)

> **EN:** *These five are the original floor — kept verbatim, then deepened.*
> **HY:** *Այս հինգը սկզբնական հատակն են — պահված բառ առ բառ, հետո խորացված։*

**EN:**
1. **Cash is oxygen.** Profit is an opinion; cash is a fact. A profitable business can still die of a cash gap. Watch runway and the cash conversion cycle. *(The classic killer: a fast-growing, "profitable-on-paper" business whose cash is trapped in receivables and inventory while payroll is due Friday. Growth consumes cash before it returns it.)*
2. **Unit economics first.** If one customer/transaction doesn't make money, scale multiplies the loss. Fix the unit before growing volume. *(Marc Andreessen's inverse: most startups die of no demand — but the ones that have demand and still die, die of broken unit economics scaled with venture money.)*
3. **Margin is the engine.** Gross margin sets the ceiling on everything you can fund. Protect it. *(Gross margin is your degrees of freedom: every point of GM is a point you can spend on S&M, R&D, or drop to the bottom line. A low-GM business is structurally poor no matter how fast it grows.)*
4. **Every number needs a denominator.** A metric without a clean, valid base is noise or manipulation. *(Define base, rate, period, and cohort. "We grew 200%" from 1 to 3 is meaningless; "churn is 2%" — monthly or annual, logo or revenue?)*
5. **Model to decide, not to predict.** A model's value is the decision it sharpens and the sensitivity it reveals, not false precision about the future. *(The map is not the territory. A spreadsheet that's right to two decimals and wrong about the one driver that matters is worse than a back-of-envelope that nails the driver.)*

**HY:**
1. **Cash-ը թթվածին է։** Շահույթը կարծիք է. cash-ը՝ փաստ։ Շահութաբեր business-ը կարող է cash-ի բացից մեռնել։ Հետևիր runway-ին ու cash conversion cycle-ին։ *(Դասական մարդասպանը՝ արագ աճող, «թղթի վրա շահութաբեր» business, որի cash-ը խրված է receivable-ներում ու inventory-ում, մինչ ուրբաթ օրը payroll-ի ժամկետն է։ Աճը cash-ը ծախսում է, նախքան վերադարձնելը։)*
2. **Unit economics-ը առաջինը։** Եթե մեկ customer/transaction-ը փող չի աշխատում, scale-ը կորուստը բազմապատկում է։ Ուղղիր unit-ը նախքան volume-ը մեծացնելը։ *(Andreessen-ի շրջումը՝ startup-ների մեծ մասը մեռնում է պահանջարկի բացակայությունից, բայց նրանք, որ պահանջարկ ունեն ու դեռ մեռնում են, մեռնում են venture փողով scale արված կոտրված unit economics-ից։)*
3. **Margin-ը շարժիչն է։** Gross margin-ը սահմանում է ամեն բանի առաստաղը, որ կարող ես ֆինանսավորել։ Պաշտպանիր այն։ *(Gross margin-ը քո ազատության աստիճաններն են. GM-ի ամեն կետ մի կետ է, որ կարող ես ծախսել S&M-ի, R&D-ի վրա, կամ իջեցնել ներքև։ Ցածր-GM business-ը կառուցվածքով աղքատ է, ինչքան էլ արագ աճի։)*
4. **Ամեն թիվ հայտարար է պահանջում։** Մետրիկ առանց մաքուր, վավեր բազայի՝ աղմուկ է կամ մանիպուլյացիա։ *(Սահմանիր base, rate, period ու cohort։ «200% աճեցինք» 1-ից 3՝ անիմաստ է. «churn-ը 2% է» — ամսակա՞ն թե տարեկան, logo թե revenue?)*
5. **Modeling արա որոշելու համար, ոչ կանխատեսելու։** Model-ի արժեքը այն որոշումն է, որ սրում է, ու sensitivity-ն, որ բացահայտում է, ոչ թե ապագայի մասին false precision-ը։ *(Քարտեզը տարածքը չէ։ Աղյուսակ, որ ճիշտ է երկու տասնորդականով, բայց սխալ է կարևոր միակ driver-ի մասին, ավելի վատ է, քան մի envelope-ի վրա արված հաշվարկ, որ driver-ը ճշտում է։)*

**EN — Added operating principles (the rest of the CFO mindset):**

**HY — Ավելացված operating principles (CFO mindset-ի մնացածը)՝**

**EN:**
6. **Separate accrual truth from cash truth — always run both.** The P&L tells you if the *model* works; the cash flow tells you if you *survive*. They diverge exactly when it matters most (rapid growth, big prepayments, seasonal swings). Never manage off one alone.
7. **Cash timing beats cash amount in the short run.** Solvency is a sequencing problem. A business with healthy annual numbers dies in a single month where outflows precede inflows. Manage the *calendar* of cash, not just the total.
8. **Marginal thinking, not average thinking — but watch the marginal trap.** Decisions are made at the margin (does *this* next dollar/customer/hire return more than it costs). But beware Clayton Christensen's warning: the marginal cost of "just this once" repeatedly chosen is how incumbents and individuals destroy themselves. The full cost is sometimes the right lens.
9. **Sunk costs are sunk; opportunity cost is real.** Past spend never justifies future spend. The only question is forward expected value vs the next-best use of the same capital and attention.
10. **Conservatism is asymmetric, on purpose.** When uncertain, be optimistic on costs/timing and pessimistic on revenue — because the failure mode (running out of cash) is fatal and the upside (pleasant surprise) is not. Plans should survive the bad-but-plausible case.
11. **One source of truth per number.** "Revenue," "ARR," "active customer," "gross margin" must each have exactly one definition and one place it's computed (ties to Skill 01's semantic/metrics layer). Metric chaos in finance is fraud-adjacent even when innocent.
12. **Reconcile or it isn't real.** Every key number ties to something independent: cash to the bank statement, revenue to invoices/contracts, headcount cost to the org chart. An unreconciled model is a story, not a finance.
13. **Capital allocation is the CEO's one real job (Buffett/*The Outsiders*).** Over a decade, where you deploy each dollar of free cash flow — reinvest, M&A, pay down debt, dividend, or buy back stock at a price below value — *is* the performance. Operations are table stakes; allocation is the multiplier. The denominator (capital deployed) matters as much as the numerator (return earned).
14. **Price is what you pay; value is what you get (Graham/Buffett).** A great company at a terrible price is a bad investment; a fair company at a great price can be a great one. Never confuse a high valuation with a good business or vice versa — the two are different axes.
15. **The denominator is ownership, too.** Every dollar raised dilutes; the question is never "how much can I raise" but "what does this capital *buy* in value created, and is that worth the ownership it costs." Raise the minimum that buys the next inflection at a price that reflects it.

**HY:**
6. **Բաժանիր accrual ճշմարտությունը cash ճշմարտությունից — միշտ երկուսն էլ վարիր։** P&L-ը ասում է՝ *model*-ն աշխատու՞մ է. cash flow-ը՝ *գոյատևու՞մ* ես։ Դրանք շեղվում են հենց երբ ամենաշատն է կարևոր (արագ աճ, մեծ prepayment-ներ, սեզոնային տատանումներ)։ Երբեք մեկով մի՛ կառավարիր։
7. **Cash-ի timing-ը կարճ ժամկետում հաղթում է cash-ի գումարին։** Վճարունակությունը հաջորդականության խնդիր է։ Առողջ տարեկան թվերով business-ը մեռնում է մի ամսում, որտեղ outflow-ները նախորդում են inflow-ներին։ Կառավարիր cash-ի *օրացույցը*, ոչ միայն գումարը։
8. **Marginal մտածողություն, ոչ average — բայց զգուշացիր marginal թակարդից։** Որոշումներն արվում են margin-ի վրա (արդյո՞ք *այս* հաջորդ dollar/customer/hire-ը ավելի շատ է վերադարձնում, քան արժե)։ Բայց զգուշացիր Christensen-ի զգուշացումից՝ «ընդամենը այս մեկ անգամ»-ի marginal cost-ը կրկնվող ընտրությամբ՝ էն է, ինչով incumbent-ներն ու անհատներն իրենց ոչնչացնում են։ Full cost-ը երբեմն ճիշտ ոսպնյակն է։
9. **Sunk cost-երը sunk են. opportunity cost-ը իրական է։** Անցյալ ծախսը երբեք չի արդարացնում ապագա ծախսը։ Միակ հարցը forward expected value-ն է ընդդեմ նույն կապիտալի ու ուշադրության հաջորդ-լավագույն օգտագործման։
10. **Conservatism-ը ասիմետրիկ է՝ դիտավորյալ։** Անորոշության դեպքում լավատես եղիր ծախսերի/timing-ի վրա ու հոռետես՝ revenue-ի, որովհետև failure mode-ը (cash-ը վերջանալը) մահացու է, իսկ upside-ը (հաճելի անակնկալ)՝ ոչ։ Պլանները պետք է գոյատևեն վատ-բայց-հնարավոր դեպքում։
11. **Մեկ source of truth ամեն թվի համար։** «Revenue», «ARR», «active customer», «gross margin»՝ ամեն մեկը պետք է ունենա ճիշտ մեկ սահմանում ու մեկ տեղ, որտեղ հաշվարկվում է (կապ Skill 01-ի semantic/metrics layer-ին)։ Finance-ում metric chaos-ը fraud-հարակից է՝ նույնիսկ երբ անմեղ է։
12. **Reconcile արա, թե չէ իրական չէ։** Ամեն key թիվ կապվում է անկախ ինչ-որ բանի՝ cash-ը bank statement-ին, revenue-ն invoice-ներին/contract-ներին, headcount cost-ը org chart-ին։ Չ-reconcile արված model-ը պատմություն է, ոչ finance։
13. **Capital allocation-ը CEO-ի միակ իրական գործն է (Buffett/*The Outsiders*)։** Տասնամյակի ընթացքում, թե որտեղ ես deploy անում free cash flow-ի ամեն dollar-ը — reinvest, M&A, պարտքի մարում, dividend, թե արժեքից ցածր գնով stock buyback — *էն* է performance-ը։ Operations-ը մուտքի տոմս է. allocation-ը՝ բազմապատկիչը։ Հայտարարը (deploy արված կապիտալ) նույնքան կարևոր է, որքան համարիչը (աշխատած return)։
14. **Price-ը էն է, ինչ վճարում ես. value-ն՝ ինչ ստանում ես (Graham/Buffett)։** Հոյակապ ընկերությունը սարսափելի գնով վատ ներդրում է. արդար ընկերությունը հոյակապ գնով կարող է հոյակապ լինել։ Երբեք մի՛ շփոթիր բարձր valuation-ը լավ business-ի հետ կամ հակառակը — դրանք տարբեր առանցքներ են։
15. **Հայտարարը նաև ownership-ն է։** Raise արված ամեն dollar dilute է անում. հարցը երբեք «ինչքա՞ն կարող եմ raise անել» չէ, այլ «ի՞նչ է այս կապիտալը *գնում* ստեղծված արժեքով, ու արժե՞ էն ownership-ին, որ արժենում է»։ Raise արա նվազագույնը, որ գնում է հաջորդ inflection-ը այն արտացոլող գնով։

---

## 2. THE THREE STATEMENTS (the controller core)

> **EN:** *The four bullets below are the original floor — kept, then expanded into operating depth.*
> **HY:** *Ստորև չորս կետերը սկզբնական հատակն են — պահված, հետո ընդլայնված operating խորության։*

**EN:**
- **P&L (income statement)** — Revenue − COGS = Gross Profit; − OpEx = Operating Profit (EBIT); the story of profitability over a period.
- **Balance sheet** — Assets = Liabilities + Equity; a snapshot of what's owned/owed.
- **Cash flow** — operating / investing / financing; where cash actually moved (the one that can't be faked by accruals).
- **Key margins** — gross margin (Rev−COGS)/Rev; contribution margin (per-unit after variable costs); operating margin. Trends matter more than levels.

**HY:**
- **P&L (income statement)** — Revenue − COGS = Gross Profit. − OpEx = Operating Profit (EBIT)։ Մի ժամանակահատվածի շահութաբերության պատմությունը։
- **Balance sheet** — Assets = Liabilities + Equity. snapshot, թե ինչ է պատկանում/պարտք։
- **Cash flow** — operating / investing / financing. որտեղ cash-ը իրականում շարժվեց (միակը, որ չի կարող կեղծվել accrual-ներով)։
- **Key margin-ներ** — gross margin (Rev−COGS)/Rev. contribution margin (per-unit՝ փոփոխական ծախսերից հետո). operating margin։ Trend-երն ավելի կարևոր են, քան մակարդակները։

### 2.1 The three statements as one system / Երեք հաշվետվությունը՝ որպես մեկ համակարգ

**EN:** They articulate — they are not three reports, they're one machine:
- Net income flows from the **P&L** into **retained earnings** on the **balance sheet**.
- The **cash flow statement** reconciles accrual net income back to the actual change in cash (the indirect method: start with net income, add back non-cash items like depreciation/amortization, adjust for changes in working capital).
- Δcash on the cash flow statement = Δcash line on the balance sheet. If those don't tie, the model is broken.
- **Heuristic:** if you can't explain why net income ≠ cash generated this period, you don't yet understand the business. The answer is almost always working capital, capex, or non-cash charges.

**HY:** Դրանք articulate են անում — երեք հաշվետվություն չեն, մեկ մեքենա են՝
- Net income-ը հոսում է **P&L**-ից դեպի **retained earnings**՝ **balance sheet**-ի վրա։
- **Cash flow statement**-ը reconcile է անում accrual net income-ը դեպի cash-ի իրական փոփոխությունը (indirect method՝ սկսիր net income-ից, հետ ավելացրու non-cash item-երը՝ depreciation/amortization, ճշգրտիր working capital-ի փոփոխությունների համար)։
- cash flow statement-ի Δcash-ը = balance sheet-ի Δcash տողը։ Եթե դրանք չեն կապվում, model-ը կոտրված է։
- **Հeuristic:** եթե չես կարող բացատրել, թե ինչու net income ≠ այս ժամանակահատվածում առաջացած cash, դեռ business-ը չես հասկանում։ Պատասխանը գրեթե միշտ working capital-ն է, capex-ը կամ non-cash charge-երը։

### 2.2 How one transaction flows through all three / Ոնց է մեկ գործարքն անցնում երեքով

**EN:** This is the test of whether you actually understand the statements. Trace examples:
- **Sell a $1,200 annual prepaid subscription, cash collected upfront.** *Cash flow:* +$1,200 (CFO, cash in now). *Balance sheet:* +$1,200 cash, +$1,200 deferred revenue (a liability). *P&L:* $0 today — revenue is recognized $100/month over 12 months. Each month: −$100 deferred revenue (BS), +$100 revenue (P&L). **Cash leads revenue by up to a year — the engine of negative CCC.**
- **Buy a $50k server (capex), paid in cash.** *P&L:* $0 immediately; the cost flows through as depreciation over its useful life (e.g., −$10k/yr for 5 yrs). *Cash flow:* −$50k now (CFI). *Balance sheet:* −$50k cash, +$50k PP&E asset, declining by depreciation each year. **Capex hits cash now but the P&L later — why EBITDA ≠ FCF.**
- **Recognize $10k revenue on net-30 terms (sold, not yet paid).** *P&L:* +$10k revenue, +gross profit now. *Balance sheet:* +$10k accounts receivable (an asset). *Cash flow:* $0 yet; cash arrives in 30 days, at which point +$10k cash, −$10k AR. **Revenue leads cash — the receivables trap that kills "profitable" growers.**
- **Accrue $20k of unpaid wages at month-end.** *P&L:* −$20k expense now. *Balance sheet:* +$20k accrued liability. *Cash flow:* $0 until paid, then −$20k. **Expense leads cash here — accrual recognizes the cost when incurred, not when paid.**

**HY:** Սա է թեստը, թե իրականում հասկանու՞մ ես հաշվետվությունները։ Trace-եր՝
- **Վաճառիր $1,200 տարեկան prepaid subscription, cash-ը հավաքված առաջից։** *Cash flow:* +$1,200 (CFO, cash հիմա ներս)։ *Balance sheet:* +$1,200 cash, +$1,200 deferred revenue (liability)։ *P&L:* $0 այսօր — revenue-ն recognize է արվում $100/ամիս 12 ամսում։ Ամեն ամիս՝ −$100 deferred revenue (BS), +$100 revenue (P&L)։ **Cash-ը մինչև մեկ տարի առաջ է անցնում revenue-ից — negative CCC-ի շարժիչը։**
- **Գնիր $50k server (capex), վճարված cash-ով։** *P&L:* $0 անմիջապես. ծախսը հոսում է depreciation-ի տեսքով useful life-ի ընթացքում (օր.՝ −$10k/տարի 5 տարի)։ *Cash flow:* −$50k հիմա (CFI)։ *Balance sheet:* −$50k cash, +$50k PP&E asset, ամեն տարի նվազող depreciation-ով։ **Capex-ը հարվածում է cash-ին հիմա, բայց P&L-ին հետո — ինչու EBITDA ≠ FCF։**
- **Recognize արա $10k revenue net-30 պայմաններով (վաճառված, դեռ չվճարված)։** *P&L:* +$10k revenue, +gross profit հիմա։ *Balance sheet:* +$10k accounts receivable (asset)։ *Cash flow:* $0 դեռ. cash-ը գալիս է 30 օրից, որի պահին +$10k cash, −$10k AR։ **Revenue-ն առաջ է անցնում cash-ից — receivables թակարդը, որ սպանում է «շահութաբեր» աճողներին։**
- **Accrue արա $20k չվճարված աշխատավարձ ամսվա վերջին։** *P&L:* −$20k ծախս հիմա։ *Balance sheet:* +$20k accrued liability։ *Cash flow:* $0 մինչ վճարելը, հետո −$20k։ **Ծախսն առաջ է անցնում cash-ից այստեղ — accrual-ը recognize է անում cost-ը երբ առաջանում է, ոչ երբ վճարվում։**

### 2.3 Accrual vs cash accounting / Accrual ընդդեմ cash accounting

**EN:**
- **Accrual basis** — recognize revenue when *earned* (delivered) and expenses when *incurred*, regardless of cash timing. This is GAAP/IFRS for any real company; it tells you whether the *business model* works by matching effort to result in the same period.
- **Cash basis** — recognize only when cash moves. Simpler, used by tiny businesses; it tells you literally what's in the bank but lies about the model (a year of prepaid revenue collected looks like a windfall; a capex year looks like ruin).
- **The operator's stance: read accrual for the model, cash for survival.** They are two different questions, and the gap between them (working capital + capex + non-cash) is itself the most diagnostic number in the business.

**HY:**
- **Accrual basis** — recognize արա revenue-ն երբ *վաստակած* է (delivered) ու ծախսերը երբ *առաջացած* են, անկախ cash-ի timing-ից։ Սա GAAP/IFRS է ցանկացած իրական ընկերության համար. այն ասում է՝ *business model*-ն աշխատու՞մ է՝ նույն ժամանակահատվածում ջանքը արդյունքին համապատասխանեցնելով։
- **Cash basis** — recognize արա միայն երբ cash-ը շարժվում է։ Ավելի պարզ, օգտագործվում է շատ փոքր business-ների կողմից. ասում է բառացիորեն ինչ կա բանկում, բայց ստում է model-ի մասին (prepaid revenue-ի մի տարին հավաքված՝ թվում է jackpot, capex-ի տարին՝ կործանում)։
- **Operator-ի դիրքը՝ կարդա accrual-ը model-ի համար, cash-ը՝ գոյատևման։** Դրանք երկու տարբեր հարց են, ու դրանց միջև բացը (working capital + capex + non-cash) ինքնին business-ի ամենա-ախտորոշիչ թիվն է։

### 2.4 The P&L, line by line (what each line is *for*) / P&L-ը տող առ տող

**EN:**
- **Revenue / Top line** — recognized per the accrual principle (earned when delivered, not when cash arrives). Watch **revenue recognition**: annual prepaid contracts are *deferred revenue* (a liability) recognized monthly, not booked all at once.
- **COGS** — the cost to *deliver* what you sold (for SaaS: hosting/infra, payment processing, customer-facing support, third-party API/data fees, DevOps tied to serving). **Gross Profit = Rev − COGS** — the money the business actually has to run on.
- **OpEx** — the cost to *run and grow* the business, not to deliver it: **S&M**, **R&D**, **G&A**. Operating leverage lives here.
- **EBIT (operating profit)** → **EBITDA** (adds back D&A — a proxy for operating cash generation, beloved and abused; it is *not* cash, it ignores capex, working capital, and interest). → **Net income** (after interest and tax).
- **Contribution margin** sits *inside* this: revenue minus all *variable* cost (some COGS + variable OpEx like commissions/ad spend). It's the per-unit profit before fixed costs — the number break-even runs on.

**HY:**
- **Revenue / Top line** — recognize է արվում accrual սկզբունքով (վաստակած՝ երբ delivered է, ոչ երբ cash-ն է գալիս)։ Հետևիր **revenue recognition**-ին՝ տարեկան prepaid contract-ները *deferred revenue* են (liability), recognize արվում ամսական, ոչ թե բոլորը միանգամից։
- **COGS** — այն, ինչ վաճառեցիր, *հասցնելու* cost-ը (SaaS-ի համար՝ hosting/infra, payment processing, customer-facing support, third-party API/data fee-ներ, serving-ին կապված DevOps)։ **Gross Profit = Rev − COGS** — այն փողը, որի վրա business-ը իրականում աշխատում է։
- **OpEx** — business-ը *վարելու ու աճեցնելու* cost-ը, ոչ թե հասցնելու՝ **S&M**, **R&D**, **G&A**։ Operating leverage-ը այստեղ է ապրում։
- **EBIT (operating profit)** → **EBITDA** (հետ ավելացնում է D&A — operating cash generation-ի proxy, սիրված ու չարաշահված. դա cash *չէ*, անտեսում է capex, working capital ու interest)։ → **Net income** (interest-ից ու tax-ից հետո)։
- **Contribution margin**-ը նստած է սրա *ներսում*՝ revenue մինուս ամբողջ *փոփոխական* cost-ը (որոշ COGS + փոփոխական OpEx, ինչպես commission-ներ/ad spend)։ Դա per-unit շահույթն է fixed cost-երից առաջ — այն թիվը, որի վրա break-even-ը աշխատում է։

### 2.5 The balance sheet (the often-ignored truth-teller) / Balance sheet-ը (հաճախ անտեսված ճշմարտախոսը)

**EN:**
- **Working capital = current assets − current liabilities.** The cash tied up in running the business day to day. Growth usually *eats* working capital.
- **The cash conversion cycle (CCC)** = DSO + DIO − DPO:
  - **DSO** (Days Sales Outstanding) — how long customers take to pay you. Lower is better.
  - **DIO** (Days Inventory Outstanding) — how long inventory sits. Zero for pure software.
  - **DPO** (Days Payable Outstanding) — how long *you* take to pay suppliers. Higher (within terms/relationship) is better — you're financing on their dime.
  - **Negative CCC = customers pay you before you pay your costs** (Amazon, annual-prepaid SaaS, marketplaces). This is a cash-generating *machine*; growth funds itself. Engineer toward it where you can (annual upfront, deposits).
- **Deferred revenue** — a *liability* that's actually great news: cash already in hand for service not yet delivered. A large, growing deferred-revenue balance is a sign of healthy prepaid demand.
- **Assets vs liabilities vs equity — the identity that never breaks.** Assets = Liabilities + Equity, always. Equity is the residual claim (book value); it is *not* market value (§7). A growing equity base from retained earnings is a self-funding business; equity propped only by fresh capital raises is not.

**HY:**
- **Working capital = current assets − current liabilities.** Business-ը օրեցօր վարելու մեջ խրված cash-ը։ Աճը սովորաբար *ուտում* է working capital-ը։
- **Cash conversion cycle (CCC)** = DSO + DIO − DPO՝
  - **DSO** (Days Sales Outstanding) — որքան ժամանակ են customer-ները վերցնում քեզ վճարելու։ Ցածրն ավելի լավ է։
  - **DIO** (Days Inventory Outstanding) — որքան է inventory-ն նստում։ Մաքուր software-ի համար՝ զրո։
  - **DPO** (Days Payable Outstanding) — որքան ես *դու* վերցնում supplier-ներին վճարելու։ Ավելի բարձրը (պայմանների/հարաբերության սահմաններում) ավելի լավ է — financing անում ես իրենց հաշվին։
  - **Բացասական CCC = customer-ները քեզ վճարում են, նախքան դու քո ծախսերը վճարելը** (Amazon, annual-prepaid SaaS, marketplace-ներ)։ Սա cash-արտադրող *մեքենա* է. աճն ինքն իրեն ֆինանսավորում է։ Engineer արա դեպի այն, որտեղ կարող ես (annual upfront, deposit-ներ)։
- **Deferred revenue** — *liability*, որ իրականում հիանալի լուր է՝ cash-ն արդեն ձեռքին է դեռ չմատուցված service-ի համար։ Մեծ, աճող deferred-revenue balance-ը առողջ prepaid պահանջարկի նշան է։
- **Assets ընդդեմ liabilities ընդդեմ equity — identity-ն, որ երբեք չի կոտրվում։** Assets = Liabilities + Equity, միշտ։ Equity-ն residual claim-ն է (book value). դա market value *չէ* (§7)։ Retained earnings-ից աճող equity base-ը ինքնա-ֆինանսավորվող business է. միայն թարմ capital raise-ով պահված equity-ն՝ ոչ։

### 2.6 The cash flow statement (the one that can't be faked) / Cash flow statement-ը (էն, որ չի կարող կեղծվել)

**EN:**
- **CFO (operating)** — cash from running the business. Should turn positive as you mature; chronically negative CFO with positive net income = an accruals/working-capital problem.
- **CFI (investing)** — capex, acquisitions, asset purchases.
- **CFF (financing)** — raising debt/equity, repaying, dividends, buybacks.
- **Free Cash Flow (FCF) = CFO − capex.** The real number — cash the business throws off and can choose to deploy. Valuation ultimately tracks FCF, not earnings. (Buffett's **owner earnings** ≈ net income + D&A − maintenance capex − incremental working capital: the cash an owner could actually pull out without starving the business.)
- **Rule:** read the cash flow statement *first* in any distressed or fast-growing situation. The P&L can be made to smile; cash cannot.

**HY:**
- **CFO (operating)** — business-ը վարելուց cash-ը։ Հասունանալիս պետք է դրական դառնա. քրոնիկ բացասական CFO դրական net income-ով = accrual-ների/working-capital-ի խնդիր։
- **CFI (investing)** — capex, acquisition-ներ, asset գնումներ։
- **CFF (financing)** — debt/equity raise, մարում, dividend-ներ, buyback-ներ։
- **Free Cash Flow (FCF) = CFO − capex.** Իրական թիվը — cash-ը, որ business-ը արտադրում է ու կարող է ընտրել deploy անել։ Valuation-ը վերջում հետևում է FCF-ին, ոչ earnings-ին։ (Buffett-ի **owner earnings** ≈ net income + D&A − maintenance capex − incremental working capital՝ cash-ը, որ owner-ը կարող էր իրականում հանել՝ առանց business-ը սովամահ անելու։)
- **Կանոն:** կարդա cash flow statement-ը *առաջինը* ցանկացած distressed կամ արագ աճող իրավիճակում։ P&L-ին կարելի է ստիպել ժպտալ. cash-ին՝ ոչ։

### 2.7 Reading like an operator / Կարդալ operator-ի պես

**EN:**
- **Trends over levels; ratios over absolutes; cohorts over aggregates.** A single period is a dot; the slope is the story; an aggregate hides the cohort that's actually rotting.
- **Common-size everything** — express the P&L as % of revenue. That's how you see operating leverage (fixed costs shrinking as % as you grow) and margin drift.
- **Variance discipline** — actual vs plan, decomposed (price vs volume vs mix vs FX). "We missed revenue by 8%" is useless; "we hit volume but mix shifted to the low-margin SKU" is a decision.

**HY:**
- **Trend-եր մակարդակների վրա. ratio-ներ absolute-ների վրա. cohort-եր aggregate-ների վրա։** Մեկ ժամանակահատվածը կետ է. slope-ը պատմությունն է. aggregate-ը թաքցնում է cohort-ը, որ իրականում փտում է։
- **Common-size արա ամեն ինչ** — արտահայտիր P&L-ը որպես revenue-ի %։ Էդպես ես տեսնում operating leverage-ը (fixed cost-երը որպես % փոքրանում են աճելիս) ու margin drift-ը։
- **Variance discipline** — actual ընդդեմ plan, decompose արված (price ընդդեմ volume ընդդեմ mix ընդդեմ FX)։ «Revenue-ն 8%-ով բաց թողեցինք» անօգուտ է. «volume-ին հասանք, բայց mix-ը շեղվեց դեպի low-margin SKU» — որոշում է։

---

## 3. UNIT ECONOMICS (the heart of the skill)

> **EN:** *Every bullet below is the original floor — kept verbatim, then deepened with the real formulas, ranges, and traps.*
> **HY:** *Ստորև ամեն կետ սկզբնական հատակն է — պահված բառ առ բառ, հետո խորացված իրական բանաձևերով, ranges-ով ու թակարդներով։*

**EN:**
- **Contribution margin** = price − variable cost per unit. Must be positive, or volume just deepens losses.
- **CAC** = fully-loaded sales+marketing cost ÷ new customers acquired.
- **LTV** = (avg revenue × gross margin × avg lifetime) — the gross profit a customer delivers over their life.
- **LTV:CAC** — > 3:1 healthy; < 1 is burning money to acquire; too high may mean under-investing in growth.
- **CAC payback** = months to recover CAC from gross-margin contribution. < 12 months strong for most models.
- **Churn** — revenue and logo churn; small monthly churn compounds brutally. Net revenue retention > 100% = growth even with zero new logos.

**HY:**
- **Contribution margin** = price − variable cost per unit։ Պետք է դրական լինի, թե չէ volume-ը պարզապես խորացնում է կորուստները։
- **CAC** = fully-loaded sales+marketing cost ÷ ձեռք բերված նոր customer-ներ։
- **LTV** = (avg revenue × gross margin × avg lifetime) — gross profit-ը, որ customer-ը տալիս է իր կյանքի ընթացքում։
- **LTV:CAC** — > 3:1 առողջ. < 1՝ փող ես այրում ձեռք բերելու համար. շատ բարձրը կարող է նշանակել growth-ի թերի-ներդրում։
- **CAC payback** = ամիսներ՝ CAC-ը gross-margin contribution-ից վերականգնելու։ < 12 ամիս՝ ուժեղ business-ների մեծ մասի համար։
- **Churn** — revenue ու logo churn. փոքր ամսական churn-ը դաժանորեն compound է անում։ Net revenue retention > 100% = աճ նույնիսկ զրո նոր logo-ով։

### 3.1 The unit-economics-must-work-at-unit-level principle / «Unit-ի մակարդակում պետք է աշխատի» սկզբունքը

**EN:** The foundational law of this skill, stated plainly: **a company is its unit economics multiplied by scale, plus fixed costs.** If a single customer or transaction does not, at the unit level, produce positive contribution that recovers its acquisition cost in acceptable time, then scaling *multiplies a loss*. Growth is a lever, never a fix. The order of operations is non-negotiable: (1) prove the *unit* is profitable (positive contribution margin, sane CAC payback), (2) prove the *cohort* retains (the curve flattens above zero), (3) *then* pour fuel on acquisition. Founders who reverse this — scale first, "we'll fix economics with scale" — are betting that fixed-cost leverage alone saves a broken unit, which it almost never does. Scale dilutes fixed cost; it does not repair negative contribution margin.

**HY:** Այս skill-ի հիմնարար օրենքը՝ պարզ ասած. **ընկերությունը իր unit economics-ն է բազմապատկած scale-ով, գումարած fixed cost-երը։** Եթե մեկ customer-ը կամ transaction-ը unit-ի մակարդակում դրական contribution չի տալիս, որ ընդունելի ժամանակում վերականգնում է իր acquisition cost-ը, ապա scale անելը *բազմապատկում է կորուստը*։ Աճը lever է, երբեք fix։ Գործողությունների հերթականությունը չի քննարկվում՝ (1) ապացուցիր, որ *unit*-ը շահութաբեր է (դրական contribution margin, ողջամիտ CAC payback), (2) ապացուցիր, որ *cohort*-ը retain է անում (curve-ը հարթվում է զրոյից վեր), (3) *հետո* լցրու վառելիք acquisition-ի վրա։ Founder-ները, որ սա շրջում են — scale առաջինը, «economics-ը scale-ով կուղղենք» — խաղադրույք են դնում, որ միայն fixed-cost leverage-ը կփրկի կոտրված unit-ը, ինչը գրեթե երբեք չի լինում։ Scale-ը նոսրացնում է fixed cost-ը. այն չի վերանորոգում բացասական contribution margin-ը։

### 3.2 Doing the math correctly (where people lie to themselves) / Մաթը ճիշտ անելը

**EN:**
- **CAC — make it *fully loaded*.** Include S&M salaries + commissions + ad spend + tools + content + the loaded cost of the AE/SDR, over the *acquiring* period. The two classic frauds: (1) counting only ad spend, ignoring the sales team; (2) dividing last month's spend by this month's customers when there's a sales-cycle lag (lag CAC: spend in month *t* matched to customers landed in *t+sales cycle*).
- **Blended vs paid CAC** — *blended* divides all S&M by *all* new customers (including organic/referral); *paid* divides paid spend by paid-acquired customers. Blended flatters you; paid tells you the truth about the channel. Track both, decide on paid.
- **LTV — gross-margin-based, not revenue-based.** LTV = ARPA × GM% × (avg lifetime). Avg lifetime ≈ 1 / churn rate (monthly churn 2% → ~50-month life). Revenue-LTV overstates by the cost-to-serve; always discount by gross margin. For long lives, discount future contribution to present value (a customer's year-5 dollar is worth less than today's).
- **The LTV/churn trap:** 1/churn explodes as churn → 0 and is wildly unstable for low-churn cohorts you haven't observed long enough. For early-stage, prefer a *capped* or *observed-window* LTV (e.g., 24-month contribution) over a theoretical infinite-life number. Don't fundraise on a 1/churn fantasy.

**HY:**
- **CAC — դարձրու *fully loaded*։** Ներառիր S&M աշխատավարձ + commission + ad spend + գործիքներ + content + AE/SDR-ի loaded cost, *ձեռք բերելու* ժամանակահատվածում։ Երկու դասական խարդախություն՝ (1) միայն ad spend-ը հաշվել՝ sales team-ը անտեսելով. (2) անցած ամսվա spend-ը բաժանել այս ամսվա customer-ների վրա, երբ sales-cycle lag կա (lag CAC՝ *t* ամսվա spend-ը համապատասխանեցված *t+sales cycle*-ին հասած customer-ներին)։
- **Blended ընդդեմ paid CAC** — *blended*-ը բաժանում է ամբողջ S&M-ը *բոլոր* նոր customer-ների վրա (ներառյալ organic/referral). *paid*-ը բաժանում է paid spend-ը paid- acquired customer-ների վրա։ Blended-ը շոյում է քեզ. paid-ը ասում է ճշմարտությունը channel-ի մասին։ Հետևիր երկուսին, որոշիր paid-ով։
- **LTV — gross-margin-հիմքով, ոչ revenue-հիմքով։** LTV = ARPA × GM% × (avg lifetime)։ Avg lifetime ≈ 1 / churn rate (ամսական churn 2% → ~50-ամսյա կյանք)։ Revenue-LTV-ն գերագնահատում է cost-to-serve-ի չափով. միշտ discount արա gross margin-ով։ Երկար կյանքերի համար discount արա ապագա contribution-ը present value-ի (customer-ի 5-րդ տարվա dollar-ը այսօրվայից պակաս արժե)։
- **LTV/churn թակարդը՝** 1/churn-ը պայթում է, երբ churn → 0, ու վայրենաբար անկայուն է low-churn cohort-ների համար, որ բավական երկար չես դիտել։ Early-stage-ի համար նախընտրիր *capped* կամ *observed-window* LTV (օր.՝ 24-ամսյա contribution) տեսական անվերջ-կյանք թվից։ Մի՛ fundraise արա 1/churn ֆանտազիայով։

### 3.3 The ratios and their honest ranges / Ratio-ները ու դրանց ազնիվ ranges-ը

**EN:**
- **LTV:CAC** — < 1 = lighting money on fire; 1–3 = working but tight / channel-dependent; **~3:1 = the healthy default**; > 5:1 *and* growing slowly = you're under-investing in growth (you're leaving money on the table — spend more to acquire). The ratio is a *guide*, not a target to optimize blindly.
- **CAC payback** — months of gross-margin contribution to recoup CAC. < 12 months = strong (SMB SaaS often 5–12); 12–18 = acceptable for enterprise with high NRR; > 18–24 = cash-hungry, only survivable with cheap capital and very low churn. **Payback is the cash-reality check that LTV:CAC hides** — a 5:1 LTV:CAC with a 30-month payback can still bankrupt you, because the cash goes out now and comes back over years.
- **Contribution margin %** — the single most load-bearing unit number. Negative = you cannot scale, full stop. Thin (< 20%) = a low-quality, capital-hungry business even at scale. Healthy software contribution sits behind a 70–85% gross margin minus variable S&M.
- **The "magic" relationship:** payback period and burn are tied — short payback = you can self-fund growth from returning cash; long payback = every new customer is a fresh cash hole you must fund externally.

**HY:**
- **LTV:CAC** — < 1 = փող ես այրում. 1–3 = աշխատում է, բայց սեղմ / channel-կախյալ. **~3:1 = առողջ default**. > 5:1 *ու* դանդաղ աճող = growth-ի թերի-ներդրում ես անում (փող ես սեղանին թողնում — ավելի շատ ծախսիր ձեռք բերելու)։ Ratio-ն *ուղեցույց* է, ոչ թե թիրախ՝ կուրորեն optimize անելու։
- **CAC payback** — gross-margin contribution-ի ամիսներ՝ CAC-ը վերականգնելու։ < 12 ամիս = ուժեղ (SMB SaaS հաճախ 5–12). 12–18 = ընդունելի enterprise-ի համար բարձր NRR-ով. > 18–24 = cash-քաղցած, գոյատևելի միայն էժան կապիտալով ու շատ ցածր churn-ով։ **Payback-ը cash-ի reality check-ն է, որ LTV:CAC-ը թաքցնում է** — 5:1 LTV:CAC՝ 30-ամսյա payback-ով, դեռ կարող է սնանկացնել, քանի որ cash-ը հիմա է դուրս գալիս ու տարիների ընթացքում վերադառնում։
- **Contribution margin %** — ամենա-load-bearing unit թիվը։ Բացասական = չես կարող scale անել, վերջ։ Բարակ (< 20%) = ցածր-որակ, capital-քաղցած business նույնիսկ scale-ով։ Առողջ software contribution-ը նստած է 70–85% gross margin-ի հետևում՝ մինուս փոփոխական S&M։
- **«Magic» հարաբերությունը՝** payback period-ն ու burn-ը կապված են — կարճ payback = կարող ես ինքնա-ֆինանսավորել աճը վերադարձող cash-ից. երկար payback = ամեն նոր customer թարմ cash անցք է, որ պետք է արտաքնապես ֆինանսավորես։

### 3.4 Churn & retention (where SaaS lives or dies) / Churn ու retention

**EN:**
- **Logo churn** (customers lost) vs **revenue churn** (dollars lost) — they diverge: lose small accounts, keep big ones → logo churn high, revenue churn low. Revenue is what matters.
- **Gross revenue retention (GRR)** = revenue kept from existing base *before* expansion (caps at 100%) — measures leakage; the honest churn number investors trust.
- **Net revenue retention (NRR / NDR)** = GRR + expansion (can exceed 100%). **NRR > 100% means the existing base grows even with zero new logos** — the single best signal of product-market fit and pricing power. Best-in-class SaaS: 120%+.
- **Churn compounds brutally:** 5% monthly churn ≈ 46% annual churn — you lose nearly half your base a year. 2% monthly ≈ 22% annual. The difference between 2% and 5% monthly is the difference between a compounding asset and a leaky bucket.
- **Cohort retention curves** — track each acquisition cohort's revenue over time. A *flattening* curve (retention stabilizes above zero) = real product-market fit; a curve heading to zero = a treadmill where you must acquire forever. The shape of the curve is the most honest unit-economics artifact you have.

**HY:**
- **Logo churn** (կորցրած customer-ներ) ընդդեմ **revenue churn** (կորցրած dollar-ներ) — դրանք շեղվում են՝ կորցնում ես փոքր account-ները, պահում մեծերը → logo churn բարձր, revenue churn ցածր։ Revenue-ն է կարևորը։
- **Gross revenue retention (GRR)** = գոյություն ունեցող base-ից պահված revenue-ն *expansion-ից առաջ* (առաստաղ 100%) — չափում է leakage-ը. ազնիվ churn թիվը, որին investor-ները վստահում են։
- **Net revenue retention (NRR / NDR)** = GRR + expansion (կարող է գերազանցել 100%)։ **NRR > 100% նշանակում է գոյություն ունեցող base-ը աճում է նույնիսկ զրո նոր logo-ով** — product-market fit-ի ու pricing power-ի լավագույն ազդանշանը։ Best-in-class SaaS՝ 120%+։
- **Churn-ը դաժանորեն compound է անում՝** 5% ամսական churn ≈ 46% տարեկան churn — տարին կորցնում ես base-իդ գրեթե կեսը։ 2% ամսական ≈ 22% տարեկան։ 2%-ի ու 5%-ի միջև տարբերությունը compounding asset-ի ու ծակ դույլի միջև տարբերությունն է։
- **Cohort retention curve-եր** — հետևիր ամեն acquisition cohort-ի revenue-ին ժամանակի ընթացքում։ *Հարթվող* curve (retention-ը կայունանում է զրոյից վեր) = իրական product-market fit. զրոյի գնացող curve = treadmill, որտեղ պետք է հավերժ ձեռք բերես։ Curve-ի ձևը ամենա-ազնիվ unit-economics artifact-ն է, որ ունես։

### 3.5 Mental models / Մտածական մոդելներ

**EN:**
- **The leaky bucket** — acquisition pours in the top; churn drains the bottom. You can't out-pour a big enough hole. Fix retention before scaling acquisition.
- **The "you can't grow your way out of bad unit economics" law** — if contribution margin is negative, every new customer makes the hole deeper; growth accelerates death. Scale is a *multiplier*, never a *fixer*, of unit economics.
- **Cohort-based unit economics** — never average across the whole base; the aggregate is a blend of a great early cohort and a rotting recent one. Read economics *per cohort* (CAC, payback, retention, expansion by acquisition month/channel) — the trend across cohorts tells you whether the machine is improving or decaying.

**HY:**
- **Ծակ դույլը** — acquisition-ը լցվում է վերևից. churn-ը ցամաքեցնում է ներքևից։ Չես կարող դուրս լցնել բավական մեծ անցքից։ Ուղղիր retention-ը նախքան acquisition-ը scale անելը։
- **«Չես կարող աճով դուրս գալ վատ unit economics-ից» օրենքը** — եթե contribution margin-ը բացասական է, ամեն նոր customer անցքն ավելի խորացնում է. աճն արագացնում է մահը։ Scale-ը unit economics-ի *բազմապատկիչ* է, երբեք *ուղղող*։
- **Cohort-հիմքով unit economics** — երբեք մի՛ average արա ամբողջ base-ի վրա. aggregate-ը հոյակապ վաղ cohort-ի ու փտող վերջին cohort-ի խառնուրդ է։ Կարդա economics-ը *cohort առ cohort* (CAC, payback, retention, expansion ըստ acquisition ամսվա/channel-ի) — cohort-ների միջև trend-ը ասում է՝ մեքենան բարելավվու՞մ է թե քայքայվում։

---

## 4. SaaS / RECURRING METRICS (the canon)

> **EN:** *Original bullets kept verbatim, then extended.*
> **HY:** *Սկզբնական կետերը պահված բառ առ բառ, հետո ընդլայնված։*

**EN:**
- **MRR/ARR**, expansion vs contraction vs churn (the MRR bridge).
- **Net Revenue Retention (NRR)** — the single most predictive growth-quality metric.
- **Rule of 40** — growth% + profit% ≥ 40 signals a healthy balance of growth and efficiency.
- **Magic number** — net-new ARR ÷ prior-period S&M spend; sales efficiency.
- **Gross margin** — for software typically high; low gross margin caps valuation and fundability.

**HY:**
- **MRR/ARR**, expansion ընդդեմ contraction ընդդեմ churn (MRR bridge-ը)։
- **Net Revenue Retention (NRR)** — growth-quality-ի ամենա-կանխատեսող մետրիկը։
- **Rule of 40** — growth% + profit% ≥ 40՝ ազդանշանում է growth-ի ու efficiency-ի առողջ հավասարակշռություն։
- **Magic number** — net-new ARR ÷ նախորդ-period S&M spend. sales efficiency։
- **Gross margin** — software-ի համար սովորաբար բարձր. ցածր gross margin-ը սահմանափակում է valuation-ն ու fundability-ն։

### 4.1 Bookings vs billings vs revenue (the three that get confused) / Bookings ընդդեմ billings ընդդեմ revenue

**EN:** Three different moments in the same deal — conflating them is a classic error that overstates the business:
- **Bookings** — the total contracted value when a deal is *signed* (e.g., a $120k 3-year contract = $120k bookings now). A commitment, not cash, not yet revenue. A sales/pipeline metric.
- **Billings** — what you *invoice* in a period (the annual invoice = $40k billed today even on a 3-year deal). Drives cash and deferred revenue; billings growth often leads revenue growth.
- **Revenue** — what you *recognize* as earned per the accrual principle ($40k/12 = $3.33k/month here). The P&L number; the one investors underwrite.
- **Rule:** never quote bookings as if it were revenue (the favorite way to inflate a deck), never confuse billings (cash-timing) with revenue (earned). ARR is a *run-rate* snapshot (current MRR × 12), not a period's recognized revenue — keep them distinct.

**HY:** Նույն գործարքի երեք տարբեր պահ — դրանք շփոթելը դասական սխալ է, որ գերագնահատում է business-ը՝
- **Bookings** — ընդհանուր պայմանագրային արժեքը, երբ գործարքը *ստորագրվում* է (օր.՝ $120k 3-տարյա contract = $120k bookings հիմա)։ Պարտավորություն է, ոչ cash, դեռ ոչ revenue։ Sales/pipeline մետրիկ։
- **Billings** — այն, ինչ *invoice* ես անում մի period-ում (տարեկան invoice-ը = $40k billed այսօր նույնիսկ 3-տարյա գործարքով)։ Շարժում է cash-ն ու deferred revenue-ն. billings-ի աճը հաճախ առաջ է անցնում revenue-ի աճից։
- **Revenue** — այն, ինչ *recognize* ես անում որպես վաստակած accrual սկզբունքով ($40k/12 = $3.33k/ամիս այստեղ)։ P&L թիվը. էն, որ investor-ները underwrite են անում։
- **Կանոն:** երբեք մի՛ նշիր bookings-ը, կարծես revenue լիներ (deck փչացնելու սիրելի ձևը), երբեք մի՛ շփոթիր billings-ը (cash-timing) revenue-ի (վաստակած) հետ։ ARR-ը *run-rate* snapshot է (ընթացիկ MRR × 12), ոչ թե period-ի recognize արված revenue — պահիր դրանք առանձին։

### 4.2 The MRR/ARR bridge (the most important SaaS waterfall) / MRR/ARR bridge-ը

**EN:** Ending MRR = Starting MRR **+ New** + **Expansion** + **Reactivation** **− Contraction** **− Churn**. Reading the bridge tells you *where* growth comes from and *where* it leaks. Two companies with identical net MRR growth can be completely different businesses: one growing on new logos with high churn (treadmill), one growing on expansion with NRR>100% (compounding asset). **Never report a single MRR number without the bridge behind it.**

**HY:** Ending MRR = Starting MRR **+ New** + **Expansion** + **Reactivation** **− Contraction** **− Churn**։ Bridge-ը կարդալը ասում է՝ *որտեղից* է գալիս աճը ու *որտեղ* է leak անում։ Նույնական net MRR աճով երկու ընկերություն կարող են լրիվ տարբեր business լինել՝ մեկը աճում է նոր logo-ներով՝ բարձր churn-ով (treadmill), մյուսը՝ expansion-ով՝ NRR>100%-ով (compounding asset)։ **Երբեք մի՛ հաղորդիր մեկ MRR թիվ՝ առանց հետևում bridge-ի։**

### 4.3 The efficiency metrics and their reads / Efficiency մետրիկները ու դրանց ընթերցումները

**EN:**
- **Rule of 40** — growth rate % + FCF (or EBITDA) margin % ≥ 40. Lets a hyper-growth burner and a slow-but-profitable cash machine both qualify. Below 40 consistently = you're neither growing fast enough nor profitable enough. It's a *balance* test, not a target.
- **Magic number** = net-new ARR in a period ÷ prior period's S&M spend. > 0.75 = efficient, lean in (spend more); 0.5–0.75 = working; < 0.5 = sales-and-marketing is inefficient, fix the motion before scaling spend.
- **Burn multiple** (Sacks) = net burn ÷ net-new ARR. The single cleanest capital-efficiency number: how much cash you burn to generate a dollar of new recurring revenue. < 1 = elite; 1–1.5 = great; 1.5–2 = ok; > 2 = inefficient; > 3 = alarming. Prefer this to magic number for a holistic read because it captures *all* burn, not just S&M.
- **Gross margin** — SaaS target ~70–85%+. Low GM (services-heavy, infra-heavy) structurally caps valuation multiples and how much growth you can fund. Watch "fake SaaS" — a services business wearing a software multiple.
- **Quick ratio** (SaaS) = (New + Expansion MRR) ÷ (Churned + Contraction MRR). > 4 = strong growth quality (you're adding $4 for every $1 you lose).

**HY:**
- **Rule of 40** — growth rate % + FCF (կամ EBITDA) margin % ≥ 40։ Թույլ է տալիս և hyper-growth burner-ին, և դանդաղ-բայց-շահութաբեր cash մեքենային qualify անել։ 40-ից ցածր կայունորեն = ոչ բավական արագ ես աճում, ոչ բավական շահութաբեր ես։ Դա *balance* թեստ է, ոչ թիրախ։
- **Magic number** = net-new ARR մի period-ում ÷ նախորդ period-ի S&M spend։ > 0.75 = efficient, լցվիր ներս (ավելի ծախսիր). 0.5–0.75 = աշխատում է. < 0.5 = sales-and-marketing-ը inefficient է, ուղղիր motion-ը նախքան spend-ը scale անելը։
- **Burn multiple** (Sacks) = net burn ÷ net-new ARR։ Ամենա-մաքուր capital-efficiency թիվը՝ որքան cash ես այրում նոր recurring revenue-ի մեկ dollar առաջացնելու համար։ < 1 = elite. 1–1.5 = հոյակապ. 1.5–2 = ok. > 2 = inefficient. > 3 = տագնապալի։ Նախընտրիր սա magic number-ից holistic ընթերցման համար, քանի որ այն գրավում է *ամբողջ* burn-ը, ոչ միայն S&M-ը։
- **Gross margin** — SaaS թիրախ ~70–85%+։ Ցածր GM (services-ծանր, infra-ծանր) կառուցվածքով սահմանափակում է valuation multiple-ները ու որքան growth կարող ես ֆինանսավորել։ Հետևիր «fake SaaS»-ին — services business, որ software multiple է հագել։
- **Quick ratio** (SaaS) = (New + Expansion MRR) ÷ (Churned + Contraction MRR)։ > 4 = ուժեղ growth-quality (ամեն $1-ի դիմաց, որ կորցնում ես, $4 ես ավելացնում)։

### 4.4 What investors actually underwrite / Ինչ են investor-ները իրականում underwrite անում

**EN:** NRR, GRR, CAC payback, burn multiple, gross margin, and the cohort retention curve — in roughly that order. Vanity ARR with bad retention gets a low multiple; modest ARR with 120%+ NRR and short payback gets a premium. **The multiple is paid on the *quality* of the recurring revenue, not its headline size.**

**HY:** NRR, GRR, CAC payback, burn multiple, gross margin ու cohort retention curve — մոտավորապես այդ հերթականությամբ։ Vanity ARR-ը վատ retention-ով ստանում է ցածր multiple. համեստ ARR-ը 120%+ NRR-ով ու կարճ payback-ով՝ premium։ **Multiple-ը վճարվում է recurring revenue-ի *որակի* համար, ոչ դրա headline չափի։**

---

## 5. MODELING (the FP&A core)

> **EN:** *Original bullets kept verbatim, then expanded into a real modeling discipline.*
> **HY:** *Սկզբնական կետերը պահված բառ առ բառ, հետո ընդլայնված իրական modeling discipline-ի։*

**EN:**
- **Driver-based** — model from operational drivers (units × price, conversion rates, churn), not top-down guesses.
- **Three scenarios** — worst / likely / best; decisions should survive the worst-but-plausible case.
- **Sensitivity** — find the 2–3 inputs that move the outcome most; that's where attention and risk-management go.
- **Cash model** — separate from P&L: timing of inflows vs outflows, runway = cash ÷ net monthly burn.
- **Break-even** — fixed costs ÷ contribution margin per unit = units to break even. Know this number.

**HY:**
- **Driver-based** — modeling արա operational driver-ներից (units × price, conversion rate-եր, churn), ոչ top-down գուշակություններից։
- **Երեք scenario** — worst / likely / best. որոշումները պետք է գոյատևեն worst-but-plausible դեպքում։
- **Sensitivity** — գտիր 2–3 input-ները, որ outcome-ը ամենաշատն են շարժում. էնտեղ է գնում ուշադրությունն ու risk-management-ը։
- **Cash model** — P&L-ից առանձին՝ inflow-ների ընդդեմ outflow-ների timing, runway = cash ÷ net monthly burn։
- **Break-even** — fixed cost-եր ÷ contribution margin per unit = unit-ներ break even-ի։ Իմացիր այս թիվը։

### 5.1 The 3-statement model & how it links / 3-statement model-ը ու ոնց է կապվում

**EN:** The real artifact of serious FP&A. A 3-statement model is a P&L, balance sheet, and cash-flow statement wired together so a change to *any* driver flows correctly through all three and **the model still balances** (Assets = L + E; Δcash ties). The build: (1) drive the **P&L** from operational assumptions; (2) net income flows to retained earnings on the **balance sheet**; (3) the **cash flow** is *derived* (indirect method: net income + non-cash − ΔWC − capex + financing) and its ending cash *is* the balance-sheet cash line. The discipline that separates a model from a spreadsheet: **the three must reconcile automatically** — if the balance sheet doesn't balance when you flex an assumption, the model is wrong and you cannot trust a single output. Working capital schedules (AR/AP/inventory as days of revenue/COGS), a debt schedule (with interest feeding the P&L), and a PP&E/depreciation schedule are the connective tissue.

**HY:** Լուրջ FP&A-ի իրական artifact-ը։ 3-statement model-ը P&L, balance sheet ու cash-flow statement է՝ իրար միացած այնպես, որ *ցանկացած* driver-ի փոփոխությունը ճիշտ հոսում է երեքով ու **model-ը դեռ balance է** (Assets = L + E. Δcash կապվում է)։ Կառուցումը՝ (1) վարիր **P&L**-ը operational assumption-ներից. (2) net income-ը հոսում է retained earnings՝ **balance sheet**-ի վրա. (3) **cash flow**-ն *derive* է արվում (indirect method՝ net income + non-cash − ΔWC − capex + financing), ու դրա ending cash-ը *հենց* balance-sheet-ի cash տողն է։ Discipline-ը, որ model-ը spreadsheet-ից տարբերում է՝ **երեքը պետք է ավտոմատ reconcile անեն** — եթե balance sheet-ը չի balance անում assumption-ը flex անելիս, model-ը սխալ է, ու չես կարող մեկ output-ի վստահել։ Working capital schedule-ները (AR/AP/inventory որպես revenue/COGS-ի օրեր), debt schedule (interest-ով, որ սնում է P&L-ը), ու PP&E/depreciation schedule-ը connective tissue-ն են։

### 5.2 How to build a model that survives contact with reality / Ոնց կառուցել model, որ գոյատևի իրականության հետ շփումը

**EN:**
- **Drivers in, outputs out — never hardcode an output.** Every cell is either an *assumption* (colored, editable, documented) or a *formula*. Revenue = traffic × conversion × ARPA × (1 − churn)…; never a number you typed because it "feels right." **The model is only as good as its drivers** — garbage assumptions produce confident garbage outputs; spend your effort validating the 2–3 drivers the answer hinges on, not formatting the spreadsheet.
- **Bottom-up beats top-down.** "We'll get 1% of a $10B market" is a fantasy; "we can land N customers/month at conversion C from channel X" is a model. Top-down is a sanity *check* on a bottom-up build, never the build itself.
- **Top-down × bottom-up triangulation** — if your bottom-up implies you'll own 40% of the market, your assumptions are wrong. Use TAM/SAM/SOM as the ceiling reality-check (TAM/SAM/SOM defined in Skill 05/06 — the strategy/market side).
- **Separate the P&L model from the cash model.** Same drivers, different timing. The P&L can be green while the cash model shows you dead in month 7. The cash model is the one that decides whether you survive.
- **Build the unit first, then multiply.** Model one customer/one cohort's economics, prove it works, then scale it. A company model is just the unit model × growth × time, plus fixed costs.

**HY:**
- **Driver-ները ներս, output-ները դուրս — երբեք output-ը մի՛ hardcode արա։** Ամեն cell կա՛մ *assumption* է (գունավորված, խմբագրելի, փաստաթղթավորված), կա՛մ *formula*։ Revenue = traffic × conversion × ARPA × (1 − churn)… երբեք թիվ, որ մուտքագրեցիր, որովհետև «ճիշտ է զգացվում»։ **Model-ը այնքան լավն է, որքան իր driver-ները** — աղբ assumption-ները արտադրում են վստահ աղբ output-ներ. ծախսիր ջանքդ՝ validate անելու 2–3 driver-ները, որոնցից կախված է պատասխանը, ոչ թե spreadsheet-ը ֆորմատավորելու։
- **Bottom-up-ը հաղթում է top-down-ին։** «$10B շուկայի 1%-ը կվերցնենք» ֆանտազիա է. «N customer/ամիս կարող ենք հասցնել C conversion-ով X channel-ից» model է։ Top-down-ը bottom-up build-ի sanity *check* է, երբեք ինքը build-ը։
- **Top-down × bottom-up triangulation** — եթե bottom-up-դ ենթադրում է, որ շուկայի 40%-ը կունենաս, assumption-ներդ սխալ են։ Օգտագործիր TAM/SAM/SOM-ը որպես առաստաղի reality-check (TAM/SAM/SOM-ը սահմանված է Skill 05/06-ում — strategy/market կողմը)։
- **Բաժանիր P&L model-ը cash model-ից։** Նույն driver-ները, տարբեր timing։ P&L-ը կարող է կանաչ լինել, մինչ cash model-ը ցույց է տալիս քեզ մեռած 7-րդ ամսին։ Cash model-ն է էն, որ որոշում է՝ գոյատևու՞մ ես։
- **Կառուցիր unit-ը առաջինը, հետո բազմապատկիր։** Modeling արա մեկ customer/մեկ cohort-ի economics-ը, ապացուցիր որ աշխատում է, հետո scale արա։ Ընկերության model-ը պարզապես unit model × growth × time է, գումարած fixed cost-եր։

### 5.3 Scenarios, sensitivity, and honesty / Scenario-ներ, sensitivity ու ազնվություն

**EN:**
- **Three scenarios, not one** — worst / base / best. The discipline isn't the optimism range; it's forcing yourself to write down the *worst-but-plausible* and confirm you survive it (enough runway, covenants hold, no death). Decisions are made against the *downside*, not the dream.
- **Sensitivity / tornado analysis** — flex each input ±X% and rank by impact on the output. The 2–3 inputs that dominate (usually: churn, conversion, price, sales-cycle length, and one cost driver) are where you focus management attention and risk controls. Everything else is noise you're over-modeling.
- **Monte Carlo only when distributions matter and you have data** — otherwise it's false precision dressed as rigor. For most operating decisions, three scenarios + sensitivity is enough.
- **The model is a thinking tool, not an oracle.** Its job is to reveal *which assumption the whole decision hinges on*, so you can go validate *that one thing* in the real world.

**HY:**
- **Երեք scenario, ոչ մեկ** — worst / base / best։ Discipline-ը optimism-ի range-ը չէ. այլ ստիպել քեզ գրել *worst-but-plausible*-ը ու հաստատել, որ գոյատևում ես (բավական runway, covenant-ները պահում են, ոչ մահ)։ Որոշումներն արվում են *downside*-ի դեմ, ոչ երազի։
- **Sensitivity / tornado analysis** — flex արա ամեն input ±X% ու դասավորիր ըստ output-ի վրա ազդեցության։ 2–3 input-ները, որ գերիշխում են (սովորաբար՝ churn, conversion, price, sales-cycle երկարություն ու մեկ cost driver), էնտեղ ես կենտրոնացնում management ուշադրությունն ու risk control-ները։ Մնացած ամեն ինչ աղմուկ է, որ over-model ես անում։
- **Monte Carlo միայն երբ distribution-ները կարևոր են ու data ունես** — թե չէ false precision է՝ rigor հագած։ Operating որոշումների մեծ մասի համար երեք scenario + sensitivity-ն բավական է։
- **Model-ը մտածական գործիք է, ոչ oracle։** Իր գործն է բացահայտել, թե *որ assumption-ից է կախված ամբողջ որոշումը*, որ կարողանաս *էդ մեկ բանը* validate անել իրական աշխարհում։

### 5.4 Cash, runway, break-even / Cash, runway, break-even

**EN:**
- **Runway = cash on hand ÷ net monthly burn.** Net burn = cash out − cash in (the *real* burn, after revenue). Recompute monthly off actuals, not the plan. **Gross burn** = total cash out (ignores revenue); track both — gross burn tells you the spend you control, net burn tells you the clock.
- **The 13-week cash flow forecast** — the standard short-horizon survival tool. Week-by-week inflows and outflows for the next quarter; this is where you catch the payroll-vs-receivable timing gap *before* it's fatal. In any cash-tight situation, this becomes the most important spreadsheet in the company.
- **Default-alive vs default-dead (Graham)** — at current growth + spend, do you reach profitability *before* the cash runs out? If default-dead, you have two levers: grow faster or cut burn — and a clock. Know which state you're in at all times; it changes every decision.
- **Break-even** — fixed costs ÷ contribution margin per unit = units to break even. Two flavors: *accounting* break-even (P&L net zero) and *cash* break-even (cash-flow net zero — the one that keeps you alive). Know both numbers cold.
- **Operating leverage** — high fixed / low variable cost structures amplify both directions: brutal below break-even, explosive above it. Know where on that curve you are.

**HY:**
- **Runway = ձեռքի cash ÷ net monthly burn.** Net burn = cash out − cash in (*իրական* burn-ը, revenue-ից հետո)։ Վերա-հաշվարկիր ամսական actual-ներից, ոչ plan-ից։ **Gross burn** = ընդհանուր cash out (անտեսում է revenue-ն). հետևիր երկուսին — gross burn-ը ասում է քո վերահսկած spend-ը, net burn-ը՝ ժամացույցը։
- **13-շաբաթյա cash flow forecast** — ստանդարտ կարճ-հորիզոն survival գործիքը։ Շաբաթ առ շաբաթ inflow-ներ ու outflow-ներ հաջորդ եռամսյակի համար. էստեղ ես բռնում payroll-ընդդեմ-receivable timing բացը *նախքան* մահացու լինելը։ Ցանկացած cash-սեղմ իրավիճակում սա դառնում է ընկերության ամենակարևոր spreadsheet-ը։
- **Default-alive ընդդեմ default-dead (Graham)** — ընթացիկ growth + spend-ով, հասնու՞մ ես շահութաբերության *նախքան* cash-ը վերջանալը։ Եթե default-dead ես, ունես երկու lever՝ ավելի արագ աճել կամ burn-ը կտրել — ու ժամացույց։ Իմացիր ո՛ր state-ում ես ամեն պահ. այն փոխում է ամեն որոշում։
- **Break-even** — fixed cost-եր ÷ contribution margin per unit = unit-ներ break even-ի։ Երկու տեսակ՝ *accounting* break-even (P&L զրո) ու *cash* break-even (cash-flow զրո — էն, որ կենդանի է պահում)։ Իմացիր երկու թիվն էլ անգիր։
- **Operating leverage** — բարձր fixed / ցածր փոփոխական cost կառուցվածքները ուժեղացնում են երկու ուղղությունն էլ՝ դաժան break-even-ից ցածր, պայթյունավտանգ՝ վերև։ Իմացիր այդ curve-ի որ կետին ես։

### 5.5 The cost of capital (the number behind every allocation decision) / Կապիտալի cost-ը

**EN:**
- Money has a price. **WACC** (weighted average cost of debt and equity) is the hurdle rate; a project that returns below your cost of capital *destroys* value even if it's "profitable."
- **Time value of money** — a dollar today > a dollar tomorrow. **NPV** (discount future cash flows to today; invest if NPV > 0) and **IRR** (the discount rate where NPV = 0; compare to hurdle) are the canonical tools for any multi-period investment (a feature, a hire, a market expansion).
- **Payback period** is the cash-risk lens (how long until I get my money back); **NPV** is the value lens. Use both: payback for survival, NPV for value. *(For startups, cash-risk usually dominates — a high-NPV project with a long payback can still kill you.)*

**HY:**
- Փողն ունի գին։ **WACC**-ը (debt-ի ու equity-ի weighted average cost) hurdle rate-ն է. project, որ վերադարձնում է cost of capital-ից ցածր, *ոչնչացնում* է արժեքը, նույնիսկ եթե «շահութաբեր» է։
- **Time value of money** — այսօրվա dollar-ը > վաղվա dollar-ից։ **NPV**-ն (discount արա ապագա cash flow-ները դեպի այսօր. ներդրու եթե NPV > 0) ու **IRR**-ը (discount rate-ը, որտեղ NPV = 0. համեմատիր hurdle-ի հետ) canonical գործիքներն են ցանկացած multi-period ներդրման համար (feature, hire, շուկայի ընդլայնում)։
- **Payback period**-ը cash-risk ոսպնյակն է (որքա՞ն մինչ փողս հետ ստանալը). **NPV**-ն՝ value ոսպնյակը։ Օգտագործիր երկուսն էլ՝ payback survival-ի, NPV՝ value-ի։ *(Startup-ների համար cash-risk-ը սովորաբար գերիշխում է — բարձր-NPV project երկար payback-ով դեռ կարող է սպանել։)*

---

## 6. PRICING MATH (ties to Skill 06 — Sales, Revenue & Growth)

> **EN:** *Original bullets kept verbatim, then deepened.* The *strategy* of pricing (positioning, packaging, willingness-to-pay research, the sales motion) lives in Skill 06; here is the *arithmetic* underneath it.
> **HY:** *Սկզբնական կետերը պահված բառ առ բառ, հետո խորացված։* Pricing-ի *ստրատեգիան* (positioning, packaging, willingness-to-pay հետազոտություն, sales motion-ը) ապրում է Skill 06-ում. այստեղ դրա տակ ընկած *թվաբանությունն* է։

**EN:**
- **Margin math** — markup vs margin are different; price = cost ÷ (1 − target margin).
- **Price-volume-profit** — small price increases usually beat equivalent volume increases on profit (no extra variable cost).
- **Discount cost** — a discount comes straight off gross profit; a 10% discount on a 40%-margin product erases 25% of the profit on that sale.

**HY:**
- **Margin math** — markup-ն ու margin-ը տարբեր են. price = cost ÷ (1 − target margin)։
- **Price-volume-profit** — փոքր price բարձրացումները սովորաբար հաղթում են համարժեք volume բարձրացումներին շահույթի վրա (լրացուցիչ փոփոխական cost չկա)։
- **Discount cost** — discount-ը գալիս է ուղիղ gross profit-ից. 10% discount 40%-margin ապրանքի վրա ջնջում է էդ վաճառքի շահույթի 25%-ը։

### 6.1 The arithmetic people get wrong / Թվաբանությունը, որ մարդիկ սխալ են անում

**EN:**
- **Markup ≠ margin.** Markup is over *cost*; margin is over *price*. A 50% markup on a $10 cost → $15 price → 33% *margin*, not 50%. To hit a target margin: **price = cost ÷ (1 − margin)**. A 40% target margin on $10 cost = $10 ÷ 0.60 = $16.67, not $14.
- **The discount → margin destruction table** (memorize the intuition): a discount comes *straight off gross profit*. On a 40%-margin product, a 10% discount erases **25%** of that sale's profit; a 20% discount erases **50%**; a 30% discount *eliminates* it. The lower your margin, the more lethal a discount — at 20% margin, a 10% discount erases *half* the profit. **Always compute the gross-profit hit before granting a discount, and trade the discount for something (longer term, prepay, case study, reference).**

**HY:**
- **Markup ≠ margin։** Markup-ը *cost*-ի վրա է. margin-ը՝ *price*-ի։ 50% markup $10 cost-ի վրա → $15 price → 33% *margin*, ոչ 50%։ Target margin-ին հասնելու՝ **price = cost ÷ (1 − margin)**։ 40% target margin $10 cost-ի վրա = $10 ÷ 0.60 = $16.67, ոչ $14։
- **Discount → margin ոչնչացման աղյուսակը** (անգիր արա ինտուիցիան)՝ discount-ը գալիս է *ուղիղ gross profit-ից*։ 40%-margin ապրանքի վրա 10% discount-ը ջնջում է էդ վաճառքի շահույթի **25%**-ը. 20% discount-ը՝ **50%**-ը. 30% discount-ը *վերացնում* է այն։ Ինչքան ցածր margin-ը, այնքան մահացու discount-ը — 20% margin-ի դեպքում 10% discount-ը ջնջում է շահույթի *կեսը*։ **Միշտ հաշվիր gross-profit հարվածը նախքան discount տալը, ու փոխանակիր discount-ը ինչ-որ բանի հետ (ավելի երկար term, prepay, case study, reference)։**

### 6.2 Price-volume-profit (PVP) — why pricing is the highest-leverage lever / Ինչու pricing-ը ամենաբարձր-leverage lever-ն է

**EN:**
- A price increase flows almost entirely to the bottom line (no extra variable cost), so it's the highest-leverage profit lever there is — McKinsey's classic finding: a 1% price improvement yields far more operating-profit lift than a 1% volume or cost improvement, for most businesses.
- The discipline: model **how much volume you can lose and still come out ahead** on a price increase. **Break-even volume change** for a price increase = −Δprice / (contribution margin % + Δprice). High-margin businesses can afford to lose a lot of volume on a price rise and still win; low-margin businesses can't.
- **Price elasticity** — if a 10% price rise loses < the break-even volume, raise it. Most B2B SaaS is far less price-elastic than founders fear; underpricing is the more common sin. (Elasticity strategy & willingness-to-pay research → Skill 06.)

**HY:**
- Price-ի բարձրացումը գրեթե ամբողջությամբ հոսում է ներքև (լրացուցիչ փոփոխական cost չկա), այնպես որ դա ամենաբարձր-leverage շահույթի lever-ն է — McKinsey-ի դասական գտածոն՝ 1% price բարելավումը տալիս է շատ ավելի operating-profit աճ, քան 1% volume կամ cost բարելավումը, business-ների մեծ մասի համար։
- Discipline-ը՝ modeling արա, թե **որքան volume կարող ես կորցնել ու դեռ առաջ դուրս գալ** price-ի բարձրացման վրա։ **Break-even volume change** price-ի բարձրացման համար = −Δprice / (contribution margin % + Δprice)։ Բարձր-margin business-ները կարող են շատ volume կորցնել price-ի բարձրացման վրա ու դեռ հաղթել. ցածր-margin-ները՝ ոչ։
- **Price elasticity** — եթե 10% price բարձրացումը կորցնում է < break-even volume-ից, բարձրացրու։ B2B SaaS-ի մեծ մասը շատ ավելի քիչ price-elastic է, քան founder-ները վախենում են. underpricing-ը ավելի տարածված մեղքն է։ (Elasticity ստրատեգիա ու willingness-to-pay հետազոտություն → Skill 06։)

### 6.3 Pricing economics methods (the canon) / Pricing economics-ի մեթոդները

**EN:**
- **Cost-plus** — easy, common, usually wrong (ignores value). A floor, never the answer.
- **Value-based** — price to the value/ROI delivered to the customer (the real method); capture a fraction of the value you create.
- **Van Westendorp Price Sensitivity Meter** — the four questions (too cheap / cheap / expensive / too expensive) to find an acceptable price *range*.
- **Good-better-best / tiering & the anchor effect** — a premium tier raises the reference price and pulls buyers to the middle; the decoy/anchor is real economics, not a trick.
- **Usage vs seat vs flat** — align the pricing metric to the *value metric* (what scales with the customer's value received) so revenue grows as the customer succeeds → this is the engine of NRR > 100%.

**HY:**
- **Cost-plus** — հեշտ, տարածված, սովորաբար սխալ (անտեսում է value-ն)։ Հատակ է, երբեք պատասխանը։
- **Value-based** — pricing արա customer-ին հասցված value/ROI-ին (իրական մեթոդը). գրավիր ստեղծած value-ի մի մասը։
- **Van Westendorp Price Sensitivity Meter** — չորս հարցը (too cheap / cheap / expensive / too expensive)՝ ընդունելի price *range* գտնելու։
- **Good-better-best / tiering ու anchor effect** — premium tier-ը բարձրացնում է reference price-ը ու ձգում գնորդներին դեպի մեջտեղ. decoy/anchor-ը իրական economics է, ոչ հնարք։
- **Usage ընդդեմ seat ընդդեմ flat** — համապատասխանեցրու pricing metric-ը *value metric*-ին (այն, ինչ scale է անում customer-ի ստացած value-ի հետ), որ revenue-ն աճի, երբ customer-ը հաջողում է → սա է NRR > 100%-ի շարժիչը։

---

## 7. VALUATION LITERACY (price vs value, what a business is worth)

> **EN:** New in v3. The investor lens (§0): what a business is worth and what return its capital earns. You do not need to *be* a banker, but you must read a valuation, sanity-check a multiple, and never confuse price with value (Graham/Buffett). Binding valuation for a transaction → a qualified advisor; the logic and the sniff-test are yours.
> **HY:** Նոր v3-ում։ Investor ոսպնյակը (§0)՝ ինչ արժե business-ը ու ինչ return է աշխատում իր կապիտալը։ Պետք չէ banker *լինես*, բայց պետք է կարդաս valuation, sanity-check անես multiple, ու երբեք price-ը value-ի հետ չշփոթես (Graham/Buffett)։ Transaction-ի binding valuation → qualified advisor. տրամաբանությունն ու հոտառությունը քոնն են։

### 7.1 The two ways to value anything / Ինչ-որ բան գնահատելու երկու ձև

**EN:**
- **Intrinsic — DCF (discounted cash flow).** A business is worth the present value of the cash it will generate over its life. Project FCF, discount at the cost of capital (WACC), add a terminal value (perpetuity growth or exit multiple), sum. **Value = Σ FCFₜ / (1+r)ᵗ + terminal value / (1+r)ⁿ.** Brutally sensitive to the discount rate and terminal assumptions — a DCF is a *machine for laundering assumptions into a number*, so its honesty is its inputs. Use it to understand *what has to be true* for a price to make sense, not to manufacture false precision.
- **Relative — comparable multiples.** Price the business off what similar businesses trade/sell for: **EV/Revenue** (for high-growth, not-yet-profitable; SaaS lives here, multiple set by growth × NRR × margin), **EV/EBITDA** (for profitable, cash-generating businesses), **P/E** (equity earnings), **EV/FCF**. Fast and market-anchored, but inherits the market's mood and only as good as the comp set. **EV (enterprise value) = equity value + net debt** — the price to buy the whole operation; don't compare an EV multiple to an equity number.
- **Triangulate.** DCF for the intrinsic logic, comps for the market reality; if they're far apart, understand *why* before trusting either.

**HY:**
- **Intrinsic — DCF (discounted cash flow)։** Business-ը արժե այն cash-ի present value-ն, որ կառաջացնի իր կյանքի ընթացքում։ Project արա FCF-ը, discount արա cost of capital-ով (WACC), ավելացրու terminal value (perpetuity growth կամ exit multiple), գումարիր։ **Value = Σ FCFₜ / (1+r)ᵗ + terminal value / (1+r)ⁿ։** Դաժանորեն զգայուն discount rate-ի ու terminal assumption-ների նկատմամբ — DCF-ը *assumption-ները թվի վերածող մեքենա* է, այնպես որ իր ազնվությունը իր input-ներն են։ Օգտագործիր այն հասկանալու, թե *ինչ պետք է ճիշտ լինի*, որ գինը իմաստ ունենա, ոչ թե false precision արտադրելու։
- **Relative — comparable multiples։** Գնահատիր business-ը նմանատիպ business-ների trade/վաճառքի գնով՝ **EV/Revenue** (բարձր-growth, դեռ-ոչ-շահութաբերի համար. SaaS-ն այստեղ է, multiple-ը սահմանված growth × NRR × margin-ով), **EV/EBITDA** (շահութաբեր, cash-արտադրող business-ների), **P/E** (equity earnings), **EV/FCF**։ Արագ ու շուկա-խարսխված, բայց ժառանգում է շուկայի տրամադրությունը ու այնքան լավն է, որքան comp set-ը։ **EV (enterprise value) = equity value + net debt** — ամբողջ operation-ը գնելու գինը. մի՛ համեմատիր EV multiple-ը equity թվի հետ։
- **Triangulate արա։** DCF՝ intrinsic տրամաբանության, comps՝ շուկայի իրականության. եթե իրարից հեռու են, հասկացիր *ինչու*, նախքան որևէ մեկին վստահելը։

### 7.2 Price vs value, ROIC vs WACC / Price ընդդեմ value, ROIC ընդդեմ WACC

**EN:**
- **Price ≠ value (Graham).** Price is the number on the term sheet / the ticker; value is the discounted cash the asset produces. The whole game is buying (or building) value above the price you pay. A 50× revenue multiple is not "good" or "bad" in the abstract — it's a bet on a growth-and-retention trajectory that either materializes or doesn't.
- **ROIC vs WACC — the value test.** Return on invested capital must exceed the weighted cost of that capital, or the business *destroys* value as it grows. **ROIC > WACC = each dollar invested creates value; ROIC < WACC = growth makes you poorer** (you're compounding negative spread). This is the single most important lens in capital allocation (§9) and the reason "grow at all costs" is sometimes value-destroying.
- **The Outsiders test (Thorndike):** the best capital allocators measured every option — reinvestment, M&A, debt paydown, dividends, and especially **buybacks at a price below intrinsic value** — against per-share value created, not empire size. Rationality over ego.

**HY:**
- **Price ≠ value (Graham)։** Price-ը term sheet-ի / ticker-ի թիվն է. value-ն asset-ի արտադրած discounted cash-ն է։ Ամբողջ խաղն այն է՝ գնել (կամ կառուցել) value՝ վճարած գնից բարձր։ 50× revenue multiple-ը abstract-ում ոչ «լավ» է, ոչ «վատ» — growth-and-retention հետագծի վրա խաղադրույք է, որ կա՛մ իրականանում է, կա՛մ ոչ։
- **ROIC ընդդեմ WACC — value թեստը։** Return on invested capital-ը պետք է գերազանցի այդ կապիտալի weighted cost-ը, թե չէ business-ը *ոչնչացնում* է արժեքը աճելիս։ **ROIC > WACC = ամեն ներդրված dollar value է ստեղծում. ROIC < WACC = աճն ավելի աղքատ է դարձնում** (բացասական spread ես compound անում)։ Սա կապիտալի բաշխման ամենակարևոր ոսպնյակն է (§9) ու պատճառը, թե ինչու «grow at all costs»-ը երբեմն value-ոչնչացնող է։
- **Outsiders թեստը (Thorndike)՝** լավագույն capital allocator-ները չափում էին ամեն տարբերակ — reinvestment, M&A, debt paydown, dividend ու հատկապես **buyback intrinsic value-ից ցածր գնով** — ստեղծված per-share value-ի դեմ, ոչ empire-ի չափի։ Rationality՝ ego-ից վեր։

---

## 8. FUNDRAISING & OWNERSHIP (dilution, cap tables, term sheets)

> **EN:** New in v3. Cross-link Skill 05 (when/whether to raise — the strategy) and Skill 08 (the negotiation). Here is the math and the structure. Binding term-sheet/legal terms → a startup lawyer; the economics and the traps are yours to see.
> **HY:** Նոր v3-ում։ Cross-link Skill 05 (երբ/արդյոք raise անել — ստրատեգիան) ու Skill 08 (բանակցությունը)։ Այստեղ մաթն ու կառուցվածքն են։ Binding term-sheet/իրավական պայմաններ → startup lawyer. economics-ն ու թակարդները քո տեսնելիքն են։

### 8.1 The arithmetic of a round / Ռաունդի թվաբանությունը

**EN:**
- **Pre-money + investment = post-money.** Investor's ownership = investment ÷ post-money. Raise $2M at $8M pre → $10M post → investor owns 20%, founders diluted to 80%. **Every term is downstream of the pre-money valuation and the amount.**
- **Dilution is cumulative and compounds across rounds.** A founder owning 100% who raises a 20% seed, a 20% A, and a 15% B owns 0.80 × 0.80 × 0.85 ≈ **54%**, before option-pool dilution. Model the full path, not one round.
- **The option pool is funded by the founders (the "pool shuffle").** Investors typically require the pool be created/topped-up *pre-money*, so it dilutes existing shareholders, not the new investor. A 10% post-round pool carved pre-money is real founder dilution disguised as a line item — negotiate its size and timing.
- **Fully-diluted share count** is the real denominator: common + preferred + options (granted and pooled) + warrants + as-converted SAFEs/notes. Ownership % means nothing without it.

**HY:**
- **Pre-money + investment = post-money։** Investor-ի ownership = investment ÷ post-money։ Raise արա $2M $8M pre-ով → $10M post → investor-ը ունի 20%, founder-ները dilute արված 80%-ի։ **Ամեն term pre-money valuation-ից ու գումարից ներքև է։**
- **Dilution-ը կուտակային է ու compound է անում ռաունդների միջով։** 100% ունեցող founder, որ raise է անում 20% seed, 20% A ու 15% B, ունի 0.80 × 0.80 × 0.85 ≈ **54%**, option-pool dilution-ից առաջ։ Modeling արա ամբողջ ուղին, ոչ մեկ ռաունդ։
- **Option pool-ը ֆինանսավորվում է founder-ների կողմից («pool shuffle»)։** Investor-ները սովորաբար պահանջում են pool-ը ստեղծվի/լրացվի *pre-money*, որ այն dilute անի գոյություն ունեցող բաժնետերերին, ոչ նոր investor-ին։ 10% post-round pool-ը pre-money փորագրված՝ իրական founder dilution է՝ line item-ի քողարկված. բանակցիր դրա չափն ու timing-ը։
- **Fully-diluted share count**-ը իրական հայտարարն է՝ common + preferred + options (տրված ու pool-ված) + warrant-ներ + as-converted SAFE/note-եր։ Ownership %-ը ոչինչ չի նշանակում առանց դրա։

### 8.2 SAFEs, convertibles, and the cap table / SAFE-եր, convertible-ներ ու cap table-ը

**EN:**
- **SAFE / convertible note** — defer the valuation; raise now, price later (at the next round) with a **valuation cap** (the max price the SAFE converts at) and/or a **discount** (e.g., 20% off the next round's price). Founder-friendly and fast, but **the dilution is invisible until conversion** — stacked uncapped/low-cap SAFEs can dilute far more than founders expect when they all convert at the priced round. **Always model the as-converted cap table including every SAFE** before signing the next round.
- **Convertible note** = a SAFE with interest and a maturity date (it's debt until it converts). The cap/discount mechanics are the same; the maturity adds a forced-event risk.
- **The cap table** is the ledger of who owns what, fully diluted, across every instrument. Keep it clean and current from day one — a messy cap table kills or delays rounds and acquisitions. Tools (Carta and equivalents) exist precisely because hand-rolled cap tables drift.

**HY:**
- **SAFE / convertible note** — հետաձգիր valuation-ը. raise արա հիմա, գին դիր հետո (հաջորդ ռաունդին)՝ **valuation cap**-ով (max գինը, որով SAFE-ը convert է անում) և/կամ **discount**-ով (օր.՝ 20% զեղչ հաջորդ ռաունդի գնից)։ Founder-բարյացակամ ու արագ, բայց **dilution-ը անտեսանելի է մինչ conversion-ը** — կուտակված uncapped/ցածր-cap SAFE-երը կարող են շատ ավելի dilute անել, քան founder-ները սպասում են, երբ բոլորը convert են անում priced ռաունդին։ **Միշտ modeling արա as-converted cap table-ը՝ ներառյալ ամեն SAFE** նախքան հաջորդ ռաունդը ստորագրելը։
- **Convertible note** = SAFE interest-ով ու maturity ամսաթվով (debt է մինչ convert անելը)։ Cap/discount մեխանիկան նույնն է. maturity-ն ավելացնում է forced-event ռիսկ։
- **Cap table**-ը ledger է, թե ով ինչ ունի, fully diluted, ամեն instrument-ի միջով։ Պահիր մաքուր ու ընթացիկ առաջին օրվանից — խառնված cap table-ը սպանում կամ հետաձգում է ռաունդներն ու acquisition-ները։ Գործիքները (Carta ու համարժեքները) գոյություն ունեն հենց որովհետև ձեռքով արված cap table-երը շեղվում են։

### 8.3 Term-sheet literacy (the terms that matter beyond valuation) / Term-sheet գրագիտություն

**EN:** Valuation gets the attention; the *control* and *preference* terms quietly decide outcomes:
- **Liquidation preference** — who gets paid first and how much on an exit. **1× non-participating** (investor takes the greater of their money back or their ownership %) is standard and founder-fair; **participating** ("double-dip": money back *and* a share of the rest) and **>1× multiples** are predatory — they can mean founders get little even on a decent exit.
- **Anti-dilution** — protects investors if a later round prices lower (a "down round"). **Broad-based weighted-average** is normal; **full ratchet** (reprices all their shares to the new low price) is brutal to founders.
- **Pro-rata rights** — the right to invest in future rounds to maintain ownership. **Board composition & protective provisions** — who controls decisions; a board you've lost control of can override you. **Vesting** (founders too — typically 4 years, 1-year cliff) and **option pool** size round it out.
- **Rule:** a higher valuation with bad preference/control terms can be worth *less* than a lower valuation with clean terms. Read the whole term sheet; the headline number is the least of it.

**HY:** Valuation-ն է ուշադրություն գրավում. *control* ու *preference* term-երը հանգիստ որոշում են արդյունքները՝
- **Liquidation preference** — ով է առաջինը վճարվում ու որքան exit-ի դեպքում։ **1× non-participating** (investor-ը վերցնում է իր փողը հետ կամ իր ownership %-ը՝ որն ավելի մեծ է) ստանդարտ ու founder-արդար է. **participating** («double-dip»՝ փողը հետ *ու* մնացածի մաս) ու **>1× multiple**-ները գիշատիչ են — կարող են նշանակել, որ founder-ները քիչ բան են ստանում նույնիսկ պարկեշտ exit-ի դեպքում։
- **Anti-dilution** — պաշտպանում է investor-ներին, եթե ավելի ուշ ռաունդը ավելի ցածր է գին դնում («down round»)։ **Broad-based weighted-average**-ը նորմալ է. **full ratchet**-ը (վերա-գնում է իրենց բոլոր share-երը նոր ցածր գնին) դաժան է founder-ների համար։
- **Pro-rata rights** — ապագա ռաունդներում ներդրման իրավունք՝ ownership-ը պահելու։ **Board composition ու protective provisions** — ով է վերահսկում որոշումները. board, որի վերահսկողությունը կորցրել ես, կարող է քեզ override անել։ **Vesting** (founder-ներն էլ՝ սովորաբար 4 տարի, 1-տարյա cliff) ու **option pool**-ի չափը լրացնում են այն։
- **Կանոն:** ավելի բարձր valuation վատ preference/control term-երով կարող է *պակաս* արժենալ, քան ավելի ցածր valuation մաքուր term-երով։ Կարդա ամբողջ term sheet-ը. headline թիվը ամենափոքրն է դրա մեջ։

---

## 9. CAPITAL ALLOCATION & BUDGETING / FP&A (the CFO's real job + the controls)

> **EN:** New section in v3 — the allocation lens (*The Outsiders*) plus the budgeting/FP&A and controls machinery that runs a company day to day.
> **HY:** Նոր բաժին v3-ում — allocation ոսպնյակը (*The Outsiders*) գումարած budgeting/FP&A-ն ու controls մեքենան, որ վարում է ընկերությունը օրեցօր։

### 9.1 The capital-allocation lens (The Outsiders) / Capital-allocation ոսպնյակը

**EN:** Every dollar of free cash flow has five possible homes, and the CEO's real job is ranking them by **per-share value created** (Thorndike's *The Outsiders*; Buffett):
1. **Reinvest in the business** — only if ROIC > WACC and the growth is real; the default for a young company with a working unit.
2. **M&A / acquisitions** — only at a price below the value acquired, integrated without destroying it; most acquisitions destroy value because the acquirer overpays.
3. **Pay down debt** — de-risk; raises equity value by shrinking the senior claim.
4. **Dividends** — return cash when reinvestment opportunities below the hurdle; a signal of discipline, not weakness.
5. **Buy back stock** — *only* when the price is below intrinsic value (you're buying a dollar for less than a dollar); value-destroying when done at a high price to prop up EPS.
The discipline: rank against an honest hurdle rate every period, ignore empire-building and peer pressure, and be willing to do nothing (hold cash) when no option clears the bar. **Most CEOs are operators promoted past their one true job; the great ones are allocators.**

**HY:** Free cash flow-ի ամեն dollar ունի հինգ հնարավոր տուն, ու CEO-ի իրական գործը դրանք դասավորելն է ըստ **ստեղծված per-share value-ի** (Thorndike-ի *The Outsiders*. Buffett)՝
1. **Reinvest արա business-ում** — միայն եթե ROIC > WACC ու աճն իրական է. default-ը երիտասարդ ընկերության աշխատող unit-ով։
2. **M&A / acquisition-ներ** — միայն ձեռք բերված value-ից ցածր գնով, integrate արված՝ առանց այն ոչնչացնելու. acquisition-ների մեծ մասը ոչնչացնում է value, որովհետև acquirer-ը գերավճարում է։
3. **Մարիր debt-ը** — de-risk. բարձրացնում է equity value-ն senior claim-ը փոքրացնելով։
4. **Dividend-ներ** — վերադարձրու cash-ը, երբ reinvestment-ի հնարավորությունները hurdle-ից ցածր են. discipline-ի ազդանշան, ոչ թուլության։
5. **Buy back արա stock-ը** — *միայն* երբ գինը intrinsic value-ից ցածր է (dollar ես գնում dollar-ից պակասով). value-ոչնչացնող, երբ արվում է բարձր գնով՝ EPS-ը պահելու համար։
Discipline-ը՝ դասավորիր ազնիվ hurdle rate-ի դեմ ամեն period, անտեսիր empire-building-ն ու peer pressure-ը, ու պատրաստ եղիր ոչինչ չանելու (cash պահել), երբ ոչ մի տարբերակ չի անցնում շեմը։ **CEO-ների մեծ մասը operator-ներ են՝ իրենց միակ իրական գործից վեր promote արված. մեծերը allocator-ներ են։**

### 9.2 Budgeting, FP&A, and finance as a partner / Budgeting, FP&A ու finance-ը որպես partner

**EN:**
- **The budget is a hypothesis, not a contract.** It's the plan you'll measure reality against — its value is the *variance* it surfaces, not the prediction. Rolling forecasts (re-forecast quarterly off actuals) beat a static annual budget that's wrong by February.
- **Variance analysis** — actual vs budget, *decomposed* into price/volume/mix/rate/timing, so a miss becomes a diagnosis and an action, not a number. "Revenue −8%, decomposed: volume +5%, mix −13% (the cheap SKU spiked)" tells you what to *do*.
- **Zero-based vs incremental budgeting** — incremental ("last year + X%") is fast but ossifies waste; zero-based (justify every line from zero) is heavier but exposes bloat. Use ZBB periodically on cost categories that drift.
- **Finance as a partner, not a police force.** The modern FP&A function's job is to make the rest of the business make better decisions — model the trade-offs, price the options, surface the risk, and arm the operators with the unit economics. Finance that only says "no" and closes the books has abdicated half its job. The best CFO is a co-pilot to the CEO, not the brakes.

**HY:**
- **Budget-ը հիպոթեզ է, ոչ contract։** Դա plan-ն է, որի դեմ չափելու ես իրականությունը — իր արժեքը *variance*-ն է, որ բացահայտում է, ոչ կանխատեսումը։ Rolling forecast-ները (եռամսյակը մեկ re-forecast actual-ներից) հաղթում են static տարեկան budget-ին, որ սխալ է փետրվարին։
- **Variance analysis** — actual ընդդեմ budget, *decompose* արված price/volume/mix/rate/timing-ի, որ miss-ը դառնա ախտորոշում ու գործողություն, ոչ թիվ։ «Revenue −8%, decompose արված՝ volume +5%, mix −13% (էժան SKU-ն թռավ)» ասում է, թե ինչ *անել*։
- **Zero-based ընդդեմ incremental budgeting** — incremental-ը («անցած տարի + X%») արագ է, բայց ոսկրացնում է վատնումը. zero-based-ը (արդարացրու ամեն տող զրոյից) ավելի ծանր է, բայց բացահայտում է bloat-ը։ Օգտագործիր ZBB պարբերաբար cost կատեգորիաների վրա, որ շեղվում են։
- **Finance-ը որպես partner, ոչ ոստիկանություն։** Ժամանակակից FP&A ֆունկցիայի գործը business-ի մնացածին ավելի լավ որոշումներ կայացնել տալն է — modeling արա trade-off-ները, գին դիր option-ներին, բացահայտիր ռիսկը ու զինիր operator-ներին unit economics-ով։ Finance, որ միայն «ոչ» է ասում ու book-երը փակում, հրաժարվել է իր գործի կեսից։ Լավագույն CFO-ն CEO-ի co-pilot է, ոչ արգելակները։

### 9.3 Financial controls (the guardrails) / Ֆինանսական controls-ը

**EN:** The minimum machinery that keeps the numbers trustworthy and the company honest (cross-link Skill 12 for the security/SoD side):
- **Segregation of duties (SoD)** — the person who *approves* a payment ≠ the one who *executes* it (four-eyes on money out). The classic fraud and error vector; mirror of Skill 02 §6.5 / Skill 12.
- **Approval thresholds & spend authority** — who can commit how much, documented; above a threshold needs a second signature.
- **The monthly close & reconciliation** — close the books on a cadence, reconcile every key balance to an independent source (bank, contracts, payroll). A company that can't close in N days doesn't know its own numbers.
- **Audit trail & one source of truth** — every number traceable to a transaction; one definition per metric (§1.11). Controls aren't bureaucracy — they're how you catch the error or the fraud *before* it's an investor-facing misstatement.

**HY:** Նվազագույն մեքենան, որ թվերը վստահելի ու ընկերությունը ազնիվ է պահում (cross-link Skill 12՝ security/SoD կողմի համար)՝
- **Segregation of duties (SoD)** — մարդը, որ *approve* է անում վճարումը ≠ էն, որ *execute* է անում (four-eyes փողի դուրս գալու վրա)։ Դասական fraud-ի ու սխալի վեկտորը. հայելի Skill 02 §6.5 / Skill 12-ի։
- **Approval threshold-ներ ու spend authority** — ով կարող է որքան commit անել, փաստաթղթավորված. շեմից վեր պետք է երկրորդ ստորագրություն։
- **Ամսական close-ը ու reconciliation-ը** — փակիր book-երը cadence-ով, reconcile արա ամեն key balance անկախ source-ի (bank, contract-ներ, payroll)։ Ընկերություն, որ չի կարող փակել N օրում, չգիտի իր սեփական թվերը։
- **Audit trail ու մեկ source of truth** — ամեն թիվ հետագծելի transaction-ի. մեկ սահմանում ամեն metric-ի (§1.11)։ Controls-ը bureaucracy չէ — դա է, ոնց ես բռնում սխալը կամ fraud-ը *նախքան* այն investor-ին ուղղված misstatement դառնալը։

---

## 10. DECISION RULES (fast, reusable)

> **EN:** *The original five rules are kept verbatim and lead the list.*
> **HY:** *Սկզբնական հինգ կանոնները պահված են բառ առ բառ ու առաջնորդում են ցանկը։*

**EN:**
- **Scale this?** Only with positive contribution margin and LTV:CAC > ~3 and acceptable CAC payback.
- **Cut cost or grow revenue?** If cash-constrained → protect runway (cut burn). If unit economics work → invest in growth.
- **Discount?** Quantify the gross-profit hit first; usually trade for term/prepay instead.
- **Hire / spend?** Against runway and the marginal return; does this dollar generate more than a dollar?
- **Raise price?** Almost always test upward first — it usually drops to the bottom line directly.

**HY:**
- **Scale անե՞լ։** Միայն դրական contribution margin-ով ու LTV:CAC > ~3-ով ու ընդունելի CAC payback-ով։
- **Cost կտրե՞լ թե revenue աճեցնել։** Եթե cash-սահմանափակ → պաշտպանիր runway-ը (burn-ը կտրիր)։ Եթե unit economics-ն աշխատում է → ներդրու growth-ում։
- **Discount տա՞լ։** Հաշվիր gross-profit հարվածը առաջինը. սովորաբար փոխանակիր term/prepay-ի։
- **Hire / spend անե՞լ։** Runway-ի ու marginal return-ի դեմ. այս dollar-ը dollar-ից ավելի՞ է առաջացնում։
- **Price բարձրացնե՞լ։** Գրեթե միշտ թեստ արա վերև առաջինը — սովորաբար ուղիղ ներքև է իջնում։

**EN — Added rules:**

**HY — Ավելացված կանոններ՝**

**EN:**
- **Profit or cash question?** Decide *which* you're solving first. "Is this a good business?" → P&L/margin/unit economics. "Will we survive the next 6 months?" → cash model/runway/13-week. Don't answer one with the other.
- **Default-alive or default-dead?** Run it first in any planning session. Dead → you have a clock; pick grow-faster or cut-burn now, not later.
- **Blended or paid CAC for this decision?** Channel/spend decisions → paid CAC. Overall efficiency narrative → blended. Never optimize spend on blended.
- **LTV — capped or 1/churn?** Early-stage or thin cohort history → capped/observed-window LTV. Mature, stable cohorts → 1/churn is acceptable. Never fundraise on infinite-life LTV.
- **Is the number booked or estimated?** Booked/filed/reported-as-fact → route through the accountant. Internal estimate/decision → CFO+FP&A altitude, move fast.
- **Investment over multiple periods?** Use NPV (value) *and* payback (cash risk); for startups, let cash risk veto.
- **Annual or monthly billing?** Push annual-upfront wherever churn-risk and cash allow — it improves cash (negative CCC), cuts churn, and funds growth. Trade a discount for the prepay, and price the discount against the cash value of the year of float.
- **Build the model how deep?** Only to the resolution the decision needs. A reversible $5k call gets a back-of-envelope; an irreversible bet-the-company call gets the full driver model + scenarios + sensitivity.
- **Bookings, billings, or revenue?** Naming the number? Pipeline/commitment → bookings; cash/invoice → billings; earned/P&L → revenue. Never quote one as another.
- **Does this dollar of growth create or destroy value?** Check ROIC vs WACC. Growth at ROIC < WACC makes you poorer — cut it, don't fund it.
- **How much to raise, at what price?** The minimum that buys the next inflection, at a valuation that reflects it, with clean preference/control terms — not the biggest number. Model the as-converted, fully-diluted cap table including every SAFE first.
- **DCF or comps for this valuation?** Profitable/cash-generating → EV/EBITDA comps + DCF. High-growth/pre-profit → EV/Revenue comps anchored on growth×NRR×margin. Triangulate; if they diverge, find out why before trusting either.

**HY:**
- **Profit թե cash հարց։** Որոշիր *որն* ես լուծում առաջինը։ «Սա լա՞վ business է» → P&L/margin/unit economics։ «Հաջորդ 6 ամիսը գոյատևե՞նք» → cash model/runway/13-week։ Մեկը մյուսով մի՛ պատասխանիր։
- **Default-alive թե default-dead։** Վարիր այն առաջինը ցանկացած planning session-ում։ Dead → ունես ժամացույց. ընտրիր grow-faster կամ cut-burn հիմա, ոչ հետո։
- **Blended թե paid CAC այս որոշման համար։** Channel/spend որոշումներ → paid CAC։ Ընդհանուր efficiency narrative → blended։ Երբեք spend-ը blended-ով մի՛ optimize արա։
- **LTV — capped թե 1/churn։** Early-stage կամ բարակ cohort history → capped/observed-window LTV։ Հասուն, կայուն cohort-ներ → 1/churn-ը ընդունելի է։ Երբեք մի՛ fundraise արա անվերջ-կյանք LTV-ով։
- **Թիվը booked է թե estimated։** Booked/filed/reported-as-fact → անցկացրու accountant-ի միջով։ Ներքին estimate/որոշում → CFO+FP&A altitude, շարժվիր արագ։
- **Ներդրում մի քանի period-ի վրա։** Օգտագործիր NPV (value) *ու* payback (cash risk). startup-ների համար թող cash risk-ը veto անի։
- **Annual թե monthly billing։** Հրիր annual-upfront, որտեղ churn-risk-ն ու cash-ը թույլ են տալիս — բարելավում է cash-ը (negative CCC), կտրում churn-ը ու ֆինանսավորում growth-ը։ Փոխանակիր discount prepay-ի հետ ու գին դիր discount-ին float-ի տարվա cash արժեքի դեմ։
- **Model-ը որքա՞ն խորը կառուցել։** Միայն մինչ էն resolution-ը, որ որոշումն է պահանջում։ Շրջելի $5k call → envelope-ի հաշվարկ. անշրջելի bet-the-company call → ամբողջ driver model + scenario-ներ + sensitivity։
- **Bookings, billings, թե revenue։** Թիվն անվանու՞մ ես։ Pipeline/commitment → bookings. cash/invoice → billings. earned/P&L → revenue։ Երբեք մեկը մյուսի փոխարեն մի՛ նշիր։
- **Աճի այս dollar-ը value ստեղծու՞մ է թե ոչնչացնում։** Ստուգիր ROIC ընդդեմ WACC։ Աճը ROIC < WACC-ով ավելի աղքատ է դարձնում — կտրիր, մի՛ ֆինանսավորիր։
- **Որքա՞ն raise անել, ի՞նչ գնով։** Նվազագույնը, որ գնում է հաջորդ inflection-ը, valuation-ով, որ արտացոլում է այն, մաքուր preference/control term-երով — ոչ թե ամենամեծ թիվը։ Modeling արա as-converted, fully-diluted cap table-ը՝ ներառյալ ամեն SAFE առաջինը։
- **DCF թե comps այս valuation-ի համար։** Շահութաբեր/cash-արտադրող → EV/EBITDA comps + DCF։ Բարձր-growth/pre-profit → EV/Revenue comps խարսխված growth×NRR×margin-ի վրա։ Triangulate արա. եթե շեղվում են, պարզիր ինչու, նախքան որևէ մեկին վստահելը։

---

## 11. ANTI-PATTERNS (smell → fix)

> **EN:** *All six original anti-patterns kept verbatim and lead the list.*
> **HY:** *Բոլոր վեց սկզբնական anti-pattern-ները պահված բառ առ բառ ու առաջնորդում են ցանկը։*

**EN:**
- **Growth on negative unit economics** — scaling a per-unit loss. *Fix:* fix contribution margin before volume.
- **Vanity revenue, ignored cash** — booking revenue while running out of cash. *Fix:* manage the cash-flow model + runway.
- **Metric with no denominator** — "we grew a lot." *Fix:* define base, rate, and period.
- **Cost-plus pricing** — ignoring value and margin. *Fix:* value-based + margin math.
- **False-precision models** — 5-year monthly forecast to the dollar. *Fix:* scenarios + sensitivity, not point estimates.
- **Reflexive discounting** — eroding margin invisibly. *Fix:* compute the gross-profit cost each time.

**HY:**
- **Growth բացասական unit economics-ի վրա** — per-unit կորուստ scale անելը։ *Fix:* ուղղիր contribution margin-ը նախքան volume-ը։
- **Vanity revenue, անտեսված cash** — revenue book անելը, մինչ cash-ը վերջանում է։ *Fix:* կառավարիր cash-flow model-ը + runway-ը։
- **Metric առանց հայտարարի** — «շատ աճեցինք»։ *Fix:* սահմանիր base, rate ու period։
- **Cost-plus pricing** — value-ն ու margin-ը անտեսելը։ *Fix:* value-based + margin math։
- **False-precision model-ներ** — 5-տարյա ամսական forecast մինչ dollar-ը։ *Fix:* scenario-ներ + sensitivity, ոչ point estimate-ներ։
- **Ռեֆլեքսային discounting** — margin-ը անտեսանելի մաշելը։ *Fix:* հաշվիր gross-profit cost-ը ամեն անգամ։

**EN — Added anti-patterns:**

**HY — Ավելացված anti-pattern-ներ՝**

**EN:**
- **EBITDA theater** — selling EBITDA as if it were cash, ignoring capex/working-capital/interest. *Fix:* manage FCF; treat EBITDA as a proxy you reconcile to cash.
- **Blended-CAC self-flattery** — hiding paid-channel inefficiency behind organic acquisition. *Fix:* track paid CAC separately; decide channel spend on it.
- **1/churn LTV fantasy** — infinite-life LTV from a cohort you've watched for three months. *Fix:* capped/observed-window LTV; validate the retention curve flattens before believing the lifetime.
- **Single-number reporting** — one MRR/revenue figure with no bridge or cohort behind it. *Fix:* MRR bridge + cohort curves; show *where* it came from.
- **Top-down market-share modeling** — "1% of a huge TAM." *Fix:* bottom-up driver model, triangulated against TAM as a ceiling.
- **Hockey-stick with no driver** — revenue that bends up because the chart needs it to. *Fix:* tie every inflection to a specific, named driver and its assumption.
- **Optimizing LTV:CAC too high** — starving growth to make the ratio look elite. *Fix:* a too-high ratio means *spend more*; re-invest into acquisition until payback/quality limits bite.
- **Cash-blind P&L management** — celebrating profit while the 13-week shows a payroll cliff. *Fix:* run the cash model alongside; solvency is timing, not annual totals.
- **Margin drift unseen** — gross margin slipping a point a quarter, invisible in absolute dollars. *Fix:* common-size the P&L; watch GM% trend, not GM dollars.
- **Sunk-cost doubling-down** — funding a failing line because of money already spent. *Fix:* forward EV vs next-best use only; sunk is sunk.
- **Unreconciled model** — beautiful spreadsheet that ties to nothing. *Fix:* reconcile cash to bank, revenue to contracts, headcount cost to org chart.
- **Booking a decision-estimate as fact** — treating an internal forecast as reportable truth. *Fix:* route anything filed/reported through the accountant; keep estimate and booked number separate.
- **Bookings-as-revenue inflation** — quoting signed-contract value as if it were earned revenue. *Fix:* keep bookings/billings/revenue distinct; report the recognized number.
- **Growth that worsens unit economics** — buying revenue at ROIC < WACC / a CAC the cohort never repays. *Fix:* gate growth on the unit working first; ROIC > WACC is the bar; cut value-destroying growth.
- **Invisible-SAFE dilution** — raising on stacked uncapped/low-cap SAFEs, surprised at the priced round. *Fix:* model the as-converted, fully-diluted cap table including every SAFE *before* signing.
- **Valuation-only term-sheet reading** — taking the highest pre-money with predatory preference/control terms. *Fix:* read liquidation preference, anti-dilution, board, and pool; a clean lower number can beat a dirty higher one.
- **DCF false precision** — a 5-year DCF to the dollar that just launders the terminal-growth and discount-rate assumptions. *Fix:* use DCF to find what must be true; triangulate with comps; flex the 2 inputs that dominate.
- **Empire-building allocation** — M&A and headcount growth measured by size, not per-share value created. *Fix:* rank every use of FCF against an honest hurdle (*The Outsiders*); be willing to hold cash or buy back below value.
- **Finance-as-police** — a finance function that only says no and closes books, not a decision partner. *Fix:* FP&A models the trade-offs and arms operators; the CFO is a co-pilot, not the brakes.

**HY:**
- **EBITDA theater** — EBITDA-ն վաճառելը, կարծես cash լիներ՝ capex/working-capital/interest անտեսելով։ *Fix:* կառավարիր FCF. վերաբերվիր EBITDA-ին որպես proxy, որ reconcile ես անում cash-ին։
- **Blended-CAC ինքնա-շողոքորթություն** — paid-channel inefficiency-ն organic acquisition-ի հետևում թաքցնելը։ *Fix:* հետևիր paid CAC-ին առանձին. որոշիր channel spend-ը դրանով։
- **1/churn LTV ֆանտազիա** — անվերջ-կյանք LTV cohort-ից, որ երեք ամիս ես դիտել։ *Fix:* capped/observed-window LTV. validate արա, որ retention curve-ը հարթվում է, նախքան lifetime-ին հավատալը։
- **Single-number reporting** — մեկ MRR/revenue թիվ՝ առանց bridge-ի կամ cohort-ի հետևում։ *Fix:* MRR bridge + cohort curve-եր. ցույց տուր, թե *որտեղից* եկավ։
- **Top-down market-share modeling** — «հսկա TAM-ի 1%»։ *Fix:* bottom-up driver model, triangulate արված TAM-ի դեմ՝ որպես առաստաղ։
- **Hockey-stick առանց driver-ի** — revenue, որ վերև է թեքվում, որովհետև chart-ին պետք է։ *Fix:* կապիր ամեն inflection կոնկրետ, անվանված driver-ի ու դրա assumption-ի հետ։
- **LTV:CAC-ը շատ բարձր optimize անելը** — growth-ը սովամահ անելը, որ ratio-ն elite երևա։ *Fix:* շատ-բարձր ratio-ն նշանակում է *ավելի ծախսիր*. re-invest արա acquisition-ում, մինչ payback/quality սահմանները կծեն։
- **Cash-կույր P&L management** — շահույթ տոնելը, մինչ 13-week-ը payroll cliff է ցույց տալիս։ *Fix:* վարիր cash model-ը կողքից. վճարունակությունը timing է, ոչ տարեկան գումարներ։
- **Margin drift չտեսնված** — gross margin-ը եռամսյակը մեկ կետ սահելը, անտեսանելի absolute dollar-ներում։ *Fix:* common-size արա P&L-ը. հետևիր GM% trend-ին, ոչ GM dollar-ներին։
- **Sunk-cost կրկնապատկում** — ձախողվող line ֆինանսավորելը արդեն ծախսված փողի պատճառով։ *Fix:* forward EV ընդդեմ next-best use միայն. sunk-ը sunk է։
- **Չ-reconcile արված model** — գեղեցիկ spreadsheet, որ ոչնչի չի կապվում։ *Fix:* reconcile արա cash-ը bank-ին, revenue-ն contract-ներին, headcount cost-ը org chart-ին։
- **Որոշման-estimate-ը որպես փաստ book անելը** — ներքին forecast-ը որպես հաղորդելի ճշմարտություն վերաբերվելը։ *Fix:* անցկացրու ամեն filed/reported-ը accountant-ի միջով. պահիր estimate-ն ու booked թիվը առանձին։
- **Bookings-as-revenue inflation** — ստորագրված-contract արժեքը որպես earned revenue նշելը։ *Fix:* պահիր bookings/billings/revenue առանձին. հաղորդիր recognize արված թիվը։
- **Growth, որ վատացնում է unit economics-ը** — revenue գնելը ROIC < WACC-ով / CAC-ով, որ cohort-ը երբեք չի վերադարձնում։ *Fix:* gate արա growth-ը unit-ը առաջինը աշխատելու վրա. ROIC > WACC-ն շեմն է. կտրիր value-ոչնչացնող growth-ը։
- **Անտեսանելի-SAFE dilution** — raise անելը կուտակված uncapped/ցածր-cap SAFE-երով, զարմացած priced ռաունդին։ *Fix:* modeling արա as-converted, fully-diluted cap table-ը՝ ներառյալ ամեն SAFE *նախքան* ստորագրելը։
- **Valuation-only term-sheet ընթերցում** — ամենաբարձր pre-money-ն վերցնելը գիշատիչ preference/control term-երով։ *Fix:* կարդա liquidation preference, anti-dilution, board ու pool. մաքուր ցածր թիվը կարող է հաղթել կեղտոտ բարձրին։
- **DCF false precision** — 5-տարյա DCF մինչ dollar-ը, որ պարզապես լվանում է terminal-growth-ի ու discount-rate-ի assumption-ները։ *Fix:* օգտագործիր DCF-ը գտնելու, թե ինչ պետք է ճիշտ լինի. triangulate արա comps-ով. flex արա 2 input-ները, որ գերիշխում են։
- **Empire-building allocation** — M&A-ն ու headcount աճը չափված չափով, ոչ ստեղծված per-share value-ով։ *Fix:* դասավորիր FCF-ի ամեն օգտագործում ազնիվ hurdle-ի դեմ (*The Outsiders*). պատրաստ եղիր cash պահել կամ value-ից ցածր buyback անել։
- **Finance-as-police** — finance ֆունկցիա, որ միայն «ոչ» է ասում ու book-եր փակում, ոչ decision partner։ *Fix:* FP&A-ն modeling է անում trade-off-ները ու զինում operator-ներին. CFO-ն co-pilot է, ոչ արգելակները։

---

## 12. CANON QUICK-REFERENCE (formulas, laws, and sources to have cold)

### 12.1 The formulas / Բանաձևերը

**EN:**
- **Gross margin** = (Rev − COGS) / Rev · **Contribution margin** = (Rev − variable costs) / Rev · **Operating margin** = EBIT / Rev.
- **Price for target margin** = cost ÷ (1 − margin). **Discount profit hit** = discount% ÷ margin% (as a fraction of profit lost). **Break-even volume change** for a price rise = −Δprice / (CM% + Δprice).
- **CAC** = fully-loaded S&M ÷ new customers. **LTV** = ARPA × GM% × lifetime; **lifetime ≈ 1 / churn**. **LTV:CAC** target ~3:1. **CAC payback (months)** = CAC ÷ (ARPA × GM%).
- **NRR** = (start + expansion − contraction − churn) / start. **GRR** = (start − contraction − churn) / start. **Quick ratio** = (new+expansion) / (churn+contraction).
- **Rule of 40** = growth% + FCF margin% ≥ 40. **Magic number** = net-new ARR ÷ prior S&M. **Burn multiple** = net burn ÷ net-new ARR (lower = better).
- **CCC** = DSO + DIO − DPO (negative = customers fund you). **Runway** = cash ÷ net monthly burn. **FCF** = CFO − capex. **Owner earnings** = NI + D&A − maintenance capex − ΔWC.
- **Break-even units** = fixed costs ÷ contribution margin per unit. **NPV** = Σ cashflowₜ / (1+r)ᵗ; invest if NPV > 0. **IRR** = r where NPV = 0. **DCF value** = Σ FCFₜ/(1+r)ᵗ + TV/(1+r)ⁿ.
- **EV** = equity value + net debt. **ROIC > WACC** = value created. **Post-money** = pre-money + investment; **investor %** = investment ÷ post-money.
- **Annualized churn from monthly** = 1 − (1 − monthly)¹² (5% monthly ≈ 46% annual). **Default-alive** = reach profit before cash = 0.

**HY:** *(Բանաձևերը universal են — Latin/մաթ նոտացիան մասնագիտական ստանդարտ է. վերևի անգլերեն ցանկը canonical reference-ն է. ստորև՝ key հասկացությունների native ընթերցումը)*
- **Gross/contribution/operating margin**-ը՝ համապատասխան բանաձևերով վերևում։ **Price for target margin** = cost ÷ (1 − margin) — markup-ի թակարդից խուսափելու բանաձևը։
- **CAC, LTV, LTV:CAC, CAC payback** — unit-economics-ի չորս հիմնասյունը. lifetime ≈ 1/churn՝ զգուշությամբ (§3.2)։
- **NRR/GRR/Quick ratio** — retention-ի որակը. **Rule of 40 / magic number / burn multiple** — efficiency-ն. **CCC/runway/FCF/owner earnings** — cash-ի ճշմարտությունը։
- **NPV/IRR/DCF/EV/ROIC vs WACC** — valuation-ի ու allocation-ի։ **Post-money/investor %** — ownership-ի։ **Annualized churn**՝ ամսականից՝ compound-ի դաժանությունը։

### 12.2 The named canon (attributed) / Անվանված canon-ը

**EN:**
- **Graham — default-alive / default-dead** (Paul Graham, *Y Combinator essays*): do you reach profitability before cash runs out? Also "price vs value" (Benjamin Graham, *The Intelligent Investor* — the value-investing root).
- **Damodaran on valuation** (Aswath Damodaran, *Investment Valuation*, *The Dark Side of Valuation*): DCF discipline, cost of capital, the honesty of inputs — the standard reference for valuing anything.
- ***The Outsiders*** (William Thorndike): capital allocation as the CEO's one true job; per-share value over empire; buybacks below intrinsic value.
- ***Financial Intelligence*** (Berman & Knight): how to read the three statements as a non-accountant operator; the art-vs-science of accounting estimates.
- **SaaS metrics canon** — **David Skok** (*forEntrepreneurs*: the SaaS funnel, CAC payback, the "you need to fund growth" math); **Maxio / ChartMogul** (the MRR-bridge / SaaS-metrics standard); **Bessemer** (*State of the Cloud*, efficiency scores, the cloud index); the **Rule of 40**; **David Sacks** (the burn multiple).
- **Higgins — sustainable growth rate** (Robert Higgins, *Analysis for Financial Management*): the growth a business can fund from its own retained earnings without new capital.
- **Corporate-finance bedrock** — Brealey, Myers & Allen (*Principles of Corporate Finance*): NPV/IRR, WACC, capital budgeting, the time value of money.
- **Pricing** — **van Westendorp** (Price Sensitivity Meter); **McKinsey** (the 1%-price-improvement finding); value-based pricing canon.

**HY:**
- **Graham — default-alive / default-dead** (Paul Graham, *Y Combinator essays*)՝ հասնու՞մ ես շահութաբերության, նախքան cash-ը վերջանալը։ Նաև «price ընդդեմ value» (Benjamin Graham, *The Intelligent Investor* — value-investing-ի արմատը)։
- **Damodaran valuation-ի մասին** (Aswath Damodaran, *Investment Valuation*)՝ DCF discipline, cost of capital, input-ների ազնվությունը — ինչ-որ բան գնահատելու ստանդարտ reference-ը։
- ***The Outsiders*** (William Thorndike)՝ capital allocation-ը որպես CEO-ի միակ իրական գործ. per-share value՝ empire-ից վեր. buyback intrinsic value-ից ցածր։
- ***Financial Intelligence*** (Berman & Knight)՝ ոնց կարդալ երեք հաշվետվությունը որպես ոչ-հաշվապահ operator. accounting estimate-ների արվեստ-ընդդեմ-գիտություն-ը։
- **SaaS metrics canon** — **David Skok** (*forEntrepreneurs*՝ SaaS funnel-ը, CAC payback-ը, «աճը պետք է ֆինանսավորես» մաթը). **Maxio / ChartMogul** (MRR-bridge / SaaS-metrics ստանդարտը). **Bessemer** (*State of the Cloud*, efficiency score-եր). **Rule of 40**-ը. **David Sacks** (burn multiple-ը)։
- **Higgins — sustainable growth rate** (Robert Higgins)՝ աճը, որ business-ը կարող է ֆինանսավորել իր սեփական retained earnings-ից առանց նոր կապիտալի։
- **Corporate-finance հիմքը** — Brealey, Myers & Allen (*Principles of Corporate Finance*)՝ NPV/IRR, WACC, capital budgeting, time value of money։
- **Pricing** — **van Westendorp** (Price Sensitivity Meter). **McKinsey** (1%-price-improvement գտածոն). value-based pricing canon-ը։

---

## 13. ԲԱՌԱՐԱՆ / Glossary (bilingual)

> **EN:** *Original glossary terms preserved; extended with the full operating vocabulary.* Technical terms keep their professional English/Latin form (real Armenian finance usage); the gloss is native.
> **HY:** *Սկզբնական glossary տերմինները պահված. ընդլայնված ամբողջ operating բառապաշարով։* Տեխնիկական տերմինները պահում են իրենց մասնագիտական անգլերեն/Latin ձևը (հայերեն finance-ի իրական գործածությունը). բացատրությունը native է։

**EN (term list):** P&L / income statement · balance sheet · cash flow statement (CFO/CFI/CFF) · accrual vs cash basis · COGS · gross / contribution / operating margin · EBIT / EBITDA · net income · FCF (free cash flow) · owner earnings · revenue recognition · deferred revenue · bookings vs billings vs revenue · working capital · CCC (cash conversion cycle) · DSO / DIO / DPO · retained earnings · assets = liabilities + equity · book value · common-size statement · variance (price/volume/mix/FX) · CAC (blended vs paid, lag CAC) · LTV (revenue vs gross-margin, capped vs 1/churn) · LTV:CAC · CAC payback · contribution margin (unit-level) · ARPA / ARPU · churn (logo vs revenue, monthly vs annual) · GRR · NRR/NDR · quick ratio (SaaS) · MRR / ARR · MRR bridge (new/expansion/reactivation/contraction/churn) · cohort retention curve · cohort-based unit economics · Rule of 40 · magic number · burn multiple · gross vs net burn · runway · 13-week cash forecast · default-alive / default-dead · break-even (accounting vs cash) · operating leverage · driver-based model · 3-statement model · top-down vs bottom-up · TAM/SAM/SOM · scenario (worst/base/best) · sensitivity / tornado · Monte Carlo · WACC / cost of capital · hurdle rate · ROIC · TVM (time value of money) · NPV · IRR · payback period · DCF · terminal value · comparable multiples (EV/Revenue, EV/EBITDA, P/E, EV/FCF) · enterprise value (EV) · price vs value · markup vs margin · price-volume-profit (PVP) · break-even volume change · price elasticity · van Westendorp PSM · value-based vs cost-plus pricing · good-better-best / anchor · usage vs seat vs flat pricing · pre/post-money · dilution · cap table · fully-diluted · option pool / pool shuffle · SAFE / convertible note · valuation cap / discount · liquidation preference (participating / non-participating / multiple) · anti-dilution (weighted-average / full ratchet) · pro-rata · vesting / cliff · capital allocation · the five uses of FCF · buyback · zero-based vs incremental budgeting · rolling forecast · segregation of duties (SoD) · monthly close / reconciliation · sunk cost · opportunity cost · marginal vs average · sustainable growth rate.

**HY (հիմնական եզրեր, native):**
- **Երեք հաշվետվությունը՝** P&L (income statement, շահույթ/վնաս) · balance sheet (հաշվեկշիռ՝ snapshot) · cash flow statement (CFO/CFI/CFF՝ operating/investing/financing) — articulate են անում որպես մեկ մեքենա, Δcash-ը կապվում է։
- **Accrual ընդդեմ cash basis** — վաստակած/առաջացած ընդդեմ cash-ի շարժի. accrual-ը model-ի համար, cash-ը՝ գոյատևման։
- **COGS · gross/contribution/operating margin · EBIT/EBITDA · net income · FCF · owner earnings** — P&L-ի անատոմիան. EBITDA-ն cash *չէ*. FCF = CFO − capex-ը իրական թիվն է։
- **Revenue recognition · deferred revenue · bookings/billings/revenue** — երբ ա revenue-ն հաշվվում. deferred revenue-ն լավ liability է. bookings (ստորագրված) ≠ billings (invoice) ≠ revenue (earned)։
- **Working capital · CCC · DSO/DIO/DPO** — cash-ը, որ խրված է operation-ում. negative CCC = customer-ները քեզ ֆինանսավորում են։
- **Retained earnings · Assets = Liabilities + Equity · book value** — balance sheet-ի identity-ն, որ երբեք չի կոտրվում. book value ≠ market value։
- **CAC (blended/paid, lag) · LTV (gross-margin/capped/1-churn) · LTV:CAC · CAC payback · contribution margin** — unit economics-ի սիրտը. payback-ը cash-ի reality-check-ն է, որ LTV:CAC-ը թաքցնում է։
- **Churn (logo/revenue, ամսական/տարեկան) · GRR · NRR/NDR · quick ratio · cohort retention curve · cohort-based unit economics** — SaaS-ը այստեղ է ապրում կամ մեռնում. NRR > 100% = compounding asset. curve-ի ձևը ամենա-ազնիվ artifact-ն է։
- **MRR/ARR · MRR bridge · Rule of 40 · magic number · burn multiple · quick ratio** — recurring-revenue-ի մետրիկները. bridge-ը ցույց է տալիս, որտեղից է գալիս աճը. burn multiple-ը ամենա-մաքուր efficiency թիվն է։
- **Gross/net burn · runway · 13-week cash forecast · default-alive/dead · break-even (accounting/cash) · operating leverage** — cash-ի ու survival-ի բառապաշարը. default-alive = շահույթ՝ cash-ից առաջ։
- **Driver-based model · 3-statement model · top-down/bottom-up · TAM/SAM/SOM · scenario · sensitivity/tornado · Monte Carlo** — modeling-ի discipline-ը. model-ն այնքան լավն է, որքան իր driver-ները. 3-statement-ը պետք է reconcile անի։
- **WACC · hurdle rate · ROIC · TVM · NPV · IRR · payback · DCF · terminal value · comparable multiples (EV/Revenue, EV/EBITDA, P/E) · EV · price vs value** — valuation-ի ոսպնյակը. ROIC > WACC = value ստեղծված. price ≠ value (Graham)։
- **Markup vs margin · PVP · break-even volume change · price elasticity · van Westendorp · value-based/cost-plus · good-better-best/anchor · usage/seat/flat** — pricing-ի թվաբանությունը (ստրատեգիան՝ Skill 06)։
- **Pre/post-money · dilution · cap table · fully-diluted · option pool / pool shuffle · SAFE / convertible note · valuation cap/discount · liquidation preference (participating/multiple) · anti-dilution (weighted-average/full ratchet) · pro-rata · vesting/cliff** — fundraising-ի ու ownership-ի մաթն ու term-երը. headline valuation-ը ամենափոքրն է. modeling արա as-converted cap table-ը։
- **Capital allocation · FCF-ի հինգ օգտագործումը · buyback · zero-based/incremental budgeting · rolling forecast · segregation of duties (SoD) · monthly close / reconciliation** — CEO-ի իրական գործը (*The Outsiders*) ու controls-ի machinery-ն։
- **Sunk cost · opportunity cost · marginal vs average · sustainable growth rate** — որոշման-finance-ի մտածական models-ը. sunk-ը sunk է, opportunity cost-ը իրական։

---

*EN: Skill 07 — top-level (v3), living. Watch the cash, fix the unit, protect the margin, model to decide, know what it's worth, raise it clean, and allocate every dollar against value — and never book an estimate as fact. Profit is an opinion; cash is a fact; value is the discounted future. Bro by Gev's side, sharpening every session.*
*HY: Skill 07 — top-level (v3), living։ Հետևիր cash-ին, ուղղիր unit-ը, պաշտպանիր margin-ը, modeling արա որոշելու, իմացիր ինչ արժե, raise արա մաքուր, ու բաշխիր ամեն dollar value-ի դեմ — ու երբեք estimate-ը որպես փաստ մի՛ գրանցիր։ Շահույթը կարծիք է. cash-ը՝ փաստ. value-ն՝ discounted ապագան։ Bro-ն Գևի կողքին, սրվում ամեն session։ 💪🤍*

---

> **Version log / Տարբերակների մատյան**
> - **v1** — original five-principle floor (statements · unit economics · SaaS metrics · modeling · pricing math).
> - **v2** — deepened every section into operating depth; added the three-finance-lenses framing, fully-loaded CAC, the MRR bridge, efficiency metrics, the modeling discipline, decision rules & anti-patterns, the canonical formula sheet.
> - **v3 (2026-06-24 deepening)** — added: the four-lens framing (incl. the investor lens); the three statements as one machine **with a worked transaction trace** + accrual-vs-cash; **bookings vs billings vs revenue**; the **unit-economics-must-work-at-unit-level** principle + cohort-based unit economics; the **3-statement model** linkage; **valuation literacy** (DCF/TVM, comparable multiples, price vs value, ROIC vs WACC, *The Outsiders*); **fundraising & ownership** (dilution, cap tables, pre/post-money, SAFEs/convertibles, term-sheet literacy, option pools); **capital allocation, budgeting/FP&A & financial controls** (variance, finance-as-partner, SoD/close/reconciliation); a named, attributed **Canon quick-reference**; and a full bilingual glossary. Nothing removed — only added, deepened, and reorganized to max.
