USE AdventureWorks2014
SELECT * FROM Person.Address
SELECT City FROM Person.Address
SELECT DISTINCT City,AddressLine1 FROM Person.Address
SELECT * FROM Person.Address WHERE City='Bothell'
SELECT * FROM Person.Address WHERE AddressID = 30
SELECT * FROM Person.Address WHERE AddressID LIKE 5
SELECT * FROM Person.Address WHERE AddressID BETWEEN 10 AND 15
SELECT * FROM Person.Address WHERE AddressID IN ('30','45')
SELECT * FROM Person.Address WHERE City IN ('Detroit','Kenmore')
SELECT *FROM Person.Address WHERE City='Kenmore' AND PostalCode='98028'
SELECT *FROM Person.Address WHERE StateProvinceID='79' AND (City='Bothell' OR City='Monroe')
SELECT *FROM Person.Address ORDER BY City
SELECT *FROM Person.Address ORDER BY City,StateProvinceID
SELECT *FROM Person.Address ORDER BY City DESC
SELECT *FROM Person.Address ORDER BY City ASC , StateProvinceID DESC
SELECT *FROM Person.Address ORDER BY StateProvinceID DESC

txtAddress = getRequestString("City")
txtSQL="INSERT INTO Person.Address (City) Values(@0)"
db.Execute(txtSQL,txtAddress)

SELECT TOP 5 * FROM Person.Address
SELECT TOP 0.1 PERCENT * FROM Person.Address
SELECT * FROM Person.Address WHERE City LIKE 'b%'
SELECT * FROM Person.Address WHERE City LIKE '%e'
SELECT * FROM Person.Address WHERE City LIKE '%tte%'
SELECT * FROM Person.Address WHERE City NOT LIKE '%b%'
SELECT * FROM Person.Address WHERE City LIKE 'bot%'
SELECT * FROM Person.Address WHERE City LIKE '_bot'
SELECT * FROM Person.Address WHERE City LIKE 'm_iss_i'
SELECT * FROM Person.Address WHERE City LIKE '[mel]%'
SELECT * FROM Person.Address WHERE City LIKE '[a-c]%'
SELECT * FROM Person.Address WHERE City LIKE '[!miss]%'
SELECT * FROM Person.Address WHERE City NOT LIKE '[miss]'
SELECT * FROM Person.Address WHERE City IN ('Phoenix','Orlando')
SELECT * FROM Person.Address
SELECT * FROM Person.Person
SELECT AddressID AS AdminID , AddressLine1 AS [ADDRESS] FROM Person.Address
SELECT AddressID , AddressLine1+ '_ '+City+'_'+PostalCode AS Address FROM Person.Address
SELECT AddressID , CONCAT(AddressLine1,'_',City,'_',StateProvinceID,'_',PostalCode) AS Address FROM Person.Address
SELECT F.FIRSTNAME , F.LASTNAME , A.ADDRESS
FROM Person.Person AS F ,Person.Address AS A
WHERE F.FirstName="Rob" OR F.LastName = "Walters" AND A.PostalCode 

SELECT Person.Address.AddressLine1, Person.BusinessEntityAddress.BusinessEntityID
FROM Person.Address,Person.BusinessEntityAddress
WHERE Person.Address.AddressID=10 AND Person.Address.AddressID=Person.BusinessEntityAddress.AddressID

SELECT Person.Address.AddressLine1, Person.BusinessEntityAddress.BusinessEntityID,Person.BusinessEntityAddress.AddressTypeID
FROM Person.Address
INNER JOIN Person.BusinessEntityAddress
ON Person.Address.AddressID =Person.BusinessEntityAddress.AddressID
ORDER BY Person.Address.AddressLine1 DESC

SELECT Person.Address.AddressLine1, Person.BusinessEntityAddress.BusinessEntityID,Person.BusinessEntityAddress.AddressTypeID
FROM Person.Address
LEFT JOIN Person.BusinessEntityAddress
ON Person.Address.AddressID =Person.BusinessEntityAddress.AddressID

SELECT Person.Address.AddressLine1, Person.BusinessEntityAddress.BusinessEntityID,Person.BusinessEntityAddress.AddressTypeID
FROM Person.Address
LEFT OUTER JOIN Person.BusinessEntityAddress
ON Person.Address.AddressID =Person.BusinessEntityAddress.AddressID

SELECT Person.Address.AddressLine1, Person.BusinessEntityAddress.BusinessEntityID,Person.BusinessEntityAddress.AddressTypeID
FROM Person.Address
RIGHT JOIN Person.BusinessEntityAddress
ON Person.Address.AddressID =Person.BusinessEntityAddress.AddressID

SELECT Person.Address.AddressLine1, Person.BusinessEntityAddress.BusinessEntityID,Person.BusinessEntityAddress.AddressTypeID
FROM Person.Address
RIGHT OUTER JOIN Person.BusinessEntityAddress
ON Person.Address.AddressID =Person.BusinessEntityAddress.AddressID

