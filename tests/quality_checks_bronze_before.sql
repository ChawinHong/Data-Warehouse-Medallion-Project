/*
======================================================================================
Quality Checks
======================================================================================
Script Purpose:
  - Perform various quality checks for data consistency, accuracy, and standardization
    across the 'bronze' schemas
  - Quality Check includes:
      - Null or duplicate primary keys
      - Unwanted spaces in string fields
      - Data standardization and consistency
      - Invalid date ranges and orders
      - Data consistency between related fields

Usage:
  - Run these queries after before transforming data and load into silver layer
  - Investigate and identify transformation needed
======================================================================================
*/

-- ===========================================================================
-- Checking bronze.crm_cust_info
-- ===========================================================================

--Check for null or dublicates in primary keys
-- Expectation: No Result

SELECT cst_id,
	COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING count(*)> 1 
	OR cst_id IS NULL

	
-- Check for unwated spaces
-- Expectation: No results

SELECT cst_firstname
FROM bronze.crm_cust_info
where cst_firstname != TRIM(cst_firstname)

-- Data standardization & consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info

SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info
  
-- ===========================================================================
-- Checking bronze.crm_prd_info
-- ===========================================================================
  
-- Check for null or duplicates in primary key
-- Expectation: No result

SELECT
	prd_id,
	count(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
having count(*) > 1 and prd_id IS NULL

-- Check for unwanted spaces
-- Expectation: No results
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for nulls or negative numbers
-- Expectation: No results

SELECT prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost is null or prd_cost < 0

--Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM bronze.crm_prd_info

-- Check for invalid date orders
SELECT *
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt
  
-- ===========================================================================
-- Checking bronze.crm_sales_details
-- ===========================================================================
  
-- Check for invalid dates

SELECT 
	NULLIF(sls_due_dt,0) AS sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0
	OR LEN(NULLIF(sls_due_dt,0)) != 8
	OR sls_due_dt > 20500101
	OR sls_due_dt < 19000101


-- Check for invalid date orders
SELECT *
FROM bronze.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
	OR sls_order_dt > sls_due_dt

-- Check data consistency: Between sales, quantity and price
-- >> Sales = Quantity * Price
-- >> Values must not be Null, zero or negative

SELECT 
	--sls_sales as old_sls_sales,
	sls_quantity,
	--sls_price as old_sls_price,

	CASE WHEN sls_sales IS NULL or sls_sales <=0 OR sls_sales != sls_quantity* ABS(sls_price)
		THEN sls_quantity * ABS(sls_price)
		ELSE sls_sales END AS sls_sales,

	CASE WHEN sls_price IS NULL or sls_price <= 0 
		THEN sls_sales/ NULLIF(sls_quantity, 0)
		ELSE sls_price END AS sls_price

FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
	OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
	OR sls_sales <= 0 OR sls_quantity  <= 0 OR sls_price  <= 0
ORDER BY sls_sales, sls_quantity, sls_price
  
-- ===========================================================================
-- Checking bronze.erp_cust_az12
-- ===========================================================================
-- Identify Out-of-Range Dates

SELECT DISTINCT bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' or bdate > GETDATE()

--Data Standardization & Consistency

SELECT DISTINCT gen,
CASE WHEN Upper(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
		WHEN Upper(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
		ELSE 'n/a' END AS gen
FROM bronze.erp_cust_az12


-- ===========================================================================
-- Checking bronze.erp_loc_a101
-- ===========================================================================
  
-- Data Standardization & Consistency
SELECT DISTINCT cntry as old_cntry,
	CASE WHEN TRIM(cntry) IN ('DE') THEN 'Germany'
		WHEN TRIM(cntry) IN ('US','USA') THEN 'United States'
		WHEN TRIM(cntry) = '' OR cntry is NUll THEN 'n/a'
		ELSE TRIM(cntry) END AS cntry
FROM bronze.erp_loc_a101
ORDER BY cntry

-- ===========================================================================
-- Checking bronze.erp_px_cat_g1v2
-- ===========================================================================

-- Check for unwanted spaces
SELECT *
FROM bronze.erp_px_cat_g1v2
Where cat != TRIM(cat)
	OR subcat != TRIM(subcat)
	OR maintenance != TRIM(maintenance)

-- Data Standardizaion & Consistency
SELECT DISTINCT maintenance
FROM bronze.erp_px_cat_g1v2

