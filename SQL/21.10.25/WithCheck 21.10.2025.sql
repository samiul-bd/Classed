USE AP
GO
CREATE VIEW vu_VendorPayment
AS
SELECT InvoiceNumber, InvoiceDate, PaymentDate, InvoiceTotal, PaymentTotal, CreditTotal
FROM Invoices i JOIN Vendors v ON i.VendorID= v.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
GO


UPDATE vu_VendorPayment
SET PaymentTotal=10976.06, PaymentDate = '2025-10-21'
WHERE InvoiceNumber = '0-2436'

GO

---JUSTIFY

SELECT * FROM DBO.vu_VendorPayment


-- UPDATE

UPDATE Invoices
SET PaymentTotal=10976.06, PaymentDate = NULL
WHERE InvoiceNumber = '0-2436'
GO
-- WITH CHECK
