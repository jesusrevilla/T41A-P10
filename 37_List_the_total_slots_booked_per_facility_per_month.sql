SELECT facid, EXTRACT(MONTH FROM starttime) AS month, SUM(slots) FROM cd.bookings 
WHERE EXTRACT(YEAR FROM starttime)=2012 GROUP BY facid, month ORDER BY facid, month;
