USE AP
GO
SELECT i.VendorID,v.VendorName,InvoiceTotal,InvoiceNumber, Paymenttotal,
il.AccountNo, il.InvoiceLineItemAmount,il.
FROM Invoices AS i JOIN Vendors AS v
ON i.VendorID=v.VendorID
JOIN InvoicesLineItems AS il ON i.InvoiceID=il.InvoiceID