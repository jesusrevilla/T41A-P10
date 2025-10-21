select name,revenue from( select fac.name,
sum(book.slots * case 
	when book.memid=0 then fac.guestcost
	else fac.membercost end) as revenue
from cd.bookings book
join cd.facilities fac on fac.facid=book.facid
group by fac.name) as new where revenue<1000
order by revenue
