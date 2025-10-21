SELECT
    name,
    CASE
        WHEN class = 1 THEN 'high'
        WHEN class = 2 THEN 'average'
        ELSE 'low'
    END AS revenue
FROM (
    SELECT
        f.name AS name,
        NTILE(3) OVER (
            ORDER BY
                SUM(
                    CASE
                        WHEN b.memid = 0 THEN b.slots * f.guestcost
                        ELSE b.slots * f.membercost
                    END
                ) DESC
        ) AS class
    FROM
        cd.bookings b
        INNER JOIN cd.facilities f ON b.facid = f.facid
    GROUP BY
        f.name
) AS subq
ORDER BY
    class,
    name;
