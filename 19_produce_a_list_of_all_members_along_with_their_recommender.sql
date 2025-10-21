select m.firstname as memfname, m.surname as memsname, r.firstname as recfname, r.surname as recsname
	from
		cd.members m
		left outer join cd.members r
			on r.memid = m.recommendedby
order by memsname, memfname;
