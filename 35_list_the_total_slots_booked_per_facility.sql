--list_the_total_slots_booked_per_facility.sql
select facid, sum(slots) as "Total Slots"
	from cd.bookings
	group by facid
order by facid;
