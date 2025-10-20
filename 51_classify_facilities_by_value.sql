--Classify facilities by value
--Classify facilities into equally sized groups of high, average, and low based on their revenue. Order by classification and facility name.

select name, case 
	when class=1 then 'high'
	when class=2 then 'average'
	else 'low' end revenue
	from (
		select fac.name as name, ntile(3) over (order by sum(case
				when memid = 0 then slots * guestcost
				else slots * membercost
			end) desc) as class
		from cd.bookings book
		inner join cd.facilities fac
			on fac.facid = book.facid
		group by fac.name
	) as subquery
order by class, name;   
