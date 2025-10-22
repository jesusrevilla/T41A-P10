--List each member's first booking after September 1st 2012
--Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.

select member.surname,member.firstname,member.memid,min(book.starttime)
from cd.bookings book
join cd.members member on member.memid=book.memid
where book.starttime>'2012.09.01'
group by member.surname,member.firstname,member.memid
order by member.memid
