USE AP
GO

SELECT * FROM Vendors 
GO

INSERT INTO Vendors  (VendorName, VendorCity,VendorState, VendorZipCode, DefaultTermsID, DefaultAccountNo)
VALUES 
('125Jui', 'Dhaka','DH', '1205',4,100)
SELECT * FROM  Vendors WHERE VendorName='125Jui'

DELETE FROM Vendors WHERE VendorID='125'

INSERT INTO Vendors ( VendorName, VendorCity, VendorState, VendorZipCode, DefaultTermsID, DefaultAccountNo)
VALUES 
('126J