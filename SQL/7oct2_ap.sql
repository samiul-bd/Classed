USE AP
GO


--SELECT InvoiceDate , CONVERT (VARCHAR,InvoiceDate,127) Varchar127 FROM Invoices 
--SELECT InvoiceDate , CONVERT (VARCHAR,InvoiceDate,3) V3 FROM Invoices 
--SELECT InvoiceDate , CONVERT (VARCHAR,InvoiceDate,107) v107 FROM Invoices 
--SELECT InvoiceDate , CONVERT (VARCHAR,InvoiceDate,112) v112 FROM Invoices 




SELECT InvoiceTotal *.775,PaymentTotal -5,                                                                                FROM Invoices WHERE InvoiceID =14

SELECT  InvoiceDate,
CAST (InvoiceDate AS VARCHAR) AS VarDate,
InvoiceTotal , 
CAST (InvoiceTotal AS int) AS intTotal ,
CAST (InvoiceTotal AS VARCHAR) AS VarTotal,
--50/100 AS  OpValue,
50/CAST (100 AS decimal (3))  AS OpValue2,
--50/CONVERT  (100 AS decimal (3))  AS OpValue2
FROM Invoices 

SELECT  InvoiceDate,
CONVERT (VARCHAR ,InvoiceDate ,100 ) AS VarDate,
CONVERT (VARCHAR ,InvoiceDate ,0 ) AS VarDate2
FROM Invoices





--.............100,0.......same  default

SELECT  InvoiceDate,
CONVERT (VARCHAR ,InvoiceDate ,100 ) AS VarDate100,
CONVERT (VARCHAR ,InvoiceDate ,0 ) AS VarDate0
FROM InvoiceCopy1


SELECT  InvoiceDate,
CONVERT (VARCHAR ,InvoiceDate ,101 ) AS VarDate,
CONVERT (VARCHAR ,InvoiceDate ,1 ) AS VarDate2
FROM Invoices 

SELECT  InvoiceDate,
CONVERT (VARCHAR ,InvoiceDate ,107 ) AS VarDate,
CONVERT (VARCHAR ,InvoiceDate ,7 ) AS VarDate2
FROM Invoices 


--time 12 hour
SELECT  InvoiceDate,
CONVERT (VARCHAR ,InvoiceDate ,108 ) AS VarDate108,
CONVERT (VARCHAR ,InvoiceDate ,8 ) AS VarDate8
FROM InvoiceCopy1 

--24 hour
SELECT  InvoiceDate,
CONVERT (VARCHAR ,InvoiceDate ,114 ) AS VarDate114,
CONVERT (VARCHAR ,InvoiceDate ,14) AS VarDate14
FROM InvoiceCopy1


SELECT  InvoiceDate,
CONVERT (VARCHAR ,InvoiceDate ,107 ) AS VarDate107,
CONVERT (VARCHAR ,InvoiceDate ,10 ) AS VarDate10,
FROM InvoiceCopy1


SELECT  InvoiceDate,
TRY_CONVERT (date,'Feb 29 2025') AS ConvDate
FROM InvoiceCopy1

--.............

SELECT STR (1234.5678,7,1) AS NewData

SELECT CHAR (65) AS ASCIIVal
SELECT CHAR (71) AS ASCIIVal
SELECT CHAR (91) AS ASCIIVal
SELECT CHAR (96) AS ASCIIVal
SELECT ASCII ('Orange') AS ASCIIVal

SELECT UNICODE (N'Or')

SELECT UNICODE (N'or')

SELECT LEN ('SQL Server')


SELECT LEFT ('SQL Server',4)


SELECT UPPER( LOWER  ('SQL Server'))

SELECT PATINDEX ('%v_%', 'SQL Server')

SELECT CHARINDEX ('SQL','  SQL Server')

SELECT CHARINDEX ('_,','(559) 555-1212')

SELECT SUBSTRING ('(559) 555-1212',7,8)

SELECT REPLACE (RIGHT('(559) 555-1212',13),')',')_')

SELECT CONCAT_WS ('-',559,55,1212)

SELECT CONCAT_WS ('*',559,55,1212)

 SELECT CONCAT ('RUN Time ',1.52,' seconds')


 SELECT VendorName, VendorContactLName  + ',' + LEFT (VendorContactFName,1 ) + '.' AS ContactTName, RIGHT (VendorPhone,8) AS PhoneNo, VendorPhone 
 FROM Vendors 

 WHERE SUBSTRING (VendorPhone,2,3)=559
 ORDER BY VendorName 

 --...................

 SELECT ROUND (12.5,0)
  SELECT ROUND (12.4999,1)
   SELECT ROUND (12.4999,-1)
    SELECT ROUND (12.5,0,1)
	    SELECT ISNUMERIC (123.656)
		SELECT ISNUMERIC ('123.656')

		SELECT CEILING ( -1.25)
			SELECT Floor ( -1.25)


--CASE..............

		SELECT InvoiceNumber ,InvoiceTotal ,InvoiceDate ,InvoiceDueDate,
		DATEDIFF(day,invoiceDueDate,GETDATE()) AS DiffDate,
		CASE
		WHEN DATEDIFF (day,InvoiceDueDate,GETDATE())>2000
		THEn 'Over 2000 days'
		ELSE 'None'
		END
		AS DayStatus
		FROM Invoices 

		--......RAnking Function.........

		--rank		
		SELECT InvoiceTotal ,RANK () OVER (ORDER BY InvoiceTotal) AS Rank FROM Invoices 

		--Dansrank

		SELECT InvoiceTotal ,RANK () OVER (ORDER BY InvoiceTotal) AS Rank ,
		DENSE_RANK () OVER (ORDER BY InvoiceTotal ) AS DansRank
		FROM Invoices 

		--ROw NUmber

		SELECT ROW_NUMBER () OVER (Partition By vendorState ORDER BY VendorName) AS RowNumber, VendorState ,VendorName 
		FROM Vendors 

		--Ntile

		SELECT TermsDescription,
		NTILE (2) OVER (ORDER BY TermsID) AS Ntile2
		FROM Terms 

SELECT TermsDescription,
		NTILE (3) OVER (ORDER BY TermsID) AS Ntile3
		FROM Terms 

		SELECT TermsDescription,
		NTILE (4) OVER (ORDER BY TermsID) AS Ntile4
		FROM Terms 


		SELECT TermsDescription,
		NTILE (5) OVER (ORDER BY TermsID) AS Ntile5
		FROM Terms 