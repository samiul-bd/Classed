USE AP
go

DECLARE @MaxInvValue money;
DECLARE @MinInvValue money;
DECLARE @InvCount int;
SELECT @MaxInvValue=MAX(InvoiceTotal), @MinInvValue= MIN(InvoiceTotal),@InvCount=COUNT(*) FROM Invoices



SET @MaxInvValue= (SELECT max(InvoiceTotal) FROM Invoices)
PRINT 'Maximum invoice value $' + Convert(varchar,@MaxInvValue,1) 


SET @MinInvValue= (SELECT min(InvoiceTotal) FROM Invoices)
PRINT 'Miniimum invoice value $' + Convert(varchar,@MinInvValue,1) 



