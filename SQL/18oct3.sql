SELECT CAST ('01-June-2019 10:00 Am' AS DATE) AS NewDate
SELECT FORMAT (CONVERT (datetime,'01-June-2019 10:00 Am'), 'hh:mm:ss')

CREATE NONCLUSTERED INDEX ix_SemesterSemesterName ON Semester(SemesterName)
--justify............
EXEC sp_helpindex Semester 

USE CollegeDB68 
Go

