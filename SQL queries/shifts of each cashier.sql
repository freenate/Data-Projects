select cashier, dayname(date_worked) as weekday, time_period,
count(date_worked) as number_of_shifts
from 
(select cashier, date(date_time) as date_worked, case 
when hour(date_time) in (7,8,9,10,11) then 'morning'
when hour(date_time) in (12,13,14,15,16) then 'afternoon'
else 'evening'
end as time_period,
count(ticket_id) as transactions
from supermarket
group by cashier, date_worked, time_period
having transactions > 20) as subq

group by cashier, weekday, time_period
order by cashier,
field(weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), 
field(time_period, 'morning', 'afternoon', 'evening')