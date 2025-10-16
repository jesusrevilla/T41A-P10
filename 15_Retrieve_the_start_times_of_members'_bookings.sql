SELECT bks.starttime
FROM cd.bookings bks
INNER JOIN cd.members mems ON bks.memid = mems.memid
WHERE mems.firstname = 'David' AND mems.surname = 'Farrell';
