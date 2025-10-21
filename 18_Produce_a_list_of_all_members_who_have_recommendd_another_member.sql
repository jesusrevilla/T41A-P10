SELECT DISTINCT rec.firstname, rec.surname
FROM cd.members m
INNER JOIN cd.members rec ON m.recommendedby = rec.memid
ORDER BY rec.surname, rec.firstname;
