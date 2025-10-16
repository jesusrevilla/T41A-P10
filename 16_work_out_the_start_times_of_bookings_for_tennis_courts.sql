--Work out the start times of bookings for tennis courts
--How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
select bookings.starttime as start, facilities.name from cd.bookings
join cd.facilities on bookings.facid=facilities.facid
where facilities.name like '%Tennis Court%' and date(bookings.starttime)='2012.09.21'
order by bookings.starttime
