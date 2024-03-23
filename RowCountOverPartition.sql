--query for [AdventureWorks2019].[Sales].[SalesOrderHeader]
SELECT  ROW_NUMBER() Over (Partition by [SalesPersonID] order by [OrderDate])
      ,*
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]