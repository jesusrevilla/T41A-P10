select 
    dategen.date,
    sum(
        case 
            when bks.memid = 0 then bks.slots * facs.guestcost
            else bks.slots * facs.membercost
        end
    ) / 15.0 as revenue
from (
    select generate_series(
        date '2012-08-01',
        date '2012-08-31',
        interval '1 day'
    )::date as date
) as dategen
left join cd.bookings bks
    on bks.starttime::date >= dategen.date - interval '14 days'
   and bks.starttime::date <= dategen.date
left join cd.facilities facs
    on bks.facid = facs.facid
group by dategen.date
order by dategen.date;
