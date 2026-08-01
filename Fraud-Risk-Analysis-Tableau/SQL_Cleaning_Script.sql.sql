create database Apex_bank1;
use Apex_bank1;
-- we import table

select count(*) as number_of_rows from apex_trust_bank_transactions_2024_2026;
rename table apex_trust_bank_transactions_2024_2026 to Apex_Bank;

SELECT COUNT(*) AS null_transaction_ids
FROM apex_bank
WHERE transaction_id IS NULL
   OR TRIM(transaction_id) = '';
   
   SELECT transaction_id,
       COUNT(*) AS total
FROM apex_bank
GROUP BY transaction_id
HAVING COUNT(*) > 1;

SELECT *
FROM apex_bank
WHERE transaction_id IN (
    SELECT transaction_id
    FROM apex_bank
    GROUP BY transaction_id
    HAVING COUNT(*) > 1
)
ORDER BY transaction_id, transaction_date;

SELECT COUNT(*) AS null_customer_ids
FROM apex_bank
WHERE customer_id IS NULL
   OR TRIM(customer_id) = '';
   
   SELECT customer_id
FROM apex_bank
WHERE customer_id <> TRIM(customer_id);

SELECT customer_id,
       COUNT(*) AS total_transactions
FROM apex_bank
GROUP BY customer_id
ORDER BY total_transactions DESC;

SELECT COUNT(*) AS null_customer_ids
FROM apex_bank
WHERE customer_id IS NULL
   OR TRIM(customer_id) = '';
   
   SELECT COUNT(*) AS null_customer_names
FROM apex_bank
WHERE customer_name IS NULL
   OR TRIM(customer_name) = '';
   
   SELECT customer_name
FROM apex_bank
WHERE customer_name <> TRIM(customer_name);

set  SQL_SAFE_UPDATES = 0;
UPDATE apex_bank
SET customer_name = TRIM(customer_name);

SELECT DISTINCT customer_name
FROM apex_bank
ORDER BY customer_name;

SELECT customer_name,
       COUNT(*) AS total
FROM apex_bank
GROUP BY customer_name
ORDER BY total DESC;

SELECT COUNT(*) AS null_customer_names
FROM apex_bank
WHERE customer_name IS NULL
   OR TRIM(customer_name) = '';
   
 select distinct customer_name from apex_bank;
 
SELECT COUNT(*) AS null_customer_age
FROM apex_bank
WHERE customer_age IS NULL;

SELECT *
FROM apex_bank
WHERE customer_age < 18
   OR customer_age > 75;
   
 SELECT
    MIN(customer_age) AS minimum_age,
    MAX(customer_age) AS maximum_age
FROM apex_bank;

  SELECT customer_age,
       COUNT(*) AS total
FROM apex_bank
GROUP BY customer_age
ORDER BY customer_age;

SELECT *
FROM apex_bank
WHERE customer_age IN (0, 1) OR customer_age > 75;

SELECT COUNT(*) AS invalid_ages
FROM apex_bank
WHERE customer_age < 18
   OR customer_age > 75
   OR customer_age IS NULL;
   
   ALTER TABLE apex_bank
ADD COLUMN age_flag VARCHAR(20);

UPDATE apex_bank
SET age_flag = 'invalid_age'
WHERE customer_age IN (0, 1) OR customer_age > 75;

UPDATE apex_bank
SET customer_age = NULL
WHERE age_flag = 'invalid_age';

SELECT MIN(customer_age), MAX(customer_age), COUNT(*) 
FROM apex_bank 
WHERE age_flag = 'invalid_age';

select distinct customer_age from apex_bank;

SELECT DISTINCT customer_age, COUNT(*)
FROM apex_bank
GROUP BY customer_age
ORDER BY customer_age;

UPDATE apex_bank
SET age_flag = 'invalid_age'
WHERE customer_age IN (5, 12);

UPDATE apex_bank
SET customer_age = NULL
WHERE age_flag = 'invalid_age' AND customer_age IN (5, 12);

UPDATE apex_bank
SET customer_age = NULL
WHERE age_flag = 'invalid_age';

