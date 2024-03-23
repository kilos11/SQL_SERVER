  SELECT 
      su.UnitPrice,
      su.[ModifiedDate]
	  ,so.summ
	  ,su.UnitPrice/so.summ as precent
  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] as su 
  inner join (select Sum([UnitPrice]) as summ, ModifiedDate as ModifiedDate from [AdventureWorks2019].[Sales].[SalesOrderDetail] group by ModifiedDate ) as so on su.ModifiedDate = so.ModifiedDate
  

  ---same query but using partition over
    select UnitPrice,
      [ModifiedDate],
	  Sum(UnitPrice) over (partition by [ModifiedDate]) as summ,
	  UnitPrice/Sum(UnitPrice) over (partition by [ModifiedDate]) as precentage --too bad I need to repeat same query instead of being able to use an alias summ
	  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]