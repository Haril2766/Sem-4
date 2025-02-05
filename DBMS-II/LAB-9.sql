--Note: for Table valued function use tables of Lab-2

----------------------------------Part – A----------------------------------

--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_1STFUNCTION()
RETURNS VARCHAR(50)
AS
BEGIN 
	RETURN 'HELLO WORLD';
END;
--SELECT DBO.FN_1STFUNCTION()

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_2NDFUNCTION(@a INT , @b INT)
RETURNS INT
AS
BEGIN 
	DECLARE @SUM INT
	SET @SUM = @a + @b
	RETURN @SUM
END
--SELECT dbo.FN_2NDFUNCTION(5,6);

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_3RDFUNCTION(@a INT)
RETURNS VARCHAR(50)
AS
BEGIN
	IF (@a % 2 = 0)
		RETURN 'Number Is Even'
	RETURN 'Number Is Odd'
END
--SELECT dbo.FN_3RDFUNCTION(5)
--SELECT dbo.FN_3RDFUNCTION(6)

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_4THFUNCTION()
RETURNS TABLE
AS
	RETURN (SELECT * 
			FROM dbo.Person
			WHERE FirstName LIKE 'B%'
			)
--SELECT * from dbo.FN_4THFUNCTION()

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_5THFUNCTION()
RETURNS TABLE
AS
	RETURN
	(
	SELECT DISTINCT FIRSTNAME FROM Person
	)
--SELECT * FROM dbo.FN_5THFUNCTION()

--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FN_6THFUNCTION(@n INT)
RETURNS VARCHAR(250)
AS
BEGIN	
		DECLARE @TEMP VARCHAR(50) = '', @i INT = 1
		WHILE @i <= @n
			BEGIN
				SET @TEMP = @TEMP + CAST(@i AS varchar) + '  ';
				SET @i = @i +1
			END
		RETURN @TEMP
END
--SELECT dbo.FN_6THFUNCTION(5)

--7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FN_7THFUNCTION(@n INT)
RETURNS INT
AS
BEGIN
	DECLARE @FAC INT = 1, @i INT = 1
	WHILE @i <= @n
			BEGIN
			SET @FAC = @FAC * @i
			SET @i = @i +1
			END
	RETURN @FAC
END

SELECT dbo.FN_7THFUNCTION(3)


----------------------------------Part – B----------------------------------
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_8THFUNCTION(@a INT,@b INT)
RETURNS VARCHAR(250)
AS
BEGIN
		DECLARE @TEMP VARCHAR(50) = ' '
		SET @TEMP = 
			CASE 
				WHEN @a > @B THEN CAST(@a AS VARCHAR) + ' IS GRETER'
				WHEN @a < @B THEN CAST(@a AS VARCHAR) + ' IS LESSER'
				WHEN @a = @B THEN CAST(@a AS VARCHAR) + ' IS EQUAL TO ' + CAST(@b AS VARCHAR)
			END
			RETURN @TEMP	
END
--SELECT dbo.FN_8THFUNCTION(3,1)
--SELECT dbo.FN_8THFUNCTION(3,5)
--SELECT dbo.FN_8THFUNCTION(3,3)

--9. Write a function to print the sum of even numbers between 1 to 20.
CREATE OR ALTER FUNCTION FN_9THFUNCTION()
RETURNS VARCHAR(50) 
AS
BEGIN 
	DECLARE @ANS VARCHAR(50) = '', @I INT = 1
	WHILE @I <= 20
		BEGIN 
			IF @I%2 = 0
				BEGIN
					SET @ANS = @ANS + @I;
					SET @I = @I +2
				END
			ELSE
				SET @I = @I + 1
		END
	RETURN @ANS
END
--SELECT dbo.FN_9THFUNCTION()

--10. Write a function that checks if a given string is a palindrome
CREATE OR ALTER FUNCTION FN_10THFUNCTION(@STR VARCHAR(50))
RETURNS VARCHAR(50) 
AS
BEGIN
	DECLARE @ANS VARCHAR(50)
	DECLARE @TEMP VARCHAR(50)
	SET @TEMP = REVERSE(@STR)

	IF @STR = @TEMP
		SET @ANS = 'STRING IS PALINDROM'
	ELSE
		SET @ANS = 'STRING IS NOT PALINDROM'
	
	RETURN @ANS
END
--SELECT dbo.FN_10THFUNCTION('LIRIL')
--SELECT dbo.FN_10THFUNCTION('HARIL')


----------------------------------Part – C----------------------------------
