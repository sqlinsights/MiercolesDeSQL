# Partes de una Tabla Temporal

## Ejemplo de Creación
``` SQL
CREATE TABLE dbo.Temporal
(
  TemporalID    INT NOT NULL IDENTITY(1,1) PRIMARY KEY
, FirstName     VARCHAR(100) NOT NULL
, LastName      VARCHAR(100) NOT NULL
, StartTime     DATETIME2(7) GENERATED ALWAYS AS ROW START HIDDEN 
, EndTime       DATETIME2(7) GENERATED ALWAYS AS ROW END HIDDEN
, PERIOD FOR SYSTEM_TIME ([StartTime], [EndTime])
)
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = dbo.TemporalHistory )
)
```

## Partes

> Creación incial regular.
``` 
CREATE TABLE dbo.Temporal
(
  TemporalID    INT NOT NULL IDENTITY(1,1) PRIMARY KEY
, FirstName     VARCHAR(100) NOT NULL
, LastName      VARCHAR(100) NOT NULL
```
> Columnas para version (Read-Only)
``` 
, StartTime     DATETIME2(7) GENERATED ALWAYS AS ROW START HIDDEN 
, EndTime       DATETIME2(7) GENERATED ALWAYS AS ROW END HIDDEN
```
> Periodo (Funcionalidad que utiliza las columnas de version para definir el periodo en el cual el estado de los datos existió

``` 
, PERIOD FOR SYSTEM_TIME ([StartTime], [EndTime])
```
> clausula WITH para encender el versionamiento

```
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = dbo.TemporalHistory )
)
```