DELETE FROM cd.members
WHERE memid NOT IN (SELECT memid FROM cd.bookings)
  AND memid != 0;
