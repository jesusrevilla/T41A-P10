--Rank members by (rounded) hours used
--Produce a list of members (including guests), along with the number of hours they've booked in facilities, rounded to the nearest ten hours. 
--Rank them by this rounded figure, producing output of first name, surname, rounded hours, rank. Sort by rank, surname, and first name.

select member.firstname,member.surname,round(sum(slots*0.5)/10)*10 as hours,rank() over(order by round(sum(slots*0.5)/10)*10 desc)
from cd.bookings book
join cd.members member on member.memid=book.memid
group by member.memid
order by rank,member.surname,member.firstname
