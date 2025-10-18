--Produce a list of all members who have used a tennis court
SELECT DISTINCT CONCAT(cdm.firstname, ' ', cdm.surname) AS member, cdf.name AS facility FROM cd.members cdm JOIN cd.bookings cdb ON cdm.memid = cdb.memid JOIN cd.facilities cdf ON cdb.facid = cdf.facid WHERE cdf.name IN ('Tennis Court 1', 'Tennis Court 2') ORDER BY member, facility;
