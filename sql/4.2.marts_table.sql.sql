CREATE TABLE fact_orders AS

SELECT
    oi.order_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,
    o.order_purchase_date,
    o.order_status,
    op.payment_type,
    op.payment_value,
    oi.price,
    oi.freight_value

FROM stg_order_items oi
LEFT JOIN stg_orders o
    ON oi.order_id = o.order_id
LEFT JOIN stg_order_payments op
    ON oi.order_id = op.order_id;

--Validate

SELECT *
FROM fact_orders
LIMIT 10;

SELECT COUNT (*)
FROM fact_orders;

--Dupe check

SELECT
    order_id,
    COUNT(*) AS row_count
FROM fact_orders
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY row_count DESC;

