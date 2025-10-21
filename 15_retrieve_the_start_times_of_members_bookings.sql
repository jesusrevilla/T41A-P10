SELECT bk.starttime
	FROM cd.bookings bk
		inner JOIN cd.members m
		  ON m.memid = bk.memid
	WHERE
		m.firstname='David'
		AND m.surname='Farrell';
