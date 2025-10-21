SELECT DISTINCT m.firstname || ' ' || m.surname as member, f.name as facility
	FROM
		cd.members m
		INNER JOIN cd.bookings bk
			ON m.memid = bk.memid
		INNER JOIN cd.facilities f
			ON bk.facid = f.facid
	WHERE
		f.name IN ('Tennis Court 2','Tennis Court 1')
ORDER BY member, facility;
