SET STATISTICS IO
	, TIME ON

SELECT *
FROM SalesOrder
WHERE SellerID = 12
	AND OrderDate BETWEEN '2016-01-01' AND '2016-12-31'


