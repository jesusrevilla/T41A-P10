SELECT membs.firstname ||' '|| membs.surname as member, facs.name as facility,
	case
		when membs.memid = 0 then
			bks.slots * facs.guestcost
		else
			bks.slots * facs.membercost
		end as cost
	from cd.members membs
	inner join cd.bookings bks
		on membs.memid = bks.memid
	inner join cd.facilities facs
		on bks.facid = facs.facid
	where bks.starttime >= '2012-09-14' and 
		  bks.starttime < '2012-09-15' and
			((membs.memid = 0 and bks.slots*facs.guestcost > 30) or
			(membs.memid != 0 and bks.slots*facs.membercost > 30))
order by cost desc;
