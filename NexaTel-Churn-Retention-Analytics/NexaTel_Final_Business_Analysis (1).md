# NexaTel Communications — Final Business Analysis & Portfolio Case Study

---

## A. Executive Business Summary

NexaTel Communications is losing customers fastest in the first six months of the relationship, and the dollars lost are concentrated in a segment that is easy to overlook because no single customer in it is worth very much. Between January 2023 and December 2025, NexaTel's churn rate reached 25.41% (4K of 15K customers), driven overwhelmingly by early-tenure attrition — 82.77% of churn happens within the first 6 months, compared with just 4.95% among customers who reach 25–36 months. Billing dissatisfaction and price sensitivity are the leading named reasons customers give for leaving, closely followed by service reliability issues (speed, call quality, network downtime).

Financially, churn has cost NexaTel approximately $222.73K in realized revenue. The Consumer segment carries the largest share of that loss (~$162K) even though Enterprise customers are individually far more valuable (CLV of $1,873 vs. $1,101 for Consumer). This is not a contradiction — it means NexaTel is bleeding revenue through volume in one segment while carrying concentrated value risk in another, and the two require different retention strategies.

The encouraging finding is that NexaTel's retention program already works: campaigns have returned $8.72M in revenue saved against $198K spent, a 42.92x ROI, and a 42% success rate. But performance is uneven — proactive, relationship-based campaigns (High Value, Loyalty, Contract Renewal) succeed roughly 46–47% of the time, while reactive campaigns (Win Back, Network Recovery) succeed only 29–37% of the time. This suggests the winning formula is not "run more retention campaigns" but "reach customers earlier, before they've already decided to leave."

**Recommended focus for NexaTel:** intervene in the first 6 months of the customer relationship, fix billing transparency, migrate month-to-month customers toward contracts, and reallocate retention spend toward the campaign types that are already proven to work — while protecting Enterprise accounts through high-touch relationship management rather than mass campaigns.

---

## B. Final Key Insights

**1. Finding:** 82.77% of churn occurs within a customer's first 6 months, falling to 46.35% at 7–12 months, 19.59% at 13–24 months, and just 4.95% at 25–36 months.

**Meaning:** Churn is not evenly distributed across the customer base — it is almost entirely a new-customer problem. Once a customer survives roughly two years, they are highly likely to stay.

**Business implication:** NexaTel doesn't need a churn strategy for the whole customer base; it needs an onboarding and early-relationship strategy. Resources spent trying to win back long-tenured customers are working against a much smaller problem than resources spent stabilizing the first 6 months.

---

**2. Finding:** Churn rate by contract type is 46.8% for Month-to-Month, 30.04% for One-Year, and 23.16% for Two-Year contracts.

**Meaning:** Contract commitment length is directly correlated with retention — the less a customer is locked in, the more likely they are to leave.

**Business implication:** Every customer NexaTel can move from month-to-month to a term contract is a structural, durable reduction in churn risk — not just a temporary retention win. This makes contract migration one of the few levers that compounds over time rather than requiring repeated intervention.

---

**3. Finding:** The two most-cited churn reasons are billing-related — "Unexpected billing charges" (340 customers) and "Monthly charges too high" (333 customers) — followed closely by competitive pressure: "Found cheaper competitor" (329), "Competitor offered better plan" (258), and "Switched to competitor promo" (233).

**Meaning:** Price and billing trust are the single largest controllable churn driver, and NexaTel is also visibly losing customers to competitors on price and offers.

**Business implication:** Billing transparency is not a "nice to have" — it's the top named reason customers leave. Combined with the competitive-pressure reasons, this indicates NexaTel's churn problem is as much about perceived value and trust as it is about product quality, and it's an area NexaTel can directly control without new infrastructure investment.

---

**4. Finding:** Service reliability issues — "Slow internet speed" (318), "Poor call quality" (298), "Frequent network downtime" (282), "Long resolution time for complaints" (280), and "Unresolved technical issue" (262) — sit nearly as high as the billing reasons.

