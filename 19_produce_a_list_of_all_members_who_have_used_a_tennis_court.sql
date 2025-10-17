--Produce a list of all members who have used a tennis court
--How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, 
--and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name followed by the facility name.

select distinct member.firstname|| ' ' || member.surname as member, fac.name as facility from cd.bookings book
join cd.members member on member.memid=book.memid
join cd.facilities fac on fac.facid=book.facid
where fac.name like 'Tennis Court%'
order by member,fac.name
