--count_the_number_of_recommendations_each_member_makes.sql
select recommendedby, count(*) 
	from cd.members
	where recommendedby is not null
	group by recommendedby
order by recommendedby;
