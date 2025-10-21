SELECT
    name,
    rank
FROM (
    SELECT
        f.name AS name,
        RANK() OVER (
            ORDER BY
                SUM(
                    CASE
                        WHEN b.memid = 0 THEN b.slots * f.guestcost
                        ELSE b.slots * f.membercost
                    END
                ) DESC
        ) AS rank
    FROM
        cd.bookings b
        INNER JOIN cd.facilities f ON b.facid = f.facid
    GROUP BY
        f.name
) AS subq
WHERE
    rank <= 3
ORDER BY
    rank;
