--Produce a list of costly bookings
--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? 
--Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. 
--Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost, and do not use any subqueries.

select  member.firstname || ' ' || member.surname as member,
fac.name as facility,
case 
when member.memid=0 then book.slots*fac.guestcost
else book.slots*fac.membercost
end as cost
from cd.bookings book
join cd.members member on member.memid=book.memid
join cd.facilities fac on fac.facid=book.facid
where date(book.starttime)='2012.09.14'
and ((member.memid<>0 and book.slots*fac.membercost>30) or (member.memid=0 and book.slots*fac.guestcost>30))
order by cost desc
