DELETE FROM cd.members m
WHERE NOT EXISTS (
  SELECT 1
  FROM cd.bookings b
  WHERE b.memid = m.memid
);
