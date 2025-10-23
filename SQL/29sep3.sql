USE AP
GO

SELECT COUNT (*) Numberofinvoices,SUM(InvoiceTotal-PaymentTotal-CreditTotal)AS TotalDue FROM Invoices 
WHERE InvoiceTotal-PaymentTotal-CreditTotal>0