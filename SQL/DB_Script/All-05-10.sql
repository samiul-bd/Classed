
--JANNAT
--1291333



USE AP 
GO

--qus no 1

SELECT TOP 5 InvoiceID, InvoiceTotal FROM Invoices
 WHERE (InvoiceTotal= PaymentTotal+ CreditTotal)
 ORDER BY InvoiceTotal DESC


 --qus no 2

 SELECT InvoiceNumber,InvoiceDate,InvoiceTotal,PaymentTotal,CreditTotal FROM Invoices 
WHERE InvoiceDate >'2020-01-01' 
AND InvoiceTotal>( PaymentTotal+CreditTotal) 
OR InvoiceTotal>500

--qus no 3

SELECT i.VendorID, i.InvoiceNumber, i.InvoiceTotal,i.PaymentTotal,i.CreditTotal,
v.VendorID,v.VendorCity, v.VendorState
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
WHERE InvoiceDate >'2020-01-01' AND v.VendorState NOT IN ('CA','NV','OR')

--qus no 4


SELECT InvoiceID, InvoiceNumber,InvoiceDate,InvoiceTotal,PaymentTotal,CreditTotal
 FROM Invoices 
WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-30'



--qus no 5

SELECT * FROM Vendors WHERE VendorCity LIKE 'SAN%'

--qus 6 

SELECT * FROM Vendors WHERE VendorContactFName LIKE '[A, E,I,O,U]%'
 
--qus 7 


SELECT * FROM Vendors WHERE VendorState LIKE 'N[A-J]%'

--qus 8 



SELECT * FROM Vendors WHERE VendorState LIKE 'N[^K-Y]%'


--qus 9


SELECT VendorID, VendorName,VendorCity, VendorState FROM Vendors 
ORDER BY VendorID
OFFSET 10 ROWS FETCH Next 20 ROWS ONLY 


--qus  no 10

SELECT VendorID, COUNT(InvoiceID) AS NumberOfInvoices,
AVG (InvoiceTotal) AS AvgAmount FROM Invoices
GROUP BY VendorID
HAVING AVG (InvoiceTotal) >2000
ORDER BY AVG (InvoiceTotal) DESC

--qus no 11
USE AP 
GO

SELECT VendorCity, VendorState, COUNT(*) TotalVendor 
FROM Vendors
WHERE VendorState IN('IA','NJ')
GROUP BY VendorCity, VendorState WITH CUBE

--qus no 12

SELECT VendorCity, VendorState, COUNT(*) TotalVendor 
FROM Vendors
WHERE VendorState IN('IA','NJ')
GROUP BY VendorCity, VendorState WITH ROLLUP

--qus no 13


SELECT VendorID,TermsID, SUM(InvoiceTotal) AS SumAmount FROM Invoices
GROUP BY GROUPING SETS (  (VendorID,TermsID),(TermsID),(VendorID),()
)
ORDER BY VendorID,TermsID

--qus no 14

--SELECT * FROM Invoices

--SELECT InvoiceNumber,InvoiceDate, SUM (InvoiceTotal) AS SumAmount FROM Invoices

SELECT InvoiceNumber,InvoiceID, SUM (InvoiceTotal)OVER ( Partition BY VendorID) AS VendorTotal

FROM Invoices

--qus no 19

SELECT DISTINCT VendorID, VendorName, ( SELECT MAX (InvoiceDate) FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID
)  AS LatestInvDate FROM Vendors
ORDER BY LatestInvDate  DESC


--qus no 16

---select * from Invoices where VendorID=34


select InvoiceNumber,InvoiceDate,InvoiceTotal from Invoices
WHERE InvoiceTotal> ANY
(select InvoiceTotal from Invoices where VendorID=34) 


--qus no 17

select InvoiceNumber,InvoiceDate,InvoiceTotal from Invoices
WHERE InvoiceTotal> ALL
(select InvoiceTotal from Invoices where VendorID=34) 

--qus no 18

select InvoiceNumber,InvoiceDate,InvoiceTotal from Invoices
WHERE InvoiceTotal> SOME
(select InvoiceTotal from Invoices where VendorID=34) 

--Qus no 15


--SELECT DISTINCT VendorID FROM Invoices

--SELECT VendorName,VendorCity,VendorState
--FROM Vendors WHERE VendorID IN ()                                                                                                                                                                                                                                                                                                                                  

