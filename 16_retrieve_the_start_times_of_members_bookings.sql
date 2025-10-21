SELECT starttime FROM cd.members mbs
INNER JOIN cd.bookings bks 
ON mbs.memid = bks.memid 
WHERE mbs.firstname = 'David' AND mbs.surname = 'Farrell';
