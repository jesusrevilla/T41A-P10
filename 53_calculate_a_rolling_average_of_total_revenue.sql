--Calculate a rolling average of total revenue
--For each day in August 2012, calculate a rolling average of total revenue over the previous 15 days. Output should contain date and revenue columns, sorted by the date. 
--Remember to account for the possibility of a day having zero revenue. This one's a bit tough, so don't be afraid to check out the hint!

select 	datos.date,
	(
		select sum(case
			when memid = 0 then slots * guestcost
			else slots * membercost
		end) as rev

		from cd.bookings book
		inner join cd.facilities fac
			on book.facid = fac.facid
		where book.starttime > datos.date - interval '14 days'
			and book.starttime < datos.date + interval '1 day'
	)/15 as revenue
	from
	(
		select 	cast(generate_series(timestamp '2012-08-01',
			'2012-08-31','1 day') as date) as date
	)  as datos
order by datos.date; 
