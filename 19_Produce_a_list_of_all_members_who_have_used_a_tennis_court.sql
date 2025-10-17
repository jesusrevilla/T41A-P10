SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member, facs.name AS facility
    FROM 
        cd.members mems
        INNER cd.bookings bks
            ON mems.memid = bks.memid
        INNER JOIN cd.facilities facs
            ON bks.facid = facs.facid
    WHERE
        facs.name IN ('Tennis Court 1','Tennis Court 2', 'Tennis Court 3')
ORDER BY member, facility  
