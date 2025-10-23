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

AND s.SumTotal=m.MaxSum 



SELECT InvoiceID ,InvoiceTotal ,InvoiceDate ,VendorID , LEAD (InvoiceTotal,1,0 )OVER (PARTITION BY VendorID ORDER BY VendorID) FROM Invoices 

SELECT InvoiceID ,InvoiceTotal ,InvoiceDate ,VendorID , LAG (InvoiceTotal,1,0 )OVER (PARTITION BY VendorID ORDER BY VendorID) FROM Invoices 

SELECT InvoiceID ,InvoiceTotal ,InvoiceDate,VendorID, CUME_DIST () OVER ( PARTITION BY VendorID ORDER BY InvoiceTotal)NewC  FROM Invoices 

SELECT InvoiceTotal, PERCENT_RANK () OVER (ORDER BY InvoiceTotal) AS PcntRank FROM Invoices 

SELECT VendorID , PERCENTILE_DISC (0.75) WITHIN GROUP (ORDER BY InvoiceTotal) 
OVER (PARTITION BY VendorID)
FROM Invoices  

SELECT VendorID , PERCENTILE_CONT (0.75) WITHIN GROUP (ORDER BY InvoiceTotal) 
OVER (PARTITION BY VendorID)
FROM Invoices 

--.....................
WITH 
SmCTE AS (
SELECT v.VendorCity ,v.VendorState , SUM (InvoiceTotal) AS SumTotal FROM Invoices AS i JOIN Vendors AS v ON i.VendorID =v.VendorID 
GROUP BY v.VendorCity ,v.VendorState),

SELECT s.vendorState FROM SmCTE  AS s 



SELECT * FROM Invoices 
INSERT INTO Invoices (VendorID ,InvoiceNumber ,InvoiceDate ,InvoiceTotal ,PaymentTotal ,CreditTotal ,TermsID ,InvoiceDueDate ,PaymentDate )
VALUES (122 ,123333,'2020-02-13',303,346,0,2,'2020-03-13','2020-03-12')



