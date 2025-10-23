---------Insert any new data in table (Vendors),here we only pick not null column---------
USE AP
GO

INSERT INTO Vendors (VendorName,VendorCity,VendorState, VendorZipCode,DefaultTermsID, DefaultAccountNo)
VALUES
('Marufa','Dhaka','DH','DH123',5,100)
GO

-------To see the new inserted data----------
SELECT * FROM Vendors WHERE VendorName='Marufa'

---Modify data: Here we update new inserted data's VendorState Name--- 
UPDATE Vendors SET VendorState='TN' WHERE VendorID='124'

------Insert recently created new Vendor's data in table (Invoices),here we only pick not null column from Invoices---------
USE AP
GO
INSERT INTO Invoices(VendorID,InvoiceNumber,InvoiceDate,InvoiceTotal,PaymentTotal,CreditTotal,TermsID,
InvoiceDueDate)
VALUES
(124,'124Marufa','2025-09-27',1000,0,0,1,'2025-09-30')


----To see the new inserted data-----------
SELECT * FROM Vendors WHERE VendorID=124


---Delete the new inserted data---BUT here we can't delete data from Vendors Table-----
--When we try to delete Vendor's new inserted data from Vendors, Invoice table's also has VendorID column--
--That VendorID becomes an orphan without parent----

DELETE FROM Vendors
WHERE VendorID=124

--------Again insert a new data in Vendors table----
INSERT INTO Vendors(VendorName,VendorCity,VendorState,VendorZipCode,DefaultTermsID,DefaultAccountNo)
VALUES
('Maria','Dhaka','DH','DH123',5,552)
GO
---To see the Data---
SELECT * FROM Vendors WHERE VendorName='Maria'

---This data will be deleted. Because here 125 row we don't insert in Invoices table.----
DELETE FROM Vendors WHERE VendorID='125'

