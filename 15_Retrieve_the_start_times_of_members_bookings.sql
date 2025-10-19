SELECT bks.starttime 
	FROM 
		cd.bookings bks
		inner JOIN cd.members mems
			ON mems.memid = bks.memid
	WHERE 
		mems.firstname='David' 
		AND mems.surname='Farrell';
