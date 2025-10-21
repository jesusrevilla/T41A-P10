SELECT
    dg.date,
    (
        SELECT
            SUM(
                CASE
                    WHEN b.memid = 0 THEN b.slots * f.guestcost
                    ELSE b.slots * f.membercost
                END
            ) AS rev
        FROM
            cd.bookings b
            INNER JOIN cd.facilities f ON b.facid = f.facid
        WHERE
            b.starttime > dg.date - INTERVAL '14 days'
            AND b.starttime < dg.date + INTERVAL '1 day'
    ) / 15 AS revenue
FROM
    (
        SELECT
            CAST(
                generate_series(
                    TIMESTAMP '2012-08-01',
                    TIMESTAMP '2012-08-31',
                    '1 day'
                ) AS DATE
            ) AS date
    ) AS dg
ORDER BY
    dg.date;
