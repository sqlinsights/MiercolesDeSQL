EXECUTE [dbo].[InsertVias] @From = 'FAJARDO'
    , @To = 'SAN JUAN'
    , @FromAbb = 'FJ'
    , @ToAbb = 'SJ'
    , @Color = 'RED'
    , @Distance = 29

EXECUTE [dbo].[InsertVias] @From = 'SAN JUAN'
    , @To = 'ARECIBO'
    , @FromAbb = 'SJ'
    , @ToAbb = 'AR'
    , @Color = 'RED'
    , @Distance = 42

EXECUTE [dbo].[InsertVias] @From = 'ARECIBO'
    , @To = 'AGUADILLA'
    , @FromAbb = 'AR'
    , @ToAbb = 'AG'
    , @Color = 'RED'
    , @Distance = 35

EXECUTE [dbo].[InsertVias] @From = 'AGUADILLA'
    , @To = 'CABO ROJO'
    , @FromAbb = 'AG'
    , @ToAbb = 'CB'
    , @Color = 'RED'
    , @Distance = 37

EXECUTE [dbo].[InsertVias] @From = 'CABO ROJO'
    , @To = 'PONCE'
    , @FromAbb = 'CB'
    , @ToAbb = 'PC'
    , @Color = 'RED'
    , @Distance = 34

EXECUTE [dbo].[InsertVias] @From = 'PONCE'
    , @To = 'SALINAS'
    , @FromAbb = 'PC'
    , @ToAbb = 'SL'
    , @Color = 'RED'
    , @Distance = 28


EXECUTE [dbo].[InsertVias] @From = 'SALINAS'
    , @To = 'FAJARDO'
    , @FromAbb = 'SL'
    , @ToAbb = 'FJ'
    , @Color = 'RED'
    , @Distance = 52

EXECUTE [dbo].[InsertVias] @From = 'SALINAS'
    , @To = 'OROCOVIS'
    , @FromAbb = 'SL'
    , @ToAbb = 'OC'
    , @Color = 'PURPLE'
    , @Distance = 21


EXECUTE [dbo].[InsertVias] @From = 'OROCOVIS'
    , @To = 'ADJUNTAS'
    , @FromAbb = 'OC'
    , @ToAbb = 'AD'
    , @Color = 'PURPLE'
    , @Distance = 24

EXECUTE [dbo].[InsertVias] @From = 'ADJUNTAS'
    , @To = 'PONCE'
    , @FromAbb = 'AD'
    , @ToAbb = 'PC'
    , @Color = 'PURPLE'
    , @Distance = 17

EXECUTE [dbo].[InsertVias] @From = 'ARECIBO'
    , @To = 'PONCE'
    , @FromAbb = 'AR'
    , @ToAbb = 'PC'
    , @Color = 'YELLOW'
    , @Distance = 29

EXECUTE [dbo].[InsertVias] @From = 'ARECIBO'
    , @To = 'ADJUNTAS'
    , @FromAbb = 'AR'
    , @ToAbb = 'AD'
    , @Color = 'GREEN'
    , @Distance = 23

EXECUTE [dbo].[InsertVias] @From = 'ARECIBO'
    , @To = 'OROCOVIS'
    , @FromAbb = 'AR'
    , @ToAbb = 'OC'
    , @Color = 'GREEN'
    , @Distance = 23


EXECUTE [dbo].[InsertVias] @From = 'SAN JUAN'
    , @To = 'SALINAS'
    , @FromAbb = 'SJ'
    , @ToAbb = 'SL'
    , @Color = 'YELLOW'
    , @Distance = 40


