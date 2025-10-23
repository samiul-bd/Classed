USE AP
GO

IF OBJECT_ID ('tempdb..#InvoiceCopy') IS NOT NULL
DROP TABLE #InvoiceCopy

select * into #InvoiceCopy from Invoices
where InvoiceTotal - PaymentTotal - CreditTotal > 0

WHILE (SELECT SUM(InvoiceTotal - PaymentTotal - CreditTotal ) FROM #InvoiceCopy)>=2000
BEGIN
UPDATE #InvoiceCopy
SET CreditTotal= CreditTotal+.05
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0

IF (SELECT MAX(CreditTotal) from Invoices )>3000
BREAK;
ELSE CONTINUE
END

SELECT (InvoiceTotal - PaymentTotal - CreditTotal) AS NEW FROM Invoices
WHERE (InvoiceTotal - PaymentTotal - CreditTotal) < 0