select  extract(year from order_date) as "year", extract(month from order_date) as "month", region, segment, category, subcategory, 
round(sum(profit),2) as "total profit", round(sum(sales),0) as "total sales", sum(quantity) as "total quantity", 
count(distinct orders.order_id) as "total orders",  
count(distinct returned.order_id) as "returns",
cast(round(avg(discount*100),2) as text) || '%' as "discount per row",
count(row_id) as "number of rows"
from orders left join returned on orders.order_id = returned.order_id
group by region, "year", "month", segment, category, subcategory 
order by "year" desc, "month" desc, region