USE AP
GO
--INSERT INTO Invoices(VendorID, InvoiceNumber, InvoiceDate, InvoiceTotal, 
--PaymentTotal, CreditTotal,TermsID, InvoiceDueDate)
--VALUES 
--(124, '124Jui','2025-09-27', '1000', 0,0,1,'2025-09-30')

SELECT * FROM Vendors WHERE VendorID=124
DELETE FROM Vendors WHERE VendorID=124

INSERT INTO Vendors 