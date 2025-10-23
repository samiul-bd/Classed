USE AP
GO

SELECT InvoiceID ,InvoiceNumber ,InvoiceTotal ,PaymentTotal  FROM Invoices 
UPDATE Invoices SET InvoiceTotal =InvoiceTotal +100,PaymentTotal = PaymentTotal +100
where InvoiceID =1

SELECT InvoiceID ,InvoiceNumber  FROM 
(SELECT InvoiceID ,InvoiceNumber ,InvoiceTotal ,PaymentTotal  FROM Invoices ) AS table1 

SELECT InvoiceID , AVG (InvoiceNumber) AS AvgTotal , SUM(PaymentTotal ) AS SumTotal FROM Invoices 
GROUP BY InvoiceID

SELECT COUNT (*),InvoiceID , MIN (InvoiceNumber) AS AvgTotal , MAX(PaymentTotal ) AS SumTotal FROM Invoices 
GROUP BY InvoiceID

SELECT InvoiceID ,InvoiceNumber  FROM 
(SELECT InvoiceID,VendorID ,TermsID,InvoiceNumber ,InvoiceTotal ,PaymentTotal  FROM Invoices ) AS table1 
