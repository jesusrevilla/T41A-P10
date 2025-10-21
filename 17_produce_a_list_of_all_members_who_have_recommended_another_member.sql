-- How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

SELECT DISTINCT mi.firstname, mi.surname FROM cd.members mi 
	INNER JOIN cd.members mo 
	ON mi.memid = mo.recommendedby
	ORDER BY mi.surname, mi.firstname;
