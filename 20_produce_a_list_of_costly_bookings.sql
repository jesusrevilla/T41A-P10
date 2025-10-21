SELECT m.firstname || ' ' || m.surname AS member, f.name AS facility,
	CASE
		when m.memid = 0 then
			b.slots*f.guestcost
		ELSE
			b.slots*f.membercost
	END AS cost
FROM cd.members m
JOIN cd.bookings b ON m.memid=b.memid
JOIN cd.facilities f ON b.facid=f.facid
WHERE b.starttime>='2012-09-14' AND b.starttime<'2012-09-15'
AND ((m.memid=0 AND b.slots*f.guestcost>30)OR(m.memid!=0 AND b.slots*f.membercost>30))
ORDER BY cost DESC;
