select dayname(date_time) as day,
case 
when hour(date_time) in (7,8,9,10,11) then 'morning'
when hour(date_time) in (12,13,14,15,16) then 'afternoon'
else 'evening'
end as time_period, 
avg(total) as revenue_per_transaction,
count(ticket_id) as number_of_transactions
from supermarket
group by time_period, day