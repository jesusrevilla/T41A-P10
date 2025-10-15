SELECT name,
	CASE
		WHEN monthlymaintenance<101 THEN 'cheap'
		ELSE 'expensive'
	END AS cost
FROM cd.facilities;
