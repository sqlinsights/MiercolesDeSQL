CREATE TABLE dbo.SalesOrder (
	SalesOrderID INT IDENTITY(1, 1) CONSTRAINT PK_SalesOrder_SalesOrderID PRIMARY KEY
	, SalesUniqueID UNIQUEIDENTIFIER CONSTRAINT DF_SalesOrder_SalesUniqueID DEFAULT NEWID()
	, OrderDate DATE
	, SellerID INT
    , CompanyID INT
	)