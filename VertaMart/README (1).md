# VertaMart — E-Commerce Operations & Profitability Analysis

### 1. Project Overview

VertaMart is a modelled Nigerian e-commerce retailer operating five distribution centres — Lagos, Abuja, Port Harcourt, Kano, and Ibadan — selling across nine departments to a national customer base, sourced from 40 suppliers. This project analyzes three years of operational data (2023–2025) to look past top-line revenue and examine whether the business is actually retaining the profit its sales numbers suggest, once fulfilment, inventory, supplier, and returns performance are factored in.

### 2. Business Problem

Is VertaMart actually capturing the profit its revenue suggests, or are operational issues across fulfilment, delivery, inventory, suppliers, and returns affecting business performance? Most retail dashboards stop at revenue and order counts. This project connects the full operational chain back to profitability to answer that question.

### 3. Objectives

* Evaluate profitability and revenue performance across products, categories, and warehouses
* Assess inventory health and stockout risk network-wide
* Measure supplier reliability and delivery lead times
* Evaluate warehouse-level fulfilment and delivery performance
* Identify return patterns affecting the most profitable product categories

### 4. Data

Nine relational tables, roughly 396,000 rows, covering 2023–2025:

* Customers
* Orders
* Order Items
* Inventory Snapshots
* Purchase Order Items
* Suppliers
* Products
* Returns
* Warehouses

### 5. Data Preparation

Data cleaning was done in MySQL using an Identify → Investigate → Validate → Fix → Document workflow — resolving structural nulls, casing inconsistencies, duplicate records, and outlier discount values. The cleaned tables were joined and exported into a flat file for Tableau, and a separate pre-aggregated SQL export was built to support accurate inventory turnover calculations without row-level duplication from the join. Full documentation is in the accompanying Data Quality Log.

### 6. Key Business Insights

**Profit looks healthy on the surface, but it's not evenly distributed.** Gross margin sits at 31.7%, with Port Harcourt DC leading at 32.5% margin — but no warehouse leads on both margin and delivery performance at once.

**Delivery performance is weak network-wide, not in one location.** On-time delivery ranges only from 75% (Ibadan) to 77% (Lagos, Abuja) — a narrow, consistently low band suggesting a shared process issue rather than a single underperforming site. Fulfilment Rate sits at 81.5%, meaning 18.5% of orders were not successfully fulfilled.

**Inventory and supplier performance are currently strengths.** Stockouts are rare network-wide (0.9%), and supplier on-time delivery is solid (83.4%) against a 12-day average lead time — the delivery weakness is happening downstream in VertaMart's own fulfilment process, not because of supply shortages.

**Ibadan DC is the one compounding risk site.** It carries the highest stockout rate in the network (1.7%) and the weakest delivery on-time rate (75%) at the same time — the only warehouse struggling on both fronts simultaneously.

**High-profit categories carry above-average return rates.** TVs & Audio (6.1%) and Laptops (7.0%) — two of the strongest profit contributors — sit well above the 3.4% network average return rate, meaning reported category profitability may overstate what the business actually retains once returns are considered.

### 7. Recommendations

* Audit delivery promise-setting and carrier performance at the network level, since every warehouse underperforms by a similar margin rather than one outlier site
* Open a focused operational review of Ibadan DC — the only warehouse weak on both inventory and delivery at once
* Reconcile profit-by-category figures against return rates before reporting them as standalone wins, particularly for TVs & Audio and Laptops
* Investigate Skincare (10.9%) and Toys (9.8%) specifically — their return rates are roughly double the next-highest category
* Reassess whether warehouse-level KPIs and targets are pulling operations and profitability in the same direction

### 8. Dashboard

The Tableau dashboard is built across three pages — Profitability Overview, Inventory & Supplier Performance, and Fulfilment & Returns — covering 10 KPIs and supporting visualizations organized around each business area.

![VertaMart Dashboard](images/vertamart-dashboard.png)

### 9. Tools

* MySQL — data cleaning, validation and analysis
* Tableau — dashboard development and visualization
* GitHub — project documentation and portfolio presentation

### 10. Project Outcome

This project shows how raw, siloed operational data can be turned into a connected view of business performance — one that ties inventory, supplier, and delivery execution back to the profit figures leadership actually cares about. Rather than stopping at "what sold," the analysis identifies where operational weaknesses are quietly working against reported profitability, and translates those findings into specific, prioritized actions a business could act on.
