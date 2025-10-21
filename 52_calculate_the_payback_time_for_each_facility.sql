select 	name, 
	initialoutlay / (monthlyrevenue - monthlymaintenance) as repaytime 
	from 
		(select fac.name as name, 
			fac.initialoutlay as initialoutlay,
			fac.monthlymaintenance as monthlymaintenance,
			sum(case
				when memid = 0 then slots * guestcost
				else slots * membercost
			end)/3 as monthlyrevenue
		from cd.bookings book
		inner join cd.facilities fac
			on book.facid = fac.facid
		group by fac.facid
	) as subq
order by name;
