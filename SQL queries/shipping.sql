-- for use in postgresql
select region, state, ship_mode, segment, subcategory, product_name, avg(ship_date - order_date) as "average number of days to ship" 
from orders
group by region, state, ship_mode, segment, subcategory, product_name
order by region, state
