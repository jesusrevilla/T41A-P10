WITH RECURSIVE recommenders(recommender) AS (
	SELECT recommendedby FROM cd.members WHERE memid = 27
	UNION ALL
	SELECT mems.recommendedby
		FROM recommenders recs
		INNER JOIN cd.members mems
			ON mems.memid = recs.recommender
)
SELECT recs.recommender, mems.firstname, mems.surname
	FROM recommenders recs
	INNER JOIN cd.members mems
		ON recs.recommender = mems.memid
ORDER BY memid DESC
