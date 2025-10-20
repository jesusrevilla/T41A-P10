--List the total slots booked per facility per month
--Produce a list of the total number of slots booked per facility per month in the year of 2012. 
--Produce an output table consisting of facility id and slots, sorted by the id and month.

select facid,extract(month from starttime) as month,sum(slots) as total
from cd.bookings
where extract(year from starttime)=2012
group by facid,month
order by facid,month
