--Find the total revenue of each facility
--
SELECT f.name, sum(slots * case when memid = 0 then f.guestcost
ELSE f.membercost END) AS revenue FROM cd.bookings b
JOIN cd.facilities f
ON b.facid = f.facid
GROUP BY f.name
ORDER BY revenue;  
