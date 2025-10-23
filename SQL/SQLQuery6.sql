--GO
--USE MASTER
--GO
--CREATE DATABASE JUI
--GO

CREATE TABLE List (
StudentID int NOT NULL PRIMARY KEY,
FirstName VARCHAR (10) NOT NULL,
LastName VARCHAR (10) NOT NULL,
DateofBirth DATETIME NOT NULL,
Gender CHAR (6) NOT NULL,
Age int CHECK (Age<20),
Country VARCHAR (25) NOT NULL DEFAULT 'Bangladesh')
GO

USE List
GO
INSERT INTO List (StudentID,FirstName,LastName,DateofBirth,Gender,Age,Country)
VALUES
(1,'Farhin','Jahan', '1998-03-14', 'Female',26,'Bangladesh'),
(2,'Dolon','Akhter','1999-12-06', 'Female',25,'Bangladesh'),
(3,'Md','Hasan','1996-08-17','Male',29,'Bangladesh')