--USE Ap
--go


CREATE Procedure spStateWiseVendors @State CHAR (2)
AS
BEGIN
SELECT * FROM Vendors Where VendorState=@state
END