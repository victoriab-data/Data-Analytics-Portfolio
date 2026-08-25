-- =====================================================
-- VertaMart | Schema Creation & Data Load
-- =====================================================

CREATE DATABASE vertamart;
USE vertamart;

-- 1. customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age_band VARCHAR(10),
    signup_date DATE,
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(30),
    customer_segment VARCHAR(30),
    acquisition_channel VARCHAR(30),
    first_order_date DATE,
    preferred_payment_method VARCHAR(30),
    customer_status VARCHAR(20)
);

-- 2. suppliers
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    supplier_type VARCHAR(30),
    city VARCHAR(50),
    country VARCHAR(50),
    lead_time_days INT,
    payment_terms VARCHAR(20),
    supplier_rating DECIMAL(3,1),
    on_time_delivery_rate DECIMAL(5,3),
    defect_rate DECIMAL(5,3),
    status VARCHAR(20)
);

-- 3. warehouses
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(30),
    capacity_units INT,
    operating_cost DECIMAL(12,2),
    manager VARCHAR(50),
    opening_date DATE
);

-- 4. products (FK -> suppliers)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    department VARCHAR(50),
    category_name VARCHAR(50),
    subcategory VARCHAR(50),
    brand VARCHAR(30),
    supplier_id INT,
    unit_cost DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    weight_kg DECIMAL(6,2),
    product_status VARCHAR(20),
    launch_date DATE,
    reorder_level INT,
    safety_stock INT,
    lead_time_days INT,
    is_seasonal TINYINT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- 5. orders (FK -> customers, warehouses)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    sales_channel VARCHAR(20),
    warehouse_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    payment_date DATE,
    transaction_fee DECIMAL(10,2),
    shipping_method VARCHAR(20),
    delivery_address_city VARCHAR(50),
    delivery_state VARCHAR(50),
    carrier VARCHAR(30),
    dispatch_date DATE,
    promised_delivery_date DATE,
    actual_delivery_date DATE,
    delivery_status VARCHAR(30),
    delivery_cost DECIMAL(10,2),
    delivery_days INT,
    subtotal DECIMAL(12,2),
    discount_amount DECIMAL(12,2),
    shipping_fee DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    order_total DECIMAL(12,2),
    cost_of_goods DECIMAL(12,2),
    estimated_profit DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- 6. order_items (FK -> orders, products)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    discount_amount DECIMAL(10,2),
    line_revenue DECIMAL(12,2),
    unit_cost DECIMAL(10,2),
    line_cost DECIMAL(12,2),
    gross_profit DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 7. purchase_order_items (FK -> suppliers, warehouses, products)
CREATE TABLE purchase_order_items (
    purchase_order_item_id INT PRIMARY KEY,
    purchase_order_id INT,
    supplier_id INT,
    warehouse_id INT,
    product_id INT,
    po_order_date DATE,
    expected_delivery_date DATE,
    po_actual_delivery_date DATE,
    purchase_order_status VARCHAR(20),
    quantity_ordered INT,
    quantity_received INT,
    unit_cost DECIMAL(10,2),
    total_cost DECIMAL(12,2),
    total_purchase_value DECIMAL(12,2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 8. inventory_snapshots (FK -> warehouses, products)
CREATE TABLE inventory_snapshots (
    snapshot_id VARCHAR(30) PRIMARY KEY,
    snapshot_date DATE,
    warehouse_id INT,
    product_id INT,
    opening_stock INT,
    units_received INT,
    units_sold INT,
    units_returned INT,
    adjustments INT,
    closing_stock INT,
    stockout_flag TINYINT,
    inventory_value DECIMAL(12,2),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 9. returns (FK -> orders, order_items)
CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT,
    order_item_id INT,
    return_date DATE,
    return_reason VARCHAR(50),
    quantity_returned INT,
    refund_amount DECIMAL(10,2),
    return_shipping_cost DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id)
);

SHOW TABLES;

-- Enable local file loading for CSV import
SET GLOBAL local_infile = 1;

-- =====================================================
-- Data Load — 9 source CSVs
-- NOTE: File paths below are relative placeholders.
-- Update to match wherever the source CSVs live in your
-- own environment before running.
-- =====================================================

-- 1. customers
LOAD DATA INFILE 'data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, customer_name, gender, age_band, @signup_date, city, state, region,
 customer_segment, acquisition_channel, @first_order_date, preferred_payment_method, customer_status)