SELECT MIN(customer_age), MAX(customer_age)
FROM apex_bank
WHERE customer_age IS NOT NULL;

SELECT COUNT(*) 
FROM apex_bank
WHERE customer_gender IS NULL;

SELECT DISTINCT customer_gender
FROM apex_bank
WHERE customer_gender != TRIM(customer_gender);

SELECT DISTINCT customer_gender, COUNT(*)
FROM apex_bank
GROUP BY customer_gender
ORDER BY customer_gender;
select distinct customer_gender from apex_bank;

SELECT COUNT(*) 
FROM apex_bank
WHERE customer_state IS NULL;

SELECT DISTINCT customer_state
FROM apex_bank
WHERE customer_state != TRIM(customer_state);

SELECT DISTINCT customer_state, COUNT(*)
FROM apex_bank
GROUP BY customer_state
ORDER BY customer_state;

UPDATE apex_bank
SET customer_state = TRIM(customer_state);

UPDATE apex_bank
SET customer_state = CASE customer_state
    WHEN 'ANA' THEN 'Anambra'
    WHEN 'DEL' THEN 'Delta'
    WHEN 'ENU' THEN 'Enugu'
    WHEN 'FCT' THEN 'Abuja'
    WHEN 'KAD' THEN 'Kaduna'
    WHEN 'KAN' THEN 'Kano'
    WHEN 'LAG' THEN 'Lagos'
    WHEN 'RIV' THEN 'Rivers'
    ELSE customer_state
END;

SELECT customer_state, COUNT(*)
FROM apex_bank
GROUP BY customer_state
ORDER BY customer_state;

SELECT COUNT(*) 
FROM apex_bank
WHERE customer_state IS NULL;

SELECT COUNT(*) 
FROM apex_bank
WHERE customer_state IS NULL;

SELECT LENGTH(phone_number), COUNT(*)
FROM apex_bank
GROUP BY LENGTH(phone_number)
ORDER BY LENGTH(phone_number);

SELECT DISTINCT phone_number
FROM apex_bank
WHERE phone_number != TRIM(phone_number);

SELECT DISTINCT phone_number
FROM apex_bank
LIMIT 20;

SELECT COUNT(*)
FROM apex_bank
WHERE phone_number LIKE '0%';

SELECT LENGTH(phone_number), COUNT(*)
FROM apex_bank
GROUP BY LENGTH(phone_number);

UPDATE apex_bank
SET phone_number = CONCAT('0', phone_number);

ALTER TABLE apex_bank
MODIFY phone_number VARCHAR(15);

UPDATE apex_bank
SET phone_number = CONCAT('0', phone_number);

SELECT LENGTH(phone_number), COUNT(*)
FROM apex_bank
GROUP BY LENGTH(phone_number);

SELECT COUNT(*) 
FROM apex_bank
WHERE account_number IS NULL;

SELECT DISTINCT account_number
FROM apex_bank
WHERE account_number != TRIM(account_number);

SELECT LENGTH(account_number), COUNT(*)
FROM apex_bank
GROUP BY LENGTH(account_number)
ORDER BY LENGTH(account_number);

ALTER TABLE apex_bank
MODIFY account_number VARCHAR(15);

UPDATE apex_bank
SET account_number = LPAD(account_number, 10, '0');

SELECT account_number, COUNT(*)
FROM apex_bank
GROUP BY account_number
HAVING COUNT(*) > 1;

UPDATE apex_bank
SET account_number = LPAD(account_number, 10, '0');

SELECT LENGTH(account_number), COUNT(*)
FROM apex_bank
GROUP BY LENGTH(account_number);

SELECT COUNT(*) 
FROM apex_bank
WHERE account_type IS NULL;

SELECT DISTINCT account_type, COUNT(*)
FROM apex_bank
GROUP BY account_type
ORDER BY account_type;

UPDATE apex_bank
SET account_type = TRIM(account_type);

UPDATE apex_bank
SET account_type = 'Domiciliary'
WHERE account_type = 'dom';

SELECT account_type, COUNT(*)
FROM apex_bank
GROUP BY account_type
ORDER BY account_type;

SELECT COUNT(*) 
FROM apex_bank
WHERE account_open_date IS NULL;

