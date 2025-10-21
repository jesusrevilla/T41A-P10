--output_the_facility_id_that_has_the_highest_number_of_slots_booked.sql
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	group by facid
order by sum(slots) desc
LIMIT 1;
