Declare @PageSize int
Declare @PageNumber int
Declare @StartRecord int
Declare @EndRecord int

Set @PageSize = 5
Set @PageNumber = 2
Set @StartRecord = @PageNumber * @PageSize - @PageSize +1
Set @EndRecord = @PageSize * @PageNumber

Select * from
(select row_number() over(order by productId) rono, * from products)) ro
where ro.rono between @StartRecord and @EndRecord



