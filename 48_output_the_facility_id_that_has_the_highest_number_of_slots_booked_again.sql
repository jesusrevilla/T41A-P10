--Output the facility id that has the highest number of slots booked, again
SELECT facid, total FROM (SELECT facid, total, rank() OVER (ORDER BY total DESC) FROM (SELECT facid, sum(slots) total FROM cd.bookings group BY facid)) WHERE rank = 1;
