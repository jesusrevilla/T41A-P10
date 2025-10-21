--Retrieve the start times of members' bookings
--How can you produce a list of the start times for bookings by members named 'David Farrell'?
select bks.starttime 
	from 
		cd.bookings bks
		inner join cd.members mems
			on mems.memid = bks.memid
	where 
		mems.firstname='David' 
		and mems.surname='Farrell';
