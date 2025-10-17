SELECT mems.firstname || ' ' || mems.surname AS member, facs.name AS facility, 
	CASE WHEN mems.memid = 0 THEN bks.slots*facs.guestcost
		ELSE bks.slots*facs.membercost
	END AS cost
        FROM
                cd.members mems                
                INNER JOIN cd.bookings bks
                        ON mems.memid = bks.memid
                INNER JOIN cd.facilities facs
                        ON bks.facid = facs.facid
        WHERE
		      bks.starttime >= '2012-09-14' AND bks.starttime < '2012-09-15' AND (
			    (mems.memid = 0 AND bks.slots*facs.guestcost > 30) OR (mems.memid != 0 AND bks.slots*facs.membercost > 30)
		    )
ORDER BY cost DESC;    
