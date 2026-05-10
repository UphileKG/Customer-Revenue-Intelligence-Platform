CREATE TABLE customer_metrics AS 

SELECT 
o.customer_id,
COUNT(DISTINCT o.order_id) AS total_orders,
ROUND(SUM(op.payment_value), 2) AS total_revenue,
ROUND(
	SUM(op.payment_value) * 1.0
        / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value,
    MIN(o.order_purchase_date) AS first_order_date,
    MAX(o.order_purchase_date) AS last_order_date
FROM stg_orders o 
LEFT JOIN stg_order_payments op
    ON o.order_id = op.order_id
GROUP BY o.customer_id;

--Validate

SELECT *
FROM customer_metrics
LIMIT 10;

SELECT COUNT(*)
FROM customer_metrics;

--PURCHASE 

ALTER TABLE customer_metrics
ADD COLUMN purchase_frequency REAL;

UPDATE customer_metrics
SET purchase_frequency = ROUND(
total_orders * 1.0,
2
);

SELECT *
FROM customer_metrics
LIMIT 10;