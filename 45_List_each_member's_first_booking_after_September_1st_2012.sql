SELECT
  m.surname,
  m.firstname,
  m.memid,
  f.first_start AS starttime
FROM cd.members AS m
JOIN (
  SELECT memid, MIN(starttime) AS first_start
  FROM cd.bookings
  WHERE starttime >= DATE '2012-09-01'
  GROUP BY memid
) AS f USING (memid)
ORDER BY m.memid;
