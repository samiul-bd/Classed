USE AP

GO
SELECT 'ACTIVE ' AS Source, InvoiceNumber,InvoiceDate,InvoiceTotal, PaymentDate
FROM Invoices WHERE InvoiceDate>='2020-01-01'
UNION
SELECT 'PAid ' AS Source, InvoiceNumber,InvoiceDate,InvoiceTotal 
FROM Invoices WHERE InvoiceDate>='2020-01-01'