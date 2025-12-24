-- Foreign Key integrity (Dimensions)
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key

LEFT JOIN gold.dim_products p
ON  f.product_key = p.product_key

WHERE p.product_key IS NULL

