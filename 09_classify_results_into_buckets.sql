SELECT name,
		CASE
           WHEN monthlymaintenance <= 100 THEN 'cheap'
           WHEN monthlymaintenance > 100 THEN 'expensive'
       END AS cost
FROM cd.facilities;
