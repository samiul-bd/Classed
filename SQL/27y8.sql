USE AP
GO
CREATE Procedure spSetTerm 
@termId int
AS
BEGIN
SELECT * FROM Invoices WHERE  TermsID=@termID
END