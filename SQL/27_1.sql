USE AP
GO


--SELECT * FROM Invoices
--SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,SUM( PaymentTotal+CreditTotal) AS Total
--FROM Invoices
--WHERE InvoiceDate> '2020-01-01' OR InvoiceTotal>500
--GROUP BY InvoiceNumber,InvoiceDate, InvoiceTotal
--HAVING InvoiceTotal> SUM (PaymentTotal + CreditTotal)


CREATE VIEW vu_QueryWithDuesVendorInfoAndTerms
AS 
SELECT i.InvoiceNumber, i.InvoiceDate, i.InvoiceTotal,i.PaymentTotal,i.CreditTotal,
i.InvoiceTotal-i.PaymentTotal-i.CreditTotal AS BalanceDue,
v.VendorName, v.VendorCity, v.VendorState,
t.TermsDescription, t.TermsDueDays
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
JOIN TERMS AS t ON t.TermsID=i.TermsID
WHERE i.InvoiceTotal-i.PaymentTotal-i.CreditTotal>0 AND v.VendorState='TN'