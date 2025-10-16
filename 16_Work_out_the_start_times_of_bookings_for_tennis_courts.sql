SELECT b.starttime AS start, f.name
FROM cd.bookings AS b
JOIN cd.facilities AS f ON f.facid = b.facid
WHERE f.name LIKE 'Tennis Court%'      
  AND DATE(b.starttime) = DATE '2012-09-21'
ORDER BY b.starttime;
