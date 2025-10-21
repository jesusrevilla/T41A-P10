--List the total hours booked per named facility
--Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour. 
--The output table should consist of the facility id, name, and hours booked, sorted by facility id. 
--Try formatting the hours to two decimal places.

select book.facid,fac.name,round(sum(slots*0.5),2) from cd.bookings book
join cd.facilities fac on fac.facid=book.facid
group by book.facid,fac.name
order by book.facid
