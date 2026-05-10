CREATE TABLE stg_order_payments AS 

SELECT
	order_id,
	payment_sequential,
	payment_type,
	payment_installments,
	payment_value
FROM raw_order_payments;

-- Validate

SELECT *
FROM stg_order_payments
LIMIT 10;