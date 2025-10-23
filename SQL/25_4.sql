USE AP
GO
SELECT *,(InvoiceTotal-PaymentTotal-CreditTotal) AS BalanceDue FROM Invoices 
WHERE InvoiceTotal-PaymentTotal-CreditTotal>0
ORDER BY InvoiceDate DESC