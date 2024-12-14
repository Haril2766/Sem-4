-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


-- PROCEDURE FOR INSERT INTO DEPARTMENT
CREATE PROCEDURE PR_DEPT_INSERT
	@DEPTID INT,
	@DEPTNAME VARCHAR(25)
AS
BEGIN
	INSERT INTO Department
	VALUES(@DEPTID,@DEPTNAME)
END

-- PROCEDURE FOR INSERT INTO DESIGNATION
ALTER PROCEDURE PR_DESIG_INSERT
	@DESIGID INT,
	@DESIGNAME VARCHAR(25)
AS
BEGIN
	INSERT INTO Designation
	VALUES(@DESIGID,@DESIGNAME)
END

--1

--DATA INSERT INTO DEPARTMENT

EXEC PR_DEPT_INSERT 1,'Admin'
EXEC PR_DEPT_INSERT 2,'IT'
EXEC PR_DEPT_INSERT 3,'HR'
EXEC PR_DEPT_INSERT 4,'Account'

--DATA INSERT INTO DESIGNATION

EXEC PR_DESIG_INSERT 11,'Jobber'
EXEC PR_DESIG_INSERT 12,'Welder'
EXEC PR_DESIG_INSERT 13,'Clerk'
EXEC PR_DESIG_INSERT 14,'Manager'
EXEC PR_DESIG_INSERT 15,'CEO'

-- PROCEDURE FOR INSERT INTO PERSON

CREATE PROCEDURE PR_PERSON_INSERT
	@FNAME VARCHAR(25),
	@LNAME VARCHAR(25),
	@SALARY DECIMAL(8,2),
	@JOININGDATE DATETIME,
	@DEPTID INT,
	@DESIGID INT
AS
BEGIN
	INSERT INTO Person
	VALUES(@FNAME,@LNAME,@SALARY,@JOININGDATE,@DEPTID,@DESIGID)
END


--DATA INSERT INTO DESIGNATION

EXEC PR_PERSON_INSERT 'Rahul','Anshu',56000,'1990-01-01',1,12
EXEC PR_PERSON_INSERT 'Hardik','Hinshu',18000,'1990-09-25',2,11
EXEC PR_PERSON_INSERT 'Bhavin','Kamani',25000,'1991-05-14',null,11
EXEC PR_PERSON_INSERT 'Bhoomi','Patel',39000,'2014-02-20',1,13
EXEC PR_PERSON_INSERT 'Rohit','Rajgor',17000,'1990-07-23',2,15
EXEC PR_PERSON_INSERT 'Priya','Mehta ',25000,'1990-10-18',2,null
EXEC PR_PERSON_INSERT 'Neha','Trivedi',18000,'2014-02-20',3,15


-- PROCEDURE FOR UPDATE INTO DEPARTMENT

--1 Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_1
	@DEPTID INT,
	@DEPTNAME VARCHAR(25)
AS
BEGIN
	UPDATE Department
	SET DepartmentName = @DEPTNAME
	WHERE DepartmentID = @DEPTID
END

-- PROCEDURE FOR UPDATE INTO DESIGNATION


CREATE OR ALTER PROCEDURE PR_PROCEDURE_2
	@DESIGID INT,
	@DESIGNAME VARCHAR(25)
AS
BEGIN
	UPDATE Designation
	SET DesignationName = @DESIGNAME
	WHERE DesignationID = @DESIGID
END

--exec PR_UPDATE_DESIG 11 , 'Jobber'

-- PROCEDURE FOR UPDATE INTO Person

CREATE OR ALTER PROCEDURE PR_PROCEDURE_3
	@PERSONID int,
	@FNAME VARCHAR(25),
	@LNAME VARCHAR(25),
	@SALARY DECIMAL(8,2),
	@JOININGDATE DATETIME,
	@DEPTID INT,
	@DESIGID INT
AS
BEGIN
	UPDATE Person
	SET FirstName = @FNAME, LastName = @LNAME, Salary = @SALARY ,
	JoiningDate = @JOININGDATE, DepartmentID = @DEPTID, DesignationID = @DESIGID
	WHERE PersonID = @PERSONID
END

-- PROCEDURE FOR DELETE FROM DEPARTMENT
CREATE OR ALTER PROCEDURE PR_PROCEDURE_4
	@DEPTID INT
AS
BEGIN
	DELETE FROM Department
	WHERE DepartmentID = @DEPTID
END

-- PROCEDURE FOR DELETE FROM DESIGNATION
CREATE OR ALTER PROCEDURE PR_PROCEDURE_5
	@DEPTID INT
AS
BEGIN
	DELETE FROM Designation
	WHERE DesignationID = @DEPTID
END

-- PROCEDURE FOR DELETE FROM PERSON
CREATE OR ALTER PROCEDURE PR_PROCEDURE_6
	@DEPTID INT
AS
BEGIN
	DELETE FROM Person
	WHERE PersonID = @DEPTID
END

--2 Department, Designation & Person Table’s SELECTBYPRIMARYKEY

-- PROCEDURE FOR SELCT BY PRIMERY KEY FROM DEPARTMENT

CREATE OR ALTER PROCEDURE PR_PROCEDURE_7
	@DEPTID INT
AS
BEGIN
	SELECT * FROM Department
	WHERE DepartmentID = @DEPTID
