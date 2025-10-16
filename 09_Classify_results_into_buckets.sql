SELECT name,
       CASE
           WHEN monthlymaintenance < 100 THEN 'cheap'
           ELSE 'expensive'
       END AS cost
FROM cd.facilities;
