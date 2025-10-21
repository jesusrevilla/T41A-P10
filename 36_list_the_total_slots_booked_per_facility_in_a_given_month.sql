SELECT facid, sum(slots) AS "Total Slots"
	FROM cd.bookings
	WHERE
		starttime >= '2012-09-01'
		AND starttime < '2012-10-01'
	group BY facid
ORDER BY sum(slots); 
