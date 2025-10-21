--Find the upward recommendation chain for member ID 27
--Find the upward recommendation chain for member ID 27: that is, the member who recommended them, and the member who 
--recommended that member, and so on. Return member ID, first name, and surname. Order by descending member id.
with recursive recommenders(recommender) as (
select recommendedby from cd.members where memid = 27
union all
select mems.recommendedby from recommenders recs
inner join cd.members mems on mems.memid = recs.recommender
)
select recs.recommender, mems.firstname, mems.surname
from recommenders recs 
inner join cd.members mems on recs.recommender = mems.memid
order by memid desc
