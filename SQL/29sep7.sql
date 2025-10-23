USE AP
GO

SELECT i.InvoiceID,InvoiceNumber, InvoiceDate,InvoiceTotal, 
il.InvoiceLineItemAmount
FROM Invoices AS i JOIN InvoiceLineItems AS il ON i.InvoiceID= il.InvoiceID AND i.InvoiceTotal>il.InvoiceLineItemAmount
ORDER BY i.InvoiceNumber'