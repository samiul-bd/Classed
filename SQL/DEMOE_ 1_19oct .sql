--Jannat
--1291333

USE AP
Go

---q1

--SELECT TOP 5 InvoiceID ,InvoiceTotal ,PaymentTotal ,CreditTotal  FROM Invoices 
--WHERE InvoiceTotal = PaymentTotal + CreditTotal 
--ORDER BY InvoiceID DESC

--q2

--SELECT * FROM Invoices 
--WHERE InvoiceDate <'2020-01-01'
--AND InvoiceTotal > (PaymentTotal +CreditTotal )
--OR InvoiceTotal >500

--q3

--SELECT * FROM Invoices AS i join Vendors AS v On i.VendorID =v.VendorID 
-- WHERE VendorState NOT IN ('CA','NV','OR')
-- AND InvoiceDate <'2020-01-01'

--q4

--SELECT * FROM Invoices 
--WHERE InvoiceDate BETWEEN '2019-12-05' AND '2019-12-31'

--q5

--SELECT * FROM Vendors 
--WHERE VendorCity Like  'SAN%'

--q6
--SELECT * FROM Vendors 
--WHERE VendorContactFName  LIKE '%[a,e,i,o,u]%'

--q7

--SELECT * FROM Vendors 
--WHERE VendorState LIKE 'N[A_J]%'

--q8

--SELECT * FROM Vendors 
--WHERE VendorState LIKE 'N[^k_Y]%'

--q9

--SELECT * FROM Vendors 
--ORDER BY VendorID 
--OFFSET 10 ROWS FETCH NEXT 20 ROWs ONLY 




--q10

--SELECT VendorID ,AVG (InvoiceTotal) AS AvgITotal FROM Invoices 
--GROUP BY  VendorID
--Having AVG (InvoiceTotal) >2000
--ORDER BY AVG (InvoiceTotal)DESC 

--q11

--SELECT VendorCity ,VendorState ,COUNT (*) FROM Vendors 
--WHERE VendorState in ('CA','NJ')
--GROUP BY  VendorCity ,VendorState With CUBE 

--q12

--SELECT VendorCity ,VendorState ,COUNT (*) FROM Vendors 
--WHERE VendorState in ('CA','NJ')
--GROUP BY  VendorCity ,VendorState With RollUp 

--q13

--SELECT VendorID ,TermsID ,SUM(InvoiceTotal)AS SInvT FROM Invoices 
--GROUP BY GROUPING SETS (VendorID ,TermsID ),(TermsID ),(VendorID),() 
--ORDER BY SInvT DESC 

--q14

--SELECT InvoiceID ,InvoiceNumber , SUM (InvoiceTotal) OVER (PARTITION BY VendorID )AS VenTotal   FROM Invoices 



--q15


--SELECT * FROM Vendors 
--WHERE VendorID In (SELECT DISTINCT  VendorID  FROM Invoices 
--)
--ORDER BY VendorID 

--q16

--SELECT * FROM Invoices 
--WHERE InvoiceTotal >ANY 

--(SELECT InvoiceTotal  FROM Invoices WHERE VendorID =34)

--q17

--SELECT * FROM Invoices 
--WHERE InvoiceTotal >All

--(SELECT InvoiceTotal  FROM Invoices WHERE VendorID =34)

--q18

--SELECT * FROM Invoices 
--WHERE InvoiceTotal >Some

--(SELECT InvoiceTotal  FROM Invoices WHERE VendorID =34)

--q19


--SELECT VendorCity,VendorState ,(SELECT MAX (InvoiceTotal)AS  NewAmount  FROM Invoices WHERE Invoices .VendorID =Vendors.VendorID) AS VendorTotal  FROM Vendors 
--ORDER BY  VendorTotal DESC 
--...................

--SELECT VendorID ,VendorName ,(
--SELECT MAX (InvoiceTotal)AS NewT  FROM Invoices WHERE Invoices .VendorID =Vendors .VendorID ) As LatestTotal FROM Vendors 
--ORDER BY LatestTotal DESC