**Meaning:** Service quality is a near-equal second driver of churn alongside billing and pricing, not a minor contributor.

**Business implication:** A retention strategy focused only on billing and pricing would still leave a comparably large group of customers at risk. Technical service reliability and support resolution speed need to be treated as a parallel priority, not an afterthought.

---

**5. Finding:** Consumer customers have the highest churn rate (26.70%) and the largest aggregate revenue loss (~$162K, the majority of the $222.73K total), while Enterprise has a lower churn rate (24.74%) and far smaller aggregate loss (~$0.03M) but the highest individual customer value (CLV $1,873 vs. $1,101 Consumer) and highest average bill ($96.84 vs. $58.42).

**Meaning:** Value-per-customer and aggregate revenue exposure are two different problems. Enterprise customers matter most individually; Consumer customers matter most in total.

**Business implication:** A one-size-fits-all retention strategy would misallocate resources. Consumer churn needs a scalable, lower-cost-per-customer intervention because of its volume and total revenue leakage, while Enterprise needs high-touch, relationship-level protection because losing even one account represents disproportionate value loss.

*Note on CLV basis:* CLV is calculated as `Avg Monthly Bill × Avg Tenure Months`, where both underlying measures are unfiltered averages across the entire customer base (active and churned combined) — confirmed by reviewing the DAX, which contains no churn-status filter. This means CLV represents the estimated lifetime value of a typical NexaTel customer, not the value specifically lost when someone churns, and should be described that way in any presentation of this figure.

---

**6. Finding:** Retention campaigns overall return $8.72M in revenue saved against $198K in cost (42.92x ROI, 42% success rate), but success rates vary sharply by campaign type: High Value Customer (47%), Loyalty (46%), and Contract Renewal (46%) outperform At Risk (37%), Network Recovery (37%), and Win Back (29%).

**Meaning:** NexaTel's retention program is financially justified in aggregate, but its effectiveness depends heavily on *when* it reaches the customer. Campaigns built around an existing positive relationship (loyalty, renewal, high value) consistently outperform campaigns built around recovering someone who is already at risk or already gone.

**Business implication:** The highest-leverage move is not necessarily spending more on retention overall — it's shifting the mix toward proactive, relationship-based campaign types and treating Win Back as a lower-yield, last-resort channel rather than a primary strategy.

---

**7. Finding:** Churn rate by internet plan/service type ranges narrowly from 23.97% (Basic 10GB) to 29.80% (None), with no internet service ("None") showing the highest churn.

**Meaning:** Unlike tenure and contract type, internet plan alone does not strongly differentiate churn risk — the spread across plan types is much narrower than the spread across tenure groups.

**Business implication:** Plan tier is a weaker predictive lever than tenure or contract structure. Retention resources are better spent addressing *when* and *why* customers leave (onboarding, billing, service reliability) than reshaping specific plan offerings.

---

**8. Finding:** NexaTel's monthly churn count and churn rate have both trended upward across the 2023–2025 analysis window, alongside an overall churn rate of 25.41%.

**Meaning:** Churn is not a one-time or stabilizing event — the trend line suggests the problem has been building, not resolving on its own.

**Business implication:** This reinforces urgency: without intervention, the early-tenure and billing-driven churn patterns identified above are likely to continue compounding rather than self-correcting.

---

## C. Prioritised Retention Recommendations

### Priority: Critical

**Recommendation:** Build a structured 0–6 month onboarding and early-engagement program (welcome check-ins, proactive usage/billing confirmation, early support outreach) for all new customers.
**Evidence:** 82.77% of all churn occurs within the first 6 months of tenure — by far the single largest churn concentration in the data.
**Target:** All new customers, all segments, first 6 months of tenure.
**Business rationale:** This is where the overwhelming majority of churn volume lives. No other single intervention addresses as much of the churn problem at once.
**Expected impact:** Reducing early-tenure churn even modestly would produce the largest proportional improvement to the overall 25.41% churn rate, since it targets the largest at-risk population.

