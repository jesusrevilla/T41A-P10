--List the total slots booked per facility
SELECT facid, SUM(slots) AS "Total Slots" FROM cd.bookings GROUP BY facid ORDER BY facid;
