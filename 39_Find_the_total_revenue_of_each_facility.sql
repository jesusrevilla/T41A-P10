SELECT f.name, 
       SUM(b.slots * CASE 
                        WHEN b.memid = 0 THEN f.guestcost
                        ELSE f.membercost
                    END) AS revenue
FROM cd.bookings b INNER JOIN cd.facilities f ON b.facid = f.facid GROUP BY f.name ORDER BY revenue;
