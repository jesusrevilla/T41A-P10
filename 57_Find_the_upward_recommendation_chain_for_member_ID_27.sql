WITH RECURSIVE recommenders(recommender) AS (
    SELECT recommendedby 
    FROM cd.members 
    WHERE memid = 27 UNION ALL
    SELECT m.recommendedby
    FROM recommenders r
    INNER JOIN cd.members m
        ON m.memid = r.recommender
)
SELECT r.recommender, m.firstname, m.surname FROM recommenders r INNER JOIN cd.members m
ON r.recommender = m.memid ORDER BY memid DESC;
