--USE MASTER
--GO
--CREATE DATABASE IsDB68Db
--GO
CREATE TABLE Students (
StudentID int NOT NULL PRIMARY KEY,
FirstName VARCHAR(10) NOT NULL,
LastName VARCHAR (10) NOT NULL,
DateofBirth DATETIME NOT NULL,
Gender CHAR (6) NOT NULL,
Age int CHECK (Age<30),
EmailAddress VARCHAR (50) NOT NULL UNIQUE,
Country VARCHAR (25) NOT NULL DEFAULT 'Bangladesh',
MobileNO VARCHAR (11) NOT NULL UNIQUE
)
Go
INSERT INTO Students (StudentID, FirstName,LastName,DateofBirth, Gender,Age,EmailAddress,Country,MobileNO)
VALUES
(1,'Samiul','Alam','1996-02-29','Male',29,'samiulalam.bd@gmail.com', 'Bangladesh','01945207270'),
(2,'Jannat', 'Ferdous', '2000-12-13', 'Female', 24, 'jfioobd@gmail.com','Bangladesh', '01571421934')

