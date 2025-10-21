SELECT m.firstname || ' ' || m.surname as member,
	f.name AS facility,
	CASE
		WHEN m.memid = 0 THEN
			bk.slots*f.guestcost
		ELSE
			bk.slots*f.membercost
	END AS cost
        FROM
                cd.members m
                INNER JOIN cd.bookings bk
                        ON m.memid = bk.memid
                INNER JOIN cd.facilities f
                        ON bk.facid = f.facid
        WHERE
		bk.starttime >= '2012-09-14' AND
		bk.starttime < '2012-09-15' AND (
			(m.memid = 0 AND bk.slots*f.guestcost > 30) OR
			(m.memid != 0 AND bk.slots*f.membercost > 30)
		)
ORDER BY cost DESC;
