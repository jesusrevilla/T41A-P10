--Produce a list of all members, along with their recommender, using no joins.
--How can you output a list of all members, including the individual who recommended them (if any), without using any joins? 
--Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.
SELECT distinct m.firstname||' '||m.surname AS member, 
(SELECT r.firstname||' '||r.surname AS recommender 
 FROM cd.members r WHERE r.memid=m.recommendedby) FROM cd.members m
ORDER BY member;
