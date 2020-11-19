DECLARE @CompanyFoundedDate DATE = '2009-02-10'
DECLARE @DaysToToday INT = DATEDIFF(DAY, @CompanyFoundedDate, GetDate())
DECLARE @LoopStep INT = 1
		,@LoopTotal int = 100000

WHILE @LoopStep <= @LoopTotal
BEGIN
INSERT INTO dbo.SalesOrder (
	  OrderDate
	, SellerID
	, CompanyID
	)
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NewId())) % @DaysToToday, @CompanyFoundedDate)
	, ABS(CHECKSUM(NewId())) % 25
	, ABS(CHECKSUM(NewId())) % 1000
	set @LoopStep = @LoopStep +1
END


