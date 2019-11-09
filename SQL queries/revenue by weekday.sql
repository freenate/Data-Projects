select dayname(date_time) as day,
case 
when hour(date_time) in (7,8,9,10,11) then 'morning'
when hour(date_time) in (12,13,14,15,16) then 'afternoon'
else 'evening'
end as time_period, 
round(sum(total)/count(distinct date(date_time)),2) as revenue from supermarket
group by time_period, day
order by revenue desc