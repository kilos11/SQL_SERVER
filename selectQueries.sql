SELECT
OrderYear = YEAR (OrderDate)
,SubTotal
,RowNumbForMedian =
ROW_NUMBER () OVER
(PARTITION BY YEAR (OrderDate)
ORDER BY SubTotal)
INTO #Sales
FROM Sales.SalesOrderHeader