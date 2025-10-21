select member, facility, cost
from (
    select 
        concat(mems.firstname, ' ', mems.surname) as member, 
        facs.name as facility, 
        (bks.slots * 
            case 
                when mems.memid = 0 then facs.guestcost 
                else facs.membercost 
            end
        ) as cost
    from cd.members mems
    join cd.bookings bks on mems.memid = bks.memid
    join cd.facilities facs on bks.facid = facs.facid
    where bks.starttime >= '2012-09-14' and 
        bks.starttime < '2012-09-15'
) bookings
where cost > 30
order by cost desc;
