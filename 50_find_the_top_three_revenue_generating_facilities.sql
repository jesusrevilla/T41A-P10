--Find the top three revenue generating facilities
SELECT name, rank FROM(SELECT cdf.name AS name, rank() over (ORDER BY SUM(CASE
				WHEN memid = 0 THEN slots * cdf.guestcost
				ELSE slots * membercost
			END) DESC) AS rank FROM cd.bookings cdb	INNER JOIN cd.facilities cdf ON cdb.facid = cdf.facid
	group BY cdf.name) ORDER BY rank LIMIT 3;
