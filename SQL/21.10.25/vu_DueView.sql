USE AP
GO
CREATE VIEW vu_DueView
AS
SELECT COUNT(*) Invqnty, SUM(InvoiceTotal) InvTotal from Invoices i JOIN Vendors v ON i.VendorID=v.VendorID
WHERE InvoiceTotal- PaymentTotal - CreditTotal > 0
GROUP BY v.VendorName
GO

--JUSTIFY
SELECT * FROM vu_DueView

