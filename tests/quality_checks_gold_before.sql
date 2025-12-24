
SELECT distinct
      ci.cst_gndr
	  ,ca.gen
	  ,CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr --CRM is the master for gender infor
			ELSE COALESCE(ca.gen,'n/a') END AS new_gen
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
	ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 AS la
	ON ci.cst_key = la.cid
order by 1,2

