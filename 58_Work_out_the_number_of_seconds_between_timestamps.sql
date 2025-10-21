--Work out the number of seconds between timestamps
--Work out the number of seconds between the timestamps '2012-08-31 01:00:00' and '2012-09-02 00:00:00'
SELECT CAST(EXTRACT(EPOCH FROM (TIMESTAMP '2012-09-02 00:00:00' 
                              - TIMESTAMP '2012-08-31 01:00:00')) AS BIGINT) 
       AS seconds_difference;

