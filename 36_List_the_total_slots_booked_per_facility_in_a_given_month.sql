--List the total slots booked per facility in a given month
--Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT facid, sum(slots) as "Total Slots" FROM cd.bookings 
WHERE starttime>= '2012-09-01' and starttime < '2012-10-01'
GROUP BY facid ORDER BY "Total Slots";
