# Temporal Tables (System Versioned)

## ¿Que son?
Temporal Tables son un tipo de tablas que contiene una tabla historica y un periodo de version que nos permite crear un registro de auditoria en una tabla adicional de los cambios que ocurran a los datos. 

---
## Ventajas
- Auditoria Automática
- No necesita Triggers
- Cambios DDL se replican automaticamente
- Soporte para Always On y Change Data Capture (Solo en la principal) 

## Desventajas
- Mayor requerimiento de espacio
- Dificulta ciertas operaciones DDL

## Limitaciones
- Vistas Indexadas no son permitidas
- No pueden ser utilizadas para File Table o File Stream
- No Graph Tables
- CASCADE no es una opcion
- INSTEAD OF Triggers no son permitidos
- AFTER Triggers solo son permitidos en la tabla principal
- Objetos no creados en la tabla historica:
    - Period definition
    - Identity definition
    - Indexes
    - Statistics
    - Check constraints
    - Triggers
    - Partitioning configuration
    - Permissions
    - Row-level security predicates