SET signup_date = NULLIF(@signup_date,''),
    first_order_date = NULLIF(@first_order_date,'');

-- 2. suppliers
LOAD DATA INFILE 'data/suppliers.csv'
INTO TABLE suppliers
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(supplier_id, supplier_name, supplier_type, city, country, lead_time_days, payment_terms,
 @supplier_rating, on_time_delivery_rate, defect_rate, status)
SET supplier_rating = NULLIF(@supplier_rating,'');

-- 3. warehouses
LOAD DATA INFILE 'data/warehouses.csv'
INTO TABLE warehouses
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(warehouse_id, warehouse_name, city, state, region, capacity_units, operating_cost, manager, opening_date);

-- 4. products
LOAD DATA INFILE 'data/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, department, category_name, subcategory, brand, supplier_id,
 unit_cost, selling_price, weight_kg, product_status, launch_date, reorder_level,
 safety_stock, lead_time_days, is_seasonal);

-- 5. orders
LOAD DATA INFILE 'data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_date, order_status, sales_channel, warehouse_id, payment_method,
 payment_status, @payment_date, @transaction_fee, shipping_method, delivery_address_city, delivery_state,
 @carrier, @dispatch_date, @promised_delivery_date, @actual_delivery_date, @delivery_status,
 @delivery_cost, @delivery_days, subtotal, discount_amount, shipping_fee, tax_amount,
 order_total, cost_of_goods, estimated_profit)
SET payment_date = NULLIF(@payment_date,''),
    transaction_fee = NULLIF(@transaction_fee,''),
    carrier = NULLIF(@carrier,''),
    dispatch_date = NULLIF(@dispatch_date,''),
    promised_delivery_date = NULLIF(@promised_delivery_date,''),
    actual_delivery_date = NULLIF(@actual_delivery_date,''),
    delivery_status = NULLIF(@delivery_status,''),
    delivery_cost = NULLIF(@delivery_cost,''),
    delivery_days = NULLIF(@delivery_days,'');

-- 6. order_items
LOAD DATA INFILE 'data/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_item_id, order_id, product_id, quantity, unit_price, discount_percent, discount_amount,
 line_revenue, unit_cost, line_cost, gross_profit);

-- 7. purchase_order_items
LOAD DATA INFILE 'data/purchase_order_items.csv'
INTO TABLE purchase_order_items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(purchase_order_item_id, purchase_order_id, supplier_id, warehouse_id, product_id,
 po_order_date, expected_delivery_date, @po_actual_delivery_date, purchase_order_status,
 quantity_ordered, quantity_received, unit_cost, total_cost, total_purchase_value)
SET po_actual_delivery_date = NULLIF(@po_actual_delivery_date,'');

-- 8. inventory_snapshots
LOAD DATA INFILE 'data/inventory_snapshots.csv'
INTO TABLE inventory_snapshots
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(snapshot_id, snapshot_date, warehouse_id, product_id, opening_stock, units_received,
 units_sold, units_returned, adjustments, closing_stock, stockout_flag, inventory_value);

-- 9. returns
LOAD DATA INFILE 'data/returns.csv'
INTO TABLE returns
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(return_id, order_id, order_item_id, return_date, return_reason, quantity_returned,
 refund_amount, return_shipping_cost);

-- =====================================================
-- Verify row counts across all 9 tables
-- =====================================================
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'suppliers', COUNT(*) FROM suppliers
UNION ALL SELECT 'warehouses', COUNT(*) FROM warehouses
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'purchase_order_items', COUNT(*) FROM purchase_order_items
UNION ALL SELECT 'inventory_snapshots', COUNT(*) FROM inventory_snapshots
UNION ALL SELECT 'returns', COUNT(*) FROM returns;
