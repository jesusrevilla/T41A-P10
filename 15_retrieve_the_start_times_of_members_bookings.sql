--Retrieve the start times of members' bookings
--How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT starttime FROM cd.bookings
JOIN cd.members m ON m.firstname = 'David'
JOIN cd.members ON m.surname = 'Farrel';
