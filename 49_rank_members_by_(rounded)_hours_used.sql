select member.firstname,member.surname,round(sum(slots*0.5)/10)*10 as hours,rank() over(order by round(sum(slots*0.5)/10)*10 desc)
from cd.bookings book
join cd.members member on member.memid=book.memid
group by member.memid
order by rank,member.surname,member.firstname
