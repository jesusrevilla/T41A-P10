SELECT b.starttime, f.name AS facility_name
FROM cd.bookings b
JOIN cd.facilities f ON b.facid = f.facid
WHERE DATE(b.starttime) = '2012-09-21'
AND f.name LIKE 'Tennis Court%'
ORDER BY b.starttime;
