--Produce a list of costly bookings, using a subquery
--The Produce a list of costly bookings exercise contained some messy logic: 
--we had to calculate the booking cost in both the WHERE clause and the CASE statement. 
--Try to simplify this calculation using subqueries. For reference, the question was:
--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? 
--Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. 
--Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost.

select member,facility,cost from 
(select member.firstname || ' ' || member.surname as member,
 fac.name as facility,
 case when member.memid=0 then book.slots*fac.guestcost
 else book.slots*fac.membercost
 end as cost
 from cd.members member
 join cd.bookings book on book.memid=member.memid
 join cd.facilities fac on fac.facid=book.facid
 where date(book.starttime)='2012.09.14') as bookings
 where cost>30
 order by cost desc
