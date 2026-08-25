# VertaMart Business Analysis
**Prepared by Victoria Benjamin, Data Analyst**
**Period covered: January 2023 – December 2025**

---

## Executive Summary

VertaMart is profitable, but profit isn't distributed evenly across the business — and the data shows where operational weaknesses may be affecting performance. Warehouses that ship on time aren't always the ones with the healthiest margins. The product lines generating the most profit also carry above-average return rates. And one distribution centre — Ibadan — is underperforming on two fronts at once: stockouts and late deliveries.

**Strongest areas:** Supplier reliability is solid (83.4% on-time delivery) and stockouts are rare across the network (0.9% overall). Inventory isn't the business's biggest problem right now.

**Biggest risks:** Delivery performance is weak everywhere, not just in one region — no warehouse clears 78% on-time delivery. Fulfilment sits at 81.5%, meaning 18.5% of orders were not successfully fulfilled. And the categories driving the most profit (TVs & Audio, Laptops) are also among the more return-prone ones, which means the numbers on the Profitability page may be overstating what VertaMart actually keeps.

**What management should focus on first:** delivery execution, not inventory. The data points to an operations and fulfilment problem, not a stock problem.

---

## Business Context & Objective

VertaMart runs five distribution centres — Lagos, Abuja, Port Harcourt, Kano, and Ibadan — selling across nine departments to a national customer base, sourced from 40 suppliers split roughly 70/30 between domestic and international. This analysis covers three years of order, inventory, supplier, and returns data, built to answer one question leadership had no consolidated view of before: is the business actually capturing the profit its revenue suggests, or is it losing margin somewhere between the sale and the doorstep?

---

## Key Business Findings

### Profit Looks Healthy on the Surface

Gross margin sits at **31.7%**, and Port Harcourt DC leads all warehouses on margin at **32.5%**, followed by Abuja (31.9%) and Ibadan (31.5%). Q4 is the clear demand driver — revenue climbs steadily through the year and peaks sharply in Q4, consistent with the Black Friday and December seasonality flagged in the original business brief. TVs & Audio is the strongest profit contributor at the subcategory level (₦27.4M), with Fiction, Cookware, and Men's Wear rounding out the top performers.

This is the part of the story a standard sales dashboard would stop at. It's also the part that hides the most.

### Where Operations Begin to Break Down

Two KPIs on the Fulfilment & Returns page tell a story the Profitability page doesn't: **Fulfilment Rate sits at 81.5%**, and **Delivery On-Time Rate is 83.4%** overall — but drops to a tight, unimpressive band of **75%–77%** when broken out by warehouse. No single distribution centre is dragging the average down on its own. All five are underperforming together, within two points of each other.

> **KEY FINDING**
> Delivery on-time performance ranges only from 75% (Ibadan) to 77% (Lagos, Abuja) — a narrow band, but a low one.
>
> **WHY IT MATTERS**
> This isn't a "fix one bad warehouse" problem. A uniformly weak result across every location suggests the issue sits in a shared process — carrier selection, promised delivery windows, or dispatch timing — rather than in any single site's management.
>
> **MANAGEMENT RESPONSE**
> Investigate delivery promise-setting and carrier performance at the process level, not warehouse by warehouse. A site-by-site review is unlikely to find the root cause if the weakness is systemic.

### The Inventory Story Doesn't Match the Delivery Story — Except in One Place

Overall, inventory health looks solid: stockouts are rare (0.9% network-wide), and supplier on-time delivery is respectable at 83.4% against a blended average lead time of 12 days. Turnover varies sensibly by department — Electronics turns fastest (1.4x), Fashion slowest (0.7x) — which is a believable pattern for a general retailer, not a red flag.

But Ibadan DC breaks that pattern. It carries the **highest stockout rate in the network (1.7%)** — nearly double the next-highest warehouse — and simultaneously posts the **weakest delivery on-time rate (75%)**. Kano, by contrast, shows a 0.0% stockout rate but still can't clear 76% on delivery, and sits at the lowest profit margin of the five warehouses (30.9%).

> **KEY FINDING**
> Ibadan is the only warehouse struggling on both stock availability and delivery timing at once.
>
> **WHY IT MATTERS**
> When a warehouse underperforms on both inventory and delivery simultaneously, it may indicate an operational issue such as capacity constraints, staffing, receiving processes, or supplier mix. Kano's zero stockout rate paired with weak delivery and the lowest margin is a different pattern worth separate attention — it may reflect lower demand rather than strong operations, and shouldn't be read as a success story without more digging.
>
> **MANAGEMENT RESPONSE**
> Prioritize an operational review of Ibadan DC specifically — receiving processes, staffing levels, and which suppliers feed that site — before assuming the network-wide delivery issue applies equally everywhere.

