--Produce a list of all members, along with their recommender, using no joins.
--How can you output a list of all members, including the individual who recommended them (if any), 
--without using any joins? Ensure that there are no duplicates in the list, 
--and that each firstname + surname pairing is formatted as a column and ordered.

select distinct member.firstname || ' ' || member.surname as member,
(select rec.firstname || ' ' || rec.surname from cd.members rec where rec.memid=member.recommendedby) as recommender
from cd.members member
order by member
