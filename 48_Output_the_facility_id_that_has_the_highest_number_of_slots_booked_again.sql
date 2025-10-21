--Output the facility id that has the highest number of slots booked, again
--Output the facility id that has the highest number of slots booked. Ensure that in the event of a tie, all tieing results get output.
SELECT facid, sum(slots) AS total FROM cd.bookings
GROUP BY facid 
having sum(slots) = (select max(sum2.totalslots) from
		(select sum(slots) as totalslots
		from cd.bookings
		group by facid
		) as sum2);
