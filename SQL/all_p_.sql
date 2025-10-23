------Question no 01------
USE AP
GO

SELECT TOP 5 InvoiceID,InvoiceNumber,InvoiceTotal,PaymentTotal,CreditTotal FROM Invoices
WHERE InvoiceTotal=(PaymentTotal+CreditTotal)
ORDER BY InvoiceTotal DESC 

------Question 02-----
SELECT * FROM Invoices
WHERE InvoiceTotal >(PaymentTotal+CreditTotal) AND InvoiceDate> '2020-01-01' 
OR InvoiceTotal>500

--OR
SELECT * FROM Invoices
WHERE InvoiceDate> '2020-01-01' AND InvoiceTotal >(PaymentTotal+CreditTotal) 
OR InvoiceTotal>500

-----Question no 03
SELECT InvoiceID,InvoiceNumber,InvoiceTotal,PaymentTotal,CreditTotal FROM Invoices
WHERE VendorID NOT IN (SELECT VendorID FROM Vendors WHERE VendorState IN('CA','NV','OR'))
AND InvoiceDate > '2020-01-01'


---Question no 04
SELECT InvoiceID,InvoiceNumber,InvoiceTotal,PaymentTotal,CreditTotal FROM Invoices
WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-30'

----Question no 05
SELECT VendorName,VendorCity,VendorState FROM Vendors
WHERE VendorCity LIKE 'SAN%'

----Question no 06
SELECT VendorName,VendorCity,VendorState,VendorContactFName,VendorContactLName FROM Vendors
WHERE VendorContactFName LIKE '[a,e,i,0,u]%'

----Question no 07
SELECT VendorName,VendorCity,VendorState FROM Vendors
WHERE VendorState LIKE 'N[A-J]'

---Question no 08
SELECT VendorName,VendorCity,VendorState FROM Vendors
WHERE VendorState LIKE 'N[^K-Y]'

----Question no 09

SELECT * FROM Vendors
ORDER BY VendorID
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY

----Question no 10

---Here we group by with VendorID not InvoiceID because InvoiceID is unique no repetation.
--so with that group by doesn't make sense.vendorID repeat that's why we use vendorID 

SELECT VendorID,COUNT(InvoiceID) AS NumberOfInvc ,AVG( InvoiceTotal) AS AvgAmount
FROM Invoices
GROUP BY VendorID
HAVING AVG( InvoiceTotal) > 2000
ORDER BY AVG( InvoiceTotal) DESC



----Question No 11--
SELECT VendorCity,VendorState,Count(*) AS TotalVendor FROM Vendors
WHERE VendorState IN ('NJ','IJ')
GROUP BY VendorCity,VendorState WITH CUBE

---Question no 12

SELECT VendorCity,VendorState,COUNT(*) AS TotalVendor FROM Vendors
WHERE VendorState IN ('NJ','IJ')
GROUP BY VendorCity,VendorState WITH ROLLUP


----Question no 13

SELECT VendorID,TermsID,SUM(InvoiceTotal) AS SumAmount FROM Invoices
GROUP BY GROUPING SETS(
(VendorID,TermsID),
(TermsID),
()
)

-----Question no 14

SELECT InvoiceNumber,VendorID,
SUM(InvoiceTotal) OVER (Partition BY VendorID) AS VendorTotal
FROM Invoices

--OR

SELECT InvoiceNumber,InvoiceDate,
SUM(InvoiceTotal) OVER (Partition BY InvoiceDate) AS DateTotal
FROM Invoices

---OR

