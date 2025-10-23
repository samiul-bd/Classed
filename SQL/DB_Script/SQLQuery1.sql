USE AP
GO

SELECT * FROM Invoices

--WHERE InvoiceID = 78

WHERE InvoiceTotal - ( PaymentTotal + CreditTotal )> 0


SELECT 
 'After 7/1/2019' AS SelectionDate, COUNT(*) AS NumberOfInvoices,
AVG (InvoiceTotal ) AIT ,SUM (InvoiceTotal) TotalAmount  
FROM Invoices
WHERE InvoiceDate > '2019-07-01'