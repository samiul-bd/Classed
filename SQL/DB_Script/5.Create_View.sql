----------------CREATE A VIEW-------------

----Here we want to get multiple column from different table for that we have to JOIN them
--Join three tables Invoices,Vendors and Terms and we set Condition that these have BalanceDue and Vendorstate=TN ----
----We can set this AS VIEW so that we can easily access Result----

USE AP
GO
CREATE VIEW vu_QueryWithDuesVendorInfoAndTerms
AS
SELECT InvoiceNumber,InvoiceDate,VendorName,VendorCity,VendorState,InvoiceTotal,TermsDescription,
TermsDueDays,PaymentTotal,CreditTotal,(InvoiceTotal-PaymentTotal-CreditTotal) AS BalanceDue
FROM Invoices AS i JOIN Vendors AS v ON i.VendorID=v.VendorID
JOIN Terms AS t ON t.TermsID=i.TermsID
WHERE InvoiceTotal-PaymentTotal-CreditTotal>0 AND VendorState='TN'

------To see the created View Result----

SELECT * FROM vu_QueryWithDuesVendorInfoAndTerms


---------Another VIEW Create----------
USE AP
GO

CREATE VIEW vu_SpecificTerm
AS
SELECT * FROM Invoices
WHERE TermsID=1


SELECT * FROM vu_SpecificTerm

