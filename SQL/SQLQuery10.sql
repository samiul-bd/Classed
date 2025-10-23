USE master
GO
CREATE DATABASE TEST

USE TEST
GO

CREATE TABLE STUDENTS1
(
StudentId int not null primary key,
FN varchar(10) not null,
LN varchar (10) not null,
age int 
) 


insert into STUDENTS1
(
StudentId,FN,LN,age
)
values 
(
1,'Samiul','alam',29 
)


select * from STUDENTS1

select FN,age,LN from STUDENTS1

 INSERT INTO STUDENTS1 (StudentId, FN, LN, age) VALUES
(2, 'Sarah', 'Jones', 22),
(3, 'Michael', 'Smith', 24),
(4, 'Ayesha', 'Khan', 25),
(5, 'Ali', 'Raza', 27),
(6, 'Emma', 'Johnson', 30),
(7, 'John', 'Doe', 21),
(8, 'Sophia', 'Williams', 26),
(9, 'David', 'Brown', 28),
(10, 'Olivia', 'Taylor', 23);




select FN,age from STUDENTS1

select FN + ' ' + LN  from STUDENTS1

