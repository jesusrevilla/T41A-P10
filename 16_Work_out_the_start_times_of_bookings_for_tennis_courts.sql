--Work out the start times of bookings for tennis courts
--How can you produce a list of the start times for bookings for tennis courts, 
--for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
SELECT b.starttime as start, f.name FROM cd.bookings b JOIN cd.facilities f 
ON b.facid = f.facid WHERE b.starttime >= '2012-09-21' AND  b.starttime < '2012-09-22'
AND f.name like 'Tennis Court%' 
ORDER BY b.starttime;
