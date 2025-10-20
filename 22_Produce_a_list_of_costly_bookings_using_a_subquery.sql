--Produce a list of costly bookings, using a subquery
--The Produce a list of costly bookings exercise contained some messy logic: we had to calculate the booking cost in both the WHERE clause and the CASE statement. 
--Try to simplify this calculation using subqueries. For reference, the question was:
--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members 
--(the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, 
--and the cost. Order by descending cost.
SELECT member, facility, cost FROM (SELECT m.firstname || ' ' || m.surname as member,
f.name AS facility,
case
	when m.memid = 0 then b.slots*f.guestcost
	else b.slots*f.membercost
	end AS cost FROM cd.members m
	JOIN cd.bookings b ON m.memid = b.memid
	JOIN cd.facilities f ON b.facid = f.facid
	WHERE
			b.starttime >= '2012-09-14' AND
			b.starttime < '2012-09-15') AS bookings WHERE cost > 30
ORDER BY cost DESC;  
