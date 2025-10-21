--List the total hours booked per named facility
SELECT cdf.facid, cdf.name, trim(to_char(sum(cdb.slots)/2.0, '9999999999999999D99')) AS "Total Hours" FROM cd.bookings cdb INNER JOIN cd.facilities cdf ON cdb.facid = cdf.facid GROUP BY cdf.facid, cdf.name ORDER BY cdf.facid;
