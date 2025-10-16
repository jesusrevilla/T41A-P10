SELECT
  m.firstname || ' ' || m.surname AS member,
  f.name                          AS facility,
  CASE
    WHEN b.memid = 0 THEN b.slots * f.guestcost
    ELSE b.slots * f.membercost
  END AS cost
FROM cd.bookings b
JOIN cd.members   m ON m.memid = b.memid
JOIN cd.facilities f ON f.facid = b.facid
WHERE DATE(b.starttime) = DATE '2012-09-14'
  AND (
    CASE WHEN b.memid = 0 THEN b.slots * f.guestcost
         ELSE b.slots * f.membercost
    END
  ) > 30
ORDER BY cost DESC;
