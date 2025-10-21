SELECT p.firstname, p.surname, o.firstname, o.surname FROM cd.members AS o
RIGHT JOIN (SELECT * FROM cd.members) AS p ON o.memid=p.recommendedby 
ORDER BY p.surname, p.firstname;
