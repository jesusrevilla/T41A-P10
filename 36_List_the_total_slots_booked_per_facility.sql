select bks.facid, total_slots."Total Slots"
from 
    cd.bookings bks
join 
    (select facid, sum(slots) as "Total Slots"
     from cd.bookings
     group by facid) total_slots
on bks.facid = total_slots.facid
group by bks.facid, total_slots."Total Slots"
order by bks.facid;
