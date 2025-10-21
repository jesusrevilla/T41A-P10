--List facilities with more than 1000 slots booked
--Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and slots, sorted by facility id.
SELECT facid, sum(slots) as "Total Slots" FROM cd.bookings
group by facid HAVING sum(slots)>1000
ORDER BY facid;
