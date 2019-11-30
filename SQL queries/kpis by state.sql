-- for use in postgresql
select state, region, extract(year from order_date) as "year", round(sum(profit),2) as "total profit", round(sum(sales),2) as "total sales", sum(quantity) as "total quantity", 
count(distinct orders.order_id) as "total orders",  
count(distinct returned.order_id) as "returns", cast(round(avg(discount*100),2) as text) || '%' as "discount per row",
count(row_id) as "number of rows"
from orders left join returned on orders.order_id = returned.order_id
group by state, region, "year"
order by "year" desc
