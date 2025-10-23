SELECT CAST('01-June-2019 10:00 AM' AS DATE )AS NewDate 
SELECT FORMAT (CONVERT(datetime,'01-June-2019 10:00 AM'),'hh:mm:ss')

CREATE NONCLUSTERED INDEX ix_SemesterSemesterName ON Semester(SemesterName)
JUSTIFY 
EXEC sp_helpindex Semester 