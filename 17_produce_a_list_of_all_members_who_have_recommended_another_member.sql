--Produce a list of all members who have recommended another member
--How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
select distinct recs.firstname as firstname, recs.surname as surname
from cd.members mems
inner join cd.members recs on recs.memid = mems.recommendedby
order by surname, firstname; 
