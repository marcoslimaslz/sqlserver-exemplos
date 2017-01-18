IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[msl_Employee]') AND type IN (N'U')) 
BEGIN 
   DROP TABLE [msl_Employee] 
END 

GO 

IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[msl_Department]') AND type IN (N'U')) 
BEGIN 
   DROP TABLE [msl_Department] 
END 

CREATE TABLE [msl_Department]( 
   [DepartmentID] [int] NOT NULL PRIMARY KEY, 
   [Name] VARCHAR(250) NOT NULL, 
) ON [PRIMARY] 
INSERT [msl_Department] ([DepartmentID], [Name])  VALUES (1, N'Engineering') 
INSERT [msl_Department] ([DepartmentID], [Name])  VALUES (2, N'Administration') 
INSERT [msl_Department] ([DepartmentID], [Name])  VALUES (3, N'Sales') 
INSERT [msl_Department] ([DepartmentID], [Name])  VALUES (4, N'Marketing') 
INSERT [msl_Department] ([DepartmentID], [Name])  VALUES (5, N'Finance') 

GO 

CREATE TABLE [msl_Employee]( 
   [EmployeeID] [int] NOT NULL PRIMARY KEY, 
   [FirstName] VARCHAR(250) NOT NULL, 
   [LastName] VARCHAR(250) NOT NULL, 
   [DepartmentID] [int] NOT NULL REFERENCES [msl_Department](DepartmentID), 
) ON [PRIMARY] 
GO 
INSERT [msl_Employee] ([EmployeeID], [FirstName], [LastName], [DepartmentID]) VALUES (1, N'Orlando', N'Gee', 1 ) 
INSERT [msl_Employee] ([EmployeeID], [FirstName], [LastName], [DepartmentID]) VALUES (2, N'Keith', N'Harris', 2 ) 
INSERT [msl_Employee] ([EmployeeID], [FirstName], [LastName], [DepartmentID]) VALUES (3, N'Donna', N'Carreras', 3 ) 
INSERT [msl_Employee] ([EmployeeID], [FirstName], [LastName], [DepartmentID]) VALUES (4, N'Janet', N'Gates', 3 )

go

SELECT * FROM msl_Department D 
CROSS APPLY 
   ( 
   SELECT * FROM msl_Employee E 
   WHERE E.DepartmentID = D.DepartmentID 
   ) A 
GO 

SELECT * FROM msl_Department D 
INNER JOIN msl_Employee E ON D.DepartmentID = E.DepartmentID 

GO

SELECT * FROM msl_Department D 
OUTER APPLY 
   ( 
   SELECT * FROM msl_Employee E 
   WHERE E.DepartmentID = D.DepartmentID 
   ) A 

GO 

SELECT * FROM msl_Department D 
LEFT OUTER JOIN msl_Employee E ON D.DepartmentID = E.DepartmentID 

GO 

IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[fn_GetAllEmployeeOfADepartment]') AND type IN (N'IF')) 
BEGIN 
   DROP FUNCTION dbo.fn_GetAllEmployeeOfADepartment 
END 
GO 
CREATE FUNCTION dbo.fn_GetAllEmployeeOfADepartment(@DeptID AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   SELECT * FROM msl_Employee E 
   WHERE E.DepartmentID = @DeptID 
   ) 
GO 
SELECT * FROM msl_Department D 
CROSS APPLY dbo.fn_GetAllEmployeeOfADepartment(D.DepartmentID) 
GO 
SELECT * FROM msl_Department D 
OUTER APPLY dbo.fn_GetAllEmployeeOfADepartment(D.DepartmentID) 
GO