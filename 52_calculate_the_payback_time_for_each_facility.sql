--Calculate the payback time for each facility
--Based on the 3 complete months of data so far, calculate the amount of time each facility will take to repay its cost of ownership. 
--Remember to take into account ongoing monthly maintenance. Output facility name and payback time in months, order by facility name. 
--Don't worry about differences in month lengths, we're only looking for a rough value here!

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
