SELECT member, facility, cost FROM (
	SELECT
		m.firstname || ' ' || m.surname AS member,
		f.name AS facility,
		case
			when m.memid = 0 then
				bk.slots*f.guestcost
			else
				bk.slots*f.membercost
		end AS cost
		FROM
			cd.members m
			inner JOIN cd.bookings bk
				on m.memid = bk.memid
			inner JOIN cd.facilities f
				ON bk.facid = f.facid
		WHERE
			bk.starttime >= '2012-09-14' AND
			bk.starttime < '2012-09-15'
	) AS bookings
	WHERE cost > 30
ORDER BY cost DESC;
