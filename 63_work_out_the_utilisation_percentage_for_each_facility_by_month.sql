SELECT
    inn.name,
    inn.month,
    ROUND(
        (100 * inn.slots) / CAST(
            25 * (
                CAST(
                    (inn.month + INTERVAL '1 month') AS DATE
                ) - CAST(inn.month AS DATE)
            ) AS NUMERIC
        ),
        1
    ) AS utilisation
FROM (
    SELECT
        f.name AS name,
        DATE_TRUNC('month', b.starttime) AS month,
        SUM(b.slots) AS slots
    FROM
        cd.bookings b
        INNER JOIN cd.facilities f ON b.facid = f.facid
    GROUP BY
        f.facid,
        month
) AS inn
ORDER BY
    name,
    month;
