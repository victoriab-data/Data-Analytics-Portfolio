-- =====================================================
-- VertaMart | Data Cleaning
-- Workflow: Identify -> Investigate -> Validate -> Fix -> Document
-- =====================================================

USE vertamart;
SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------
-- FIX 1: inventory_snapshots — stockout_flag not set
-- -----------------------------------------------------
-- IDENTIFY: rows where closing_stock = 0 but stockout_flag was still 0.
-- INVESTIGATE: confirmed the mismatch only ran in one direction —
-- stock hitting zero without the flag updating, never the reverse.
SELECT
    SUM(CASE WHEN closing_stock = 0 AND stockout_flag != 1 THEN 1 ELSE 0 END) AS stock_zero_flag_not_set,
    SUM(CASE WHEN closing_stock > 0 AND stockout_flag != 0 THEN 1 ELSE 0 END) AS stock_positive_flag_set
FROM inventory_snapshots;

-- FIX: set stockout_flag = 1 wherever closing_stock is 0.
UPDATE inventory_snapshots
SET stockout_flag = 1
WHERE closing_stock = 0 AND stockout_flag != 1;

-- VALIDATE: re-run the same check — both counts should now be 0.
SELECT
    SUM(CASE WHEN closing_stock = 0 AND stockout_flag != 1 THEN 1 ELSE 0 END) AS stock_zero_flag_not_set,
    SUM(CASE WHEN closing_stock > 0 AND stockout_flag != 0 THEN 1 ELSE 0 END) AS stock_positive_flag_set
FROM inventory_snapshots;


-- -----------------------------------------------------
-- FIX 2: customers — inconsistent state name casing/formatting
-- -----------------------------------------------------
-- IDENTIFY: state values entered with mixed casing (e.g. 'lagos', 'LAGOS', 'Lagos')
-- causing the same state to be treated as multiple distinct values.
SELECT state, COUNT(*) AS row_count
FROM customers
GROUP BY state
ORDER BY row_count DESC;

-- FIX: trim whitespace, then standardize casing per state.
UPDATE customers SET state = TRIM(state);

UPDATE customers SET state = 'Lagos'    WHERE state IN ('lagos','LAGOS');
UPDATE customers SET state = 'FCT'      WHERE state IN ('fct','Fct');
UPDATE customers SET state = 'Rivers'   WHERE state IN ('rivers','RIVERS');
UPDATE customers SET state = 'Oyo'      WHERE state IN ('oyo','OYO');
UPDATE customers SET state = 'Enugu'    WHERE state IN ('enugu','ENUGU');
UPDATE customers SET state = 'Anambra'  WHERE state IN ('anambra');
UPDATE customers SET state = 'Kaduna'   WHERE state IN ('kaduna','KADUNA');
UPDATE customers SET state = 'Edo'      WHERE state IN ('edo','EDO');
UPDATE customers SET state = 'Abia'     WHERE state IN ('abia','ABIA');
UPDATE customers SET state = 'Plateau'  WHERE state IN ('plateau','PLATEAU');
UPDATE customers SET state = 'Delta'    WHERE state IN ('delta');
UPDATE customers SET state = 'Kwara'    WHERE state IN ('kwara','KWARA');
UPDATE customers SET state = 'Kano'     WHERE state IN ('kano','KANO');

-- VALIDATE: each state should now appear as a single, consistent value.
SELECT state, COUNT(*) AS row_count FROM customers GROUP BY state ORDER BY row_count DESC;


-- -----------------------------------------------------
-- FIX 3: orders — inconsistent delivery city casing
-- -----------------------------------------------------
-- Same issue as customers.state, found in orders.delivery_address_city.
UPDATE orders SET delivery_address_city = TRIM(delivery_address_city);

UPDATE orders SET delivery_address_city = 'Lagos'         WHERE delivery_address_city IN ('lagos','LAGOS');
UPDATE orders SET delivery_address_city = 'Abuja'         WHERE delivery_address_city IN ('abuja','ABUJA');
UPDATE orders SET delivery_address_city = 'Port Harcourt' WHERE delivery_address_city IN ('port harcourt','PORT HARCOURT');
UPDATE orders SET delivery_address_city = 'Ibadan'        WHERE delivery_address_city IN ('ibadan','IBADAN');
UPDATE orders SET delivery_address_city = 'Benin City'    WHERE delivery_address_city IN ('benin city','BENIN CITY');
UPDATE orders SET delivery_address_city = 'Enugu'         WHERE delivery_address_city IN ('enugu','ENUGU');
UPDATE orders SET delivery_address_city = 'Onitsha'       WHERE delivery_address_city IN ('onitsha','ONITSHA');
UPDATE orders SET delivery_address_city = 'Kaduna'        WHERE delivery_address_city IN ('kaduna','KADUNA');
UPDATE orders SET delivery_address_city = 'Aba'           WHERE delivery_address_city IN ('aba','ABA');
UPDATE orders SET delivery_address_city = 'Kano'          WHERE delivery_address_city IN ('kano','KANO');
UPDATE orders SET delivery_address_city = 'Warri'         WHERE delivery_address_city IN ('warri','WARRI');
UPDATE orders SET delivery_address_city = 'Ilorin'        WHERE delivery_address_city IN ('ilorin','ILORIN');
UPDATE orders SET delivery_address_city = 'Jos'           WHERE delivery_address_city IN ('jos','JOS');