SELECT DISTINCT account_open_date
FROM apex_bank
WHERE account_open_date != TRIM(account_open_date);

SELECT DISTINCT account_open_date
FROM apex_bank
LIMIT 30;

SELECT LENGTH(account_open_date), COUNT(*)
FROM apex_bank
GROUP BY LENGTH(account_open_date)
ORDER BY LENGTH(account_open_date);

ALTER TABLE apex_bank
ADD COLUMN account_open_date_clean DATE;

UPDATE apex_bank
SET account_open_date_clean = STR_TO_DATE(account_open_date, '%m/%d/%Y');

SELECT COUNT(*)
FROM apex_bank
WHERE account_open_date_clean IS NULL;

ALTER TABLE apex_bank
DROP COLUMN account_open_date;

ALTER TABLE apex_bank
change COLUMN account_open_date_clean account_open_date DATE;
ALTER TABLE apex_bank
ADD COLUMN account_open_date_clean DATE;

SELECT COUNT(*)
FROM apex_bank
WHERE account_open_date_clean IS NULL;

DESCRIBE apex_bank;

SELECT account_open_date
FROM apex_bank
LIMIT 10;

ALTER TABLE apex_bank
DROP COLUMN account_open_date_clean;
select * from apex_bank;

SELECT COUNT(*)
FROM apex_bank
WHERE account_open_date IS NULL;

DESCRIBE apex_bank;

SELECT COUNT(*) 
FROM apex_bank
WHERE transaction_date IS NULL;

SELECT DISTINCT transaction_date
FROM apex_bank
WHERE transaction_date != TRIM(transaction_date);

SELECT LENGTH(transaction_date), COUNT(*)
FROM apex_bank
GROUP BY LENGTH(transaction_date)
ORDER BY LENGTH(transaction_date);

SELECT transaction_date
FROM apex_bank
LIMIT 30;

SHOW COLUMNS
FROM apex_bank
LIKE 'transaction_date';


SELECT COUNT(*) AS invalid_dates
FROM apex_bank
WHERE STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i') IS NULL;

SELECT transaction_date
FROM apex_bank
WHERE STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i') IS NULL;

SELECT DISTINCT transaction_date
FROM apex_bank
WHERE STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i') IS NULL;

ALTER TABLE apex_bank
ADD COLUMN transaction_date_backup TEXT;

UPDATE apex_bank
SET transaction_date_backup = transaction_date;

UPDATE apex_bank
SET transaction_date = DATE_FORMAT(
    STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i'),
    '%m/%d/%Y %H:%i'
)
WHERE STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i') IS NULL
AND STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i') IS NOT NULL;

SELECT transaction_date,
       STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i') AS converted
FROM apex_bank
WHERE transaction_date LIKE '__/__/____ %'
LIMIT 10;

ALTER TABLE apex_bank
ADD COLUMN transaction_datetime DATETIME;
set  SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET transaction_datetime =
COALESCE(
    STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i'),
    STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i')
);
SELECT COUNT(*) AS null_transaction_type
FROM apex_bank
WHERE transaction_type IS NULL;

SELECT transaction_type
FROM apex_bank
WHERE transaction_type <> TRIM(transaction_type);

SELECT DISTINCT transaction_type
FROM apex_bank
ORDER BY transaction_type;

DESCRIBE apex_bank;

SELECT COUNT(*) AS null_channel
FROM apex_bank
WHERE channel IS NULL;

SELECT channel
FROM apex_bank
WHERE channel <> TRIM(channel);

SELECT channel
FROM apex_bank
LIMIT 20;

-- 1. Check NULLs
SELECT COUNT(*) AS null_merchant_category
FROM apex_bank
WHERE merchant_category IS NULL;

-- 2. Check leading/trailing spaces
SELECT merchant_category
FROM apex_bank
WHERE merchant_category <> TRIM(merchant_category);

-- 3. Check inconsistencies
SELECT DISTINCT merchant_category
FROM apex_bank
ORDER BY merchant_category;

