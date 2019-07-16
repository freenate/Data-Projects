--This query shows the percent increase of list prices using the start dates from the Adventure Works 2017 database and the tables Production.Product and Production.PriceListHistory 

select Name as "Product Name", id as "Product ID", case when PreviousPrice = 0 then 0
else (CurrentPrice - PreviousPrice)/PreviousPrice * 100. end as "% Increase", CurrentPrice as "List Price", SDate as "Date"
from (select ProductID as id, ListPrice as CurrentPrice, 
      LAG(ListPrice, 1, 0) over (partition by ProductID order by StartDate) as PreviousPrice, StartDate as SDate 
      from Production.ProductListPriceHistory) as PriceLag, Production.Product as prod
where prod.ProductID = PriceLag.id