END
--EXEC PR_SELECTBYPRIMARYKEY_DEPT 1

-- PROCEDURE FOR SELCT BY PRIMERY KEY FROM DESIGNATION

CREATE OR ALTER PROCEDURE PR_PROCEDURE_8
	@DEPTID INT
AS
BEGIN
	SELECT * FROM Designation
	WHERE DesignationID = @DEPTID
END
--EXEC PR_SELECTBYPRIMARYKEY_DESIG 11

-- PROCEDURE FOR SELCT BY PRIMERY KEY FROM DESIGNATION

CREATE OR ALTER PROCEDURE PR_PROCEDURE_9
	@DEPTID INT
AS
BEGIN
	SELECT * FROM Person
	WHERE PersonID = @DEPTID
END
--EXEC PR_SELECTBYPRIMARYKEY_PERSON 101


--3 Department, Designation & Person Table’s (If foreign key is available then do write join and take 
--columns on select list)
CREATE OR ALTER PROCEDURE PR_PROCEDURE_10
	AS 
	BEGIN
			SELECT * FROM PERSON
			JOIN Department 
			ON Department.DepartmentID = Person.DepartmentID
			JOIN Designation
			ON Designation.DesignationID = Person.DesignationID
	END   
--exec PR_JOIN_FOREIGNKEY

--4 Create a Procedure that shows details of the first 3 persons.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_11
AS
BEGIN
		SELECT TOP 3 * FROM Person
END
--EXEC PR_TOPTHREE

---------------PART - B---------------

--5 Create a Procedure that takes the department name as input and returns a table with all workers 
--working in that department.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_12
@DNAME VARCHAR(100)
AS
BEGIN
	SELECT Person.FirstName, Person.LastName 
	FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	WHERE Department.DepartmentName = @DNAME
END

--EXEC PR_PROCEDURE_12 'IT'

--6 Create Procedure that takes department name & designation name as input and returns a table with 
--  worker’s first name, salary, joining date & department name.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_13
@DNAME VARCHAR(100),
@DESIGNATION VARCHAR(100)
AS
BEGIN 
	SELECT Person.FirstName , Person.Salary , Person.JoiningDate, Department.DepartmentName
	FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation
	ON Person.DesignationID = Designation.DesignationID
	WHERE (Designation.DesignationName = @DESIGNATION) 
		  AND
		  (Department.DepartmentName = @DNAME)
END
--EXEC PR_PROCEDURE_13 'IT','JOBBER'

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the 
--worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_14
	@FNAME VARCHAR(100)
AS
BEGIN
	SELECT * 
	FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation
	ON Person.DesignationID = Designation.DesignationID
	WHERE Person.FirstName = @FNAME
END	

--EXEC PR_PROCEDURE_14 'RAHUL'

--8. Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_15
AS
BEGIN
	SELECT Department.DepartmentName, MAX(Person.Salary),MIN(Person.Salary), SUM(Person.Salary)
	FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	GROUP BY Department.DepartmentName
END

EXEC PR_PROCEDURE_15

--9. Create Procedure which displays designation wise average & total salaries.CREATE OR ALTER PROCEDURE PR_PROCEDURE_16ASBEGIN	SELECT Designation.DesignationName, AVG(Person.Salary), SUM(Person.Salary)	FROM Person	JOIN Designation
	ON Person.DesignationID = Designation.DesignationID	GROUP BY Designation.DesignationNameEND--EXEC PR_PROCEDURE_16---------------PART - B---------------

--10. Create Procedure that Accepts Department Name and Returns Person Count.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_17	@DNAME VARCHAR(100)ASBEGIN
	SELECT @DNAME, COUNT(PERSON.PersonID) 
	FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	WHERE Department.DepartmentName = @DNAME
	GROUP BY Department.DepartmentName
END	
--EXEC PR_PROCEDURE_17 'IT'

--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than 
--input salary value along with their department and designation details.
CREATE OR ALTER PROCEDURE PR_PROCEDURE_18	@SAL DECIMAL(8,2)ASBEGIN 	SELECT * 	FROM Person	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation
	ON Person.DesignationID = Designation.DesignationID	WHERE Salary > @SALEND
--EXEC PR_PROCEDURE_18 19000

--12. Create a procedure to find the department(s) with the highest total salary among all departments.CREATE OR ALTER PROCEDURE PR_PROCEDURE_19	@DNAME VARCHAR(100)ASBEGIN
	SELECT @DNAME , MAX(Person.Salary)
	FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	WHERE Department.DepartmentName = @DNAME
END
--EXEC PR_PROCEDURE_19 'IT'

--13. Create a procedure that takes a designation name as input and returns a list of all workers under that 
      --designation who joined within the last 10 years, along with their department.CREATE OR ALTER PROCEDURE PR_PROCEDURE_20@DESIGNAME VARCHAR(100)ASBEGIN	SELECT @DESIGNAME, person.FirstName , Department.DepartmentName	FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation
	ON Person.DesignationID = Designation.DesignationID	WHERE Designation.DesignationName = @DESIGNAME		  AND		  Person.JoiningDate > DATEADD(YEAR, -10, GETDATE());END--EXEC PR_PROCEDURE_20 'JOBBER'




