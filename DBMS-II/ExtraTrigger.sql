CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID			Int					Primary Key,
	EmployeeName		Varchar(100)		Not Null,
	ContactNo			Varchar(100)		Not Null,
	Department			Varchar(100)		Not Null,
	Salary				Decimal(10,2)		Not Null,
	JoiningDate			DateTime			Null
)

CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);


CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);

CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);


------------------------------Trigger---------------------------
-- AFTER INSERT Trigger
CREATE TRIGGER TR_AfterInsert_Employee
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
    PRINT 'Employee record inserted';
    INSERT INTO EmployeeLogs (EmployeeID, EmployeeName, ActionPerformed, ActionDate)
    SELECT EmployeeID, EmployeeName, 'INSERT', GETDATE()
    FROM inserted;
END;

--DROP TRIGGER TR_AfterInsert_Employee

-- AFTER UPDATE Trigger
CREATE OR ALTER TRIGGER TR_AfterUpdate_Employee
ON EmployeeDetails
AFTER UPDATE
AS
BEGIN
    PRINT 'Employee record updated';
    INSERT INTO EmployeeLogs (EmployeeID, EmployeeName, ActionPerformed, ActionDate)
    SELECT EmployeeID, EmployeeName, 'UPDATE', GETDATE()
    FROM inserted;
END;
--DROP TRIGGER TR_AfterUpdate_Employee

-- AFTER DELETE Trigger
CREATE OR ALTER TRIGGER tr_AfterDelete_Employee
ON EmployeeDetails
AFTER DELETE
AS
BEGIN
    PRINT 'Employee record deleted';
    INSERT INTO EmployeeLogs (EmployeeID, EmployeeName, ActionPerformed, ActionDate)
    SELECT EmployeeID, EmployeeName, 'DELETE', GETDATE()
    FROM deleted;
END;
--DROP TRIGGER TR_AfterDelete_Employee


-- Trigger for automatic Joining Bonus
CREATE OR ALTER TRIGGER TR_AfterInsert_JoiningBonus
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
    UPDATE EmployeeDetails
    SET Salary = (I.Salary + (I.Salary * 0.10))
    FROM EmployeeDetails e
    INNER JOIN inserted i ON e.EmployeeID = i.EmployeeID;
END;

--DROP TRIGGER TR_AfterInsert_JoiningBonus

-- Trigger to set JoiningDate if NULL
CREATE OR ALTER TRIGGER TR_SetDefaultJoiningDate
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
    UPDATE EmployeeDetails
    SET JoiningDate = GETDATE()
    WHERE JoiningDate IS NULL;
END;

-- Trigger to validate ContactNo length
CREATE OR ALTER TRIGGER TR_ValidateContactNo
ON EmployeeDetails
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE LEN(ContactNo) <> 10)
    BEGIN
        RAISERROR('Contact number must be 10 digits.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;


-- INSTEAD OF INSERT, UPDATE, DELETE Trigger
CREATE OR ALTER TRIGGER TR_InsteadOfMovies
ON Movies
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieID, MovieTitle, 'INSERT/UPDATE', GETDATE() FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieID, MovieTitle, 'DELETE', GETDATE() FROM deleted;
    END
END;

-- Trigger to allow only movies with Rating > 5.5
CREATE OR ALTER TRIGGER TR_ValidateRating
ON Movies
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Rating <= 5.5)
    BEGIN
        RAISERROR('Rating must be greater than 5.5', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;


-- Trigger to prevent duplicate MovieTitle
CREATE OR ALTER TRIGGER TR_PreventDuplicateMovieTitle
ON Movies
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT MovieTitle FROM inserted WHERE MovieTitle IN (SELECT MovieTitle FROM Movies))
    BEGIN
        INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieID, MovieTitle, 'Duplicate Title Attempt', GETDATE()
        FROM inserted;
        RAISERROR('Duplicate movie title not allowed', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;


-- Trigger to prevent pre-release movies
CREATE OR ALTER TRIGGER TR_PreventPreReleaseMovies
ON Movies
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE ReleaseYear > YEAR(GETDATE()))
    BEGIN
        RAISERROR('Cannot insert pre-release movies', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;


-- Trigger to prevent duration update to greater than 120 minutes
CREATE OR ALTER TRIGGER TR_ValidateDuration
ON Movies
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Duration > 120)
    BEGIN
        RAISERROR('Movie duration cannot be greater than 120 minutes', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
		