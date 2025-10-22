--Find the total revenue of each facility
--Produce a list of facilities along with their total revenue. 
--The output table should consist of facility name and revenue, sorted by revenue. 
--Remember that there's a different cost for guests and members!

select fac.name,
sum(book.slots * case 
	when book.memid=0 then fac.guestcost
	else fac.membercost end) as revenue
from cd.bookings book
join cd.facilities fac on fac.facid=book.facid
group by fac.name
order by revenue