SELECT DISTINCT channel
FROM apex_bank
ORDER BY channel;
SELECT COUNT(*) AS null_merchant_category
FROM apex_bank
WHERE merchant_category IS NULL;

SELECT merchant_category
FROM apex_bank
WHERE merchant_category <> TRIM(merchant_category);

SHOW COLUMNS
FROM apex_bank
LIKE 'merchant_category';

SELECT COUNT(*) AS null_amount
FROM apex_bank
WHERE amount IS NULL;

SELECT amount
FROM apex_bank
WHERE amount <> TRIM(amount);

SELECT *
FROM apex_bank
WHERE amount < 0;

SELECT transaction_type,
       COUNT(*) AS total_negative
FROM apex_bank
WHERE amount < 0
GROUP BY transaction_type;

SHOW COLUMNS
FROM apex_bank
LIKE 'amount';

SELECT transaction_id,
       transaction_type,
       amount,
       balance_after_txn
FROM apex_bank
WHERE transaction_type = 'Deposit'
  AND amount < 0;
  
  UPDATE apex_bankapex_bank
SET amount = ABS(amount)
WHERE transaction_type = 'Deposit'
  AND amount < 0;
  
  SELECT transaction_id,
       transaction_type,
       amount
FROM apex_bank
WHERE transaction_type = 'Deposit'
  AND amount < 0;
  
  SELECT DISTINCT currency
FROM apex_bank
ORDER BY currency;

UPDATE apex_bank
SET currency = 'NGN'
WHERE UPPER(TRIM(currency)) = 'NAIRA';

SET SQL_SAFE_UPDATES = 0;

SELECT currency, COUNT(*) AS total
FROM apex_bank
GROUP BY currency;

SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET currency = NULL
WHERE UPPER(TRIM(currency)) = 'N/A';

SET SQL_SAFE_UPDATES = 1;

SELECT currency, COUNT(*) AS total
FROM apex_bank
GROUP BY currency;

SELECT COUNT(*) AS null_currency
FROM apex_bank
WHERE currency IS NULL;

DESCRIBE apex_bank;

SELECT
    MIN(balance_after_txn) AS minimum_balance,
    MAX(balance_after_txn) AS maximum_balance
FROM apex_bank;

SELECT COUNT(*) AS negative_balances
FROM apex_bank
WHERE balance_after_txn < 0;

SELECT transaction_id,
       customer_id,
       balance_after_txn
FROM apex_bank
WHERE balance_after_txn < 0;

SELECT COUNT(*) AS blank_balance
FROM apex_bank
WHERE balance_after_txn IS NULL;

SELECT COUNT(*) AS blank_balance
FROM apex_bank
WHERE balance_after_txn IS NULL;

SELECT DISTINCT transaction_status
FROM apex_bank
ORDER BY transaction_status;

SELECT transaction_status,
       COUNT(*) AS total
FROM apex_bank
GROUP BY transaction_status
ORDER BY total DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET transaction_status = 'Unknown'
WHERE transaction_status IS NULL
   OR TRIM(transaction_status) = '';

SET SQL_SAFE_UPDATES = 1;

SELECT transaction_status,
       COUNT(*) AS total
FROM apex_bank
GROUP BY transaction_status
ORDER BY total DESC;

SELECT DISTINCT device_id
FROM apex_bank
ORDER BY device_id;

SELECT COUNT(*) AS blank_device
FROM apex_bank
WHERE device_id IS NULL
   OR TRIM(device_id) = '';
   
   SELECT COUNT(DISTINCT device_id) AS unique_devices
FROM apex_bank;

SELECT COUNT(*) AS blank_ip
FROM apex_bank
WHERE ip_address IS NULL
   OR TRIM(ip_address) = '';
   
   SELECT DISTINCT ip_address
FROM apex_bank
LIMIT 20;

SELECT COUNT(DISTINCT ip_address) AS unique_ip
FROM apex_bank;

SELECT DISTINCT is_fraud_flag
FROM apex_bank
ORDER BY is_fraud_flag;

SELECT is_fraud_flag,
       COUNT(*) AS total
FROM apex_bank
GROUP BY is_fraud_flag
ORDER BY total DESC;

