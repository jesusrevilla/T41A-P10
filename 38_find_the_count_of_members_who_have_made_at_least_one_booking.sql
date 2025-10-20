--Find the count of members who have made at least one booking
--Find the total number of members (including guests) who have made at least one booking.

select count(memid) from cd.members where memid in (select memid from cd.bookings)