--q20
 --SELECT VendorName  FROM Vendors 
 --WHERE  EXISTS (SELECT *   
 --FROM Invoices  As i join Vendors as v on i.VendorID =v.VendorID )



 --q21

 --with 
 --Summary As 
 --(SELECT SUM (InvoiceTotal) AS NewAmount  ,v.VendorCity , v.VendorState    FROM Invoices AS i join Vendors As v on i.VendorID =v.VendorID
 --GROUP By v.VendorCity ,VendorState),
 --TopAmount As (
 --SELECT VendorCity , MAX(NewAmount ) MNAmount  FROM Summary group by VendorCity 

 --)

 --SELECT NewAmount,MNAmount FROM Summary As s join TopAmount As t on s.VendorCity  =t.VendorCity 

 --WITH Summary AS(SELECT SUM (InvoiceTotal ) ASSI,v.VendorCity ,v.VendorState   FROM Invoices AS i join Vendors as v on i.VendorID =v.VendorID GROUP BY v.VendorCity ,v.VendorState )
 --,

 --TOPAMOUNT AS (
 -- SELECT VendorCity , MAX(ASSI) AS MAS FROM Summary GROUP BY VendorCity 
 --)

 --SELECT * FROM Summary  AS s JOin TOPAMOUNT As t on s.VendorCity =t.VendorCity 
 

 --Q22
-- INSERT INTO Vendors (VendorName,VendorAddress1 ,VendorAddress2 , VendorCity  ,VendorState ,VendorZipCode,VendorPhone ,VendorContactLName ,VendorContactFName ,DefaultTermsID ,DefaultAccountNo  )
-- Values ('Alkas Hyjh','Jigatola','Null','DHAka','BN',1205,'Null', 'null','null',3,630)

-- --q23
--DELETE From Vendors where VendorID =127

 --q24

 SELECT CAST ('01-June-2019 10:00 Am ' AS Date ) AS NEWDATE 

 --q25

 SELECT FORMAt( CONVERT (DateTime,'01-June-2019 10:00 Am ' ),'hh:mm :ss' ) 

 --26q

 SELECT InvoiceNumber, TermsID,

 CASE TermsID

 WHEN 1 then '10 days' 
 When 2 then '20days'
 when 3 then '30days'
 End
 AS newT
 FROM Invoices 

 --q27

 SELECT VendorID, SUM (InvoiceTotal) AS Amount,
IIF( SUM (InvoiceTotal)>5000,'High','Low') AS InvStatus
FROM Invoices
GROUP BY VendorID
ORDER BY  SUM (InvoiceTotal) DESC


SELECT VendorID , Sum (InvoiceTotal ) AS Amount ,
IIf (Sum (InvoiceTotal )>5000,'High','low') AS InvStatus
FROM Invoices 
GRoup



SELECT VendorID,VendorState ,VendorName   , ROW_NUMBER () over (order by Vendorstate ) As new FROM Vendors 

SELECT InvoiceNumber ,InvoiceID ,InvoiceTotal , RANK () over (order by InvoiceTotal) FROM Invoices 
SELECT InvoiceNumber ,InvoiceID ,InvoiceTotal ,DENSE_RANK () over (order by InvoiceTotal) FROM Invoices 

SELECT TermsDescription,TermsID  , NTILE (2) over (ORDER BY TremsID  ) AS TILE1 
FROM Terms 

SELECT InvoiceID ,InvoiceNumber ,VendorID , FIRST_VALUE (InvoiceTotal )over (partition by vendorid ORDER BY vendorid )  FROM Invoices 

SELECT InvoiceID ,InvoiceNumber ,VendorID , LEAD (InvoiceTotal,1,0 )over (partition by vendorid ORDER BY vendorid )  FROM Invoices

SELECT InvoiceID ,InvoiceNumber ,VendorID , LAG (InvoiceTotal,1,0 )over (partition by vendorid ORDER BY vendorid )  FROM Invoices