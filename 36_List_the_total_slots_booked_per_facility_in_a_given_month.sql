SELECT facid,
       SUM(slots) AS "Total Slots"
FROM cd.bookings
WHERE starttime >= DATE '2012-09-01'
  AND starttime <  DATE '2012-10-01'
GROUP BY facid
ORDER BY "Total Slots";
