WITH per_member AS (
  SELECT
    memid,
    10 * ROUND(SUM(slots) * 0.5 / 10.0) AS hours   -- round to nearest 10 hours
  FROM cd.bookings
  GROUP BY memid
)
SELECT
  m.firstname,
  m.surname,
  per_member.hours::int AS hours,
  RANK() OVER (ORDER BY per_member.hours DESC) AS rank
FROM per_member
JOIN cd.members m USING (memid)
ORDER BY rank, m.surname, m.firstname;
