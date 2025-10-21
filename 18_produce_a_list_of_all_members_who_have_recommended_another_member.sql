select distinct r.firstname as firstname, r.surname as surname
	from
		cd.members mems
		inner join cd.members r
			on r.memid = mems.recommendedby
order by surname, firstname;