SELECT Person.Address.AddressLine1, Person.BusinessEntityAddress.BusinessEntityID,Person.BusinessEntityAddress.AddressTypeID
FROM Person.Address
FULL OUTER JOIN Person.BusinessEntityAddress
ON Person.Address.AddressID =Person.BusinessEntityAddress.AddressID

SELECT ModifiedDate FROM Person.Address
UNION
SELECT ModifiedDate FROM Person.BusinessEntityAddress
OrDER BY ModifiedDate
SELECT ModifiedDate FROM Person.Address
UNION ALL
SELECT ModifiedDate FROM Person.BusinessEntityAddress
OrDER BY ModifiedDate

SELECT AddressID,ModifiedDate FROM Person.Address
WHERE ModifiedDate='2008-12-15 00:00:00.000'
UNION ALL
SELECT AddressID, ModifiedDate FROM Person.BusinessEntityAddress
WHERE ModifiedDate='2008-12-15 00:00:00.000'
ORDER BY AddressID

SELECT * 
INTO example2
FROM Person.Address
SELECT * FROM example2

USE example2
SELECT *
INTO example2 IN 'dbo.contacts'
FROM Person.Address

USE AdventureWorks2014
INSERT INTO Person.Address(PostalCode,AddressID)
SELECT AddressTypeID,AddressID FROM Person.BusinessEntityAddress

CREATE DATABASE ONE
USE ONE
CREATE TABLE Persons
(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

SELECT * FROM dbo.PersonsNotNull

CREATE TABLE PersonsNotNull
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

CREATE TABLE Persons
(
P_Id int NOT NULL UNIQUE,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

CREATE TABLE Persons
(
P_Id int NOT NULL PRIMARY KEY,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)
)

CREATE TABLE Orders
(
O_Id int NOT NULL,
OrderNo int NOT NULL,
P_Id int,
PRIMARY KEY (O_Id),
CONSTRAINT fk_PerOrders FOREIGN KEY (O_Id)
REFERENCES Persons(P_Id)
)
CREATE TABLE Persons
(
P_Id int NOT NULL CHECK (P_Id>0),
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)
CREATE TABLE Personas
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255) DEFAULT 'Sandnes'
)

CREATE INDEX One
on Persons (LastName)
CREATE INDEX Oned
on Persons (FirstName)

CREATE INDEX PeIndex
ON Persons (LastName, FirstName)

USE example2
-- xoa du lieu trong bang
TRUNCATE TABLE dbo.AWBuildVersion

SELECT * FROM Persone
-- them column vao bang , ten date of birth
ALTER TABLE Persons
ADD DateOfBirth date


CREATE TABLE Persone
(
ID int IDENTITY(1,1) PRIMARY KEY,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

INSERT INTO dbo.Persone (FirstName,LastName)
VALUES ('Lars','Monsen')

SELECT GETDATE()
SELECT DATEPART(YYYY,GETDATE())
SELECT DATEADD(YY,3,GETDATE())
SELECT DATEDIFF(day,'2014-06-05','2014-08-05')

SELECT CONVERT(VARCHAR(19),GETDATE())
SELECT CONVERT(VARCHAR(10),GETDATE(),10)
SELECT CONVERT(VARCHAR(10),GETDATE(),110)
SELECT CONVERT(VARCHAR(11),GETDATE(),6)
SELECT CONVERT(VARCHAR(11),GETDATE(),106)
SELECT CONVERT(VARCHAR(24),GETDATE(),113)

USE AdventureWorks2014
SELECT AVG(ListPrice) AS SHOW FROM Production.product

SELECT ProductNumber,ListPrice FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.product)

SELECT COUNT(Name) AS COUN FROM Production.Product
WHERE Name='Classic Vest, L'

SELECT COUNT(*) AS SHOW FROM Production.Product

SELECT COUNT(DISTINCT Name) AS COUND FROM Production.Product

SELECT Name FROM Production.Product


SELECT TOP 4 Name FROM Production.Product
ORDER BY Name DESC

SELECT FIRST(ListPrice) FROM Production.Product

SELECT LAST(Name) AS LASTNAME FROM Production.Product
SELECT MAX(Name) AS MAXX FROM Production.Product
SELECT MIN(Name) AS MINX FROM Production.Product
SELECT SUM(ListPrice) AS SUMER FROM Production.Product

SELECT Name,SUM(ListPrice) AS SUMER FROM Production.Product
WHERE Name='All-Purpose Bike Stand'
GROUP BY Name
ORDER BY Name ASC

SELECT Name,SUM(ListPrice) AS SUMER FROM Production.Product
GROUP BY Name
HAVING SUM(Production.Product.ListPrice) > 50

SELECT UCASE(LastName) AS UPERCASE,FirstName FROM Person.Person
SELECT LCASE(LastName) AS UPERCASE,FirstName FROM Person.Person

SELECT MID(LastName,1,5) AS MID FROM Person.Person

SELECT FirstName,LEN(LastName) AS LENGTHD FROM Person.Person

SELECT Name,ROUND(ListPrice,11) AS ROUNDD FROM Production.Product
use AdventureWorks2014
SELECT Name,FORMAT(Now(),'YYYY-MM-DD') AS PerDate
FROM Production.Product
