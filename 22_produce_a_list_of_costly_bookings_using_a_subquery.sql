--Produce a list of costly bookings, using a subquery
SELECT member, facility, cost FROM (
	SELECT 
		cdm.firstname || ' ' || cdm.surname AS member,
		cdf.name AS facility,
		CASE
			WHEN cdm.memid = 0 THEN
				cdb.slots*cdf.guestcost
			ELSE
				cdb.slots*cdf.membercost
		END AS cost
		FROM
			cd.members cdm
			INNER JOIN cd.bookings cdb
				ON cdm.memid = cdb.memid
			INNER JOIN cd.facilities cdf
				ON cdb.facid = cdf.facid
		WHERE
			cdb.starttime >= '2012-09-14' AND
			cdb.starttime < '2012-09-15'
	) AS bookings
	WHERE cost > 30
ORDER BY cost DESC; 
