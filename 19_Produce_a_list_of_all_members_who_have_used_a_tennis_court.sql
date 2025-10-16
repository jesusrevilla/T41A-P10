SELECT DISTINCT 
    mems.firstname || ' ' || mems.surname AS member, 
    facs.name AS facility
FROM 
    cd.members mems
JOIN 
    cd.bookings bks ON mems.memid = bks.memid
JOIN 
    cd.facilities facs ON bks.facid = facs.facid
WHERE 
    facs.name LIKE 'Tennis Court%'
ORDER BY 
    member, 
    facility;
