--Find facilities with a total revenue less than 1000
--Produce a list of facilities with a total revenue less than 1000. Produce an output table consisting of facility name and revenue, sorted by revenue.
--Remember that there's a different cost for guests and members!
SELECT f.name, SUM(case 
				WHEN b.memid=0 then b.slots*f.guestcost 
				else b.slots*f.membercost end) AS revenue
		FROM cd.bookings b
		JOIN cd.facilities f ON b.facid=f.facid  
GROUP BY f.name HAVING sum(case 
		when b.memid = 0 then slots * f.guestcost
		else b.slots * f.membercost
	end) < 1000
ORDER BY revenue;
