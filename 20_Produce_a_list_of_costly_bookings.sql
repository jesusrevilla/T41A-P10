SELECT a.firstname || ' ' || a.surname AS member, b.name, 
CASE
WHEN a.memid=0 THEN (b.guestcost*c.slots)
ELSE (b.membercost*c.slots) END AS cost FROM cd.members AS a
JOIN cd.bookings AS c ON c.memid = a.memid JOIN cd.facilities AS b ON c.facid=b.facid 
WHERE DATE(c.starttime)='2012-09-14'  AND ((a.memid = 0 AND c.slots * b.guestcost > 30) OR 
(a.memid <> 0 AND c.slots * b.membercost > 30)) ORDER BY cost DESC;
