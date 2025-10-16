SELECT name,
       CASE 
           WHEN monthlymaintenance > 100 THEN 'expensive'
           WHEN monthlymaintenance <= 100 THEN 'cheap'
           ELSE 'unknown'
       END AS cost
FROM cd.facilities;
