USE Examples
GO
SELECT d.DeptNo, d.DeptName ,e.FirstName,e.LastName
FROM Departments AS d
CROSS JOIN Employees AS e
