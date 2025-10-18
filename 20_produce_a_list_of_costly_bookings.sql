--Produce a list of costly bookings
SELECT CONCAT(cdm.firstname, ' ', cdm.surname) AS member, 
	cdf.name AS facility, 
	CASE 
		WHEN cdm.memid = 0 then
			cdb.slots*cdf.guestcost
		ELSE
			cdb.slots*cdf.membercost
	END AS cost
        FROM
                cd.members cdm                
                inner JOIN cd.bookings cdb
                        ON cdm.memid = cdb.memid
                inner JOIN cd.facilities cdf
                        ON cdb.facid = cdf.facid
        WHERE
		cdb.starttime >= '2012-09-14' AND 
		cdb.starttime < '2012-09-15' AND (
			(cdm.memid = 0 AND cdb.slots*cdf.guestcost > 30) OR
			(cdm.memid != 0 AND cdb.slots*cdf.membercost > 30)
		)
ORDER BY cost DESC;
