SELECT DISTINCT recomend.firstname AS firstname, recomend.surname AS surname
	FROM 
		cd.members members
		INNER JOIN cd.members recomend
			ON recomend.memid = members.recommendedby
ORDER BY surname, firstname; 
