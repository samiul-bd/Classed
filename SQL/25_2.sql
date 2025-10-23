--USE master
--GO
--CREATE DATABASE APNew
--GO

USE APNew
GO
--CREATE TABLE Invoices(
--InvoiceID int NOT NULL PRIMARY KEY IDENTITY (1,1),
--InvoiceNumber VARCHAR (15) NOT NULL,
--InvoicesDate DATE NOT NULL,
--InvoiceTotal Money NOT NULL,
--PaymentTotal Money NOT NULL,
--CreditTotal MOney NOT NULL,
--InvoiceDueDate Date NOT NULL,
--PaymentDate Date NULL
--)

--CREATE TABLE Vendors (
--VendorID int NOT NULL PRIMARY KEY IDENTITY (1,1),
--VendorName VARCHAR (15) NOT NULL,
--City VARCHAR (10) NOT NULL
--)
--GO
--CREATE TABLE Terms (
--TermsID int NOT NULL PRIMARY KEY IDENTITY (1,1),
--TermDescription VARCHAR (50) NOT NULL 
--)

--ALTER TABLE Invoices ADD
--VendorID int NOT NULL REFERENCES Vendors (VendorID)

--ALTER TABLE Invoices ADD
--TermsID int NOT NULL REFERENCES Terms (TermsID)


--ALTER TABLE Invoices ADD
--BalanceDue Money NOT NULL

--ALTER TABLE Invoices DROP Column BalanceDue

--CREATE INDEX IX_Invoices_VendorsID ON Invoices (VendorID )

exec sp_helpindex Invoices