--Retrieve the start times of members' bookings
SELECT starttime FROM cd.bookings WHERE memid = (SELECT memid FROM cd.members WHERE firstname = 'David' AND surname = 'Farrell');