### Returns Are Quietly Eating Into the Best Performers

Return Rate sits at **3.4%** overall — low, and on its own, not alarming. The category breakdown tells a more useful story: **Skincare (10.9%) and Toys (9.8%)** are far above every other category, roughly double the return rate of most product lines. More significant for the profit conversation: **TVs & Audio (6.1%) and Laptops (7.0%)** — two of the strongest profit contributors on the Profitability page — also carry return rates well above the 3.4% network average.

This is consistent with a pattern worth flagging rather than ignoring: the categories management would point to as "working well" based on revenue and profit are not the same categories performing well once returns are factored in. The Profitability page, viewed alone, may overstate the categories' effective contribution once returns are considered.

---

## Operational Deep Dive: Connecting the Pages

Reading the three dashboard pages together instead of separately surfaces three relationships a single-page view would miss:

1. **Warehouse margin and warehouse delivery performance move independently.** Port Harcourt has the best margin (32.5%) but only mid-pack delivery (76%). Lagos and Abuja lead on delivery (77%) but sit in the middle on margin. There's no warehouse excelling at both — which suggests the operations team and the merchandising team may be optimizing for different things at each site.

2. **Supplier reliability is not currently the constraint on inventory health.** With 83.4% on-time supplier delivery and a network-wide stockout rate under 1%, the inventory side of the business is in reasonably good shape. That's worth stating plainly, because it means the delivery and fulfilment weaknesses are not being caused by supply-side shortages — they're happening downstream, inside VertaMart's own fulfilment process.

3. **Profitability and returns need to be read together, not separately.** A category showing strong profit and a category showing high returns can be the same category, and at VertaMart, in at least two cases, they are.

---

## Priority Business Problems

Ranked by business impact, not by dashboard order:

1. **Delivery on-time performance is weak network-wide (75%–77%).** This is the single biggest gap between what the business is capable of and what customers are experiencing, and it touches every warehouse.
2. **Fulfilment Rate at 81.5% means close to 1 in 5 orders isn't completing successfully.** Combined with the delivery finding above, this is where customer experience is most at risk.
3. **Ibadan DC is a compounding risk site** — the only warehouse weak on both inventory and delivery simultaneously.
4. **Return-prone categories overlap with the highest-profit categories,** meaning reported profitability may not fully reflect what the business retains after returns.

---

## Recommendations

**Priority 1 — Immediate**

- **Audit delivery promise-setting and carrier performance at the network level**, not warehouse by warehouse. Since every site is underperforming by a similar margin, the fastest path to improvement is likely a shared process fix — realistic delivery windows, carrier accountability, or dispatch timing — rather than five separate local investigations.
- **Open a focused operational review of Ibadan DC.** It's the only site showing weakness in both stock availability and delivery timing, which points to something specific to that location — staffing, receiving process, or supplier mix feeding that warehouse — rather than a network-wide cause.

**Priority 2 — Short Term**

- **Reconcile profit-by-category figures against return rates before reporting them to leadership as standalone wins.** TVs & Audio and Laptops look strong on the Profitability page but carry return rates well above the network average; a margin figure net of returns would give a more honest picture of what these categories actually contribute.
- **Investigate Skincare and Toys specifically** — their return rates (10.9% and 9.8%) are roughly double the next-highest category, which is a large enough gap to suggest a specific, findable cause (sizing, product quality, or expectation mismatch) rather than general customer behavior.

**Priority 3 — Strategic**

- **Reassess whether warehouse-level KPIs are pulling in the same direction.** No single warehouse leads on both margin and delivery performance, which suggests site-level incentives or targets may be optimizing operations and profitability separately instead of together.

---

## Management Takeaways

- The business is profitable, but the Profitability page alone overstates how healthy operations actually are — read it alongside Fulfilment & Returns, not in isolation.
- Inventory and supplier performance are currently strengths, not the problem — don't spend limited attention there first.
- Delivery execution is the most urgent, most fixable issue, and it's a shared problem across every warehouse, not one bad site.
- Ibadan is the one location showing a compounding, warehouse-specific risk and deserves a dedicated look.
- Two of the most profitable product categories are also above-average return risks — profit numbers for TVs & Audio and Laptops should be treated as provisional until viewed net of returns.
