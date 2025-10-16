DELETE FROM cd.members m
WHERE m.memid = 37
  AND NOT EXISTS (
    SELECT 1 FROM cd.bookings b
    WHERE b.memid = m.memid
  );
