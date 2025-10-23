--DDL

--USE master
--GO

--IF DB_ID ('HospitalDB') IS NOT NULL
--DROP DATABASE HospitalDB
--GO

--CREATE DATABASE HospitalDB on (
--NAME = HospitalDB_data,
--FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HospitalDB_data.mdf',
--SIZE =25 MB,
--MAXSIZE = 100 MB,
--FILEGROWTH= 5%
--)

--LOG ON(
--NAME = HospitalDB_log,
--FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HospitalDB_log.ldf',
--SIZE =2 MB,
--MAXSIZE = 10 MB,
--FILEGROWTH= 1%
--)
--GO

USE HospitalDB
GO

--CREATE TABLE Department 
--(
--DepartmentID int primary key Not Null,
--DepartmentName varchar(20) Not Null
--)

--CREATE TABLE Doctor (
--DoctorId varchar (4) primary key NOT NUll,
--DoctorName varchar(50),
--DepartmentID int REFERENCES Department (DepartmentID) ON DELETE CASCADE NOT NULL
--)

--CREATE TABLE PatientType (
--PatientTypeID int not null PRIMARY KEY,
--TypeName varchar (10) not null
--)



--CREATE TABLE Patient (
--PatientID int Primary key,
--FirstName varchar(50),
--LastName varchar(50),
--PatientTypeID int REFERENCES PatientType(PatientTypeID) ON DELETE CASCADE NOT NULL
--)

CREATE TABLE Appoinments (
AppoinmentID Int PRIMARY KEY not null,
PatientID INT REFERENCES Patient(patientID) ON DELETE CASCADE NOT NULL,
DoctorID varchar(4) REFERENCES Doctor(DoctorID) ON DELETE CASCADE NOT NULL,
AppoinmentDate datetime not null ,
TreatmentCost decimal (18,4) not null
)
GO


IF OBJECT_ID ('spDoctorReadInsertUpdateDeletOutputReturn') IS not null
DROP PROCEDURE spDoctorReadInsertUpdateDeletOutputReturn
GO

CREATE PROC spDoctorReadInsertUpdateDeletOutputReturn
@OparationType char(1),
@DoctorId char(4),
@DoctorName varchar(50),
@DepartmentId int,
@Name varchar (20) OUTPUT,
@DoctorCount int 

AS
BEGIN
if @OparationType = 'S' 
BEGIN
select * from Doctor
END
IF 
@OparationType='I'
BEGIN
INSERT INTO Doctor(DoctorID, DoctorName, DepartmentID)
values (@DoctorId, @DoctorName, @DepartmentId)
END

IF @OparationType='U'
BEGIN
UPDATE Doctor SET DoctorName=@DoctorName, DepartmentID=@DepartmentId
WHERE DoctorID=@DoctorId
END

IF 
@OparationType ='D'
BEGIN 
DELETE FROM Doctor 
WHERE DoctorId=@DoctorId
END

IF
@OparationType ='O'
BEGIN 
SELECT @Name=DoctorName FROM Doctor where DoctorId=@DoctorId
END

IF
@OparationType ='R'
BEGIN
SELECT @DoctorCount= COUNT(*) FROM Doctor 
WHERE DepartmentID=@DepartmentId
RETURN @doctorCount
END
END


---justify
EXEC spDoctorReadInsertUpdateDeletOutputReturn '','','','','',''

EXEC spDoctorReadInsertUpdateDeletOutputReturn 'S','','','','','' --FOR SELECTING
EXEC spDoctorReadInsertUpdateDeletOutputReturn 'I','DR04','Dr Yunus','103','','' --for Insert
EXEC spDoctorReadInsertUpdateDeletOutputReturn 'U','DR04','DR. Jannatul Ferdous','103','','' -- for Update
EXEC spDoctorReadInsertUpdateDeletOutputReturn 'D','DR06','','','','' -- FOR DELETE


DECLARE @NAME VARCHAR (20)
EXEC spDoctorReadInsertUpdateDeletOutputReturn 'O','DR04','','',@Name OUTPUT,''
PRINT @NAME

DECLARE @COUNT INT
EXEC @COUNT = spDoctorReadInsertUpdateDeletOutputReturn 'R','','','101','',''
SELECT @COUNT