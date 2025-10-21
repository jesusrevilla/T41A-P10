WITH RECURSIVE down AS (
  SELECT memid, firstname, surname
  FROM cd.members
  WHERE recommendedby = 1
  UNION ALL
  SELECT m.memid, m.firstname, m.surname
  FROM cd.members m
  JOIN down d ON m.recommendedby = d.memid
)
SELECT memid, firstname, surname
FROM down
ORDER BY memid;
