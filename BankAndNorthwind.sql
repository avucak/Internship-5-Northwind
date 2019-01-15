CREATE DATABASE Bank

CREATE TABLE Titles(
ID INT IDENTITY(1,1),
Title nvarchar(30) NOT NULL 
)

CREATE TABLE Users(
ID INT IDENTITY(1,1),
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(30) NOT NULL,
OIB INT NOT NULL,
PhoneNumber nvarchar(20),
Address nvarchar(30) NOT NULL,
City nvarchar(30) NOT NULL,
Country  nvarchar(30) NOT NULL,
PostalCode int NOT NULL
)

CREATE TABLE Transactions(
ID INT IDENTITY(1,1),
ProcessingDate date NOT NULL,
Status bit NOT NULL
)

CREATE TABLE Employees(
ID INT IDENTITY(1,1),
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(30) NOT NULL,
Title nvarchar(30) NOT NULL,
Email nvarchar(30)
)

INSERT INTO Titles
VALUES 
('Director'),('Vice president'),('Investment associate'),
('Investment analyst')

ALTER TABLE Transactions
ADD Description nvarchar(50)

ALTER TABLE Employees
ADD EmployeeNotes nvarchar(50)

ALTER TABLE Users
ADD UNIQUE(OIB)

INSERT INTO Users
(FirstName,LastName,OIB,Address,City, Country,PostalCode)
VALUES
('Mate',N'Matiæ',73797,'Matice hrvatske 1','Split','Hrvatska',21000)

UPDATE Users
SET PhoneNumber='0957843444'
WHERE OIB=73797

INSERT INTO Titles 
VALUES ('Accountant')

DELETE FROM Titles
WHERE ID=5

INSERT INTO Transactions
(ProcessingDate,Status)
VALUES
('2019-1-12',1),('2020-7-24',0),('1990-3-5',1)

UPDATE Transactions
SET Description='Transaction successful'
WHERE ID=3

DELETE FROM Transactions
WHERE ID=1

INSERT INTO Employees
VALUES
('Ana','Banana','Investment analyst',N'banana@investment.com','No notes'),
('Zoran','Z','Director',N'z@z','best director'),('Third','Employee','Vice president',N'3@em.com','nothing to say'),
('Great','NameWithG','Investment analyst',N'g@name','Employee with name that starts with G')

SELECT * FROM Employees
WHERE FirstName LIKE '[A-G]%'

--DRUGI DIO
--1.
SELECT TOP 50 CompanyName,ContactName,ContactTitle,Address,City,Phone
FROM Customers 

--2.
SELECT COUNT(CustomerID) AS FaxAndRegionNotNull 
FROM Customers
WHERE Fax IS NOT NULL AND Region IS NOT NULL

--3.
SELECT TOP 2 FirstName,LastName,Title
FROM Employees
ORDER BY BirthDate ASC

--4
SELECT * 
FROM Customers 
Where Address LIKE '[0-9]%' AND CompanyName LIKE '__a%'
ORDER BY Country ASC

--5
SELECT OrderID
FROM Orders 
WHERE OrderID=(SELECT TOP 1 OrderID from [Order Details] ORDER BY Quantity DESC)

--6
SELECT COUNT(CustomerID)
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders)

