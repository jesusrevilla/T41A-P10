SELECT bks.starttime AS start, facs.name
FROM cd.bookings bks
INNER JOIN cd.facilities facs ON bks.facid = facs.facid
WHERE facs.name LIKE 'Tennis Court %'
  AND bks.starttime >= '2012-09-21'
  AND bks.starttime < '2012-09-22'
ORDER BY bks.starttime;
