SELECT
    m.firstname,
    m.surname,
    ((SUM(b.slots) + 10) / 20) * 10 AS hours,
    RANK() OVER (
        ORDER BY
            ((SUM(b.slots) + 10) / 20) * 10 DESC
    ) AS rank
FROM
    cd.bookings b
    INNER JOIN cd.members m ON b.memid = m.memid
GROUP BY
    m.memid
ORDER BY
    rank,
    m.surname,
    m.firstname;
