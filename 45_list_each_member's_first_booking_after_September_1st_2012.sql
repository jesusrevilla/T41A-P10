select member.surname,member.firstname,member.memid,min(book.starttime)
from cd.bookings book
join cd.members member on member.memid=book.memid
where book.starttime>'2012.09.01'
group by member.surname,member.firstname,member.memid
order by member.memid
