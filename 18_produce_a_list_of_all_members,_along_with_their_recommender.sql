--Produce a list of all members, along with their recommender
--How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

select member.firstname as memfname,member.surname as memsname,
rec.firstname as recfname, rec.surname as recsname from cd.members member
left join cd.members rec on rec.memid=member.recommendedby
order by member.surname,member.firstname
