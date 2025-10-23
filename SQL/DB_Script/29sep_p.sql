
--.....qus no 1

USE AP 
GO
SELECT TOP 5 InvoiceID, InvoiceTotal FROM Invoices
 WHERE (InvoiceTotal= PaymentTotal+ CreditTotal)
 ORDER BY InvoiceTotal DESC

--.....qus no 3

SELECT i.InvoiceNumber,i.InvoiceDate,
v.VendorID,v.VendorState
FROM Invoices AS i JOIN Vendors AS V ON i.VendorID=v.VendorID 
WHERE VendorState NOT IN ('CA','NV','OR') AND
InvoiceDate > '2020-01-01'

--.....qus no 4

SELECT InvoiceID,InvoiceNumber,InvoiceDate FROM Invoices 
WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-31'

--...qus no 5

SELECT VendorID, VendorName, VendorCity FROM Vendors
WHERE VendorCity LIKE ('SAN%')

--QUS no 6

SELECT VendorID,(VendorContactFName +' '+ VendorContactLName) AS ContactName FROM Vendors
WHERE VendorContactFName LIKE '[a,e,i,o,u]%'

--qus no 7
SELECT VendorID,VendorState FROM Vendors 
WHERE VendorState LIKE 'N[A-J]'

qus no 8

SELECT VendorID,VendorState FROM Vendors 
WHERE VendorState LIKE 'N[^k-Y]'

--qus no 9

SELECT VendorID,VendorName,VendorCity FROM Vendors
ORDER BY VendorID 
OFFSET 10 ROWS FETCH NEXT 20 ROWS ONLY

--qus no 11

SELECT * FROM Vendors

INSERT INTO Vendors (VendorName,VendorCity,VendorState,VendorZipCode,DefaultTermsID,DefaultAccountNo)
VALUES ('SAM','DHAKA','BN','1205','5','976')