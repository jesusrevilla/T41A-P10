--Produce a count of the number of recommendations each member has made. Order by member ID.
select recommendedby, count(*) 
	from cd.members
	where recommendedby is not null
	group by recommendedby
order by recommendedby;    
