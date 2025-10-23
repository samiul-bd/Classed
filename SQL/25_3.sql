USE AP
GO
SELECT * , (InvoiceTotal-PaymentTotal-CreditTotal) BalanceDue FROM Invoices
WHERE InvoiceTotal-PaymentTOtal-CreditTotal>0 
ORDER BY (InvoiceTotal-PaymentTotal-CreditTotal) DESC