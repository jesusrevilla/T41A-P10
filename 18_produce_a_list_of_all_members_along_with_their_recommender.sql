--Produce a list of all members, along with their recommender
SELECT uno.firstname AS memfname, uno.surname AS memsname, dos.firstname AS recfname, dos.surname AS recsname FROM cd.members uno LEFT OUTER JOIN cd.members dos ON dos.memid = uno.recommendedby ORDER BY uno.surname, uno.firstname;