---

**Recommendation:** Implement proactive billing transparency measures — advance notice of charges, plain-language bill summaries, and a pre-emptive outreach trigger when a customer's bill changes materially.
**Evidence:** "Unexpected billing charges" (340) and "Monthly charges too high" (333) are the top two churn reasons.
**Target:** All segments, with priority on Consumer given its larger aggregate revenue exposure ($162K).
**Business rationale:** This is the single most controllable churn driver in the dataset — it does not require network investment or product changes, only process and communication changes.
**Expected impact:** Directly addresses the top two named churn reasons and protects revenue disproportionately in the segment carrying the largest aggregate loss.

---

### Priority: High

**Recommendation:** Launch a contract-migration incentive (e.g., discount or perk for converting to a One-Year or Two-Year term) targeted at Month-to-Month customers, especially those still in their early tenure window.
**Evidence:** Churn rate is 46.8% for Month-to-Month vs. 23.16% for Two-Year contracts.
**Target:** Month-to-Month customers, prioritizing those within the first 6–12 months.
**Business rationale:** Contract length is a structural churn reducer — unlike a single retention campaign, it lowers a customer's churn risk for the duration of the term.
**Expected impact:** A durable, compounding reduction in churn exposure among NexaTel's highest-risk contract segment.

---

**Recommendation:** Reallocate retention budget and campaign volume toward High Value, Loyalty, and Contract Renewal campaign types, scaling these ahead of Win Back and Network Recovery.
**Evidence:** Success rates of 47% (High Value), 46% (Loyalty), and 46% (Contract Renewal) vs. 37% (At Risk), 37% (Network Recovery), and 29% (Win Back).
**Target:** Customers eligible for loyalty, contract renewal, or high-value account campaigns — i.e., customers reached *before* they are already at risk.
**Business rationale:** The data shows proactive, relationship-based campaigns consistently outperform reactive recovery campaigns; scaling what already works is lower-risk than expanding underperforming channels.
**Expected impact:** Improves overall campaign ROI and success rate by shifting mix toward higher-converting campaign types.

---

### Priority: Medium

**Recommendation:** Address service reliability churn reasons (slow speed, call quality, network downtime, long complaint resolution time) through a targeted technical service review for customers citing these issues.
**Evidence:** Combined, these reasons account for a volume of churned customers nearly on par with the billing-related reasons (five reasons each in the 260–320 customer range).
**Target:** Customers with recorded support interactions citing service/technical issues.
**Business rationale:** Service quality is a near-equal secondary driver; addressing billing alone would leave a comparably sized group of at-risk customers unaddressed.
**Expected impact:** Reduces the second-largest cluster of controllable churn reasons.

---

**Recommendation:** Establish a dedicated high-touch account management approach for Enterprise customers (e.g., named account contact, proactive quarterly check-ins), separate from mass-market retention campaigns.
**Evidence:** Enterprise has the highest CLV ($1,873) and highest average monthly bill ($96.84), even though its aggregate churn loss is currently smaller (~$0.03M).
**Target:** Enterprise segment.
**Business rationale:** Enterprise's current aggregate loss is low, but each individual account represents outsized value — the cost of losing high-touch coverage is asymmetric to the cost of providing it.
**Expected impact:** Protects the segment with the greatest per-customer revenue and CLV exposure, ahead of it becoming a larger aggregate problem.

---

**Recommendation:** Review and redesign the Win Back and Network Recovery campaign approach (messaging, timing, offer structure) rather than simply increasing their volume.
**Evidence:** These campaign types have the lowest success rates (29% and 37% respectively).
**Target:** Customers currently reached through Win Back or Network Recovery campaigns.
**Business rationale:** Scaling an underperforming approach compounds inefficiency; the data suggests a design problem, not a volume problem, in these two campaign types.
**Expected impact:** Improves the marginal ROI of budget already being spent on these two channels.

