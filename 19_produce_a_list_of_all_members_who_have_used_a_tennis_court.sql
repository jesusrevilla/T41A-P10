SELECT distinct mems.firstname || ' ' || mems.surname AS member, facs.name AS facility
	FROM 
		cd.members mems
		inner join cd.bookings bks
			on mems.memid = bks.memid
		inner join cd.facilities facs
			on bks.facid = facs.facid
	WHERE
		facs.name in ('Tennis Court 2','Tennis Court 1')
order by member, facility
