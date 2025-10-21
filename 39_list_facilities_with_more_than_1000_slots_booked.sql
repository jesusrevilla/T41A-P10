--list_facilities_with_more_than_1000_slots_booked.sql
select facid, sum(slots) as "Total Slots"
        from cd.bookings
        group by facid
        having sum(slots) > 1000
        order by facid 
