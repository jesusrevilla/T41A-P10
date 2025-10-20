SELECT facid, EXTRACT(MONTH FROM starttime) AS month, SUM(slots) AS slots FROM cd.bookings WHERE starttime >= '2012-01-01'
AND starttime < '2013-01-01' GROUP BY ROLLUP(facid, month) ORDER BY facid, month;
