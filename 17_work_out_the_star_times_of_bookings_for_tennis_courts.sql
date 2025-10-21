SELECT b.starttime AS start, f.name AS name
FROM cd.bookings b
INNER JOIN cd.facilities f ON b.facid = f.facid
WHERE f.name LIKE 'Tennis Court%'
AND b.starttime >= '2012-09-21' 
AND b.starttime < '2012-09-22'
ORDER BY b.starttime;
