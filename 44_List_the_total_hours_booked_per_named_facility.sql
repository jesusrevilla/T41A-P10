-List the total hours booked per named facility
--Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour. The output table should consist of the facility 
--id, name, and hours booked, sorted by facility id. Try formatting the hours to two decimal places.
SELECT f.facid,f.name,
    ROUND(SUM(b.slots) / 2.0, 2) AS total_hours
FROM cd.bookings b
JOIN cd.facilities f 
    ON f.facid = b.facid
GROUP BY f.facid, f.name
ORDER BY f.facid;