SELECT COUNT(*) AS blank_flag
FROM apex_bank
WHERE is_fraud_flag IS NULL
   OR TRIM(is_fraud_flag) = '';
   
   SELECT DISTINCT fraud_type
FROM apex_bank
ORDER BY fraud_type;

SELECT fraud_type,
       COUNT(*) AS total
FROM apex_bank
GROUP BY fraud_type
ORDER BY total DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET fraud_type = 'Not Applicable'
WHERE fraud_type IS NULL
   OR TRIM(fraud_type) = '';

SET SQL_SAFE_UPDATES = 1;

SELECT fraud_type,
       COUNT(*) AS total
FROM apex_bank
GROUP BY fraud_type
ORDER BY total DESC;

DESCRIBE apex_bank;

SELECT COUNT(*) AS blank_risk_score
FROM apex_bank
WHERE risk_score IS NULL;

SELECT
    MIN(risk_score) AS minimum_score,
    MAX(risk_score) AS maximum_score
FROM apex_bank;

SELECT COUNT(*) AS blank_risk_scores
FROM apex_bank
WHERE risk_score IS NULL;

SELECT 
    risk_score,
    COUNT(*) AS frequency
FROM apex_bank
GROUP BY risk_score
ORDER BY risk_score;

SELECT COUNT(*) AS total_rows
FROM apex_bank;

SELECT 
    transaction_id,
    COUNT(*) AS duplicate_count
FROM apex_bank
GROUP BY transaction_id
HAVING COUNT(*) > 1;

SELECT
SUM(transaction_id IS NULL) AS transaction_id_nulls,
SUM(customer_id IS NULL) AS customer_id_nulls,
SUM(customer_name IS NULL) AS customer_name_nulls,
SUM(amount IS NULL) AS amount_nulls,
SUM(transaction_date IS NULL) AS transaction_date_nulls,
SUM(transaction_type IS NULL) AS transaction_type_nulls,
SUM(channel IS NULL) AS channel_nulls,
SUM(currency IS NULL) AS currency_nulls,
SUM(risk_score IS NULL) AS risk_score_nulls
FROM apex_bank;

SELECT 
    currency,
    COUNT(*) AS frequency
FROM apex_bank
GROUP BY currency;

SELECT *
FROM apex_bank
WHERE currency = '';

SELECT 
    currency,
    COUNT(*) AS frequency
FROM apex_bank
GROUP BY currency;
SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET currency = 'Unknown'
WHERE currency = '';

SELECT 
    currency,
    COUNT(*) AS frequency
FROM apex_bank
GROUP BY currency;

UPDATE apex_bank
SET currency = 'Unknown'
WHERE currency IS NULL;

SELECT 
    currency,
    COUNT(*) AS frequency
FROM apex_bank
GROUP BY currency;

SELECT
MIN(transaction_date) AS earliest_date,
MAX(transaction_date) AS latest_date
FROM apex_bank;

DESCRIBE apex_bank;

DESCRIBE apex_bank;

SHOW COLUMNS FROM apex_bank LIKE '%amount%';

SELECT amount
FROM apex_bank
LIMIT 10;

SELECT COUNT(*) AS blank_amounts
FROM apex_bank
WHERE amount IS NULL OR amount = '';

SELECT COUNT(*) AS null_amounts
FROM apex_bank
WHERE amount IS NULL;

SELECT COUNT(*) AS empty_amounts
FROM apex_bank
WHERE amount = '';

ALTER TABLE apex_bank
ADD COLUMN amount_clean DOUBLE;

UPDATE apex_bank
SET amount_clean = CAST(amount AS DOUBLE)
WHERE amount <> '';

UPDATE apex_bank
SET amount_clean = 0
WHERE amount = '';

SELECT COUNT(*) AS amount_clean_nulls
FROM apex_bank
WHERE amount_clean IS NULL;

SELECT COUNT(*) AS zero_amounts
FROM apex_bank
WHERE amount_clean = 0;

SELECT COUNT(*) AS total_rows
FROM apex_bank;

