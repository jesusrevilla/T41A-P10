SELECT b.starttime AS start, f.name AS name FROM cd.facilities f INNER JOIN cd.bookings b
ON f.facid = b.facid WHERE f.name IN ('Tennis Court 2','Tennis Court 1') AND b.starttime >= '2012-09-21' AND
b.starttime < '2012-09-22'ORDER BY b.starttime;   
