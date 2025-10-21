WITH RECURSIVE chain(memid) AS (
  SELECT recommendedby
  FROM cd.members
  WHERE memid = 27
  UNION ALL
  SELECT m.recommendedby
  FROM cd.members m
  JOIN chain c ON m.memid = c.memid
  WHERE m.recommendedby IS NOT NULL AND m.recommendedby <> 0
)
SELECT c.memid AS recommender, m.firstname, m.surname
FROM chain c
JOIN cd.members m ON m.memid = c.memid
ORDER BY recommender DESC;
