--List the total slots booked per facility per month, part 2
SELECT facid, EXTRACT(month FROM starttime) AS month, SUM(slots) FROM cd.bookings WHERE EXTRACT(year FROM starttime) = 2012 GROUP BY facid, month
UNION ALL
SELECT facid, NULL, SUM(slots) FROM cd.bookings WHERE EXTRACT(year FROM starttime) = 2012 GROUP BY facid
UNION ALL
SELECT NULL, NULL, SUM(slots) FROM cd.bookings WHERE EXTRACT(year FROM starttime) = 2012 ORDER BY facid, month;
