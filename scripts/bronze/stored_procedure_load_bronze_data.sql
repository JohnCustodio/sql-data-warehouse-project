-- ===================================================================
-- Stored Procedure: load_bronze_data
-- ===================================================================
-- Purpose:
--   Loads data from CSV files into the bronze layer tables.
--   - Truncates tables before load.
--   - Uses COPY for bulk insert from CSV.
--   - Logs progress and duration.
-- ===================================================================

CREATE OR REPLACE PROCEDURE bronze.load_bronze_data()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
BEGIN
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Starting Bronze Layer Data Load';
    RAISE NOTICE '================================================';

    -- CRM TABLES -----------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------------------------';

    -- bronze.crm_cust_info
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating bronze.crm_cust_info...';
    TRUNCATE TABLE bronze.crm_cust_info;
    RAISE NOTICE '>> Loading data from /data/csvs/cust_info.csv...';
    COPY bronze.crm_cust_info
    FROM '/data/csvs/cust_info.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load duration: % seconds', EXTRACT(epoch FROM (end_time - start_time));

    -- bronze.crm_prd_info
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating bronze.crm_prd_info...';
    TRUNCATE TABLE bronze.crm_prd_info;
    RAISE NOTICE '>> Loading data from /data/csvs/prd_info.csv...';
    COPY bronze.crm_prd_info
    FROM '/data/csvs/prd_info.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load duration: % seconds', EXTRACT(epoch FROM (end_time - start_time));

    -- bronze.crm_sales_details
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating bronze.crm_sales_details...';
    TRUNCATE TABLE bronze.crm_sales_details;
    RAISE NOTICE '>> Loading data from /data/csvs/sales_details.csv...';
    COPY bronze.crm_sales_details
    FROM '/data/csvs/sales_details.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load duration: % seconds', EXTRACT(epoch FROM (end_time - start_time));

    -- ERP TABLES -----------------------------------------------------
    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------------------------';

    -- bronze.erp_loc_a101
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating bronze.erp_loc_a101...';
    TRUNCATE TABLE bronze.erp_loc_a101;
    RAISE NOTICE '>> Loading data from /data/csvs/loc_a101.csv...';
    COPY bronze.erp_loc_a101
    FROM '/data/csvs/loc_a101.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load duration: % seconds', EXTRACT(epoch FROM (end_time - start_time));

    -- bronze.erp_cust_az12
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating bronze.erp_cust_az12...';
    TRUNCATE TABLE bronze.erp_cust_az12;
    RAISE NOTICE '>> Loading data from /data/csvs/cust_az12.csv...';
    COPY bronze.erp_cust_az12
    FROM '/data/csvs/cust_az12.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load duration: % seconds', EXTRACT(epoch FROM (end_time - start_time));

    -- bronze.erp_px_cat_g1v2
    start_time := clock_timestamp();
    RAISE NOTICE '>> Truncating bronze.erp_px_cat_g1v2...';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    RAISE NOTICE '>> Loading data from /data/csvs/px_cat_g1v2.csv...';
    COPY bronze.erp_px_cat_g1v2
    FROM '/data/csvs/px_cat_g1v2.csv'
    WITH (FORMAT csv, HEADER true);
    end_time := clock_timestamp();
    RAISE NOTICE '>> Load duration: % seconds', EXTRACT(epoch FROM (end_time - start_time));

    RAISE NOTICE '==========================================';
    RAISE NOTICE 'All Bronze Tables Loaded Successfully!';
    RAISE NOTICE '==========================================';
END;
$$;

-- =====================================================================

CALL bronze.load_bronze_data();

