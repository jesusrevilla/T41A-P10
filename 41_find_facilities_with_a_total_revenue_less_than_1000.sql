SELECT facs.name, sum(case 
		when memid = 0 then slots * facs.guestcost
		else slots * membercost
	end) AS revenue
	FROM cd.bookings bks
	inner JOIN cd.facilities facs
		ON bks.facid = facs.facid
	group BY facs.name
	HAVING revenue < 1000
ORDER BY revenue;
