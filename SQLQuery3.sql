--CREATE DATABASE ShopDB;
--use ShopDB

CREATE TABLE Users
(
Id INT IDENTITY PRIMARY KEY,
 Username VARCHAR(30),
 UserPassword VARCHAR(30)
)

CREATE TABLE Roles
(
Id INT IDENTITY PRIMARY KEY,
RoleName VARCHAR(30),
UserId INT FOREIGN KEY REFERENCES Users(id)
)


INSERT INTO Users(Username,UserPassword)VALUES('adil123','adil123')

INSERT INTO Roles(RoleName,UserId)VALUES('user',2)

SELECT U.Username,U.UserPassword,R.RoleName FROM Users U JOIN Roles R ON U.Id = R.UserId









CREATE TABLE Products
(
Id INT IDENTITY PRIMARY KEY,
ProductName VARCHAR(30),
Price MONEY, 
)

INSERT INTO Products(ProductName,Price)VALUES('Telefon',100)
SELECT * FROM Products


CREATE TABLE Categories
( 
Id INT IDENTITY PRIMARY KEY,
CategoryName VARCHAR(30),
ProductId INT FOREIGN KEY REFERENCES Products(Id)
)

INSERT INTO Categories(CategoryName,ProductId)VALUES('Elektronika',4)

CREATE TABLE Colors 
(
Id INT IDENTITY PRIMARY KEY,
ColorName varchar(15),
ProductId INT FOREIGN KEY REFERENCES Products(Id)
)

CREATE TABLE ColorAndCategory
(

ColorId INT FOREIGN KEY REFERENCES Colors(Id),
CategoryId INT FOREIGN KEY REFERENCES Categories(Id)
)


INSERT INTO Colors(ColorName,ProductId)VALUES('Qara',4)

SELECT P.ProductName,P.Price,C.CategoryName,CL.ColorName FROM Products P
LEFT JOIN Categories C ON P.Id = C.ProductId 
LEFT JOIN Colors CL on CL.ProductId = P.Id   