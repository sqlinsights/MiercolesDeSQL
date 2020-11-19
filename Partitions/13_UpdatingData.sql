SELECT $PARTITION.SalesPartitionByYear(OrderDate) as PartitionNumber
	, COUNT(1) AS Rows
INTO #FileGroupsSize
FROM Sales SO
GROUP BY $PARTITION.SalesPartitionByYear(OrderDate)
ORDER BY $PARTITION.SalesPartitionByYear(OrderDate)

select * from #FileGroupsSize

--Get a Value
Select top 1 * from Sales where YEAR(OrderDate) = 2009

--Update
Update Sales set OrderDate = DATEADD(YEAR,1,OrderDate) where SalesID = 1
-- Check Partition
SELECT TOP 1 *
	, $PARTITION.SalesPartitionByYear(OrderDate)
FROM Sales
WHERE SalesID = 1

--Compare Counts
;with Counts as (
SELECT $PARTITION.SalesPartitionByYear(OrderDate) PartitionNumber
	, COUNT(1) AS Rows

FROM Sales SO 
GROUP BY $PARTITION.SalesPartitionByYear(OrderDate)
) Select Counts.*, FGS.Rows as PreviousValue from Counts 
join #FileGroupsSize FGS on FGS.PartitionNumber = Counts.PartitionNumber
order by PartitionNumber
