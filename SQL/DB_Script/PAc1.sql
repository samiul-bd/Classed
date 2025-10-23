USE AP 
GO
--q1

SELECT TOP 5 InvoiceID,InvoiceNumber,InvoiceTotal,PaymentTotal,CreditTotal FROM Invoices
WHERE InvoiceTotal=( PaymentTotal+CreditTotal)
ORDER BY InvoiceID DESC


--q2

SELECT InvoiceID,InvoiceDate,InvoiceTotal,PaymentTotal,CreditTotal FROM Invoices
WHERE InvoiceDate > '2020-01-01' 
AND (InvoiceTotal>= PaymentTotal+CreditTotal)
OR InvoiceTotal >= 500 

--q2

SELECT InvoiceID,InvoiceDate,InvoiceTotal,PaymentTotal,CreditTotal FROM Invoices
WHERE InvoiceDate >'2020-01-01' 
AND InvoiceTotal> (PaymentTotal+CreditTotal) 
OR InvoiceTotal >500

--q3

SELECT v.VendorID,v.VendorState ,i.VendorID, i.InvoiceDate FROM Invoices AS i JOIN Vendors AS v ON i.VendorID= v.VendorID
WHERE VendorState NOT IN ('CA','NV','OR') AND InvoiceDate >'2020-01-01'

--q3

SELECT v.VendorID, v.VendorState ,i.InvoiceID ,i.VendorID ,i.InvoiceDate  FROM Invoices AS i JOIN Vendors AS v ON i.VendorID =v.VendorID 
WHERE InvoiceDate >'2020-02-01' AND  VendorState NOT IN ( 'CA','NV','OR')

--q4

SELECT InvoiceID ,InvoiceDate ,InvoiceNumber  FROM Invoices
WHERE InvoiceDate  BETWEEN ' 2020-01-01' AND '2020-01-30'

--q4

SELECT InvoiceID ,InvoiceNumber , InvoiceDate  FROM Invoices
WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-30' 

--qus no 5
SELECT VendorID ,VendorCity , VendorState  FROM Vendors 
WHERE VendorCity  LIKE 'SAN%'

--qus no 6

SELECT * FROM Vendors 
WHERE VendorContactFName  LIKE '[a,e,i,o,u]%'

--qus no 7

SELECT * FROM Vendors 
WHERE VendorState LIKE 'N[A-J]%'


--q7
SELECT * FROM Vendors 
WHERE VendorState LIKE 'n[A-J]%'

--q8
SELECT * FROM Vendors 
WHERE VendorState LIKE 'N[^k-y]%'

--q9 

SELECT * FROM Vendors 
ORDER BY VendorID 
OFFSET 10 ROWS FETCH NEXT 20 ROWS Only

q9


SELECT * FROM Vendors 
ORDER BY VendorID 
OFFSET 10 ROWS FETCH NEXT 20 ROWS Only  
q10

SELECT VendorID  , COUNT(InvoiceID) AS CII  , AVG( InvoiceTotal) AS AIT 
FROM Invoices 
GROUP BY VendorID 
Having  AVG( InvoiceTotal) >2000
ORder by AVG( InvoiceTotal) DESC


SELECT VendorID, COUNT(InvoiceID) AS NumberOfInvoices,
AVG (InvoiceTotal) AS AvgAmount FROM Invoices
GROUP BY VendorID
HAVING AVG (InvoiceTotal) >2000
ORDER BY AVG (InvoiceTotal) DESC

--q 10
SELECT VendorID , count (InvoiceID ) AS CII, AVG (InvoiceTotal) AS AIT  FROM Invoices 
GROUP BY VendorID 
HAVING AVG (InvoiceTotal) > 2000
ORDER BY AVG (InvoiceTotal) DESC

--q 10 

USE AP 
GO
SELECT VendorID, COUNT (InvoiceNumber ) AS CIN, AVG(InvoiceTotal) AS AIT  FROM Invoices
GROUP BY VendorID 
HAVING AVG(InvoiceTotal) >2000
ORDER BY AVG(InvoiceTotal) DESC


--q11

SELECT VendorID ,VendorCity ,VendorState, COUNT (*) AS vendorTotal  FROM Vendors 
WHERE VendorState IN ('CA','NJ')
GROUP  BY VendorCity ,VendorState with CUBE

--q12
SELECT VendorCity, VendorState, COUNT(*) TotalVendor 
FROM Vendors
WHERE VendorState IN('CA','NJ')
GROUP BY VendorCity, VendorState WITH ROLLUP

--q11

SELECT VendorCity ,VendorState ,COUNT(*) AS tv FROM Vendors 
WHERE VendorState NOT IN ('DC','CA')
GROUP BY VendorCity ,VendorState with CUBE
ORDER BY VendorCity DESC

--q13

SELECT InvoiceID ,VendorID ,TermsID ,COUNT (*) AS CI FROM Invoices 
GROUP BY GROUPING  SETS ((InvoiceID ,VendorID ,TermsID), (VendorID ,TermsID),(InvoiceID ,TermsID),(InvoiceID),(TermsID), (TermsID) ,()
)
ORDER BY InvoiceID ,VendorID ,TermsID 


--q14

SELECT InvoiceNumber ,InvoiceID ,COUNT(InvoiceTotal) OVER (Partition BY VendorId) AS VT FROM Invoices 

q14

SELECT InvoiceID ,InvoiceNumber ,COUNT (InvoiceTotal) OVER (Partition By VendorID) AS VT FROM Invoices 

q15


SELECT DISTINCT VendorID ,VendorName ,(SELECT MAX(InvoiceID ) FROM Invoices WHERE Invoices.VendorID = Vendors.VendorID ) AS VII FROM Vendors 
ORDER BY VII DESC


SELECT DISTINCT VendorID, VendorName, ( SELECT MAX (InvoiceDate ) FROM Invoices WHERE Invoices.VendorID=Vendors.VendorID
)  AS LatestInvDate FROM Vendors
ORDER BY LatestInvDate  DESC

--q16

SELECT * FROM Invoices 
WHERE InvoiceTotal > All

(SELECT InvoiceTotal  FROM Invoices WHERE VendorID =114)
