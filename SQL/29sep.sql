USE AP
GO

SELECT VendorCity, VendorState, COUNT (*) AS TotalVendor
FROM Vendors
WHERE VendorState IN ('IA','NJ')
GROUP By VendorCity, VendorState

SELECT VendorCity, VendorState, COUNT (*) AS TotalVendor
FROM Vendors
WHERE VendorState IN ('IA','NJ')
GROUP By VendorCity, VendorState WITH ROLLUP


SELECT VendorCity, VendorState, COUNT (*) AS TotalVendor
FROM Vendors
WHERE VendorState IN ('IA','NJ')
GROUP By VendorCity, VendorState WITH CUBE