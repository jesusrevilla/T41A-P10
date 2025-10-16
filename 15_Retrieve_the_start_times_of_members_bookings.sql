SELECT bks.starttime FROM Cd.bookings bks 
  INNER JOIN cd.members mems ON mems.memid = bks.memid
	WHERE mems.firstname='David' AND mems.surname='Farrell';    
