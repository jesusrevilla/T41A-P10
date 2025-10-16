SELECT DISTINCT
  m.firstname || ' ' || m.surname AS member,
  (SELECT r.firstname || ' ' || r.surname
     FROM cd.members r
     WHERE r.memid = m.recommendedby) AS recommender
FROM cd.members m
ORDER BY member;
