SELECT $PARTITION.SalesPartitionByYear(OrderDate)
	, COUNT(1) AS Rows
FROM Sales SO
GROUP BY ROLLUP($PARTITION.SalesPartitionByYear(OrderDate))
ORDER BY $PARTITION.SalesPartitionByYear(OrderDate)


