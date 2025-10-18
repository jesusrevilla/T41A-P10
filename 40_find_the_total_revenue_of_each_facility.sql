--Find the total revenue of each facility
SELECT cdf.name, SUM(slots * CASE 
					 WHEN memid = 0 THEN cdf.guestcost 
					 ELSE cdf.membercost 
					 END) AS revenue FROM cd.bookings cdb INNER JOIN cd.facilities cdf ON cdf.facid = cdb.facid GROUP BY cdf.name ORDER BY revenue;
