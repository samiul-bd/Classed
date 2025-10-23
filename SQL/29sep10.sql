USE AP
GO
SELECT VendorID FROM Vendors WHERE VendorState  IN ('CA','OR','NV')

SELECT * FROM Invoices          
WHERE VendorID  NOT IN (SELECT VendorID FROM Vendors WHERE VendorState  IN ('CA','OR','NV'))
AND InvoiceDate>'2020-01-01'

SELECT i.VendorID, i.InvoiceNumber, i.InvoiceTotal,i.PaymentTotal,i.CreditTotal,
v.VendorID,v.VendorCity, v.VendorState
t.TermsDescription, t.TermsDueDays
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
JOIN Terms AS t  ON t.TermsID=i.TermsID
WHERE InvoiceDate >'2020-01-01' AND v.VendorState NOT IN ('CA','NV','OR')