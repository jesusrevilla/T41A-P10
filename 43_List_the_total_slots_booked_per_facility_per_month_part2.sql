--List the total slots booked per facility per month, part 2
--Produce a list of the total number of slots booked per facility per month in the year of 2012. In this version, include output rows containing totals for all months per facility, 
--and a total for all months for all facilities. The output table should consist of facility id, month and slots, sorted by the id and month.
--When calculating the aggregated values for all months and all facids, return null values in the month and facid columns.
select facid, extract(month from starttime) as month, sum(slots) as slots
	from cd.bookings
	where
		starttime >= '2012-01-01'
		and starttime < '2013-01-01'
	group by rollup(facid, month)
order by facid, month;          
