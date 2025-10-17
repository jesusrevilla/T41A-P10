SELECT name, CASE WHEN (monthlymaintenance > 100) THEN 'expensive'
			else 'cheap' END AS cost
FROM cd.facilities; 
