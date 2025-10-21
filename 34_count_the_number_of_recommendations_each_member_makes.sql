SELECT recommendedby, COUNT(*) 
	FROM cd.members
	WHERE recommendedby IS NOT null
	group BY recommendedby
ORDER BY recommendedby;
