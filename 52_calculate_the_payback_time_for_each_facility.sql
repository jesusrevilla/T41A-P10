SELECT
    f.name AS name,
    f.initialoutlay / (
        (
            SUM(
                CASE
                    WHEN b.memid = 0 THEN b.slots * f.guestcost
                    ELSE b.slots * f.membercost
                END
            ) / 3
        ) - f.monthlymaintenance
    ) AS months
FROM
    cd.bookings b
    INNER JOIN cd.facilities f ON b.facid = f.facid
GROUP BY
    f.facid
ORDER BY
    name;
