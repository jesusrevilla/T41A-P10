--List each member's first booking after September 1st 2012
--Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.
select mems.surname, mems.firstname, mems.memid, min(bks.starttime) as starttime
	from cd.bookings bks
	join cd.members mems on
		mems.memid = bks.memid
	where starttime >= '2012-09-01'
	group by mems.surname, mems.firstname, mems.memid
order by mems.memid;          
