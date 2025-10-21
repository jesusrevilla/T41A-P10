SELECT
    f.name,
    SUM(
        CASE
            WHEN b.memid = 0 THEN f.guestcost * b.slots
            ELSE f.membercost * b.slots
        END
    ) AS revenue
FROM
    cd.bookings b
JOIN
    cd.facilities f ON b.facid = f.facid
GROUP BY
    f.name
ORDER BY
    revenue;
