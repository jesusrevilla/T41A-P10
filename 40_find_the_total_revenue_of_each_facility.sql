SELECT facs.name, sum(slots * case
			WHEN memid = 0 THEN facs.guestcost
			ELSE facs.membercost
		end) AS revenue
	FROM cd.bookings bks
	inner JOIN cd.facilities facs
		ON bks.facid = facs.facid
	group BY facs.name
ORDER BY revenue;   
