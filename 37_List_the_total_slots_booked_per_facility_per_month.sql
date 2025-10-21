--List the total slots booked per facility per month
--Produce a list of the total number of slots booked per facility per month in the year of 2012. 
--Produce an output table consisting of facility id and slots, sorted by the id and month.
SELECT facid, extract(month FROM starttime) AS month, sum(slots) AS "Total Slots"
FROM cd.bookings
WHERE extract(year FROM starttime) = 2012
group by facid, month
ORDER BY facid,month;
