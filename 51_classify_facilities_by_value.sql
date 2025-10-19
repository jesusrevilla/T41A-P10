--Classify facilities by value
SELECT name, CASE
		WHEN class=1 THEN 'high'
		WHEN class=2 THEN 'average'
		ELSE 'low'
		END revenue FROM ( SELECT cdf.name AS name, NTILE(3) OVER (ORDER BY SUM(CASE
				WHEN memid = 0 THEN slots * cdf.guestcost
				ELSE slots * membercost
				END) DESC) AS class FROM cd.bookings cdb INNER JOIN cd.facilities cdf ON cdb.facid = cdf.facid
		GROUP BY cdf.name) ORDER BY class, name;  
