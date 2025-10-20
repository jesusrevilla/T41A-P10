--Find the count of members who have made at least one booking
--Find the total number of members (including guests) who have made at least one booking.
SELECT COUNT(distinct memid) FROM cd.bookings;
