use ap
go


--q1
--SELECT Top 5 InvoiceID , InvoiceTotal ,PaymentTotal ,CreditTotal  FROM Invoices 
--WHERE InvoiceTotal = PaymentTotal +CreditTotal 
--ORDER BY InvoiceTotal DESC

----q2
--SELECT InvoiceDate ,InvoiceTotal , PaymentTotal ,CreditTotal  from Invoices 
--WHERE InvoiceDate >'2020-01-01' 
--AND InvoiceTotal > PaymentTotal + CreditTotal 
--OR InvoiceTotal >500

----q9
--select * from Vendors 
--order  by VendorID 
--offset 10 rows fetch next 20 Rows only


--  q10
--SELECT VendorID ,AVG (InvoiceTotal ) AS AvgAmount  FROM Invoices 
--Group by VendorID 
--Having AVG (InvoiceTotal ) >2000
--order by AVG (InvoiceTotal ) DESC

----q11
--SELECT VendorCity ,VendorState  FROM Vendors 
--WHERE VendorState in ('CA','NJ')
--GRoup by VendorCity ,VendorState WITH CUBE

----q12
--SELECT VendorCity ,VendorState  FROM Vendors 
--WHERE VendorState IN ('CA','NJ')
--GROUP BY VendorCity ,VendorState with ROLLUP

--q13
--SELECT VendorID ,InvoiceTotal ,COUNT (*) FROM Invoices 
--GROUP BY GROUPING SETs (VendorID ,InvoiceTotal),(VendorID ),(InvoiceTotal),()
--ORDER BY VendorID,InvoiceTotal  DESC
--q14
--SELECT InvoiceNumber , COUNT (InvoiceTotal) OVER (PARTITION BY VendorID)AS VendorTotal FROM Invoices 
--q15



--SELECT * FROM Vendors WHERE VendorID IN (SElect DiStinct  VendorID  FROM Invoices )
  
 --SELECT * FROM Vendors WHERE VendorID  NOT IN (SELECT DISTinct  VendorID  FROM Invoices)

 --Q16
-- select InvoiceID ,VendorID ,InvoiceTotal  from Invoices 
-- where InvoiceTotal >ALL
--(select InvoiceTotal  from Invoices where VendorID =34)

----Q11

--seLECT VendorCity ,VendorState,count (*)  FROM Vendors 
--where VendorState IN ('CA','NJ')
--Group by VendorCity ,VendorState WITH CUBE

--q17
--SElect InvoiceID ,InvoiceTotal,PaymentTotal ,TermsID  from Invoices 
--where InvoiceTotal >Any
--(select InvoiceTotal  from Invoices where VendorID =34 )

--SELECT * FROM Invoices 
--WHERE  PaymentTotal  > All
--(SELECT PaymentTotal   FROM Invoices where VendorID =123 )


--SELECT * FROM Invoices 
--WHERE  PaymentTotal  > Some
--(SELECT PaymentTotal   FROM Invoices where VendorID =123 )

--q19
SELECT VendorID , vendorName , (SELECT MAX (InvoiceTotal ) FROM Invoices AS i join Vendors AS v on i.VendorID =v.VendorID  ) AS VIT FROM Vendors 
ORDER BY VendorID DESC

SELECT VendorID,VendorName,
(SELECT MAX(InvoiceTotal) FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID) AS LatestInvDate
FROM Vendors


--cte

WITH 
 Summary AS (
SELECT SUM (InvoiceTotal) AS Newamount ,v.VendorName ,v.VendorCity   
FROM Invoices AS i JOIN Vendors v on i.VendorID =v.VendorID 
GROUP BY v.VendorName ,v.VendorCity ),

(SELECT v.vendorID, MAX (NewAmount)AS MNA FROM Summary  )

SELECT * FROM Vendors 



 WITH Summary AS 
(SELECT v.VendorName, v.VendorState, SUM (i.InvoiceTotal) AS SumAmount
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
GROUP BY v.VendorName, v.VendorState),
TopAmount AS 
(SELECT VendorState, MAX (SumAmount) AS MaxAmount FROM Summary GROUP BY VendorState)

SELECT s.VendorName,s.VendorState,s.SumAmount,t.MaxAmount
FROM Summary AS s JOIN TopAmount AS t ON S.VendorState=t.VendorState