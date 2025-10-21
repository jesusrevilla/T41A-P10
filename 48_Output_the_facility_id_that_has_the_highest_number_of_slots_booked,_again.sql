WITH totals AS (
  SELECT facid, SUM(slots) AS total
  FROM cd.bookings
  GROUP BY facid
)
SELECT facid, total
FROM totals
WHERE total = (SELECT MAX(total) FROM totals)
ORDER BY facid;
