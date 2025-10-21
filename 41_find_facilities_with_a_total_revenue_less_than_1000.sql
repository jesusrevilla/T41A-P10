--Find facilities with a total revenue less than 1000
--Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue. 
--Remember that there's a different cost for guests and members!

select name,revenue from( select fac.name,
sum(book.slots * case 
	when book.memid=0 then fac.guestcost
	else fac.membercost end) as revenue
from cd.bookings book
join cd.facilities fac on fac.facid=book.facid
group by fac.name) as new where revenue<1000
order by revenue
