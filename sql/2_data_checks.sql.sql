--Null Customers checks-- 

SELECT COUNT (*) AS null_customer_ids
FROM raw_orders ro 
WHERE customer_id IS NULL;

--Duplicate IDs--

SELECT 
    order_id,
    COUNT(*) AS duplicate_count
FROM raw_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

--Negative or zero payments

SELECT COUNT(*) AS invalid_payments
FROM raw_order_payments
WHERE payment_value <= 0;

--Missing Product categories

SELECT COUNT(*) AS missing_categories
FROM raw_products
WHERE product_category_name IS NULL;

