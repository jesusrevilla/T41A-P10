SELECT b.facid, SUM(a.slots) FROM cd.bookings AS a JOIN cd.facilities AS b 
ON a.facid = b.facid GROUP BY b.facid ORDER BY facid; 
