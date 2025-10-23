USE Ap
GO

--SELECT * FROM Invoices WHERE VendorID=34

SELECT InvoiceNumber, InvoiceDate,InvoiceTotal FROM Invoices 
WHERE InvoiceTotal> ANY
(SELECT InvoiceTotal FROM Invoices WHERE VendorID=34)

SELECT InvoiceNumber, InvoiceDate,InvoiceTotal FROM Invoices 
WHERE InvoiceTotal> ALL
(SELECT InvoiceTotal FROM Invoices WHERE VendorID=34)

SELECT InvoiceNumber, InvoiceDate,InvoiceTotal FROM Invoices 
WHERE InvoiceTotal> SOME
(SELECT InvoiceTotal FROM Invoices WHERE VendorID=34)