---

## Prioritisation Rationale

**Priority 1 — Early-tenure retention + billing transparency.** These two actions target the largest churn volume (82.77% concentrated in 0–6 months) and the top named churn reason (billing) simultaneously. No other action addresses this much of the problem at once, and both are process/communication changes rather than infrastructure investments — making them the fastest to implement.

**Priority 2 — Contract migration + scaling proven campaign types.** These build structural, compounding churn reduction (contract terms) and improve the efficiency of a program that is already working (campaign mix reallocation). They are natural second steps once the highest-volume problem (Priority 1) is being addressed.

**Priority 3 — Service reliability, Enterprise high-touch coverage, and Win Back/Network Recovery redesign.** These are important but secondary: service reliability is a close second driver rather than the top one, Enterprise is a value-protection play rather than an urgent volume problem, and redesigning underperforming campaigns is an optimization on top of an already-positive-ROI program.

---

## D. Business Question Audit

| Business Question | Dashboard Evidence | Status | Explanation |
|---|---|---|---|
| **Q1: Why are customers leaving NexaTel?** | Churn rate by contract type, internet service, internet plan, tenure group, customer segment; full churn-reason breakdown (16 named reasons with customer counts) | ✅ Fully answered | The dashboard provides both structural drivers (contract type, tenure, segment) and stated reasons (billing, service, competition), giving a complete diagnostic picture. |
| **Q2: What is churn costing NexaTel?** | Revenue Lost to Churn ($222.73K), CLV ($1.17K overall, by segment), ARPU ($61.46), MRR ($18.0M), Revenue Lost to Churn by segment | ✅ Fully answered (dashboard + documentation) | The dashboard quantifies realized historical revenue loss and customer value directly. Revenue *at risk* going forward is addressed narratively here rather than as a dashboard KPI: since churn is heavily concentrated in the 0–6 month tenure band (82.77% churn rate), that band represents NexaTel's largest pool of forward-looking revenue exposure. This framing answers the objective without requiring a new visual — the tenure-based churn rate already on the dashboard functions as the risk indicator. |
| **Q3: Are retention campaigns delivering a positive ROI?** | Retention ROI (42.92x), Revenue Saved ($8.72M), Total Retention Cost ($198K), Campaign Success Rate by type, Total Campaigns and Campaigns Retained by type | ✅ Fully answered | Cost, outcome, and return are all directly quantified and broken down by campaign type, giving a clear and specific ROI answer. |
| **Q4: What should NexaTel do to reduce churn?** | Page 4 "Recommended Actions" box (4 directional bullet points) | ✅ Fully answered (dashboard + documentation) | The dashboard provides the headline directional guidance. This documentation supplies the supporting evidence, targeting, rationale, and prioritization (Section C) that turns those four bullet points into a complete, defensible business case. |

---

## E. Gaps / Required Fixes

Only genuine gaps are listed below. None require redesigning the dashboard.

1. **Campaign targeting by tenure/segment is not confirmed in the available data.** The dashboard shows campaign type, response, and outcomes, but does not show which specific customers (e.g., 0–6 month tenure customers) were targeted by which campaigns. **This cannot be confirmed from the information currently provided**, so no claim is made linking campaign targeting to the highest-risk tenure group.

2. **Aggregate service-quality KPIs (e.g., complaint rate, satisfaction score) are not present as summary metrics.** The churn-reason breakdown already captures the relevant service issues in detail (slow speed, call quality, downtime, resolution time), so this is not required to answer the core business questions — it would only be a future enhancement if NexaTel wanted a dedicated service-quality diagnostic view.

---

## F. Portfolio Case Study Narrative

### 1. Project Overview
NexaTel Communications is a simulated telecom company serving approximately 15,000 customers across Consumer, SME, and Enterprise segments. This project analyzes customer churn and retention performance from January 2023 to December 2025, using MySQL for data cleaning and Power BI for modeling, DAX measures, and dashboard delivery.

