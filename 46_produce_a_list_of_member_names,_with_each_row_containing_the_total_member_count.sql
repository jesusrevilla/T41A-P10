select (select count(memid) from cd.members) as count,firstname,surname from cd.members
order by joindate
