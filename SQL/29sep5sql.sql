USE AP
GO

--SELECT i.InvoiceNumber,i.InvoiceDate,i. InvoiceTotal,
--v.VendorName,il.InvoiceLineItemDescription,ga.AccountDescription
--FROM Invoices AS i JOIN Vendors AS v ON (i.VendorID=v.VendorID ) 
--JOIN InvoiceLineItems AS il ON il.InvoiceID=i.InvoiceID
--JOIN GLAccounts AS ga  ON ga.AccountNo=il.AccountNo
--WHERE InvoiceTotal-PaymentTotal-CreditTotal>0
--ORDER BY VendorName,il.InvoiceLineItemDescription


SELECT Invoices.InvoiceNumber,Invoices.InvoiceTotal,Invoices.InvoiceDate,
,Vendors.VendorName ,GLAccounts.AccountDescription,InvoiceLineItems.InvoiceLineItemDescription

FROM Invoices , Vendors, InvoiceLineItems,GLAccounts
WHERE Invoices.VendorID=Vendors.VendorID
AND Invoices.InvoiceID=InvoiceLineItems.InvoiceID
AND GLAccounts.AccountNo=InvoiceLineItems.AccountNo
AND Invoices.InvoiceTotal-Invoices.PaymentTotal-Invoices.CreditTotal>0