SELECT DISTINCT m.firstname || ' ' || m.surname AS member, f.name AS facility
FROM cd.members m
JOIN cd.bookings b ON m.memid=b.memid
JOIN cd.facilities f ON f.facid=b.facid
WHERE f.name IN ('Tennis Court 1','Tennis Court 2')
ORDER BY member,facility;
