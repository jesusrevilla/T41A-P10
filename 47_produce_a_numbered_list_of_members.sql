--produce_a_numbered_list_of_members.sql
select row_number() over(order by joindate), firstname, surname
	from cd.members
order by joindate
