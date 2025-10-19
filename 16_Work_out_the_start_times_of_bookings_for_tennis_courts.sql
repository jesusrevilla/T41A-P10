SELECT p.starttime AS start, o.name FROM cd.facilities AS o JOIN cd.bookings AS p 
ON o.facid = p.facid WHERE DATE(p.starttime) = '2012-09-21' AND o.name LIKE '%Tennis%' 
AND o.name!='Table Tennis'  ORDER BY p.starttime;
