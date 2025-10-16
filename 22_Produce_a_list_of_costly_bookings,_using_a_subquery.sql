SELECT
  m.firstname || ' ' || m.surname AS member,
  q.facility,
  q.cost
FROM (
  SELECT
    b.memid,
    f.name AS facility,
    b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END AS cost
  FROM cd.bookings b
  JOIN cd.facilities f ON f.facid = b.facid
  WHERE DATE(b.starttime) = DATE '2012-09-14'
) AS q
JOIN cd.members m ON m.memid = q.memid
WHERE q.cost > 30
ORDER BY q.cost DESC;
