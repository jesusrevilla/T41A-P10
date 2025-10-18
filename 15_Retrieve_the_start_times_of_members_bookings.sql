--Retrieve the start times of members' bookings
--How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT starttime FROM cd.bookings b JOIN cd.members m ON b.memid= m.memid 
WHERE m.firstname='David' and m.surname = 'Farrell';
