--Produce a list of all members who have used a tennis court
--How can you produce a list of all members who have used a tennis court? 
--Include in your output the name of the court, and the name of the member 
--formatted as a single column. Ensure no duplicate data, and order by the 
--member name followed by the facility name.
SELECT distinct m.firstname ||' '||m.surname AS member, f.name AS facility
FROM cd.bookings b 
JOIN cd.members m ON b.memid = m.memid
JOIN cd.facilities f ON b.facid=f.facid
WHERE f.name in ('Tennis Court 2', 'Tennis Court 1')
ORDER BY member, facility;
