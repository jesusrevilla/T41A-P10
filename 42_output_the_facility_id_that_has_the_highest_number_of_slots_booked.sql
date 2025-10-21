SELECT facid, sum(slots) AS "Total Slots"
	FROM cd.bookings
	group BY facid
ORDER BY sum(slots) DESC
LIMIT 1;    
