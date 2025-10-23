USE AP
GO
SELECT i.VendorID,v.VendorName, InvoiceNumber, InvoiceTotal, PaymentTotal, CreditTotal ,
(i.InvoiceTotal-i.PaymentTotal- i.CreditTotal) AS BalanceDue
FROM Invoices AS i INNER JOIN Vendors AS v ON i.VendorID=v. VendorID
WHERE (i.InvoiceTotal-i.PaymentTotal- i.CreditTotal )>0
ORDER BY (i.InvoiceTotal-i.PaymentTotal- i.CreditTotal) DESC
--SELECT * FROM Vendors WHERE VendorID=122