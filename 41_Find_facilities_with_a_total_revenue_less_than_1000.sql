SELECT
  f.name,
  SUM(b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END) AS revenue
FROM cd.bookings AS b
JOIN cd.facilities AS f ON f.facid = b.facid
GROUP BY f.name
HAVING SUM(b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END) < 1000
ORDER BY revenue;
