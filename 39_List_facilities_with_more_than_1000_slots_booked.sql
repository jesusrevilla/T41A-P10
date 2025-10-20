SELECT facid, SUM(slots) AS slot FROM cd.bookings 
GROUP BY facid HAVING SUM(slots)>1000 ORDER BY facid; 
