--USE master
--GO
--IF DB_ID('CollegeDB_68') IS NOT NULL
--DROP DATABASE CollegeDB_68
--GO
--CREATE DATABASE CollegeDB_68
--ON(
--NAME='CollegeDB_68_DATA_1',
--FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CollegeDB_68_DATA_1.mdf',
--SIZE=25MB,
--MAXSIZE=100MB,
--FILEGROWTH=5%
--)

--LOG ON(
--NAME='CollegeDB_68_LOG_1',
--FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CollegeDB_68_LOG_1.Ldf',
--SIZE=2MB,
--MAXSIZE=50MB,
----FILEGROWTH=1MB
--)


USE CollegeDB_68
GO
CREATE TABLE Teacher (
TeacherID int Primary key not null,
TeacherName CHAR (1) NOT NULL
)
INSERT INTO Teacher(TeacherID,TeacherName)
VALUES
(1,'A'),
(2,'B'),
(3,'C')
GO

CREATE TABLE Semester(
SemesterId int primary key not null,
SemesterName Varchar(7)
)

INSERT INTO Semester(SemesterId,SemesterName)
VALUES 
(101,'Spring'),
(102,'Winter'),
(103,'Summer'),
(104,'Fall')
GO

CREATE TABLE Subjects(
SubjectID int primary key not null,
SubjectName Varchar(20)
)
INSERT INTO Subjects(SubjectID,SubjectName)
VALUES 
(1,'C#'),
(2,'Data Base'),
(3,'Web Design'),
(4,'Data Mining'),
(5,'MIS'),
(6,'PHP'),
(7,'Project Management'),
(8,'PCL '),
(9,'Software Engineering ')
GO

CREATE TABLE Student(
StudentID int primary key not null,
StudentName Varchar(2)
)
INSERT INTO Student(StudentID,StudentName)
VALUES 
(301,'AA'),
(302,'BB'),
(303,'CC'),
(304,'DD'),
(305,'EE'),
(306,'FF'),
(307,'GG'),
(308,'HH'),
(309,'II')
GO

CREATE TABLE TeacherStdSubSemRelation(
TeacherID int not null REFERENCES Teacher(TeacherID),
StudentID int not null REFERENCES Student(StudentID),
SemesterID int not null REFERENCES Semester(SemesterID),
SubjectID int not null REFERENCES Subjects(SubjectID),
)

INSERT INTO TeacherStdSubSemRelation(TeacherID,StudentID,SemesterID,SubjectID)
VALUES
(201,301,101,1),
(201,302,101,1),
(201,304,101,1),
(202,303,101,2),
(202,303,101,2),

