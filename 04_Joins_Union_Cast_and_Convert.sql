/*
	Understanding JOINS
	UNION and UNION ALL
	Cast and Convert

*/

-- JOINS
/*
	This query joins the customer table to the salesOrderHeader table
	Each table is aliased. Since the CustomerID column appears in both
	tables, it must be fully qualified. The easy way to do this is
	with an alias. Otherwise, the table name must be used.
*/
SELECT C.CustomerID, C.AccountNumber,SOH.SalesOrderID, 
	SOH.OrderDate 
FROM 
	Sales.Customer AS C 
INNER JOIN 
	Sales.SalesOrderHeader AS SOH 
ON C.CustomerID = SOH.CustomerID;

--The word INNER is optional. Here is the same query:
SELECT C.CustomerID, C.AccountNumber,SOH.SalesOrderID, 
	SOH.OrderDate 
FROM 
	Sales.Customer AS C 
JOIN 
	Sales.SalesOrderHeader AS SOH 
ON C.CustomerID = SOH.CustomerID;

-- We could have anything in the ON clause, but 
-- the wrong thing could give us bad results
SELECT C.CustomerID, P.ProductID
FROM Sales.Customer AS C 
INNER JOIN Production.Product AS P 
	ON C.CustomerID = P.ProductID; 

SELECT * 
FROM Sales.Customer AS C 
INNER JOIN Sales.SalesOrderHeader AS SOH 
ON 1 = 2;

-- UNION
-- Combine BusinessEntityID from several tables
SELECT E.BusinessEntityID, P.FirstName + ' ' +  P.LastName AS Name, 
	'Employee' AS Source
FROM HumanResources.Employee AS E 
JOIN Person.Person AS P ON E.BusinessEntityID = P.BusinessEntityID
UNION ALL 
SELECT V.BusinessEntityID, Name, 
	'Vendor' AS Source
FROM Purchasing.Vendor AS V 
UNION ALL 
SELECT P.BusinessEntityID, P.FirstName + ' ' + P.LastName AS Name, 
	'Customer' AS Source
FROM Sales.Customer AS C 
JOIN Person.Person AS P ON P.BusinessEntityID =C.PersonID;

-- They don't have to combine data that even makes sense!
-- This query removes all duplicates
SELECT Name
FROM Production.Product 
UNION
SELECT FirstName
FROM Person.Person;


-- This query retains the duplicates
SELECT Name
FROM Production.Product 
UNION ALL
SELECT FirstName
FROM Person.Person;

-- Any ORDER BY must be with the last query
-- But refers to the column name in first query
SELECT Name
FROM Production.Product 
UNION ALL
SELECT FirstName
FROM Person.Person
ORDER BY Name;

-- Problems with different datatypes!
SELECT ProductID 
FROM Production.Product
UNION ALL
SELECT Name 
FROM Production.Product;

-- Use CAST or CONVERT to fix the problem
SELECT CAST(ProductID AS VARCHAR) AS ID
FROM Production.Product
UNION ALL
SELECT Name 
FROM Production.Product;

--Also must have the same number of columns
SELECT ProductID, Name 
FROM Production.Product 
UNION ALL 
SELECT BusinessEntityID, FirstName, LastName 
FROM Person.Person;
