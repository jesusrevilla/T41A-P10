SELECT DISTINCT recomend.firstname as firstname, recomend.surname as surname
	from 
		cd.members members
		inner join cd.members recomend
			on recomend.memid = members.recommendedby
order by surname, firstname; 
