/*
	Aggregate Functions
		COUNT, SUM, MIN, MAX, AVG, YEAR
	GROUPBY
	HAVING CLAUSE
*/

-- Aggregate Functions
-- Count the rows in the results
SELECT COUNT(*) As CountOfRows
FROM Sales.SalesOrderHeader;

--Count the actual values, not null
SELECT COUNT(SalesPersonID) AS CountOfSalesPerson
FROM Sales.SalesOrderHeader;

--Can have multiple functions in one query
SELECT 
	COUNT(SalesPersonID) AS CountOfSalesPerson,
	SUM(TotalDue) AS TotalSales, 
	MIN(TotalDue) AS MinSale,
	MAX(TotalDue) AS MaxSales, 
	AVG(TotalDue) AS AvgSale
FROM Sales.SalesOrderHeader;

-- Group By
-- To summarize for groups of data, add a GROUP BY clause
-- This query returns one row for each CustomerID
SELECT CustomerID, SUM(TotalDue) AS SubTotal
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- Make sure that all non-aggregate columns and expessions are included in a group by
-- This is not right!
-- It actually returns one row for every OrderDate
SELECT YEAR(OrderDate) AS [Year], SUM(TotalDue) AS Sales
FROM Sales.SalesOrderHeader
GROUP BY OrderDate;

--Instead, make sure the expression is the same
SELECT YEAR(OrderDate) AS [Year], SUM(TotalDue) AS Sales
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate);

SELECT CustomerID, SUM(TotalDue) AS SubTotal
FROM Sales.SalesOrderHeader
WHERE SUM(TotalDue) > 10000
GROUP BY CustomerID;

-- *** HAVING Clause
--Instead do this
SELECT CustomerID, SUM(TotalDue) AS SubTotal
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING SUM(TotalDue) > 10000
ORDER BY SUM(TotalDue);

--You can have both WHERE clause and HAVING clause
SELECT CustomerID, SUM(TotalDue) AS SubTotal
FROM Sales.SalesOrderHeader 
WHERE TerritoryID = 1
GROUP BY CustomerID
HAVING SUM(TotalDue) > 10000;

-- Regular column filter treated like it was in WHERE clause
SELECT CustomerID, TerritoryID, SUM(TotalDue) AS CustSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, TerritoryID
HAVING COUNT(*) > 10 AND TerritoryID = 1
ORDER BY CustSales;