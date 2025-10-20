SELECT facid, SUM(slots) FROM cd.bookings WHERE DATE(starttime)>='2012-09-01' AND
DATE(starttime)<='2012-09-30' GROUP BY facid ORDER BY SUM(slots); 
