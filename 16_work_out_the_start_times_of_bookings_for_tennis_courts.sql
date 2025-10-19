--Work out the start times of bookings for tennis courts
SELECT cd.bookings.starttime AS start, cd.facilities.name AS name
	FROM 
		cd.facilities
		INNER JOIN cd.bookings
			ON cd.facilities.facid = cd.bookings.facid
	WHERE 
		cd.facilities.name IN ('Tennis Court 2','Tennis Court 1') AND
		cd.bookings.starttime >= '2012-09-21' AND
		cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime;
