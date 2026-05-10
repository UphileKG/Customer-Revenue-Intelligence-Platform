CREATE TABLE customer_retention AS 

SELECT
	customer_id,
	total_orders,
	first_order_date,
	last_order_date,
	CASE
		WHEN total_orders = 1 THEN 'one_time'
		ELSE 'repeat'
	END AS customer_type
FROM customer_metrics;

--Validate

SELECT *
FROM customer_retention
LIMIT 10;

--Segments Check

SELECT 
	customer_type,
	COUNT(*) AS customer_count
FROM customer_retention
GROUP BY customer_type;

--Customer lifetime days

ALTER TABLE customer_retention
ADD COLUMN customer_lifetime_days INTEGER;

UPDATE customer_retention
SET customer_lifetime_days = 
	JULIANDAY(last_order_date) - JULIANDAY(first_order_date);

--Validate

SELECT *
FROM customer_retention
LIMIT 10;

--Churned customers

SELECT 
	COUNT(*) AS potential_churned_customers
FROM customer_retention
WHERE customer_lifetime_days <= 0
AND customer_type = 'one_time';

	