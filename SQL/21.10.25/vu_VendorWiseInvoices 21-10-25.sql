
-- vendors who have dues and Vendorstate = 'CA'

ALTER VIEW vu_VendorWiseInvoices
AS

SELECT VendorName, VendorCity, VendorState, I.InvoiceNumber  FROM Vendors v Join Invoices i on i.VendorID = v.VendorID 
WHERE i.InvoiceTotal - i.PaymentTotal - i.CreditTotal > 0 AND V.VENDORSTATE = 'CA' 

--justify

select * from vu_VendorWiseInvoices