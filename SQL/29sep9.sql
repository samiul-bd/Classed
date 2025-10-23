USE AP
GO

--SELECT i.VendorID, i.InvoiceNumber, i.InvoiceTotal, i.InvoiceDate ,
--(i.InvoiceTotal-i.PaymentTotal-i.CreditTotal) AS due,
--v.VendorName, v.VendorCity, v.VendorState,
--il.InvoiceLineItemDescription, il.InvoiceLineItemAmount
--FROM Invoices AS i LEFT JOIN Vendors AS v ON i.VendorID=v.VendorID
--JOIN InvoiceLineItems AS il ON il.InvoiceID=i.InvoiceID
--WHERE i.InvoiceTotal-i.PaymentTotal-i.CreditTotal>0


SELECT InvoiceNumber, InvoiceDate,InvoiceTotal,PaymentTotal,CreditTotal ,
il.AccountNo, il.InvoiceLineItemAmount,il.InvoiceLineItemDescription
FROM Invoices AS i JOIN  InvoiceLineItems AS il ON i.InvoiceID=il.InvoiceID
JOIN GLAccounts AS g ON il.AccountNo=g.AccountNo