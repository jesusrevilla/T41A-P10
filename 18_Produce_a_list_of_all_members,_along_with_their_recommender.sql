SELECT m.firstname AS memfname, m.surname AS memsname,r.firstname AS recfname, r.surname AS recsname
FROM cd.members m LEFT OUTER JOIN cd.members r ON r.memid = m.recommendedby 
ORDER BY memsname, memfname;
