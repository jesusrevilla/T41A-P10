SELECT
    f.facid,
    f.name,
    TRIM(
        TO_CHAR(SUM(b.slots) / 2.0, '9999999999999999D99')
    ) AS "Total Hours"
FROM
    cd.bookings b
    INNER JOIN cd.facilities f ON f.facid = b.facid
GROUP BY
    f.facid,
    f.name
ORDER BY
    f.facid;
