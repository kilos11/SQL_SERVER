/*
	T-SQL Basics:
		SELECT, 
		FROM, 
		COLUMN AND TABLE ALIAS,
		ORDER BY,
		CONCATENATION,
		LITERAL VALUES
*/

-- Select top 1000 rows

-- Select all columns
SELECT 
	* 
FROM 
	Person.Person;

-- Select specific columns
SELECT
	BusinessEntityID,
	FirstName,
	LastName
FROM
	Person.Person;

-- Alias Columns
SELECT
	FirstName AS First,
	LastName  AS Last
FROM
	Person.Person

-- Sorting the final result set
SELECT
	FirstName AS First,
	LastName  AS Last
FROM
	Person.Person
--ORDER BY
--	FirstName
--ORDER BY
--	LastName,
--	First
 ORDER BY 
	1

-- Concatenating Columns
SELECT
	FirstName + LastName
FROM
	Person.Person

-- ALIAS & Literal Value
SELECT
	FirstName + ' ' + LastName AS FullName
FROM
	Person.Person;

SELECT
	LastName + ', ' + FirstName AS FullName
FROM
	Person.Person
ORDER BY
	LastName DESC;

