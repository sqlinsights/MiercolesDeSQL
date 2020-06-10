/*
AUTHOR: Carlos D. Serrano
WEBSITE: https://sqlinsights.info
Sample Call: EXEC TableToTemporal @Table2PartName = 'dbo.Table'
https://github.com/sqlinsights/MiercolesDeSQL
*/

CREATE or ALTER PROCEDURE TableToTemporal (@Table2PartName   SYSNAME )
as
BEGIN
    SET NOCOUNT ON;
    DECLARE 
        @TemporalType     INT -- 0:NonTemporal | 1:HistoryTable | 2: SystemVersionedTable
        , @DynamicQueryText NVARCHAR(MAX);

    SET @TemporalType = (
                            SELECT temporal_type
                                FROM sys.tables
                                WHERE
                                object_id = OBJECT_ID(@Table2PartName, 'U')
                        );
    IF @TemporalType IS NULL
    BEGIN
    PRINT 'PROVIDED TABLE NOT FOUND'
    END
    ELSE IF @TemporalType = 0
        BEGIN
            PRINT @Table2PartName + ' is not a temporal table, starting conversion.';
            PRINT 'Checking Required Columns...';
            IF NOT EXISTS (
                            SELECT name
                                FROM sys.columns
                                WHERE
                                object_id = OBJECT_ID(@Table2PartName, 'U')
                                AND name = 'StartTime'
                                AND system_type_id = 42 --DateTime2
                                AND scale = 7
                        )
                BEGIN
                    PRINT '---> Creating StartTime Column';
                    SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' ADD StartTime DATETIME2(7)';
                    EXEC sp_executesql @DynamicQueryText;
                    PRINT '------> Pre-Populating StartTime Column';
                    SET @DynamicQueryText = N'UPDATE ' + @Table2PartName + N' SET StartTime = GetUTCDate()';
                    EXEC sp_executesql @DynamicQueryText;
                    PRINT '---------> Setting StartTime Column as Not-Nullable';
                    SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' ALTER COLUMN StartTime DATETIME2(7) NOT NULL';
                    EXEC sp_executesql @DynamicQueryText;

                END;
            IF NOT EXISTS (
                            SELECT name
                                FROM sys.columns
                                WHERE
                                object_id = OBJECT_ID(@Table2PartName, 'U')
                                AND name = 'EndTime'
                                AND system_type_id = 42 --DateTime2
                                AND scale = 7
                        )
                BEGIN
                    PRINT '---> Creating EndTime Column';
                    SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' ADD EndTime DATETIME2(7)';
                    EXEC sp_executesql @DynamicQueryText;
                    PRINT '------> Pre-Populating EndTime Column';
                    SET @DynamicQueryText = N'UPDATE ' + @Table2PartName + N' SET EndTime = ''9999-12-31 23:59:59.9999999''';
                    EXEC sp_executesql @DynamicQueryText;
                    PRINT '---------> Setting EndTime Column as Not-Nullable';
                    SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' ALTER COLUMN EndTime DATETIME2(7) NOT NULL';
                    EXEC sp_executesql @DynamicQueryText;

                END;
            PRINT 'Required Columns Added/Verified';
            PRINT 'Creating Period for System Time at :' + @Table2PartName;
            SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' ADD PERIOD FOR SYSTEM_TIME (StartTime, EndTime)';
            EXEC sp_executesql @DynamicQueryText;
            PRINT 'Converting ' + @Table2PartName + ' to Temporal...';
            SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = ' + @Table2PartName + N'_History, DATA_CONSISTENCY_CHECK = ON))';
            EXEC sp_executesql @DynamicQueryText;
            PRINT '---> Setting StartTime Column as Hidden';
            SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' ALTER COLUMN StartTime ADD HIDDEN';
            EXEC sp_executesql @DynamicQueryText;
            PRINT '---> Setting EndTime Column as Hidden';
            SET @DynamicQueryText = N'ALTER TABLE ' + @Table2PartName + N' ALTER COLUMN EndTime ADD HIDDEN';
            EXEC sp_executesql @DynamicQueryText;
            PRINT 'Process Completed';
        END;
    ELSE
        PRINT @Table2PartName + ' Is not a candidate for Temporal Table Conversion';
END
