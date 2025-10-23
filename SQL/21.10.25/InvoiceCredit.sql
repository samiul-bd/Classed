USE AP
GO


CREATE VIEW InvoiceCredit
AS
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, PaymentTotal, CreditTotal FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
GO
-- JUSTIFY
SELECT * FROM InvoiceCredit

--UPDATE BY VIEW

UPDATE InvoiceCredit
SET CreditTotal = CreditTotal - 50
WHERE InvoiceTotal - PaymentTotal - CreditTotal >= 100

-- justify
select * from dbo.InvoiceCredit

