--Output the facility id that has the highest number of slots booked
--Output the facility id that has the highest number of slots booked. For bonus points, try a version without a LIMIT clause. This version will probably look messy!
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	group by facid
order by sum(slots) desc
LIMIT 1;    
