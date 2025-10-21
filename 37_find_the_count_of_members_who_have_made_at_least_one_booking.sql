--Find the count of members who have made at least one booking
SELECT COUNT(DISTINCT memid) FROM cd.bookings WHERE memid IS NOT NULL;
