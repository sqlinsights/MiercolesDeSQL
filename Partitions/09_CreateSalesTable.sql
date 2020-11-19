CREATE TABLE dbo.Sales (
	SalesID INT IDENTITY(1, 1) NOT NULL
	, SalesUniqueID UNIQUEIDENTIFIER CONSTRAINT DF_Sales_SalesUniqueID DEFAULT NEWID()
	, OrderDate DATE NOT NULL
	, SellerID INT
    , CompanyID INT
    , CONSTRAINT PK_Sales_SalesOrderID PRIMARY KEY (SalesID, OrderDate)
	) ON SalesDataScheme(OrderDate)