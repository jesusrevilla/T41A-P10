SELECT DISTINCT m.firstname || ' ' || m.surname AS member,f.name AS facility FROM cd.members m
JOIN cd.bookings b ON m.memid = b.memid JOIN cd.facilities f ON b.facid = f.facid
WHERE f.name LIKE 'Tennis Court%' ORDER BY member, facility;
