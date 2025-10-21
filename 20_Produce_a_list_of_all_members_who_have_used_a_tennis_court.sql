select 
    concat(mems.firstname, ' ', mems.surname) as member, 
    facs.name as facility
from cd.members mems
join cd.bookings bks on mems.memid = bks.memid
join cd.facilities facs on bks.facid = facs.facid
where facs.name in ('Tennis Court 2', 'Tennis Court 1')
group by mems.firstname, mems.surname, facs.name
order by member, facility;
