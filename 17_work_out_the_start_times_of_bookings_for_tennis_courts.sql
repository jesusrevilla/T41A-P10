
SELECT starttime,name FROM cd.bookings bks JOIN 
cd.facilities fcs ON bks.facid = fcs.facid
WHERE name LIKE '%Tennis Court%' AND starttime > '2012-09-21' AND starttime<'2012-09-22'
ORDER BY starttime ASC;
