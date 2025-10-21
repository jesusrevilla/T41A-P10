SELECT facid, sum(slots) AS "Total Slots"
        FROM cd.bookings
        group BY facid
        HAVING sum(slots) > 1000
        ORDER BY facid;        
