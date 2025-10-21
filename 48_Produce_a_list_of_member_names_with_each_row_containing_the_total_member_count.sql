--Produce a list of member names, with each row containing the total member count
--Produce a list of member names, with each row containing the total member count. Order by join date, and include guest members.

select count(*) over(), firstname, surname
	from cd.members
order by joindate
