USE AP 
GO
SELECT COUNT(*) AS NumberofInvoices,
AVG(InvoiceTotal) AS AvgAmount, SUM ( InvoiceTotal) AS TotalAmount,
MIN(InvoiceTotal) AS MinAmount, MAx(InvoiceTotal)AS MaxTotal
FROM Invoices WHERE InvoiceDate>'2020-01-01'