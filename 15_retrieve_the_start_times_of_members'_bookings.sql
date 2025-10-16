--Retrieve the start times of members' bookings
--How can you produce a list of the start times for bookings by members named 'David Farrell'?

select starttime from cd.bookings
join cd.members on cd.bookings.memid=cd.members.memid
where members.firstname='David' and members.surname='Farrell'
