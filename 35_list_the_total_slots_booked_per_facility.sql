--List the total slots booked per facility
--Produce a list of the total number of slots booked per facility. For now, 
--just produce an output table consisting of facility id and slots, sorted by facility id.

select facid,sum(slots) as "Total Slots" from cd.bookings
group by facid
order by facid;
