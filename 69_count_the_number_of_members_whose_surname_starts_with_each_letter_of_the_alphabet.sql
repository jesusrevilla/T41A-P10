SELECT
    SUBSTR(m.surname, 1, 1) AS letter,
    COUNT(*) AS count
FROM
    cd.members m
GROUP BY
    letter
ORDER BY
    letter;
