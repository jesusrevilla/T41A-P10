SELECT DISTINCT recs.firstname, recs.surname
FROM cd.members mems
INNER JOIN cd.members recs ON mems.recommendedby = recs.memid
ORDER BY recs.surname, recs.firstname;
