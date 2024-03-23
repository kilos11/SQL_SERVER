-- Northwind
select * from
(select ROW_NUMBER() over(order by productId) num, * from products) rono where rono.num % 2 =1