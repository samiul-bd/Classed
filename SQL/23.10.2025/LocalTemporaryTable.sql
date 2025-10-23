USE AP
GO

SELECT TOP 1 VendorID, AVG(InvoiceTotal) AvgInvTotal 
INTO #TopVendors

FROM Invoices
GROUP BY VendorID
ORDER BY AvgInvTotal desc;

--SELECT * FROM #TopVendors

SELECT v.VendorName, t.VendorID, t.AvgInvTotal FROM Vendors v JOIN #TopVendors t ON v.VendorID= t.VendorID






