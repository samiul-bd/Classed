USE AP
GO

--q1

--SELECT InvoiceID ,InvoiceTotal ,PaymentTotal ,CreditTotal  FROM Invoices 
--WHERE InvoiceTotal =PaymentTotal +CreditTotal 

--q2

--SELECT InvoiceDate ,PaymentTotal ,CreditTotal ,InvoiceTotal ,InvoiceID  FROM Invoices 
--WHERE InvoiceDate >'2020-01-01'
--AND InvoiceTotal > (PaymentTotal + CreditTotal )
--OR InvoiceTotal >500

--q3

--SELECT InvoiceID , v.VendorID ,VendorCity ,VendorState 
--FROM Invoices AS i JOIN Vendors AS v ON i.VendorID =v.VendorID  
--WHERE VendorState NOT IN ('CA','NV','OR')
--AND InvoiceDate >'2020-01-01'

--q4
--SELECT InvoiceID ,InvoiceDate  FROM Invoices 
--WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-30'
--ORDER BY InvoiceDate DESC

--q5
--SELECT * FROM Vendors 
--WHERE VendorCity LIKE 'SAN%'

--q6

--SELECT * FROM Vendors 
--WHERE VendorContactFName LIKE '[a,e,i,o,u]%'

--q7
--SELECT * FROM Vendors 
--WHERE VendorState LIKE 'N[A_J]%'

----q8
--SELECT * FROM Vendors 
--WHERE VendorState LIKE 'N[^K_Y]%'

--q9
--SELECT VendorID ,VendorCity ,VendorState  FROM Vendors 
--ORDER BY VendorID 
--OFFSET 10 ROWS FETCH NEXT 20 ROWS ONLY 

--q9

--SELECT * FROM Vendors 
-- ORDER BY VendorID 
-- OFFSET 10 ROWS FETCH NEXT 20 ROWS ONLY 

--q10

--SELECT InvoiceID , AVG(InvoiceTotal) AS AvgAmount ,InvoiceNumber  FROM Invoices
--GROUP BY InvoiceID ,InvoiceNumber 
--HAVING AVG(InvoiceTotal) >2000
--ORDER BY AVG(InvoiceTotal) DESC

--q11

--SELECT VendorCity ,VendorState  FROM Vendors 
--WHERE VendorState In ('CA','NJ') 
--GROUP BY VendorCity ,VendorState WITH CUBE

--Q11

--SELECT * FROM Invoices WHERE Invoices.VendorID =Vendors.VendorID 

--SELECT * FROM Vendors 
--WHERE EXISTS (SELECT * FROM Invoices WHERE Invoices.VendorID =Vendors.VendorID )

----q20

--SELECT * FROM Invoices WHERE Invoices.VendorID =Vendors.VendorID 

--SELECT * FROM Vendors 
--WHERE EXISTS (SELECT * FROM Invoices WHERE Invoices.VendorID =Vendors.VendorID )

----q20

--SELECT * FROM Invoices WHERE Invoices.InvoiceID = Vendors.VendorID 

--SELECT * FROM Vendors 
--WHERE EXISTS (SELECT * FROM Invoices WHERE Invoices.InvoiceID = Vendors.VendorID )

--q11

--SELECT VendorCity ,VendorState  FROM Vendors 
--WHERE VendorState IN ('DC','CA')
--GRoup BY VendorCity ,VendorState WITH CUBE

----q12
----SELECT * FROM Vendors 

----...............
----corelated subquery

--SELECT DISTINCT VendorID  FROM Invoices 

--SELECT * FROM Vendors WHERE VendorID  NOT IN (SELECT DISTINCT VendorID  FROM Invoices )

--SELECT VendorName ,VendorCity ,VendorZipCode  FROM Vendors WHERE VendorID  NOT IN (SELECT DISTINCT VendorID  FROM Invoices )

----....

--SELECT AVG(InvoiceTotal) AS AvgAmount  FROM Invoices 


--SELECT InvoiceID ,InvoiceNumber,InvoiceTotal ,VendorID  FROM Invoices AS outerInv
--WHERE VendorID =123 AND InvoiceTotal >(SELECT AVG(InvoiceTotal) AS AvgAmount  FROM Invoices AS InnerInv WHERE InnerInv .VendorID =outerInv .VendorID 
--)


--SELECT AVG(InvoiceTotal)  FROM Invoices 

--SELECT * FROM Invoices inv1
--WHERE InvoiceTotal >(SELECT AVG(InvoiceTotal)  FROM Invoices inv2 WHERE inv1.VendorID =inv2 .VendorID) 


----SELECT VendorID  FROM Vendors WHERE VendorState ='NJ'
----SELECT * FROM Invoices WHERE VendorID  IN (SELECT VendorID  FROM Vendors WHERE VendorState ='CA')
----SELECT * FROM Invoices WHERE EXISTS (SELECT *  FROM Vendors WHERE VendorState ='CA')
------..................

--SELECT TermsDueDays ,
--CASE TermsDueDays
--WHEN 10 THEN '100 taka'
--WHEN 20 THEN '200 taka'
--WHEN 30 THEN '300 taka'
--ELSE 'NO taka found'
--END  NewDue
--FROm Terms 

----........................................

--SELECT InvoiceID , ISNULL (PaymentDate,'1900-01-01') AS NullDate FROM Invoices 

--SELECT InvoiceID , COALESCE (PaymentDate,'2025-01-01','1900-01-01') AS NullDate FROM Invoices
--WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-30'

--.....................................

CREATE NONCLUSTERED INDEX ix_Invoices_InvoiceNumber ON Invoices (InvoiceNumber)

--justify

--EXEC sp_helpindex Invoices 

WITH 
 SumCTE AS (

SELECT v.VendorName ,v.VendorState ,SUM(InvoiceTotal) SumTotal 
FROM Invoices AS i JOIn Vendors AS v ON i.VendorID =v.VendorID 
GROUP BY v.VendorName ,v.VendorState ),
MaxAmountByState AS (
SELECT s.VendorState,MAX(s.SumTotal) AS MaxAmount FROM SumCTE  AS s
GROUP BY s.VendorState
)
SELECT * FROM SumCTE s JOIN MaxAmountByState as m ON s.VendorState=m.VendorState
 