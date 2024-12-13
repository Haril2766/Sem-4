CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE,
 ManagerID INT NOT NULL,
 Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employee (
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 DoB DATETIME NOT NULL,
 Gender VARCHAR(50) NOT NULL,
 HireDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 Salary DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Projects Table
CREATE TABLE Projects (
 ProjectID INT PRIMARY KEY,
 ProjectName VARCHAR(100) NOT NULL,
 StartDate DATETIME NOT NULL,
 EndDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location)
VALUES 
 (1, 'IT', 101, 'New York'),
 (2, 'HR', 102, 'San Francisco'),
 (3, 'Finance', 103, 'Los Angeles'),
 (4, 'Admin', 104, 'Chicago'),
 (5, 'Marketing', 105, 'Miami');
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID, 
Salary)
VALUES 
 (101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00),
 (102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00),
 (103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00),
 (104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00),
 (105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00);
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID)
VALUES 
 (201, 'Project Alpha', '2022-01-01', '2022-12-31', 1),
 (202, 'Project Beta', '2023-03-15', '2024-03-14', 2),
 (203, 'Project Gamma', '2021-06-01', '2022-05-31', 3),
 (204, 'Project Delta', '2020-10-10', '2021-10-09', 4),
 (205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);


 ---Part – A

----------------PROCEDURE-1----------------
--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based
--on this you must give EmployeeID, DOB, Gender & Hiredate.
CREATE OR ALTER PROCEDURE PR_PROCEDURENO1
@firstname varchar(50) = null,
@lastname varchar(50) = null
AS
BEGIN
	SELECT EmployeeID, DOB, Gender , Hiredate 
	FROM Employee	WHERE (FirstName = @firstname) 
		  OR
		  (LastName = @lastname)
END
--EXEC PR_PROCEDURENO1 'JOHN'

----------------PROCEDURE-2----------------
--2. Create a Procedure that will accept Department Name and based on that gives employees list who
--belongs to that department. 
CREATE OR ALTER PROCEDURE PR_PROCEDURENO2
@dname varchar(100)
AS
BEGIN	
	SELECT * 
	FROM Employee
	JOIN Departments
	ON Employee.DepartmentID = Departments.DepartmentID
	WHERE DepartmentName = @dname
END
--EXEC PR_PROCEDURENO2 'IT'


----------------PROCEDURE-3----------------
--3. Create a Procedure that accepts Project Name & Department Name and based on that you must give
--all the project related details.
CREATE PROCEDURE PR_PROCEDURENO3
	@PNAME VARCHAR(100),
	@DNAME VARCHAR(100)
AS
BEGIN 
	SELECT Projects.ProjectID, Projects.ProjectName,
	Projects.StartDate, Projects.EndDate
	FROM DEPARTMENTS
	JOIN Projects
	ON Projects.DepartmentID = DEPARTMENTS.DepartmentID
	WHERE (Projects.ProjectName = @PNAME) 
		  AND 
	      (DEPARTMENTS.DepartmentName = @DNAME)
END		  
--EXEC PR_PROCEDURENO3 'Project Beta' , 'HR'


----------------PROCEDURE-4----------------
--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those
--employee list comes in output.
CREATE OR ALTER PROCEDURE PR_PROCEDURENO4
@SSAL INT,
@ESAL INT
AS
BEGIN 
	SELECT * 
	FROM EMPLOYEE
	WHERE Salary BETWEEN @SSAL AND @ESAL
END
--EXEC PR_PROCEDURENO4 75000,85000

----------------PROCEDURE-5----------------
--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date.
CREATE OR ALTER PROCEDURE PR_PROCEDURENO5
@HDATE DATETIME
AS
BEGIN
	SELECT * 
	FROM EMPLOYEE
	WHERE HireDate = @HDATE
END
--EXEC PR_PROCEDURENO5 '2010-06-15'


--Part-B

----------------PROCEDURE-6----------------
--6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be
--served. 

CREATE OR ALTER PROCEDURE PR_PROCEDURENO6
@G VARCHAR(1)
AS
BEGIN
	SELECT * FROM EMPLOYEE
	WHERE GENDER LIKE @G+'%'
END
--EXEC PR_PROCEDURENO6 'M'

----------------PROCEDURE-7----------------
--7. Create a Procedure that accepts First Name or Department Name as input and based on that employee
--data will come. 
CREATE OR ALTER PROCEDURE PR_PROCEDURENO7
@FNAME VARCHAR(100),
@DNAME VARCHAR(100)
AS
BEGIN
	SELECT * 
	FROM EMPLOYEE
	JOIN DEPARTMENTS
	ON Employee.DepartmentID = Departments.DepartmentID
	WHERE (EMPLOYEE.FirstName = @FNAME) 
		  AND 
		  (DEPARTMENTS.DepartmentName = @DNAME)
END
--EXEC PR_PROCEDURENO7 'John','IT'

----------------PROCEDURE-8----------------
--8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will
--get all the departments with all data. 
CREATE OR ALTER PROCEDURE PR_PROCEDURENO8
@LOC VARCHAR(100)
AS
BEGIN
	SELECT * 
	FROM DEPARTMENTS
	JOIN EMPLOYEE
	ON Employee.DepartmentID = Departments.DepartmentID
	WHERE DEPARTMENTS.Location LIKE '%' + @LOC + '%'
END
--EXEC PR_PROCEDURENO8 'E'

--Part – C
----------------PROCEDURE-9----------------
--9. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project
--related data.
CREATE OR ALTER PROCEDURE PR_PROCEDURENO9
	@SDATE DATETIME,
	@EDATE DATETIME
AS
BEGIN 
	SELECT * 
	FROM Projects
	WHERE (StartDate = @SDATE) 
			AND
			(EndDate = @EDATE)	
END
--EXEC PR_PROCEDURENO9 '2022-01-01','2022-12-31'


----------------PROCEDURE-10----------------
--10. Create a procedure in which user will enter project name & location and based on that you must
--provide all data with Department Name, Manager Name with Project Name & Starting Ending Dates.

CREATE OR ALTER PROCEDURE PR_PROCEDURENO10
@PNAME VARCHAR(100),
@LOCATION VARCHAR(100)
AS
BEGIN 
	SELECT * 
	FROM DEPARTMENTS
	JOIN EMPLOYEE 
	ON Employee.DepartmentID = Departments.DepartmentID
	JOIN Projects
	ON Projects.DepartmentID = DEPARTMENTS.DepartmentID
	WHERE Projects.ProjectName = @PNAME AND DEPARTMENTS.LOCATION = @LOCATION
END
--EXEC PR_PROCEDURENO10 'Project Beta ','San Francisco'

			