### 2. Business Problem
NexaTel's leadership needed to understand why customers were leaving, what churn was costing the business in revenue terms, and whether the company's retention campaigns were generating a positive return on investment — with the ultimate goal of identifying clear, evidence-based actions to reduce churn.

### 3. Analytical Approach
The analysis was structured around four linked questions, each answered by a dedicated dashboard page: what is happening (Executive Overview), why customers are leaving (Customer & Churn Drivers), what churn is costing the business (Revenue & Customer Value), and what NexaTel should do about it (Retention & Recommendations). Four operational datasets — Customer_Master, Monthly_Customer_Activity, Customer_Support_Interactions, and Retention_Campaigns — were integrated to support this analysis.

### 4. Data & Cleaning
All four source tables were cleaned in MySQL Workbench, resolving mixed date formats, casing inconsistencies, currency symbol formatting, duplicate records, and structural nulls before the data was modeled in Power BI with a dedicated date dimension and centralized measures table.

### 5. Analysis
The analysis revealed that churn is heavily concentrated by tenure and contract structure, and that stated churn reasons cluster into two comparably-sized groups: billing/pricing dissatisfaction and service reliability issues. Revenue impact analysis showed that customer value (CLV) and aggregate revenue loss diverge sharply by segment — Enterprise customers are individually the most valuable, while Consumer customers represent the largest total revenue exposure. Campaign performance analysis showed a strongly positive overall ROI, but with wide variation in effectiveness depending on whether a campaign was proactive or reactive.

### 6. Key Findings
- 82.77% of churn occurs within a customer's first 6 months of tenure.
- Month-to-Month contract customers churn at nearly double the rate of Two-Year contract customers (46.8% vs. 23.16%).
- Billing transparency and pricing are the top named churn reasons, closely followed by service reliability issues.
- Consumer customers represent the largest aggregate revenue exposure from churn (~$162K), while Enterprise customers carry the highest individual customer value (CLV of $1,873).
- Retention campaigns return $8.72M against $198K in cost (42.92x ROI), but proactive campaign types (Loyalty, High Value, Contract Renewal) meaningfully outperform reactive types (Win Back, Network Recovery).

### 7. Recommendations
This indicates NexaTel should prioritize a 0–6 month onboarding and engagement program alongside proactive billing transparency measures, as these two actions address both the largest volume of churn and its top named cause. From a business perspective, this should be followed by contract-migration incentives and a reallocation of retention spend toward the campaign types already proven to perform best, with service-reliability fixes and Enterprise-specific account management addressing the secondary drivers.

### 8. Business Impact
Executed together, these actions target the two largest levers in the data: the tenure window where the overwhelming majority of churn occurs, and the two churn-reason clusters (billing and service) that together account for the largest share of named departures. This creates a financial exposure reduction opportunity concentrated in the Consumer segment while protecting Enterprise's disproportionate per-customer value — without requiring a change to the existing retention program's structure, only a more disciplined focus on where and when it is applied.

### 9. Dashboard Overview
The four-page Power BI dashboard (Executive Overview, Customer & Churn Drivers, Revenue & Customer Value, Retention & Recommendations) uses a dark, telecom-branded design system with DAX-driven KPIs, segment- and tenure-based breakdowns, and campaign performance tracking, giving management a complete evidence base for the recommendations above.

### 10. Conclusion
This project demonstrates the ability to move beyond dashboard construction into full business analysis — translating churn data into a diagnosis of *why* customers leave, a quantified picture of *what it costs*, an evaluation of whether current interventions work, and a prioritized set of actions grounded directly in the evidence. I recommend NexaTel treat early-tenure retention and billing transparency as immediate priorities, with contract migration, campaign-mix optimization, service reliability, and Enterprise account protection following as the next wave of action.
