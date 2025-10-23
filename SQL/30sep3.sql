qus 3

USE AP
GO
SELECT VendorID FROM Vendors WHERE VendorState  IN ('CA','OR','NV')

SELECT * FROM Invoices          
WHERE VendorID  NOT IN (SELECT VendorID FROM Vendors WHERE VendorState  IN ('CA','OR','NV'))
AND InvoiceDate>'2020-01-01'

SELECT i.VendorID, i.InvoiceNumber, i.InvoiceTotal,i.PaymentTotal,i.CreditTotal,
v.VendorID,v.VendorCity, v.VendorState
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
WHERE InvoiceDate >'2020-01-01' AND v.VendorState NOT IN ('CA','NV','OR')



USE AP
GO

SELECT i.InvoiceNumber, i.InvoiceTotal, i.InvoiceDate 
v.VendorName, v.VendorCity, v.VendorState
FROM Invoices AS I JOIN Vendors AS v ON i.VendorID=v.VendorID

USE AP
GO

SELECT i.InvoiceNumber, i.InvoiceTotal, i.InvoiceDate ,
v.VendorName, v.VendorCity, v.VendorState 
FROM Invoices AS I LEFT JOIN Vendors AS v ON i.VendorID=v.VendorID


USE AP
GO

SELECT i.InvoiceNumber, i.InvoiceTotal, i.InvoiceDate ,
v.VendorName, v.VendorCity, v.VendorState 
FROM Invoices AS I RIGHT JOIN Vendors AS v ON i.VendorID=v.VendorID




USE AP
GO

SELECT i.InvoiceID,InvoiceNumber, InvoiceDate,InvoiceTotal, 
il.InvoiceLineItemAmount
FROM Invoices AS i JOIN InvoiceLineItems AS il ON i.InvoiceID= il.InvoiceID AND i.InvoiceTotal>il.InvoiceLineItemAmount
ORDER BY i.InvoiceNumber




USE AP
GO

SELECT VendorCity, VendorState, COUNT (*) AS TotalVendor
FROM Vendors
WHERE VendorState IN ('IA','NJ')
GROUP By VendorCity, VendorState

SELECT VendorCity, VendorState, COUNT (*) AS TotalVendor
FROM Vendors
WHERE VendorState IN ('IA','NJ')
GROUP By VendorCity, VendorState WITH ROLLUP


SELECT VendorCity, VendorState, COUNT (*) AS TotalVendor
FROM Vendors
WHERE VendorState IN ('IA','NJ')
GROUP By VendorCity, VendorState WITH CUBE


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