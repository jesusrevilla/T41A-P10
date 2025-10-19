-- How can you output a list of all members, including the individual who recommended them (if any), 
-- without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.
SELECT DISTINCT
	mo.firstname || ' ' || mo.surname AS member,
	(
		SELECT firstname || ' ' || surname AS recommender
	  	FROM cd.members ms WHERE ms.memid = mo.recommendedby
	)
FROM cd.members mo 
ORDER BY member;
