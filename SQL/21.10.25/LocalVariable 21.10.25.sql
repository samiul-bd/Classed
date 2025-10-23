USE AP
GO

DECLARE @MaxInvoice money, @MinInvoice money;
DECLARE @PercentDifference decimal(8,2);
DECLARE @InvoiceCount int; 
DECLARE @VendorIdVar int;

SET @VendorIdVar = 95;

SET @MaxInvoice = (SELECT MAX(InvoiceTotal) from Invoices where VendorID = @VendorIdVar);
SELECT @MinInvoice=MIN(InvoiceTotal) ,@InvoiceCount =COUNT(*) FROM INVOICES 
WHERE VendorID = @VendorIdVar 
SET @PercentDifference=(@MaxInvoice-@MinInvoice)/@MinInvoice*100;

PRINT 'Maximum Invoice Amount is $' + CONVERT (Varchar, @maxInvoice,1)+' .';
PRINT 'Minimum Invoice Amount is $' + CONVERT (Varchar, @minInvoice,1)+' .';
PRINT 'Percent Of Invoices' + CONVERT (Varchar, @PercentDifference)+' .';
PRINT ' Number Of Invoices' + CONVERT (VARCHAR,@InvoiceCount);





SELECT * FROM Invoices WHERE VendorID = 95