/*
===============================================================================
QUALITY CHECKS - Gold Layer
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency, and accuracy of the Gold Layer. 
	These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- 1. CHECKING 'gold.dim_customers'.
-- ====================================================================
-- Check for Uniqueness of Customer Key in gold.dim_customers.
-- Expectation: No results.
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- 2. CHECKING 'gold.dim_products'.
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_products.
-- Expectation: No results. 
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- 3. Checking 'gold.fact_sales'.
-- ====================================================================
-- Check the data model connectivity between fact and dimensions.

SELECT * FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL;

