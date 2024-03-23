/*
	T-SQL Functions and Expressions:
		Basic addition and mathematical expressions
		String manipulation functions and expressions
		Working with Date functions
			Dateadd
			Datediff
			Year / Month
*/

-- Mathematical Expressions
SELECT 
	UnitPrice,
	UnitPrice + 10 AS Plus10,
	UnitPrice * 2  AS Doubled,
	UnitPrice * OrderQty AS LineTotalCalc,
	LineTotal
FROM
	Sales.SalesOrderDetail;

-- String manipulation Expressions
SELECT
	Firstname, 
	LEFT(FirstName, 3) AS First3,
	RIGHT(FirstName, 3) AS Last3
FROM
	Person.Person

SELECT
	Firstname, 
	UPPER(FirstName) AS UpperFirst,
	LOWER(FirstName) AS LowerFirst
FROM
	Person.Person

SELECT
	Firstname, 
	REPLACE(FirstName, 'a', '*') AS ReplaceA
FROM
	Person.Person

SELECT 
	LEN(FirstName) AS LengthOfName,
	FirstName
FROM
	Person.Person

-- Date Functions
SELECT GETDATE() AS SystemTime

SELECT 
	GETDATE() SystemTime,
	DATEPART(YEAR, GETDATE()) AS SystemYear,
	DATEPART(MONTH, GETDATE()) AS SystemMonth;

SELECT 
	GETDATE() SystemTime,
	YEAR(GETDATE()) AS SystemYear,
	MONTH(GETDATE()) AS SystemMonth;

SELECT
	OrderDate,
	YEAR(OrderDate)  AS OrderYear,
	MONTH(OrderDate) AS OrderMonth
FROM
	Sales.SalesOrderHeader
ORDER BY
	OrderMonth

-- DATEADD
SELECT
	OrderDate,
	DATEADD(YEAR, -1, OrderDate)  AS PreviousYear
FROM
	Sales.SalesOrderHeader

-- DATEDIFF
SELECT
	OrderDate,
	DATEDIFF(DAY, OrderDate, ShipDate)  AS DaysToShip
FROM
	Sales.SalesOrderHeader

-- DATEDIFF
SELECT
	OrderDate,
	DATEDIFF(MONTH, OrderDate, GETDATE()) AS MonthsSinceOrder
FROM
	Sales.SalesOrderHeader
ORDER BY 
	MonthsSinceOrder 

