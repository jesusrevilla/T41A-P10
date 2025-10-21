SELECT facid, extract(month FROM starttime) AS month, sum(slots) AS "Total Slots"
	FROM cd.bookings
	WHERE extract(year FROM starttime) = 2012
	group BY facid, month
ORDER BY facid, month;  