CREATE VIEW apex_bank_cleaned AS
SELECT
    transaction_id,
    customer_id,
    customer_name,
    customer_age,
    customer_gender,
    customer_state,
    phone_number,
    account_number,
    account_type,
    branch,
    transaction_datetime,
    transaction_type,
    channel,
    merchant_category,
    amount_clean AS amount,
    currency,
    balance_after_txn,
    transaction_status,
    device_id,
    ip_address,
    is_fraud_flag,
    fraud_type,
    risk_score
FROM apex_bank;

SELECT *
FROM apex_bank_cleaned
LIMIT 10;

SELECT
COUNT(*) AS blank_datetime
FROM apex_bank
WHERE transaction_datetime IS NULL;

SELECT transaction_date
FROM apex_bank
LIMIT 10;

SELECT transaction_date
FROM apex_bank
WHERE STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i') IS NULL
LIMIT 20;

SELECT
    transaction_date,
    STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i') AS us_format,
    STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i') AS uk_format
FROM apex_bank
LIMIT 20;

SELECT
    transaction_date,
    STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i') AS converted
FROM apex_bank
LIMIT 10;

UPDATE apex_bank
SET transaction_datetime = STR_TO_DATE(
    transaction_date,
    '%m/%d/%Y %H:%i'
);

UPDATE apex_bank
SET transaction_datetime =
COALESCE(
    STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i'),
    STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i')
);

SELECT COUNT(*) AS mmdd_rows
FROM apex_bank
WHERE transaction_date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4} ';

SELECT transaction_date
FROM apex_bank
WHERE CAST(SUBSTRING_INDEX(transaction_date, '/', 1) AS UNSIGNED) > 12
LIMIT 20;

UPDATE apex_bank
SET transaction_datetime = STR_TO_DATE(transaction_date, '%m/%d/%Y %H:%i')
WHERE CAST(SUBSTRING_INDEX(transaction_date, '/', 1) AS UNSIGNED) <= 12;

SELECT COUNT(*) AS blank_datetime
FROM apex_bank
WHERE transaction_datetime IS NULL;

SELECT transaction_id, transaction_date
FROM apex_bank
WHERE transaction_datetime IS NULL;

SELECT transaction_id, transaction_date
FROM apex_bank
WHERE transaction_datetime IS NULL;

SELECT
    transaction_date,
    STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i') AS converted
FROM apex_bank
WHERE transaction_id = 'TXN100111';

UPDATE apex_bank
SET transaction_datetime = STR_TO_DATE(transaction_date, '%d/%m/%Y %H:%i')
WHERE transaction_datetime IS NULL;

SELECT COUNT(*) AS blank_datetime
FROM apex_bank
WHERE transaction_datetime IS NULL;

select * from apex_bank;

SELECT
    merchant_category,
    COUNT(*) AS total
FROM apex_bank
GROUP BY merchant_category
ORDER BY merchant_category;

UPDATE apex_bank
SET merchant_category = 'Not Applicable'
WHERE merchant_category IS NULL
   OR merchant_category = '';
   
   SELECT
    merchant_category,
    COUNT(*) AS total
FROM apex_bank
GROUP BY merchant_category
ORDER BY total DESC;

select * from apex_bank;

-- Fix typo from earlier ABS() update (line 494) - re-run it
UPDATE apex_bank
SET amount = ABS(amount)
WHERE transaction_type = 'Deposit' AND amount < 0;

-- Fix channel blanks (never actually got filled)
SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET channel = 'Unknown'
WHERE channel IS NULL OR TRIM(channel) = '';

-- Fix amount_clean - catch NULLs too, not just empty strings
UPDATE apex_bank
SET amount_clean = CAST(amount AS DOUBLE)
WHERE amount IS NOT NULL AND amount <> '';

UPDATE apex_bank
SET amount_clean = 0
WHERE amount = '' OR amount IS NULL;

SET SQL_SAFE_UPDATES = 1;

-- Verify everything's clean now
SELECT COUNT(*) AS remaining_blank_channel
FROM apex_bank
WHERE channel IS NULL OR TRIM(channel) = '';

SELECT COUNT(*) AS remaining_null_amount_clean
FROM apex_bank
WHERE amount_clean IS NULL;

SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET channel = 'Unknown'
WHERE channel IS NULL OR TRIM(channel) = '';


UPDATE apex_bank
SET amount_clean = CAST(amount AS DOUBLE)
WHERE amount IS NOT NULL AND amount <> '';

UPDATE apex_bank
SET amount_clean = 0
WHERE amount = '' OR amount IS NULL;

SET SQL_SAFE_UPDATES = 1;

SELECT COUNT(*) AS remaining_blank_channel
FROM apex_bank
WHERE channel IS NULL OR TRIM(channel) = '';

SELECT COUNT(*) AS remaining_null_amount_clean
FROM apex_bank
WHERE amount_clean IS NULL;

select * from apex_bank;

SELECT * FROM apex_bank WHERE balance_after_txn < 0 OR balance_after_txn IS NULL;

SELECT transaction_id, COUNT(*) AS dupe_count
FROM apex_bank
GROUP BY transaction_id
HAVING COUNT(*) > 1;

ALTER TABLE apex_bank
DROP COLUMN customer_name,
DROP COLUMN phone_number,
DROP COLUMN account_number,
DROP COLUMN device_id,
DROP COLUMN ip_address,
DROP COLUMN balance_after_txn,
DROP COLUMN merchant_category,
DROP COLUMN transaction_date,
DROP COLUMN transaction_date_backup,
DROP COLUMN age_flag;

SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET risk_score = -1
WHERE risk_score IS NULL;

SET SQL_SAFE_UPDATES = 1;

SELECT
SUM(transaction_datetime IS NULL) AS datetime_nulls,
SUM(channel IS NULL OR TRIM(channel) = '') AS channel_nulls,
SUM(transaction_type IS NULL) AS type_nulls,
SUM(branch IS NULL) AS branch_nulls,
SUM(amount_clean IS NULL) AS amount_nulls,
SUM(fraud_type IS NULL) AS fraud_type_nulls,
SUM(risk_score IS NULL) AS risk_score_nulls,
SUM(is_fraud_flag IS NULL) AS flag_nulls,
SUM(customer_age IS NULL) AS age_nulls,
SUM(customer_gender IS NULL) AS gender_nulls,
SUM(customer_state IS NULL) AS state_nulls,
SUM(account_type IS NULL) AS acct_type_nulls,
SUM(transaction_status IS NULL) AS status_nulls
FROM apex_bank;

select * from apex_bank;

ALTER TABLE apex_bank
ADD COLUMN age_group VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE apex_bank
DROP COLUMN amount;

ALTER TABLE apex_bank
CHANGE COLUMN amount_clean amount DOUBLE;

SELECT amount FROM apex_bank LIMIT 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET customer_age = CASE
    WHEN customer_age IS NULL THEN 'Unknown'
    WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
    WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
    WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
    WHEN customer_age BETWEEN 46 AND 60 THEN '46-60'
    WHEN customer_age > 60 THEN '60+'
END;

SET SQL_SAFE_UPDATES = 1;

SELECT age_group, COUNT(*) FROM apex_bank GROUP BY age_group ORDER BY age_group;

ALTER TABLE apex_bank
ADD COLUMN age_group VARCHAR(20);

ALTER TABLE apex_bank
ADD COLUMN age_group VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE apex_bank
SET age_group = CASE
    WHEN customer_age IS NULL THEN 'Unknown'
    WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
    WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
    WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
    WHEN customer_age BETWEEN 46 AND 60 THEN '46-60'
    WHEN customer_age > 60 THEN '60+'
END;

SET SQL_SAFE_UPDATES = 1;

SELECT age_group, COUNT(*) FROM apex_bank GROUP BY age_group ORDER BY age_group;

select * from apex_bank;

SELECT channel, COUNT(*)
FROM apex_bank
GROUP BY channel
ORDER BY channel;

SELECT DISTINCT account_type FROM apex_bank;

SELECT DISTINCT currency FROM apex_bank;

SELECT DISTINCT transaction_type FROM apex_bank;

SELECT DISTINCT transaction_status FROM apex_bank;

SELECT DISTINCT fraud_type FROM apex_bank;