use AP
GO
--------to retrive FIRST_VALUE
SELECT InvoiceID, InvoiceTotal, VendorID, InvoiceDate,
FIRST_VALUE(InvoiceTotal) OVER (PARTITION BY VendorID ORDER BY InvoiceTotal DESC )
as FirstValue
FROM Invoices

--------to retrive LAST_VALUE
SELECT InvoiceID, InvoiceTotal, VendorID, InvoiceDate,
LAST_VALUE(InvoiceTotal) OVER (PARTITION BY VendorID ORDER BY InvoiceTotal DESC )
as FirstValue
FROM Invoices


