--DML

USE HospitalDB
GO

INSERT INTO Department (DepartmentID,DepartmentName)
values 
(101,'Cardiology'),
(102,'Neurology'),
(103,'Orthopedics')

INSERT INTO Doctor (DoctorID,DoctorName,DepartmentID)
values 
('DR01','Dr. k. House',101),
('DR02','Dr. A. Grey',102),
('DR03','Dr. M. Blake',103)

INSERT INTO PatientType (PatientTypeID,TypeName)
values 
(201,'Out Door'),
(202,'Out Door')


INSERT INTO Patient (PatientID,FirstName,LastName,PatientTypeID)
values 
(1,'Alan','Turing',201),
(2,'Grace','Hopper',202),
(3,'Ada','Lovelace',201),
(4,'Linus','Torvalds',201),
(5,'Bill','Gates',202),
(6,'Steve','Wozniak',202)


INSERT INTO Appoinments(AppoinmentID,PatientID,DoctorID,AppoinmentDate,TreatmentCost)
VALUES 
(1000,1,'DR01',DATEADD(DAY,-10,GETDATE()), 15000),
(1001,2,'DR02',DATEADD(DAY,-30,GETDATE()), 25000),
(1002,3,'DR01',DATEADD(DAY,+10,GETDATE()), 5000),
(1003,4,'DR03',DATEADD(DAY,-15,GETDATE()), 50000),
(1004,5,'DR02',DATEADD(DAY,+15,GETDATE()), 50000),
(1005,6,'DR03',DATEADD(DAY,-+5,GETDATE()), 150000)