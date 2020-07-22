CREATE OR ALTER PROC InsertVias (
    @From VARCHAR(100)
    , @To VARCHAR(100)
    , @FromAbb VARCHAR(10)
    , @ToAbb VARCHAR(10)
    , @Color VARCHAR(20)
    , @Distance INT
    )
AS
BEGIN
    DECLARE @FromNode NVARCHAR(1000)
        , @ToNode NVARCHAR(1000)

    SET @FromNode = (
            SELECT $NODE_ID
            FROM Stations
            WHERE StationName = @From
            )
    SET @ToNode = (
            SELECT $NODE_ID
            FROM Stations
            WHERE StationName = @To
            )

    INSERT INTO Vias
    VALUES (
        @FromNode
        , @ToNode
        , CONCAT_WS('-', @FromAbb, @ToAbb)
        , @Color
        , @Distance
        )
        , (
        @ToNode
        , @FromNode
        , CONCAT_WS('-', @ToAbb, @FromAbb)
        , @Color
        , @Distance
        )
END


SELECT * FROM Stations

SELECT * FROM Vias