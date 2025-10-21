SELECT
  b.facid,
  f.name,
  ROUND(SUM(b.slots) * 0.5, 2) AS "Total Hours"
FROM cd.bookings AS b
JOIN cd.facilities AS f ON f.facid = b.facid
GROUP BY b.facid, f.name
ORDER BY b.facid;
