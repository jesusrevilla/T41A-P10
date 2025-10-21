SELECT a.memid, COUNT(b.recommendedby) FROM cd.members AS a JOIN cd.members b 
ON a.memid=b.recommendedby GROUP BY a.memid ORDER BY a.memid;
