--Produce a list of all members who have recommended another member
--How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

select distinct(firstname),surname from cd.members
where memid in (select recommendedby from cd.members)
order by surname,firstname
