-- How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname)

SELECT 
	mo.firstname AS memfname, 
	mo.surname AS memsname, 
	ms.firstname AS recfname, 
	ms.surname AS recsname 
FROM cd.members mo LEFT OUTER JOIN
	cd.members ms ON
	mo.recommendedby = ms.memid
ORDER BY mo.surname, mo.firstname; 
