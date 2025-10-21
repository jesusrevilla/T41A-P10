SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member, facs.name AS facility
FROM 
    cd.members mems
    INNER JOIN cd.bookings bks
        ON mems.memid = bks.memid
    INNER JOIN cd.facilities facs
        ON bks.facid = facs.facid
WHERE
    facs.name IN ('Tennis Court 2', 'Tennis Court 1')
ORDER BY member, facility;
