--USE master
--GO

--CREATE DATABASE TestDB
--GO

USE TestDB
GO

CREATE TABLE Test (
TestID int primary key not null,
TestDescription varchar (20) not null,
Charge money null

)