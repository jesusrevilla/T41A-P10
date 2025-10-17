SELECT books.starttime 

	FROM cd.bookings books,
		 cd.members members
		 
	WHERE members.firstname = 'David' AND members.surname = 'Farrell' AND members.memid = books.memid;
