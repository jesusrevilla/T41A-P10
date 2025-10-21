SELECT DISTINCT r.firstname, r.surname FROM cd.members m INNER JOIN cd.members r ON r.memid = m.recommendedby ORDER BY surname, firstname;
