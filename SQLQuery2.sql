CREATE DATABASE BlogDB;
use BlogDB
CREATE TABLE Categories
(
Id INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(20) NOT NULL 
)

CREATE TABLE Tags
(
Id INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(20) NOT NULL 
)

CREATE TABLE Users
(
Id INT IDENTITY PRIMARY KEY,
Username VARCHAR(20) NOT NULL UNIQUE,
Fullname VARCHAR(50) NOT NULL,
Age INT CHECK(Age >0 AND Age<150)
)

SELECT * FROM Users

INSERT INTO Users(Username,Fullname,Age)
VALUES
('Nihat1','Nihat Memmedov',20)



CREATE TABLE Blogs
(
Id INT IDENTITY PRIMARY KEY, 
TITLE VARCHAR(100) NOT NULL CHECK(Len(TITLE) >0 AND Len(TITLE) < 50),
Description VARCHAR(200) NOT NULL,
CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
UserId INT FOREIGN KEY REFERENCES Users(Id),
)

drop table Comments

CREATE TABLE Comments
(
Id INT IDENTITY Primary Key,
Content VARCHAR(100) NOT NULL check (Len(Content) > 0 and Len(Content)<250 ),
UserId INT FOREIGN KEY REFERENCES Users(Id),
BlogId INT FOREIGN KEY REFERENCES Blogs(Id),
)

INSERT INTO Comments   
values('this is THIRD comment' , 1 , NULL)

SELECT Users.Id,Users.Username,Comments.Content FROM Users 
 JOIN Comments on Users.Id = Comments.UserId

 select * FROM Users 


 SELECT * FROM Comments