-- VALIDATE
SELECT delivery_address_city, COUNT(*) FROM orders GROUP BY delivery_address_city ORDER BY COUNT(*) DESC;


-- -----------------------------------------------------
-- FIX 4: products — duplicate category label
-- -----------------------------------------------------
-- IDENTIFY: 'Diapers and Wipes' and 'Diapers & Wipes' existed as two
-- separate category values for what should be one category.
UPDATE products SET category_name = 'Diapers & Wipes' WHERE category_name = 'Diapers and Wipes';

-- VALIDATE: only one version of the category name should remain.
SELECT category_name, COUNT(*) FROM products WHERE category_name LIKE 'Diapers%' GROUP BY category_name;


-- -----------------------------------------------------
-- FIX 5: customers — missing first_order_date
-- -----------------------------------------------------
-- IDENTIFY: a portion of customers had no first_order_date on file.
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN first_order_date IS NULL THEN 1 ELSE 0 END) AS missing_first_order,
    ROUND(SUM(CASE WHEN first_order_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_missing
FROM customers;

-- INVESTIGATE: some customers genuinely have no orders at all — a missing
-- first_order_date is expected for them, not a data error. Added a flag
-- column to distinguish "never ordered" from "data missing."
ALTER TABLE customers ADD COLUMN has_ordered VARCHAR(3);

UPDATE customers c
LEFT JOIN (SELECT DISTINCT customer_id FROM orders) o
    ON c.customer_id = o.customer_id
SET c.has_ordered = CASE WHEN o.customer_id IS NULL THEN 'No' ELSE 'Yes' END;

-- FIX: for customers who DID order, backfill first_order_date from
-- their actual earliest order in the orders table.
UPDATE customers c
JOIN (
    SELECT customer_id, MIN(order_date) AS earliest_order
    FROM orders
    GROUP BY customer_id
) o ON c.customer_id = o.customer_id
SET c.first_order_date = o.earliest_order;

-- VALIDATE: customers with has_ordered = 'Yes' should now have 0 missing
-- first_order_date values; 'No' customers are expected to remain NULL.
SELECT has_ordered,
       SUM(CASE WHEN first_order_date IS NULL THEN 1 ELSE 0 END) AS still_null,
       SUM(CASE WHEN first_order_date IS NOT NULL THEN 1 ELSE 0 END) AS filled
FROM customers
GROUP BY has_ordered;


-- -----------------------------------------------------
-- INVESTIGATED, NO CHANGE — estimated_profit formula
-- -----------------------------------------------------
-- Confirmed the underlying logic: order_total - cost_of_goods - transaction_fee
-- - shipping_fee. When transaction_fee was NULL, a 1.5% estimated fee applies.
-- Remaining discrepancies were rounding variance under ₦0.01 and were left as-is.
SELECT COUNT(*) AS mismatch_count
FROM orders
WHERE ROUND(estimated_profit, 2) <> ROUND(
    order_total
    - cost_of_goods
    - COALESCE(transaction_fee, ROUND(order_total * 0.015, 2))
    - COALESCE(shipping_fee, 0),
    2
);


-- -----------------------------------------------------
-- INVESTIGATED, NO CHANGE — products.safety_stock vs reorder_level
-- -----------------------------------------------------
-- IDENTIFY: 26 of 200 products had safety_stock above reorder_level.
-- INVESTIGATE: values reflect reasonable inventory threshold variation
-- by product/category, not a data entry error. Documented and left as-is.
SELECT
    COUNT(*) AS total_products,
    SUM(safety_stock > reorder_level) AS safety_above_reorder,
    SUM(safety_stock = reorder_level) AS safety_equals_reorder,
    SUM(safety_stock < reorder_level) AS safety_below_reorder
FROM products;

SET SQL_SAFE_UPDATES = 1;
COMMIT;
