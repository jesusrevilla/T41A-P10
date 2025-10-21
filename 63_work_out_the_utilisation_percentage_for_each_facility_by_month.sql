--Work out the utilisation percentage for each facility by month
SELECT name, month, ROUND((100 * slots) / CAST(25 * (CAST((month + INTERVAL '1 month') AS date)
			- CAST(month AS date)) AS numeric),1) AS utilisation FROM(SELECT cdf.name AS name,
			DATE_TRUNC('month', starttime) AS month, SUM(slots) AS slots FROM cd.bookings cdb
			INNER JOIN cd.facilities cdf ON cdb.facid = cdf.facid GROUP BY cdf.facid, month) ORDER BY name, month;
