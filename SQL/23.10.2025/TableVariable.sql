USE AP
GO

DECLARE @BigBudgetVendor TABLE
(
VendorName varchar (50), 
vendorcity varchar (14), 
vendorState char(2)
);



INSERT @BigBudgetVendor
select VendorName, VendorCity, VendorState from Vendors
where VendorID in (select distinct VendorID from Invoices where InvoiceTotal > 5000)


--JUSTIFY
SELECT * FROM @BigBudgetVendor