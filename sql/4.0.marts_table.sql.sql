CREATE TABLE dim_customers AS 

SELECT DISTINCT
	customer_id,
	customer_unique_id,
	customer_city,
	customer_state
FROM stg_customers;

-- Validate

SELECT *
FROM dim_customers
LIMIT 10;

SELECT COUNT (*)
FROM dim_customers;
