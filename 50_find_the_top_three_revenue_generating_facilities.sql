--Find the top three revenue generating facilities
--Produce a list of the top three revenue generating facilities (including ties). 
--Output facility name and rank, sorted by rank and facility name.

select fac.name,rank() over( order by
  sum(
	slots * case
	when book.memid=0 then guestcost
	else membercost end) desc) 
from cd.bookings book
join cd.facilities fac on fac.facid=book.facid
group by fac.name
limit 3
