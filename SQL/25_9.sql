USE AP
GO
SELECT i.VendorID,v.VendorName, InvoiceNumber,InvoiceDate,InvoiceTotal,PaymentTotal, CreditTotal ,
il.AccountNo,il.InvoiceLineItemAmount,il.InvoiceLineItemDescription
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
JOIN InvoiceLineItems AS il ON i.InvoiceID=il.InvoiceID
WHERE i.InvoiceTotal>10000;