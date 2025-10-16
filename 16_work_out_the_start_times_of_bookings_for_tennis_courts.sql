SELECT DISTINCT b.starttime AS start, f.name
FROM cd.bookings b
JOIN cd.facilities f ON b.facid=f.facid
WHERE f.name LIKE '%Tennis Court%'
AND b.starttime>='2012-09-21'
AND b.starttime<'2012-09-22'
ORDER BY b.starttime;
