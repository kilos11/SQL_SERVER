  --Displaying hierarchy in organization by following recursion between employee and manager
  With EmpHie as(
  select EmployeeId, ManagerId, 1 as hierarchy from [AdventureWorks2019].[HumanResources].[EmployeeDemo] where ManagerId is null 
  union all
  select em.EmployeeId, em.ManagerId, bos.hierarchy+1 from [AdventureWorks2019].[HumanResources].[EmployeeDemo] as em 
  inner join EmpHie as bos on bos.EmployeeId = em.ManagerId
  )  select EmployeeId, ManagerId, hierarchy from EmpHie -- select after with is a part of a query, there can be no extra query between this selct and ) of With statement