CREATE TABLE stg_orders AS 

SELECT 
	order_id,
	customer_id,
	LOWER(order_status) AS order_status, 
	DATE(order_purchase_timestamp) AS order_purchase_date,
	DATE(order_approved_at) AS order_approved_date,
	DATE(order_delivered_customer_date) AS delivered_date
FROM raw_orders; 

-- Validation

SELECT *
FROM stg_orders
LIMIT 10; 

