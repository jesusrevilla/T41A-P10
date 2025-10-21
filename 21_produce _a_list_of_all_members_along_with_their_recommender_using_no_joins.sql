SELECT DISTINCT m.firstname || ' ' ||  m.surname as member,
	(SELECT re.firstname || ' ' || re.surname as recommender
		fROM cd.members re
		WHERE re.memid = m.recommendedby
	)
	FROM
		cd.members m
ORDER BY member;
