--Produce a CTE that can return the upward recommendation chain for any member
--Produce a CTE that can return the upward recommendation chain for any member. You should be able to select recommender from recommenders where member=x. Demonstrate it by getting the chains for members 12 and 22. 
--Results table should have member and recommender, ordered by member ascending, recommender descending.
with recursive recommenders(recommender, member) as (
	select recommendedby, memid
		from cd.members
	union all
	select mems.recommendedby, recs.member
		from recommenders recs
		inner join cd.members mems
			on mems.memid = recs.recommender
)
select recs.member member, recs.recommender, mems.firstname, mems.surname
	from recommenders recs
	inner join cd.members mems		
		on recs.recommender = mems.memid
	where recs.member = 22 or recs.member = 12
order by recs.member asc, recs.recommender desc      
