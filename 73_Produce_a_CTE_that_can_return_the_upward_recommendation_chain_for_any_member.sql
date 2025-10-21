WITH RECURSIVE recommenders(member, recommender) AS (
  -- seed members
  SELECT memid AS member, recommendedby AS recommender
  FROM cd.members
  WHERE memid IN (12, 22)

  UNION ALL

  -- walk upward through the recommender chain
  SELECT r.member, m.recommendedby
  FROM recommenders r
  JOIN cd.members m ON m.memid = r.recommender
  WHERE m.recommendedby IS NOT NULL AND m.recommendedby <> 0
)
SELECT
  r.member,
  r.recommender,
  m.firstname,
  m.surname
FROM recommenders r
JOIN cd.members m ON m.memid = r.recommender
ORDER BY r.member ASC, r.recommender DESC;
