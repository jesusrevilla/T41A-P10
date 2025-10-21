SELECT member, facility, cost FROM (
    SELECT 
        m.firstname || ' ' || m.surname AS member,
        f.name AS facility,
        CASE 
            WHEN m.memid = 0 THEN b.slots * f.guestcost
            ELSE b.slots * f.membercost
        END AS cost
    FROM cd.members m
    INNER JOIN cd.bookings b ON m.memid = b.memid
    INNER JOIN cd.facilities f ON b.facid = f.facid
    WHERE b.starttime >= '2012-09-14' 
    AND b.starttime < '2012-09-15'
) AS bookings
WHERE cost > 30
ORDER BY cost DESC;