SELECT VendorName,VendorCity,VendorState
FROM Vendors WHERE VendorID IN (SELECT DISTINCT VendorID FROM Invoices)

--qus  no 20

--SELECT * FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID

--SELECT VendorName FROM Vendors
--WHERE NOT EXISTS ()



SELECT VendorName FROM Vendors
WHERE NOT EXISTS (SELECT * FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID)

 --qus no 21

 WITH Summary AS 
(SELECT v.VendorName, v.VendorState, SUM (i.InvoiceTotal) AS SumAmount
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
GROUP BY v.VendorName, v.VendorState),
TopAmount AS 
(SELECT VendorState, MAX (SumAmount) AS MaxAmount FROM Summary GROUP BY VendorState)

SELECT s.VendorName,s.VendorState,s.SumAmount,t.MaxAmount
FROM Summary AS s JOIN TopAmount AS t ON S.VendorState=t.VendorState

--qus no 22

INSERT INTO Vendors (VendorName,VendorCity,VendorState, VendorZipCode,DefaultTermsID, DefaultAccountNo)
VALUES
('Jannat','Dhaka','DH','DH123',5,100)
GO

--qus no 23

DELETE FROM Vendors WHERE VendorID='125'

--qus no 25

SELECT InvoiceNumber,TermsID,
CASE TermsID
WHEN 1 THEN '10 DAYS'
WHEN 2 THEN '20 DAYS'
WHEN 3 THEN '30 DAYS'
WHEN 4 THEN '40 DAYS'
WHEN 5 THEN '50 DAYS'
END
AS Term
FROM Invoices
ORDER BY TermsID

--SELECT (CASE WHEN THEN END AS) FROM Invoices .........case function rules

-qus no 26

-----IIF----

--SELECT * FROM Invoices

--SELECT VendorID, InvoiceTotal FROM Invoices

--SELECT VendorID, SUM (InvoiceTotal) AS Amount,
--IIF( SUM (InvoiceTotal)>5000,'High','Low') AS InvStatus
--FROM Invoices
--GROUP BY VendorID

SELECT VendorID, SUM (InvoiceTotal) AS Amount,
IIF( SUM (InvoiceTotal)>5000,'High','Low') AS InvStatus
FROM Invoices
GROUP BY VendorID
ORDER BY  SUM (InvoiceTotal) DESC

------CHOOSE------
--SELECT * FROM Invoices

SELECT InvoiceNumber, InvoiceTotal,TermsID, 
CHOOSE (TermsID,'10 Days','20 DAYS','30 DAYS','40 DAYS','50 DAYS') AS NetDues
FROM Invoices




--qus no 27

--.....ISNULL...

--SELECT * FROM Invoices

SELECT InvoiceNumber,PaymentDate,
ISNULL (PaymentDate,'1900-01-01' ) AS PayDate
FROM Invoices

--.........COALESCE...........

--SELECT * FROM Invoices

--SELECT VendorID,InvoiceTotal
--FROM Invoices i JOIN Vendors v ON i.VendorID=v.VendorID

--SELECT v.VendorName, InvoiceTotal
--FROM Invoices i RIGHT JOIN Vendors v ON i.VendorID=v.VendorID

SELECT v.VendorName, InvoiceTotal,
COALESCE ( CAST (i.InvoiceTotal AS VARCHAR),'NO Invoice') AS VenInv
FROM Invoices i RIGHT JOIN Vendors v ON i.VendorID=v.VendorID


--qus no 28

 --SELECT * FROM Vendors

SELECT VendorState,VendorCity, COUNT (*) AS QtyVendor
 FROM Vendors
 GROUP BY GROUPING SETS ((VendorState,VendorCity), VendorZipCode,())
 ORDER BY VendorState DESC, VendorCity DESC

 -------------------Question 29
-----RANK
SELECT RANK() OVER (ORDER BY InvoiceTotal) AS Rank 
FROM Invoices

---DENSERANK
SELECT InvoiceTotal,
DENSE_RANK() OVER (ORDER BY InvoiceTotal) AS DenseRank
FROM Invoices

---ROW NUMBER
SELECT ROW_NUMBER() OVER (Partition BY VendorState ORDER BY VendorName) AS RowNumber,
VendorState,VendorName
FROM Vendors

---NTILE
SELECT TermsDescription,
NTILE(2) OVER (ORDER BY TermsID) AS Ntile2,
NTILE(3) OVER (ORDER BY TermsID) AS Ntile3,
NTILE(4) OVER (ORDER BY TermsID) AS Ntile4
FROM Terms

