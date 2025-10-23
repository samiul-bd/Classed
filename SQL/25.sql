USE IsDB68Db
GO
CREATE TABLE AcademicResult(
ResultId int NOT NULL PRIMARY KEY Identity(1,1),
StudentID int NOT NULL  REFERENCES Students (StudentID),
ResultTitle VARCHAR (10) NOT NULL,
Result CHAR(2) NOT NULL
)
GO
INSERT INTO AcademicResult (StudentID,ResultTitle,Result)
VALUES
(1,'SSC','A+'),
(1,'HSC','A+'),
(1,'BSC','A+')
GO

SELECT * FROM AcademicResult