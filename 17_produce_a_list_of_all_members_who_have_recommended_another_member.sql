SELECT DISTINCT m.firstname,m.surname 
FROM cd.members m
JOIN cd.members d ON m.memid=d.recommendedby
ORDER BY surname, firstname;
