SELECT o.starttime FROM cd.bookings AS o JOIN cd.members AS p ON p.memid = o.memid
WHERE firstname = 'David' AND surname = 'Farrell'
