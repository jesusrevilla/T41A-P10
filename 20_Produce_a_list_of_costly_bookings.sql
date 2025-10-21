--Produce a list of costly bookings.
--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member 
--(or guest) more than $30? Remember that guests have different costs to members (the listed 
--costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output 
--the name of the facility, the name of the member formatted as a single column, and the cost. 
--Order by descending cost, and do not use any subqueries.
SELECT m.firstname||' '||m.surname AS member, f.name AS facility, 
case when m.memid=0 then b.slots*f.guestcost
else b.slots*f.membercost
end AS cost
FROM cd.members m 
JOIN cd.bookings b ON m.memid=b.memid
JOIN cd.facilities f ON b.facid=f.facid
WHERE b.starttime >= '2012-09-14' AND  b.starttime < '2012-09-15' 
AND ((m.memid = 0 and b.slots*f.guestcost > 30) or
	(m.memid != 0 and b.slots*f.membercost > 30))
ORDER BY cost DESC;
