USE AP
GO

USE AP
GO
---1-----------
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
FIRST_VALUE(InvoiceTotal) OVER(PARTITION BY VendorID ORDER BY VendorID)
AS FirstValue FROM Invoices
---2---------------------
SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate,
LAST_VALUE(InvoiceTotal) OVER(PARTITION BY VendorID ORDER BY VendorID)
AS FirstValue FROM Invoices
----3------------------
 SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate ,
 LEAD(InvoiceTotal,1,0) OVER(Partition BY VendorID Order BY InvoiceDate DESC) AS LeadAmount
 FROM Invoices
----4--------------------
  SELECT InvoiceID,InvoiceTotal,VendorID,InvoiceDate ,
 LAG(InvoiceTotal,1,0) OVER(Partition BY VendorID Order BY InvoiceDate DESC) AS LagAmount
 FROM Invoices
----5--------------
 SELECT InvoiceTotal,
 ROUND(PERCENT_RANK() OVER(ORDER BY InvoiceTotal),2) AS PcntRank
  FROM Invoices
----6--------------------
 SELECT InvoiceID,InvoiceTotal,InvoiceDate, VendorID,
 CUME_DIST() OVER (PARTITION BY VendorID ORDER BY InvoiceTotal) AS Cum_dist
 FROM Invoices
----7--------
 SELECT VendorID,InvoiceTotal,PERCENTILE_CONT(0.75)
 WITHIN GROUP (ORDER BY InvoiceTotal) OVER (PARTITION BY VendorID)
 AS pcnt_75_Cont FROM Invoices
 ---8-----------
 SELECT VendorID,InvoiceTotal,PERCENTILE_DISC(0.75)
 WITHIN GROUP (ORDER BY InvoiceTotal) OVER (PARTITION BY VendorID)
 AS pcnt_75_Disk FROM Invoices