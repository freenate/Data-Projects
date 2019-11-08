-- intended for MySQL
(select
case 
when hour(date_time) in(7,8,9,10,11) then 'mornings'
when hour(date_time) in (12,13,14,15,16) then 'afternoons'
else 'evenings'
end as time_period, 
round(sum(total)/count(distinct date(date_time)),2) as revenue from supermarket
group by time_period
order by revenue desc)
union
(select hour(date_time) as time_period, round(sum(total)/count(distinct date(date_time)), 2) as revenue from supermarket
group by hour(date_time)
order by revenue desc)
