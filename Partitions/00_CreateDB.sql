CREATE DATABASE PartitionedData ON (
	NAME = PartitionedData_DATA
	, FILENAME = '/var/opt/mssql/data/PartitionedData_DATA.mdf'
	, SIZE = 10
	, MAXSIZE = 500 MB
	, FILEGROWTH = 5
	) LOG ON (
	NAME = PartitionedData_LOG
	, FILENAME = '/var/opt/mssql/data/PartitionedData_LOG.ldf'
	, SIZE = 5 MB
	, MAXSIZE = 1 GB
	, FILEGROWTH = 5 MB
	);


