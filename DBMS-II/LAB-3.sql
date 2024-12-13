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
	FROM Employee	WHERE (FirstName = @firstname) 
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
CREATE PROCEDURE PR_PROCEDURENO5
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

			


