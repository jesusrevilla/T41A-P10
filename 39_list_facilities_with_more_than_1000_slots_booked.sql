--List facilities with more than 1000 slots booked
SELECT facid, SUM(slots) AS "Total Slots" FROM cd.bookings GROUP BY facid HAVING SUM(slots) > 1000 ORDER BY facid;
