-- How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. 
-- Ensure no duplicate data, and order by the member name followed by the facility name.

SELECT DISTINCT
	m.firstname || ' ' || m.surname AS member, 
	f.name AS facility 
	FROM cd.members m INNER JOIN cd.bookings b
	ON m.memid = b.memid
	INNER JOIN cd.facilities f
	ON b.facid = f.facid
	WHERE f.name LIKE 'Tennis Court%'
ORDER BY member, facility;
