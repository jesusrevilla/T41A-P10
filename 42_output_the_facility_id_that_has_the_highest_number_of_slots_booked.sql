select facid,sum(slots) as total from cd.bookings
group by facid
order by sum(slots) desc
limit 1;
