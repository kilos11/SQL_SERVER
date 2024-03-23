
--- This will create a new table with ManagerId to train hierarchy queries. It works on AdventureWorks2019 database.
GO  
  if OBJECT_ID('HumanResources.EmployeeDemo') is not null
 drop table HumanResources.EmployeeDemo 

 SELECT emp.BusinessEntityID AS EmployeeID, emp.LoginID, 
  (SELECT  man.BusinessEntityID FROM HumanResources.Employee man 
	    WHERE emp.OrganizationNode.GetAncestor(1)=man.OrganizationNode OR 
		    (emp.OrganizationNode.GetAncestor(1) = 0x AND man.OrganizationNode IS NULL)) AS ManagerID,
       emp.JobTitle, emp.HireDate
INTO HumanResources.EmployeeDemo   
FROM HumanResources.Employee emp ;
GO