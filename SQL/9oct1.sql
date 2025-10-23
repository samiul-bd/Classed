USE master
Go
--IF DB_ID ('InventoryBD68') IS NOT NULL
--DROP DATABASE InventoryDB68 
--Go
--CREATE DATABASE InventoryDB68
--ON(
--NAME=InventoryDB_Data_1,
--FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InventoryDB_Data_1.mdf',
--SIZE=25MB,
--MAXSIZE=100MB,
--FILEGROWTH=5%
--)
--LOG ON(
--NAME=InventoryDB_Log_1,
--FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InventoryDB_Log_1.ldf',
--SIZE=2MB,
--MAXSIZE=50MB,
--FILEGROWTH=1MB
--)

USE InventoryDB68 
Go

CREATE TABLE Item(
ItemID int primary key not null,
ItemNo varchar (7) not null,
)
INSERT INTO Item (ItemID,ItemNo)
VALUES 
(1,'Item 1'),
(2,'Item 2'),
(3,'Item 3'),
(4,'Item 4'),
(5,'Item 5'),
(6,'Item 6'),
(7,'Item 7'),
(8,'Item 8')

CREATE TABLE ItemType(
ItemTypeID int PRIMARY KEY NOT NULL,
TypeNAme Varchar (15) NOT NULL
)
INSERT INTO ItemType (ItemTypeID ,TypeNAme)
VALUES 
( 101,'Camp Shirt'),
( 102,'Dress Shirt'),
( 103,'T-Shirt'),
( 104,'Polo Shirt')

CREATE TABLE Color (
ColorID int PRIMARY KEY NOT NULL,
ColorName VARCHAR (5) NOT NULL
)
INSERT INTO Color (ColorID ,ColorName )
VALUES 
(201,'Red'),
(202,'Blue')

CREATE TABLE Unit (
UnitID int PRIMARY KEY NOT NULL,
UnitName varchar (5)
)
INSERT INTO Unit (UnitID,UnitName)
VALUES 
(301,'pcs')

CREATE TABLE ItemColor (
ItemID int  NOT NULL REFERENCES Item(ItemID),
ColorID int NOT NULL REFERENCES Color(ColorID),
PRIMARY KEY (ItemID,ColorID)
)

INSERT INTO ItemColor (ItemID , ColorID)
VALUES 
(1,201),
(2,202),
(3,201),
(4,202),
(5,201),
(6,202),
(7,201),
(8,202)

CREATE TABLE Lot
( LotNo varchar (6) not null ,
ItemID int not null REFERENCES Item (ItemID),
Quantity int not null,
UnitID int not null References Unit (UnitID),
UnitPrice money not null ,
VAT float NOT NULL,
PRIMARY KEY (LotNo,ItemID)
)
INSERT INTO Lot (LotNo ,ItemID ,Quantity ,UnitID ,UnitPrice ,VAT)
VALUES
('Lot 1',1,6,301,1100,.15),
('Lot 1',2,6,301,1200,.15),
('Lot 1',3,6,301,1300,.15),
('Lot 1',4,6,301,1400,.15),
('Lot 1',5,6,301,1500,.15),
('Lot 1',6,6,301,1600,.15),
('Lot 1',7,6,301,1700,.15),
('Lot 1',8,6,301,1800,.15),

('Lot 2',1,12,301,1150,.15),
('Lot 2',2,12,301,1250,.15),
('Lot 2',3,12,301,1350,.15),
('Lot 2',4,12,301,1450,.15),
('Lot 2',5,12,301,1550,.15),
('Lot 2',6,12,301,1650,.15),
('Lot 2',7,12,301,1750,.15),
('Lot 2',8,12,301,1850,.15)
