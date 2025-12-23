/*
======================================================================================
Quality Checks
======================================================================================
Script Purpose:
  - Perform various quality checks for data consistency, accuracy, and standardization
    across the 'silver' schemas
  - Quality Check includes:
      - Null or duplicate primary keys
      - Unwanted spaces in string fields
      - Data standardization and consistency
      - Invalid date ranges and orders
      - Data consistency between related fields

Usage:
  - Run these queries after loading data into the silver layer
  - Investigate and resolve any discrepancies found during the check
======================================================================================
*/

-- ===========================================================================
-- Checking silver.crm_cust_info
-- ===========================================================================
--Check for null or dublicates in primary keys
-- Expectation: No Result
SELECT cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING count(*)> 1 
	OR cst_id IS NULL

	
-- Check for unwated spaces
-- Expectation: No results

SELECT cst_firstname
FROM silver.crm_cust_info
where cst_firstname != TRIM(cst_firstname)

-- Data standardization & consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

SELECT *
FROM silver.crm_cust_info

-- ===========================================================================
-- Checking silver.crm_prd_info
-- ===========================================================================
-- Check for null or duplicates in primary key
-- Expectation: No result

SELECT
	prd_id,
	count(*)
FROM silver.crm_prd_info
GROUP BY prd_id
having count(*) > 1 and prd_id IS NULL

-- Check for unwanted spaces
-- Expectation: No results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for nulls or negative numbers
-- Expectation: No results

SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost is null or prd_cost < 0

--Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- Check for invalid date orders
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt


SELECT *
FROM silver.crm_prd_info
-- ===========================================================================
-- Checking silver.crm_sales_details
-- ===========================================================================

-- Check for invalid date orders
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
	OR sls_order_dt > sls_due_dt

-- Check data consistency: Between sales, quantity and price
-- >> Sales = Quantity * Price
-- >> Values must not be Null, zero or negative

SELECT 
	sls_sales ,
	sls_quantity,
	sls_price 

FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
	OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
	OR sls_sales <= 0 OR sls_quantity  <= 0 OR sls_price  <= 0
ORDER BY sls_sales, sls_quantity, sls_price

-- Check overall
SELECT * FROM silver.crm_sales_details
  
-- ===========================================================================
-- Checking silver.erp_cust_az12
-- ===========================================================================
-- Identify Out-of-Range Dates

SELECT distinct bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' or bdate > GETDATE() or bdate is null

--Data Standardization & Consistency

SELECT DISTINCT gen
FROM silver.erp_cust_az12

-- Check overall
SELECT * FROM silver.erp_cust_az12

-- ===========================================================================
-- Checking silver.erp_loc_a101
-- ===========================================================================
-- Data Standardization & Consistency
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry

-- Check overall
SELECT * FROM silver.erp_loc_a101
  
-- ===========================================================================
-- Checking silver.erp_px_cat_g1v2
-- ===========================================================================

-- Check overall
SELECT *
FROM silver.erp_px_cat_g1v2

