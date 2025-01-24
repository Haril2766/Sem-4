-- Creating PersonInfo Table
CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);
-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL,
);


--Part – A

--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the
--PersonInfo table to display a message “Record is Affected.”
CREATE TRIGGER TR_PersonInfo_INSERT_UPDATE_DELETE
ON PersonInfo 
AFTER INSERT,UPDATE,DELETE 
AS
BEGIN 
	PRINT 'Record is Affected.'
END
DROP TRIGGER TR_PersonInfo_INSERT_UPDATE_DELETE

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. 
--For that, log all operations performed on the person table into PersonLog.
CREATE TRIGGER TR_PersonInfo_INSERT_LOG
ON PersonInfo 
AFTER INSERT
AS
BEGIN 
	DECLARE @PID INT
	DECLARE @PNAME VARCHAR(100)
	INSERT INTO PersonLog VALUES (@PID,@PNAME,'INSERTED',GETDATE())
END

DROP TRIGGER TR_PersonInfo_INSERT_LOG

CREATE TRIGGER TR_PersonInfo_UPDATE_LOG
ON PersonInfo 
AFTER UPDATE
AS
BEGIN 
	DECLARE @PID INT
	DECLARE @PNAME VARCHAR(100)
	INSERT INTO PersonLog VALUES (@PID,@PNAME,'UPDATED',GETDATE())
END

DROP TRIGGER TR_PersonInfo_UPDATE_LOG

CREATE TRIGGER TR_PersonInfo_DELETED_LOG
ON PersonInfo 
AFTER DELETE
AS
BEGIN 
	DECLARE @PID INT
	DECLARE @PNAME VARCHAR(100)
	INSERT INTO PersonLog VALUES (@PID,@PNAME,'DELETED',GETDATE())
END

DROP TRIGGER TR_PersonInfo_DELETED_LOG
--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on 
--the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
CREATE TRIGGER TR_PersonInfo_INSERT_LOG_INSTEADOF
ON PersonInfo 
INSTEAD OF INSERT
AS
BEGIN 
	DECLARE @PID INT
	DECLARE @PNAME VARCHAR(100)
	INSERT INTO PersonLog VALUES (@PID,@PNAME,'INSERTED',GETDATE())
END

CREATE TRIGGER TR_PersonInfo_UPDATE_LOG_INSTEADOF
ON PersonInfo 
INSTEAD OF UPDATE
AS
BEGIN 
	DECLARE @PID INT
	DECLARE @PNAME VARCHAR(100)
	INSERT INTO PersonLog VALUES (@PID,@PNAME,'UPDATED',GETDATE())
END

CREATE TRIGGER TR_PersonInfo_DELETED_LOG_INSTEADOF
ON PersonInfo 
INSTEAD OF DELETE
AS
BEGIN 
	DECLARE @PID INT
	DECLARE @PNAME VARCHAR(100)
	INSERT INTO PersonLog VALUES (@PID,@PNAME,'DELETED',GETDATE())
END
DROP TRIGGER TR_PersonInfo_DELETED_LOG_INSTEADOF


--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert
--person name into uppercase whenever the record is inserted.
CREATE TRIGGER TR_PersonInfo_INSERT_LOG_CONVERT_UPPERCASE
ON PersonInfo 
AFTER INSERT
AS
BEGIN 
	DECLARE @PID INT
	DECLARE @PNAME VARCHAR(100)
	INSERT INTO PersonLog VALUES (@PID,@PNAME,'INSERTED',GETDATE())
	UPDATE PersonInfo
	SET PersonName = UPPER(@PNAME)
	WHERE PersonID = @PID
END


DROP TRIGGER TR_PersonInfo_INSERT_LOG_CONVERT_UPPERCASE
--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
Create Trigger TR_PersonInfo_DUPLICATE
On PersonInfo
INSTEAD OF Insert
As
Begin
	Insert InTo PersonInfo
	Select
		PersonID,
		PersonName,
		Salary,
		JoiningDate,
		City,
		Age ,
		BirthDate 
	From inserted
	Where PersonName not in (Select PersonName from PersonInfo)
EndDROP TRIGGER TR_PersonInfo_DUPLICATE--6. Create trigger that prevent Age below 18 years.Create Trigger TR_PersonInfo_UNDERAGE
On PersonInfo
INSTEAD OF Insert
As
Begin
	Insert InTo PersonInfo
	Select
		PersonID,
		PersonName,
		Salary,
		JoiningDate,
		City,
		Age ,
		BirthDate 
	From inserted
	Where AGE <= 18
EndDROP TRIGGER TR_PersonInfo_UNDERAGE