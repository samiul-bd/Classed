TRuNCATE TABLE InvoiceArchive


INSERT INTO InvoiceArchive 
SELECT * FROM Invoices  WHERE  InvoiceTotal - PaymentTotal -CreditTotal >0
--q4 mcq
SELECT *FROM Invoices 
WHERE VendorID In (SELECT VendorID  FROM Vendors WHERE VendorState In ('CA','NJ'))


--q27mcq
SELECT 