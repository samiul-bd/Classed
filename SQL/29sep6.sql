USE AP 
GO

SELECT DISTINCT v1.VendorName, v1.VendorCity, v1.VendorState 
FROM Vendors  AS v1 JOIN Vendors AS v2
on (v1.VendorCity=v2.VendorCity) AND 
(v1.VendorState=v2.VendorState) AND  
(v1.VendorID<>v2.VendorID)
ORDER BY v1.VendorState,v1.VendorCity
 