SELECT VendorID,TermsID,
SUM(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorTotal
FROM Invoices

---Question no 15

SELECT VendorID,VendorName,VendorCity FROM Vendors
WHERE VendorID IN(SELECT DISTINCT VendorID FROM Invoices)

---Question no 16

----  > ANY/ SOME→ greater than at least one value (basically greater than the minimum)
----  > ALL → greater than all values (basically greater than the maximum)

SELECT * FROM Invoices
WHERE InvoiceTotal> ANY(SELECT InvoiceTotal FROM Invoices WHERE VendorID=34)

---Question no 17
SELECT * FROM Invoices
WHERE InvoiceTotal>ALL(SELECT InvoiceTotal FROM Invoices WHERE VendorID =34)

-----Question no 18
SELECT * FROM Invoices
WHERE InvoiceTotal>SOME(SELECT InvoiceTotal FROM Invoices WHERE VendorID =34)

------- Question no 19
SELECT VendorID,VendorName,
(SELECT MAX(InvoiceTotal) FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID) AS LatestInvDate
FROM Vendors


------Question no 20

------Vendors with invoices

SELECT VendorName,VendorCity,VendorState 
FROM Vendors
WHERE EXISTS(SELECT * FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID)

---OR ------Vendors without invoices

SELECT VendorName,VendorCity,VendorState 
FROM Vendors
WHERE NOT EXISTS(SELECT * FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID)

--Question no 21 --CTE
WITH

SummaryTable AS
(SELECT v.VendorState,v.VendorCity,SUM(InvoiceTotal) AS SumAmount 
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
GROUP BY v.VendorState,v.VendorCity),

TopAmountTable AS
(SELECT VendorState,MAX(SumAmount) AS MaxSumAmount
FROM SummaryTable
GROUP BY VendorState)

SELECT s.VendorState,s.VendorCity,s.SumAmount,t.MaxSumAmount
FROM SummaryTable AS s JOIN TopAmountTable AS t ON s.VendorState=t.VendorState

----Question 22

SELECT VendorName,VendorCity,VendorState,VendorZipCode,DefaultTermsID,DefaultAccountNo FROM Vendors

INSERT INTO Vendors(VendorName,VendorCity,VendorState,VendorZipCode,DefaultTermsID,DefaultAccountNo)
VALUES
('Monjuri','Dhaka','DH','1235',4,540)

SELECT * FROM Vendors
WHERE VendorName='Monjuri'

---------Question no 23

DELETE FROM Vendors
WHERE VendorID=126

----------Question 25
SELECT InvoiceNumber,TermsID, 
CASE TermsID
WHEN 1 THEN '10 Days'
WHEN 2 THEN '20 days'
WHEN 3 THEN '30 days'
WHEN 4 THEN '40 days'
WHEN 5 THEN '50 days'
END 
AS Condition
FROM Invoices
ORDER BY TermsID

-------Searched CASE
USE AP
GO
SELECT InvoiceNumber,InvoiceTotal,InvoiceDate,InvoiceDueDate,
DATEDIFF(day,InvoiceDueDate,GETDATE()) DIFFDate,
CASE 
WHEN DATEDIFF(day,InvoiceDueDate,GETDATE())>2100
THEN'OVER 2100 days'
WHEN DATEDIFF(day,InvoiceDueDate,GETDATE()) >2000
THEN 'OVER 2000 days'
ELSE 'NONE'
END
AS DayStatus
FROM Invoices


----Question No 26

----IIF----IIF(condition,true,false)

 SELECT VendorID,SUM(InvoiceTotal) AS Amount,
 IIF(SUM(InvoiceTotal)>5000,'High','Low') AS InvoiceStatus
 FROM Invoices
 GROUP BY VendorID
 ORDER BY SUM(InvoiceTotal) DESC

 ----CHOOSE
SELECT InvoiceNumber,InvoiceTotal,TermsID,
CHOOSE(TermsID,'10 Days','20 Days','30 Days','40 Days','50 Days') AS NetDues
FROM Invoices
ORDER BY 

------Question 27

---ISNULL --Duitai valu Thake
SELECT PaymentDate,ISNULL(PaymentDate,'1900-01-01') AS Newdate FROM Invoices

------COALESCE---List of expression theke value ney

SELECT PaymentDate,COALESCE(PaymentDate,'1900-01-01') AS Newdate FROM Invoices

SELECT PaymentDate,COALESCE(PaymentDate,'2020-01-01','1900-01-01') AS Newdate FROM Invoices

---ISNULL(expression, replacement_value)
----If the expression is NULL, it returns the replacement_value.
----If the expression is not NULL, it returns the original value.

SELECT InvoiceNumber,PaymentDate, 
ISNULL(PaymentDate,'1900-01-01') AS PayDate
FROM Invoices

---Question 28

SELECT VendorCity,VendorState,COUNT (*) AS QtyVendor
FROM Vendors
GROUP BY GROUPING SETS((VendorCity,VendorState),VendorZipCode,())
ORDER BY VendorCity DESC,VendorState DESC

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