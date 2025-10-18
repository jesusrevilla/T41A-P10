--Output the facility id that has the highest number of slots booked
select facid, sum(slots) as totalslots
	from cd.bookings
	group by facid
	having sum(slots) = (select max(sum2.totalslots) from
		(select sum(slots) as totalslots
		from cd.bookings
		group by facid
		) as sum2);
