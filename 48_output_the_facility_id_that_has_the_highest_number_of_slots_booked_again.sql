SELECT
    facid,
    total
FROM (
    SELECT
        facid,
        SUM(slots) AS total,
        RANK() OVER (
            ORDER BY
                SUM(slots) DESC
        ) AS rank
    FROM
        cd.bookings
    GROUP BY
        facid
) AS ranked
WHERE
    rank = 1;
