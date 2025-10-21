select extract(month from cal.month) as month,
(cal.month + '1 month')-cal.month as lenght
from(
select generate_series(timestamp '2012/01/01',timestamp '2012/12/01','1 month') as month  
) cal
order by month;
