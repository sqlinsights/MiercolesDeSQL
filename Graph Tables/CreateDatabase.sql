CREATE DATABASE Graph2019
ON
PRIMARY
    (NAME = Graph2019_Data,
    FILENAME = '/var/opt/mssql/data/Graph2019_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20)
LOG ON
  (NAME = Graph2019_Log,
    FILENAME = '/var/opt/mssql/data/Graph2019_Log.ldf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20)
GO
