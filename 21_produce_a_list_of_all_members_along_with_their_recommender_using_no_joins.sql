--Produce a list of all members, along with their recommender, using no joins.
SELECT DISTINCT CONCAT(uno.firstname, ' ', uno.surname) AS member, (SELECT CONCAT(dos.firstname, ' ', dos.surname) AS recommender FROM cd.members AS dos WHERE uno.recommendedby = dos.memid) FROM cd.members AS uno ORDER BY member;
