CREATE TABLE stg_order_items AS 

SELECT 
	order_id,
	order_item_id,
	product_id,
	seller_id,
	shipping_limit_date,
	price,
	freight_value
FROM raw_order_items;

-- Validate

SELECT *
FROM stg_order_items
LIMIT 10;
	