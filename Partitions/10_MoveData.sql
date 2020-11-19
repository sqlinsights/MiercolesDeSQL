SET IDENTITY_INSERT dbo.Sales ON

INSERT INTO dbo.Sales (
	SalesID
	, SalesUniqueID
	, OrderDate
	, SellerID
	, CompanyID
	)
SELECT SalesOrderID
	, SalesUniqueID
	, OrderDate
	, SellerID
	, CompanyID
FROM SalesOrder

SET IDENTITY_INSERT dbo.Sales OFF

