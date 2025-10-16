--Produce a list of all members who have recommended another member
SELECT DISTINCT dos.firstname, dos.surname FROM cd.members uno INNER JOIN cd.members dos ON dos.memid = uno.recommendedby ORDER BY surname, firstname;
