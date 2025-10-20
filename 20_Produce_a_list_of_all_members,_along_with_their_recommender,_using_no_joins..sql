SELECT DISTINCT m.firstname || ' ' || m.surname AS member,
 (SELECT r.firstname || ' ' || r.surname AS recommender
FROM cd.members r WHERE r.memid = m.recommendedby)
FROM cd.members m ORDER BY member;
