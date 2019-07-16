--Rolling average of total revenue over the past six months for AdventureWorks



select moyr as "Month", avg(revenue) over (partition by moyr order by moyr rows 6 preceding) as "Rolling six month average(in $) of Revenue" from
 (select format(OrderDate, 'yyyy-MM') as moyr, sum(UnitPrice*OrderQty*(1.0 - UnitPriceDiscount)) as revenue
  from Sales.SalesOrderHeader as SH join Sales.SalesOrderDetail as SD on SH.SalesOrderID = SD.SalesOrderID 
  group by format(OrderDate, 'yyyy-MM')) as MonthlyRev
  