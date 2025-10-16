SELECT bk.starttime as start, f.name AS name
	FROM
		cd.facilities f
		inner JOIN cd.bookings bk ON f.facid = bk.facid
	WHERE
		f.name IN ('Tennis Court 2','Tennis Court 1') AND
		bk.starttime >= '2012-09-21' AND bk.starttime < '2012-09-22'
ORDER BY bk.starttime;
