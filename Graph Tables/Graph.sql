
CREATE  TABLE Person (
		PersonID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	 , FirstName VARCHAR(100)
	, LastName VARCHAR(100)
	) as NODE


select * from person
    INSERT INTO Person
    (
        FirstName, LastName
    )
    VALUES
    ('Carlos','Serrano')
    ,('Jose','Perez')
    ,('Maria','Rodriguez')
    ,('Luis','Ortiz')
    ,('Wanda','Ortega')
    ,('Jessica','Gomez')

CREATE TABLE FriendOf (
	  PersonID INT
	, FriendID INT
	) as EDGE

INSERT INTO FriendOf
SELECT (SELECT $node_id from Person WHERE PersonID = 1),(SELECT $node_id from Person WHERE PersonID = 5),1,5
UNION 
SELECT (SELECT $node_id from Person WHERE PersonID = 5),(SELECT $node_id from Person WHERE PersonID = 1),5,1 --Carlos > Wanda
UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 1),(SELECT $node_id from Person WHERE PersonID = 6),1,6
UNION 
SELECT (SELECT $node_id from Person WHERE PersonID = 6),(SELECT $node_id from Person WHERE PersonID = 1),6,1 --Carlos > Jessica
UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 4),(SELECT $node_id from Person WHERE PersonID = 6),4,6
UNION 
SELECT (SELECT $node_id from Person WHERE PersonID = 6),(SELECT $node_id from Person WHERE PersonID = 4),6,4 --Luis > Jessica
UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 5),(SELECT $node_id from Person WHERE PersonID = 2),5,2
UNION 
SELECT (SELECT $node_id from Person WHERE PersonID = 2),(SELECT $node_id from Person WHERE PersonID = 5),2,5--Wanda > Jose
UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 2),(SELECT $node_id from Person WHERE PersonID = 3),2,3
UNION 
SELECT (SELECT $node_id from Person WHERE PersonID = 3),(SELECT $node_id from Person WHERE PersonID = 3),3,2--Jose > Maria
UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 5),(SELECT $node_id from Person WHERE PersonID = 3),5,3
UNION 
SELECT (SELECT $node_id from Person WHERE PersonID = 3),(SELECT $node_id from Person WHERE PersonID = 5),3,5--Wanda > Maria


CREATE TABLE Restaurant (
	RestaurantID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, RestaurantName VARCHAR(100)
	) AS NODE
INSERT INTO Restaurant
(
RestaurantName
)
VALUES
('Jimmy''s Cafe'),('The Lounge'),('La Cocina Puertorriqueña'),('Sake Japan')

select * from Restaurant



CREATE TABLE RestaurantPersonVisit (
	RestaurantPersonVisitID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, RestaurantID INT
	, PersonID INT
	, VisitDate DATE
	) AS EDGE

INSERT INTO RestaurantPersonVisit
SELECT (SELECT $node_id from Person WHERE PersonID = 1),(SELECT $node_id from Restaurant WHERE RestaurantID = 1), 1,1,'2019/02/15' UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 5),(SELECT $node_id from Restaurant WHERE RestaurantID = 2), 2,5,'2019/09/30' UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 3),(SELECT $node_id from Restaurant WHERE RestaurantID = 3), 3,3,'2019/08/18' UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 6),(SELECT $node_id from Restaurant WHERE RestaurantID = 4),4,6,'2020/01/23'  UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 2),(SELECT $node_id from Restaurant WHERE RestaurantID = 4),4,2,'2020/04/13'  UNION
SELECT (SELECT $node_id from Person WHERE PersonID = 2),(SELECT $node_id from Restaurant WHERE RestaurantID = 2),2,2,'2020/05/01'

CREATE TABLE Dish (
	DishID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, DishName VARCHAR(100)
	) AS NODE

INSERT INTO Dish (DishName)
VALUES ('Arroz con Pollo')
	, ('Sushi Roll')
	, ('Mofongo')
	, ('Short Ribs')
	, ('Egg Roll')
	, ('BLT Sandwich')
	, ('Stuffed Peppers')
	, ('Egg Drop Soup')
	, ('Steak Sandwich')


CREATE TABLE RestaurantDish (
	RestaurantDishID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, DishID INT
	, RestaurantID INT
	) AS EDGE

INSERT into RestaurantDish
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 1),(SELECT $node_id from Dish WHERE DishID = 1),1,3 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 3),(SELECT $node_id from Dish WHERE DishID = 3),3,3 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 3),(SELECT $node_id from Dish WHERE DishID = 7),7,3 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 4),(SELECT $node_id from Dish WHERE DishID = 2),2,4 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 4),(SELECT $node_id from Dish WHERE DishID = 5),5,4 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 4),(SELECT $node_id from Dish WHERE DishID = 4),4,4 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 4),(SELECT $node_id from Dish WHERE DishID = 8),8,4 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 2),(SELECT $node_id from Dish WHERE DishID = 9),9,2 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 1),(SELECT $node_id from Dish WHERE DishID = 9),9,1 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 1),(SELECT $node_id from Dish WHERE DishID = 6),6,1 UNION
SELECT (SELECT $node_id from Restaurant WHERE RestaurantID = 2),(SELECT $node_id from Dish WHERE DishID = 6),6,2



