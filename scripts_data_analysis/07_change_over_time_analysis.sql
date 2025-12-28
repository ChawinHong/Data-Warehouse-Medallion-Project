-- Change over time analysis (Time series analysis)

SELECT
	YEAR(order_date) AS order_month 
	,MONTH(order_date) AS order_month
	,SUM(sales_amount) AS total_sales
	,COUNT(DISTINCT customer_key) as total_customers
	,SUM(quantity) as total_quantity

FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)


SELECT
	DATETRUNC(month,order_date) AS order_month 

	,SUM(sales_amount) AS total_sales
	,COUNT(DISTINCT customer_key) as total_customers
	,SUM(quantity) as total_quantity

FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)
ORDER BY DATETRUNC(month,order_date)


SELECT
	FORMAT(order_date,'yyyy-MMM') AS order_month 
	,SUM(sales_amount) AS total_sales
	,COUNT(DISTINCT customer_key) as total_customers
	,SUM(quantity) as total_quantity

FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date,'yyyy-MMM')
ORDER BY FORMAT(order_date,'yyyy-MMM') -- The output is not sorted correctly if using this syntax.
