select count(memid) from cd.members where memid in (select memid from cd.bookings)
