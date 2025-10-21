WITH RECURSIVE recommenders(recommender, member) AS (
    SELECT
        recommendedby,
        memid
    FROM
        cd.members
    UNION ALL
    SELECT
        m.recommendedby,
        r.member
    FROM
        recommenders r
        INNER JOIN cd.members m ON m.memid = r.recommender
)
SELECT
    r.member AS member,
    r.recommender,
    m.firstname,
    m.surname
FROM
    recommenders r
    INNER JOIN cd.members m ON r.recommender = m.memid
WHERE
    r.member = 22
    OR r.member = 12
ORDER BY
    r.member ASC,
    r.recommender DESC;
