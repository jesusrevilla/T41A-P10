--Produce a list of all members, along with their recommender
--How can you output a list of all members, including the individual 
--who recommended them (if any)? Ensure that results are ordered by (surname, firstname).
SELECT t2.firstname AS memfname, t2.surname AS memsname, 
t1.firstname AS recfname, t1.surname AS recsname
FROM cd.members t2 LEFT OUTER JOIN cd.members t1 
ON t1.memid = t2.recommendedby
ORDER BY t2.surname, t2.firstname;
