--Calculate the payback time for each facility
SELECT cdf.name AS name, cdf.initialoutlay/((SUM(CASE
			WHEN memid = 0 THEN slots * cdf.guestcost
			ELSE slots * membercost
			END)/3) - cdf.monthlymaintenance) AS months FROM cd.bookings cdb INNER JOIN cd.facilities cdf
			ON cdb.facid = cdf.facid GROUP BY cdf.facid ORDER BY name;
