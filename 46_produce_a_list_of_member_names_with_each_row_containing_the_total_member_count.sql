--produce_a_list_of_member_names_with_each_row_containing_the_total_member_count.sql
select count(*) over(), firstname, surname
	from cd.members
order by joindate  
