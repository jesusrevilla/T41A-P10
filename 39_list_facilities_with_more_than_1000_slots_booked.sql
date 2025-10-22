--List facilities with more than 1000 slots booked
--Produce a list of facilities with more than 1000 slots booked. 
--Produce an output table consisting of facility id and slots, sorted by facility id.

select facid,sum(slots) as total from cd.bookings
group by facid
having sum(slots)>1000
order by facid