-----Question 30

---First value
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
FIRST_VALUE(InvoiceTotal) OVER(PARTITION BY VendorID ORDER BY InvoiceDate)
AS FirstValue
FROM Invoices

---Last value
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
LAST_VALUE(InvoiceTotal) OVER(PARTITION BY VendorID ORDER BY InvoiceDate)
AS LastValue
FROM Invoices
---OR
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
LAST_VALUE(InvoiceDate) OVER(PARTITION BY VendorID ORDER BY VendorID)
AS LastValue
FROM Invoices

----LEAD
---By default 1 ta bad dibe
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
LEAD(InvoiceTotal) OVER(Partition BY VendorID ORDER BY InvoiceDate) AS LeadAmount
FROM Invoices

---OR

SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
LEAD(InvoiceTotal,1,0) OVER(Partition BY VendorID ORDER BY InvoiceDate) AS LeadAmount
FROM Invoices
--
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
LEAD(InvoiceTotal,2,0) OVER(Partition BY VendorID ORDER BY InvoiceDate) AS LeadAmount
FROM Invoices

---LAG
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
LAG(InvoiceTotal) OVER(Partition BY VendorID ORDER BY InvoiceDate) AS LagAmount
FROM Invoices

----PERCENT RANK
SELECT InvoiceTotal,
ROUND(PERCENT_RANK() OVER(ORDER BY InvoiceTotal),2) AS prcntRank
FROM Invoices

---Cumulative_Distribution

SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
CUME_DIST() OVER (Partition BY VendorID ORDER BY InvoiceTotal) AS Cum_dist
FROM Invoices

-----PERCENTILE_CONTINUOUS
SELECt VendorID,InvoiceTotal,PERCENTILE_CONT(0.75)
WITHIN GROUP (ORDER BY InvoiceTotal) OVER (Partition BY VendorID)
AS pcnt_75_cont FROM  Invoices

----PERCENTILE_DISCRITE

SELECt VendorID,InvoiceTotal,PERCENTILE_DISC(0.75)
WITHIN GROUP (ORDER BY InvoiceTotal) OVER (Partition BY VendorID)
AS pcnt_75_Disc FROM  Invoices


---------MERGE------

TRUNCATE TABLE InvoiceArchive

INSERT INTO InvoiceArchive
SELECT * FROM Invoices WHERE InvoiceTotal-PaymentTotal-CreditTotal > 0 

----------- START -- MERGE

MERGE InvoiceArchive As ia
USING InvoiceCopy As ic
ON ic.InvoiceID=ia.InvoiceID
WHEN MATCHED AND
ic.PaymentTotal>ia.PaymentTotal
THEN
UPDATE SET
ia.PaymentTotal=ic.PaymentTotal
WHEN NOT MATCHED THEN 
INSERT(InvoiceID, VendorID,InvoiceNumber,InvoiceDate,InvoiceTotal,PaymentTotal,
CreditTotal,TermsID,InvoiceDueDate)
VALUES (ic.InvoiceID, ic.VendorID,ic.InvoiceNumber,ic.InvoiceDate,ic.InvoiceTotal,ic.PaymentTotal,
ic.CreditTotal,ic.TermsID,ic.InvoiceDueDate)
;

------Recursive CTE-----
USE Examples 
GO
WITH
EmpCTE AS(
SELECT EmployeeID,FirstName+' '+ LastName AS FullName,
1 AS RANK
FROM Employees
WHERE ManagerID IS NULL
UNION ALL
SELECT Employees.EmployeeID,FirstName+' '+ LastName AS FullName,RANK +1
FROM Employees JOIN EmpCTE ON Employees.ManagerID=EmpCTE.EmployeeID
)
SELECT * FROM EmpCTE ORDER By EmployeeID



--.....................................................


CREATE NONCLUSTERED INDEX ix_Invoices_VendorID ON Invoices (VendorID)

--...............JUSTIFY

--EXEC sp_helpindex Invoices 
................

--SELECT CAST ('01-June-2019 10:00 Am' AS DATE) AS NewDate
--SELECT FORMAT (CONVERT (datetime,'01-June-2019 10:00 Am'), 'hh:mm:ss')

--CREATE NONCLUSTERED INDEX ix_SemesterSemesterName ON Semester(SemesterName)
----justify............
--EXEC sp_helpindex Semester 
----............................................
