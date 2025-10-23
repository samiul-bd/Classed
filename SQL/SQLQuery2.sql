 WITH Summary AS 
(SELECT v.VendorName, v.VendorState, SUM (i.InvoiceTotal) AS SumAmount
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
GROUP BY v.VendorName, v.VendorState),
TopAmount AS 
(SELECT VendorState, MAX (SumAmount) AS MaxAmount FROM Summary GROUP BY VendorState)

SELECT s.VendorName,s.VendorState,s.SumAmount,t.MaxAmount
FROM Summary AS s JOIN TopAmount AS t ON S.VendorState=t.VendorState
--..........................................................................................


WITH
SUMMARY AS 
(select v.VendorName ,v.VendorCity , SUM (i.InvoiceTotal ) AS SIT 
FROM Invoices AS i join Vendors v On i.VendorID =v.VendorID
GROUP BY   v.VendorName ,v.VendorCity ),

TopAmount AS 

( SELECT VendorCity ,MAX (SIT)AS MSIT FROM Summary 
GROUP BY VendorCity)

SELECT s.VendorName ,s.VendorCity , s.SIT  ,t.MSIT FRom SUMMARY AS s join TopAmount AS t on s.VendorCity =t.VendorCity 

--.....................................
WITH 
SUmmary AS (
SELECT v.VendorCity ,v.VendorAddress1 ,Sum (i.InvoiceTotal ) AS STotal  
FROM Invoices AS i JOIN Vendors AS v On i.VendorID =v.VendorID 
GROUP BY v.VendorCity ,v.VendorAddress1) ,

TOPAMOUNT AS (
SELECT VendorCity ,MAX (STotal  ) AS MSTotal 
FROM SUmmary 
GROUP BY  VendorCity ) 


SELECT s.VendorCity ,s.VendorAddress1 ,s.STotal,t.MSTotal FROM SUmmary AS s join TOPAMOUNT AS t ON s.VendorCity =t.VendorCity 