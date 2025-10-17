SELECT mems.firstname AS memfname, mems.surname AS memsname, recs.firstname AS recfname, recs.surname AS recsname
	FROM 
		cd.members mems
		LEFT OUTER JOIN cd.members recs
			ON recs.memid = mems.recommendedby
ORDER BY memsname, memfname; 
