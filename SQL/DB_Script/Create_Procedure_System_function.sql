USE AP
GO


----CREATE A Procedure----here we can set Parameter with @

CREATE Procedure spSetTerm @termId int 
AS
BEGIN
SELECT * FROM Invoices WHERE TermsID=@termId
END

--------To access this procedure----------
EXEC spSetTerm 1

EXEC spSetTerm 2

EXEC spSetTerm 3

EXEC spSetTerm 4

EXEC spSetTerm 5

--------------Create procedure-------

CREATE Procedure spStateWiseVendors @state CHAR(2)
AS
BEGIN
SELECT * FROM Vendors WHERE VendorState=@state
END


EXEC spStateWiseVendors 'TN'

EXEC spStateWiseVendors 'CA'

-----------System defined function-------
USE AP
GO

SELECT GETDATE()
AS Today

SELECT Day('2025-09-27')
SELECT Month ('2025-09-27')
SELECT ISDATE ('2025-09-31')
SELECT PI()
