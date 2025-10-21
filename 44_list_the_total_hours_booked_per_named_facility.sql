select book.facid,fac.name,round(sum(slots*0.5),2) from cd.bookings book
join cd.facilities fac on fac.facid=book.facid
group by book.facid,fac.name
order by book.facid
