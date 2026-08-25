-- =====================================================
-- VertaMart | Full Flat View
-- Combines all 9 cleaned tables into a single view,
-- exported to CSV and used as the Tableau data source.
-- =====================================================

USE vertamart;

CREATE OR REPLACE VIEW VertaMart_Full_Table AS
SELECT 
    -- Order
    o.order_id, o.order_date, o.order_status, o.order_total, o.subtotal, o.payment_status, o.payment_method, o.payment_date,
    o.delivery_state, o.delivery_address_city, o.delivery_status, o.actual_delivery_date, o.promised_delivery_date, o.delivery_days,
    o.sales_channel, o.shipping_method, o.carrier, o.shipping_fee, o.delivery_cost, o.discount_amount, o.tax_amount, o.transaction_fee,
    o.cost_of_goods, o.estimated_profit,

    -- Customer
    c.customer_id, c.customer_name, c.gender, c.age_band, c.signup_date, c.city AS customer_city, c.state AS customer_state, 
    c.region AS customer_region, c.customer_segment, c.acquisition_channel, c.preferred_payment_method, c.customer_status,

    -- Warehouse
    w.warehouse_id, w.warehouse_name, w.city AS warehouse_city, w.state AS warehouse_state, w.region AS warehouse_region, 
    w.capacity_units, w.operating_cost, w.manager, w.opening_date,

    -- Order Items
    oi.order_item_id, oi.quantity, oi.unit_price AS item_unit_price, oi.discount_percent, oi.discount_amount AS item_discount, 
    oi.line_revenue, oi.line_cost, oi.gross_profit, oi.unit_cost AS item_unit_cost,

    -- Product
    p.product_id, p.product_name, p.department, p.category_name, p.subcategory, p.brand, p.selling_price, p.unit_cost AS product_unit_cost, 
    p.weight_kg, p.product_status, p.launch_date, p.reorder_level, p.safety_stock, p.lead_time_days AS product_lead_time, p.is_seasonal,

    -- Supplier
    s.supplier_id, s.supplier_name, s.supplier_type, s.country AS supplier_country, s.lead_time_days AS supplier_lead_time, 
    s.supplier_rating, s.on_time_delivery_rate, s.defect_rate, s.payment_terms, s.status AS supplier_status,

    -- Inventory
    inv.snapshot_id, inv.snapshot_date, inv.opening_stock, inv.closing_stock, inv.units_received, inv.units_sold AS inv_units_sold, 
    inv.units_returned AS inv_units_returned, inv.adjustments, inv.stockout_flag, inv.inventory_value,

    -- Purchase Orders
    poi.purchase_order_item_id, poi.purchase_order_id, poi.po_order_date, poi.expected_delivery_date, poi.po_actual_delivery_date,
    poi.quantity_ordered, poi.quantity_received, poi.unit_cost AS po_unit_cost, poi.total_cost AS po_total_cost, 
    poi.total_purchase_value, poi.purchase_order_status,

    -- Returns
    r.return_id, r.return_date, r.return_reason, r.quantity_returned, r.refund_amount, r.return_shipping_cost

FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN warehouses w ON o.warehouse_id = w.warehouse_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id
LEFT JOIN inventory_snapshots inv 
    ON p.product_id = inv.product_id 
    AND w.warehouse_id = inv.warehouse_id 
    AND inv.snapshot_date = o.order_date 
LEFT JOIN purchase_order_items poi 
    ON p.product_id = poi.product_id 
    AND w.warehouse_id = poi.warehouse_id
LEFT JOIN returns r 
    ON oi.order_id = r.order_id 
    AND oi.order_item_id = r.order_item_id;
