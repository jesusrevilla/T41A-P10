--output_the_facility_id_that_has_the_highest_number_of_slots_booked_again.sql
select facid, total from (
	select facid, sum(slots) total, rank() over (order by sum(slots) desc) rank
        	from cd.bookings
		group by facid
	) as ranked
	where rank = 1 
