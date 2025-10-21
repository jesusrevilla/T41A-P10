SELECT
  facid,
  EXTRACT(MONTH FROM starttime) AS month,
  SUM(slots) AS slots
FROM cd.bookings
WHERE starttime >= DATE '2012-01-01'
  AND starttime <  DATE '2013-01-01'
GROUP BY ROLLUP (facid, EXTRACT(MONTH FROM starttime))
ORDER BY facid, month;
