SELECT distinct recs.firstname AS firstname, recs.surname AS surname
	FROM 
		cd.members mems
		inner join cd.members recs
			on recs.memid = mems.recommendedby
order by surname, firstname;
