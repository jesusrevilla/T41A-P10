--Produce a list of all members who have recommended another member
--How can you output a list of all members who have recommended another member? 
--Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
SELECT distinct(t2.firstname), t2.surname FROM cd.members t1, cd.members t2 
WHERE t2.memid = t1.recommendedby
ORDER BY surname,firstname;
