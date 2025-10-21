SELECT
    CAST(
        EXTRACT(
            EPOCH
            FROM
                (
                    TIMESTAMP '2012-09-02 00:00:00' - TIMESTAMP '2012-08-31 01:00:00'
                )
        ) AS INTEGER
    ) AS date_part;
