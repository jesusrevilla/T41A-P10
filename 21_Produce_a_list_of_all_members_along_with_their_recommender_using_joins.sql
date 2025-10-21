SELECT DISTINCT mems.firstname ||' '|| mems.surname as member, 
	(SELECT recs.firstname ||' '|| recs.surname as recommender
	 from cd.members recs
	 where 
		recs.memid = mems.recommendedby)
		from cd.members mems
order by member;
