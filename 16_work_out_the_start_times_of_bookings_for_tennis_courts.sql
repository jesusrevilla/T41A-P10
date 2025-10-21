SELECT bks.starttime as start, facs.name AS name
	FROM 
		cd.facilities facs
		inner join cd.bookings bks
			on facs.facid = bks.facid
	WHERE 
		facs.name in ('Tennis Court 2','Tennis Court 1') and
		bks.starttime >= '2012-09-21' and
		bks.starttime < '2012-09-22'
order by bks.starttime;    
