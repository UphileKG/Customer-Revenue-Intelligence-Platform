CREATE TABLE dim_products AS 

SELECT DISTINCT 
	product_id,
	product_category_name,
	product_weight_g,
	product_length_cm,
	product_height_cm,
	product_width_cm
FROM stg_products;

--Validate

SELECT *
FROM dim_products
LIMIT 10;


	