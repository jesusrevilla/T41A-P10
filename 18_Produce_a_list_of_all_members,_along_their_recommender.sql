SELECT membs.firstname as memfname, membs.surname as memsname, recs.firstname as recfname, recs.surname as recsname
	from cd.members membs
	left join cd.members recs
	on recs.memid = membs.recommendedby
order by membs.surname, membs.firstname;
