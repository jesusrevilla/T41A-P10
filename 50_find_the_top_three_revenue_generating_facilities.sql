select fac.name,rank() over( order by
  sum(
	slots * case
	when book.memid=0 then guestcost
	else membercost end) desc) 
from cd.bookings book
join cd.facilities fac on fac.facid=book.facid
group by fac.name
limit 3
