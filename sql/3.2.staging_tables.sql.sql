CREATE TABLE stg_products AS 

SELECT 
	product_id,
    LOWER(product_category_name) AS product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm   
  FROM raw_products;
  
  -- Validate
  
  SELECT *
  FROM stg_products
  LIMIT 10;
  
SELECT *
FROM raw_products
LIMIT 10;

DROP TABLE stg_products;

CREATE TABLE stg_products AS

SELECT
    product_id,
    LOWER(product_category_name) AS product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM raw_products;

--Validate

SELECT *
FROM stg_products
LIMIT 10;