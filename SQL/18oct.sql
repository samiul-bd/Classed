USE master
GO
--IF DB_ID ('CollegeDB68') IS NOT NULL
--DROP DATABASE CollegeDB68 
--GO
--CREATE DATABASE CollegeDB68
--ON (
--Name='CollegeDB68_Data_1',
--FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CollegeDB68_Data_1.mdf',
--SIZE=25MB,
--MAXSIZE=100MB,
--FILEGROWTH=5%
--)

--LOG ON (
--Name='CollegeDB68_Log_1',
--FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CollegeDB68_Log_1.ldf',
--SIZE=2MB,
--MAXSIZE=50MB,
--FILEGROWTH=1MB
--)


USE CollegeDB68 
GO

CREATE TABLE Teacher (
TeacherID int primary key not null,
TeacherName char (1) not null
)
INSERT INTO Teacher (TeacherID,TeacherName )
VALUES 
(1,'A'),(2,'B'),(3,'C')
GO
CREATE TABLE Semester (
SemesterID int primary key not null,
SemesterName Varchar (7) not null
)
INSERT INTO Semester (SemesterID,SemesterName )
VALUES 
(101,'Spring'),(102,'Winter'),(103,'Summer'),(104,'Fall')
Go
CREATE TABLE Subjects (
SubjectID int primary key not null,
SubjectName Varchar (20) not null
)
INSERT INTO Subjects  (SubjectID,SubjectName )
VALUES 
(201,'C#'),(202,'Data Base'),(203,'Web Design'),(204,'Data Mining'),(205,'MIS'),(206,'PHP'),(207,'Project Management'),
(208,'PCL'),(209,'Software Engineering')
Go

CREATE TABLE Student (
StudentID int primary key not null,
StudentName char (2) not null
)

INSERT INTO Student (StudentID,StudentName )
VALUES 
(301,'AA'),(302,'BB'),(303,'CC'),(304,'DD'),(305,'EE'),(306,'FF'),(307,'GG'),(308,'HH'),(309,'II')
go

CREATE TABLE TeacherStdSubSemRelation (

TeacherID int Not Null REFERENCES Teacher (TeacherID),
StudentID int Not Null REFERENCES Student (StudentID),
SemesterID int Not Null REFERENCES Semester (SemesterID),
SubjectID int Not Null REFERENCES Subjects (SubjectID),
PRIMARY KEY (TeacherID,StudentID,SemesterID,SubjectID)
)
INSERT INTO TeacherStdSubSemRelation (TeacherID,StudentID,SemesterID,SubjectID)
VALUES 
(1,301,101,201),
(1,302,101,201),
(1,304,101,201),
(2,301,101,202),
(2,303,101,202),
(2,309,101,202),
(3,305,101,203),
(3,308,101,203),
(3,302,101,203),
(3,307,101,203),
(1,305,103,201),
(1,307,103,201),
(2,302,103,204),
(2,306,103,204),
(2,308,103,204),
(3,301,103,205),
(3,302,103,205),
(3,303,103,205),
(1,308,104,206),
(1,309,104,206),
(2,305,104,202),
(2,307,104,202),
(2,304,104,202),
(3,309,104,207),
(3,304,104,207),
(3,306,104,207),
(1,303,102,208),
(1,306,102,208),
(2,301,102,204),
(2,302,102,204),
(2,303,102,204),
(3,301,102,203),
(3,303,102,203),
(3,304,102,203)

--................
CREATE TABLE TestDrop(
DropID int not null 
)

DROP TAble TestDrop
--...............
--Alter kori ni ,newa lagbe 
--..................
