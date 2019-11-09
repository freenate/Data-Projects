-- intended for MySQL
select dayname(date_time) as weekday, case 
when hour(date_time) in (7,8,9,10,11) then 'morning'
when hour(date_time) in (12,13,14,15,16) then 'afternoon'
else 'evening'
end as time_period,
count(distinct cashier) as number_of_cashiers
from supermarket group by weekday, time_period
order by field(weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), 
field(time_period, 'morning', 'afternoon', 'evening')
