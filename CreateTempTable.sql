--northwind
select productid, ProductName, UnitPrice into #deleted from Products where CategoryID = 2