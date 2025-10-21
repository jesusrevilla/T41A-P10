SELECT bks.starttime FROM cd.bookings bks
		inner join cd.members mems
			on mems.memid = bks.memid
	WHERE 
		mems.firstname='David' 
		and mems.surname='Farrell';
