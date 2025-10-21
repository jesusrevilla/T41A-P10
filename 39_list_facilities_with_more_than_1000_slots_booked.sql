select facid,sum(slots) as total from cd.bookings
group by facid
having sum(slots)>1000
order by facid
