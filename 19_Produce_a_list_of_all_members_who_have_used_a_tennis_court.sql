SELECT DISTINCT membs.firstname ||' '|| membs.surname as member, fac.name as facility
	from cd.members membs
	inner join cd.bookings bks
		on membs.memid = bks.memid
	inner join cd.facilities fac
		on fac.facid = bks.facid
	where fac.name in ('Tennis Court 2','Tennis Court 1')
order by member, facility;
