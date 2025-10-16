SELECT 
    mems.firstname || ' ' || mems.surname AS member,
    facs.name AS facility,
    CASE 
        WHEN mems.memid = 0 THEN bks.slots * facs.guestcost
        ELSE bks.slots * facs.membercost 
    END AS cost
FROM 
    cd.bookings bks
INNER JOIN 
    cd.facilities facs ON bks.facid = facs.facid
INNER JOIN 
    cd.members mems ON bks.memid = mems.memid
WHERE 
    bks.starttime >= '2012-09-14' AND bks.starttime < '2012-09-15'
    AND (CASE 
            WHEN mems.memid = 0 THEN bks.slots * facs.guestcost 
            ELSE bks.slots * facs.membercost 
         END) > 30
ORDER BY 
    cost DESC;
