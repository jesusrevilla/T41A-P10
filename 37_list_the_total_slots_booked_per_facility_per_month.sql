--List the total slots booked per facility per month
SELECT facid, EXTRACT(month FROM starttime) AS month, SUM(slots) AS "Total Slots" FROM cd.bookings WHERE EXTRACT(year FROM starttime) = 2012 GROUP BY facid, month ORDER BY facid, month;
