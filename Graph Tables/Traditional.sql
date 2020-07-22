CREATE SCHEMA Traditional AUTHORIZATION dbo
GO

CREATE TABLE Traditional.Person (
	PersonID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, FirstName VARCHAR(100)
	, LastName VARCHAR(100)
	)
    INSERT INTO Traditional.Person
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

GO

CREATE TABLE Traditional.FriendOf (
	FriendOfID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, PersonID INT
	, FriendID INT
	)
INSERT INTO Traditional.FriendOf
(
    PersonID, FriendID
)
VALUES
(1,5),(5,1),--Carlos > Wanda
(1,6),(6,1),--Carlos > Jessica
(4,6),(6,4),--Luis > Jessica
(5,2),(2,5),--Wanda > Jose
(2,3),(3,2),--Jose > Maria
(5,3),(3,5) --Wanda > Maria

CREATE TABLE Traditional.Restaurant (
	RestaurantID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, RestaurantName VARCHAR(100)
	)
INSERT INTO Traditional.Restaurant
(
RestaurantName
)
VALUES
('Jimmy''s Cafe'),('The Lounge'),('La Cocina Puertorriqueña'),('Sake Japan')


select * from Traditional.Restaurant
select * from Traditional.Person



CREATE TABLE Traditional.RestaurantPersonVisit (
	RestaurantPersonVisitID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, RestaurantID INT
	, PersonID INT
	, VisitDate DATE
	)

INSERT INTO Traditional.RestaurantPersonVisit
(
    RestaurantID, PersonID, VisitDate
)
VALUES
(1,1,'2019/02/15'),
(2,5,'2019/09/30'),
(3,3,'2019/08/18'),
(4,6,'2020/01/23'),
(4,2,'2020/04/13'),
(2,2,'2020/05/01')

CREATE TABLE Traditional.Dish (
	DishID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, DishName VARCHAR(100)
	)
INSERT INTO Traditional.Dish (DishName)
VALUES ('Arroz con Pollo')
	, ('Sushi Roll')
	, ('Mofongo')
	, ('Short Ribs')
	, ('Egg Roll')
	, ('BLT Sandwich')
	, ('Stuffed Peppers')
	, ('Egg Drop Soup')
	, ('Steak Sandwich')

    select * from Traditional.Dish
select * from Traditional.Restaurant
CREATE TABLE Traditional.RestaurantDish (
	RestaurantDishID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED
	, DishID INT
	, RestaurantID INT
	)

    INSERT into Traditional.RestaurantDish
    (
        DishID, RestaurantID
    )
VALUES
(1,3),
(3,3),
(7,3),
(2,4),
(5,4),
(4,4),
(8,4),
(9,2),
(9,1),
(6,1),
(6,2)



SELECT P.FirstName
	, F.FirstName AS FriendName
	, R.RestaurantName
	, RPV.VisitDate
FROM Traditional.Person P
JOIN Traditional.FriendOf FO
	ON FO.PersonID = P.PersonID
JOIN Traditional.Person F
	ON F.PersonID = FO.FriendID
JOIN Traditional.RestaurantPersonVisit RPV
	ON RPV.PersonID = F.PersonID
JOIN Traditional.Restaurant R
	ON R.RestaurantID = RPV.RestaurantID
JOIN Traditional.RestaurantDish RD
	ON RD.RestaurantID = R.RestaurantID
JOIN Traditional.Dish D
	ON D.DishID = RD.DishID
WHERE P.FirstName = 'Carlos'
	AND D.DishName = 'Sushi Roll'
