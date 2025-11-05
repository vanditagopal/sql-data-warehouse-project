/*SQL scripts to insert the data in the table*/

EXEC bronze.load_bronze;
CREATE OR ALTER  PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time  DATETIME ,@end_time DATETIME,@start_batchtime DATETIME,@end_batchtime DATETIME;
	BEGIN TRY

		SET @start_batchtime=GETDATE();
		PRINT '==========================';
		PRINT 'Loading the Bronze Layer';
		PRINT '==========================';

		PRINT '--------------------------';
		PRINT 'Loading the CRM tables ';
		PRINT '--------------------------';
		SET @start_time=GETDATE();
		PRINT '>>Truncating table :bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>>Inserting data :bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH
		(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Load Duration:'+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		PRINT '--------------------------';
		SET @start_time=GETDATE();
		PRINT '>>Truncating table :bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>>Inserting data :bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH
		(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Load Duration:'+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		PRINT '--------------------------';
		SET @start_time=GETDATE();
		PRINT '>>Truncating table :bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>>Inserting data :bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH
		(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Load Duration:'+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		PRINT '--------------------------';
		PRINT '--------------------------';
		PRINT 'Loading the ERP tables';
		PRINT '--------------------------';
		SET @start_time=GETDATE();
		PRINT '>>Truncating table :bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>>Inserting data :bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH
		(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Load Duration:'+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		PRINT '--------------------------';
		SET @start_time=GETDATE();
		PRINT '>>Truncating table :bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>>Inserting data :bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH
		(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Load Duration:'+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		PRINT '--------------------------';
		SET @start_time=GETDATE();
		PRINT '>>Truncating table :bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>>Inserting data :bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH
		(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT 'Load Duration:'+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		PRINT '--------------------------';

		SET @end_batchtime=GETDATE();
		PRINT '--------------------------';
		PRINT 'Load Completed';
		PRINT '--------------------------';
		PRINT 'Total Load Duration:'+CAST(DATEDIFF(second,@start_batchtime,@end_batchtime) AS NVARCHAR) +'seconds';

	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR_MESSAGE'+ ERROR_MESSAGE();
	END CATCH
END;

