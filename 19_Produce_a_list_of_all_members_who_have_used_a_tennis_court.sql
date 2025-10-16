SELECT DISTINCT
  m.firstname || ' ' || m.surname AS member,
  f.name                           AS facility
FROM cd.bookings  b
JOIN cd.members   m ON m.memid = b.memid
JOIN cd.facilities f ON f.facid = b.facid
WHERE f.name LIKE 'Tennis Court%'
ORDER BY member, facility;
