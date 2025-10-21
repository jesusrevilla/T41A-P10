SELECT
    DISTINCT mems.firstname || ' ' || mems.surname AS member,
    (
        SELECT
            recs.firstname || ' ' || recs.surname
        FROM
            cd.members recs
        WHERE
            recs.memid = mems.recommendedby
    ) AS recommender
FROM
    cd.members mems
ORDER BY
    member;
