delete from cd.members where memid not in (select memid from cd.bookings);
