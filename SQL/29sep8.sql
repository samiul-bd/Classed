USE AP
GO
SELECT i.InvoiceNumber, i.InvoiceDate,
v.VendorName,v.VendorState
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID 
WHERE v.VendorState NOT IN ('CA','NV','OR') AND  i.InvoiceDate >'2020-01-01' 
 