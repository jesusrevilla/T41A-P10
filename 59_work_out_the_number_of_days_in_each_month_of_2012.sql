--Work out the number of days in each month of 2012
SELECT EXTRACT(month FROM cal.month) AS month, (cal.month + INTERVAL '1 month') - cal.month AS length
	FROM (SELECT GENERATE_SERIES(timestamp '2012-01-01', timestamp '2012-12-01', INTERVAL '1 month')
	AS month) cal ORDER BY month;
