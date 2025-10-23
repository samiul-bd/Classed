use ap
go


------TASK 3.
select VendorID from Vendors WHERE VendorState  in('CA','OR','NV')

SELECT * FROM Invoices
WHERE VendorID NOT IN (select VendorID from Vendors WHERE VendorState  in('CA','OR','NV'))
AND InvoiceDate > '2020-01-01'


SELECT i.VendorID, i. InvoiceNumber, i.InvoiceTotal, i. PaymentTotal, i.CreditTotal, v.VendorName, v.VendorCity, v.VendorState, T.TermsDescription, T.TermsDueDays
FROM Invoices  i INNER JOIN Vendors  v ON I.VendorID = V.VendorID 
JOIN TERMS t ON T.TermsID =i .TermsID
WHERE InvoiceDate>'2020-01-01'
AND V.VendorState NOT IN ('CA','OR','NV')

SELECT i.InvoiceNumber, i.InvoiceTotal,i.InvoiceDate, v.VendorName, v.VendorCity, v.VendorState
FROM Invoices i RIGHT JOIN Vendors V ON I.VendorID = V.VendorID



SELECT i.InvoiceNumber, i.InvoiceTotal,i.InvoiceDate,(i.InvoiceTotal- i.PaymentTotal-i.CreditTotal) Due ,v.VendorName, v.VendorCity, v.VendorState
FROM Invoices i  JOIN Vendors V ON I.VendorID = V.VendorID JOIN InvoiceLineItems il ON il.InvoiceID = i.InvoiceID
WHERE i.InvoiceTotal- i.PaymentTotal-i.CreditTotal > 0
ORDER BY InvoiceDueDate DESC


---------- TASK 3.
SELECT InvoiceID, InvoiceNumber, V.VendorState FROM Invoices i JOIN Vendors v ON i.VendorID =  V. VendorID
WHERE i.InvoiceDate > '2020-01-01' AND V.VendorState NOT IN ('CA','NV','OR')

--- Which invoices has more than one product.

select i.InvoiceID,InvoiceNumber, InvoiceDate, InvoiceTotal from Invoices i join InvoiceLineItems il On I.InvoiceID = il.InvoiceID
AND I.InvoiceTotal > il.InvoiceLineItemAmount
ORDER BY I.InvoiceNumber


---------------SELF JOIN

SELECT DISTINCT V1.VendorName, V1.VendorCity,V1.VendorState 
FROM Vendors V1 JOIN Vendors V2 
ON (V1.VendorCity= V2.VendorCity)
AND (V1.VendorState=V2.VendorState)
AND (V1.VendorID<>V2.VendorID)
ORDER BY V1.VendorState, V1.VendorCity

----------- RETRIVE THOSE INVOICE WHO HAVE DUE

SELECT InvoiceNumber, InvoiceDate,v.VendorName,il.InvoiceLineItemDescription,ga.AccountDescription
FROM Invoices i 
JOIN Vendors v On i.VendorID = v.VendorID 
JOIN InvoiceLineItems il ON il.InvoiceID = I.InvoiceID
JOIN GLAccounts ga on ga.AccountNo = il.AccountNo
where i.InvoiceTotal - i.PaymentTotal - i.CreditTotal>0
order by VendorName, il.InvoiceLineItemDescription

---------- implicit syntax.

select Invoices.InvoiceNumber, Invoices.InvoiceTotal, Invoices.InvoiceDate, Vendors.VendorName, GLAccounts.AccountDescription, 
InvoiceLineItems.InvoiceLineItemDescription
from Invoices, Vendors, InvoiceLineItems, GLAccounts
WHERE Invoices.VendorID= Vendors.VendorID
AND Invoices.InvoiceID = InvoiceLineItems.InvoiceID
AND GLAccounts.AccountNo = InvoiceLineItems.InvoiceID
AND Invoices.InvoiceTotal - Invoices.PaymentTotal-Invoices.CreditTotal>0


-------- CROSS JOIN
USE Examples
GO

SELECT d.DeptNo,d.DeptName, e.FirstName,e.LastName 
FROM Departments d CROSS JOIN Employees e

-----------missing-------

----------union
use AP
GO
select 'Active' AS source ,InvoiceNumber,InvoiceDate,InvoiceTotal from Invoices
where InvoiceDate >= '2020-01-01'
UNION
select 'Paid' AS source ,InvoiceNumber,InvoiceDate,InvoiceTotal from Invoices
where InvoiceDate < '2020-01-01'


---------- customer table
use Examples
GO

select CustomerFirst, CustomerLast from Customers
except
select FirstName, LastName from Employees


----------chapter5
------SUMMERY QUERY


use AP
go


select count(*) NumberOfInvoices, sum(InvoiceTotal- PaymentTotal- CreditTotal) TotalDue from Invoices
WHERE InvoiceTotal- PaymentTotal- CreditTotal >0


SELECT 'After 2020-01-01' SelectedDate, COUNT(*) NumberOfInvoices,
avg(InvoiceTotal) AvgAmount ,
sum(InvoiceTotal) TotalAmount,
min(InvoiceTotal) MinAmount,
Max(InvoiceTotal) MaxAmount
FROM Invoices WHERE InvoiceDate > '2020-01-01'

------------task 16.

--select * from Invoices where VendorID=34


select InvoiceNumber,InvoiceDate,InvoiceTotal from Invoices
WHERE InvoiceTotal> ANY ---ANY/ALL/SOME
(select InvoiceTotal from Invoices where VendorID=34) 


------ TASK 11.
SELECT VendorCity, VendorState, COUNT(*) TotalVendor 
FROM Vendors
WHERE VendorState IN('IA','NJ')
GROUP BY VendorCity, VendorState WITH ROLLUP ----ROLLUP/CUBE