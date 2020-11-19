DECLARE @FilegroupName SYSNAME
	, @FilesPath VARCHAR(200) = '/var/opt/mssql/data/'

DECLARE FileCreation CURSOR
FOR
(
		SELECT name AS AvailableFilegroups
		FROM sys.filegroups
		WHERE type = 'FG'
			AND name <> 'Primary'
		)

OPEN FileCreation

FETCH NEXT
FROM FileCreation
INTO @FileGroupName

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @CMD NVARCHAR(MAX) = CONCAT (
			'ALTER DATABASE PartitionedData
ADD FILE
(NAME = [Partition'
			, @FileGroupName
			, ']
,FILENAME = '''
			, @FilesPath
			, 'Partition'
			, @FileGroupName
			, '.ndf'') TO FILEGROUP [',@FileGroupName,']'
			)

	EXEC SP_EXECUTESQL @Command1 = @CMD

	FETCH NEXT
	FROM FileCreation
	INTO @FileGroupName
END
