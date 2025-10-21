SELECT
    name,
    revenue
FROM (
    SELECT
        f.name,
        SUM(CASE
            WHEN b.memid = 0 THEN b.slots * f.guestcost
            ELSE b.slots * f.membercost
        END) AS revenue
    FROM
        cd.bookings b
        INNER JOIN cd.facilities f ON b.facid = f.facid
    GROUP BY
        f.name
) AS agg
WHERE
    revenue < 1000
ORDER BY
    revenue;
