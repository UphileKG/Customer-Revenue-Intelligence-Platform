CREATE TABLE stg_customers AS 

SELECT 
	customer_id, 
	customer_unique_id,
	customer_zip_code_prefix,
	LOWER(customer_city) AS customer_city,
	UPPER(customer_state) AS customer_state
FROM raw_customers;

-- Validation

SELECT *
FROM stg_customers
LIMIT 10;